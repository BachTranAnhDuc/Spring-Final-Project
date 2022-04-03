package com.rubikme.admin.category.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rubikme.admin.FileUploadUtil;
import com.rubikme.admin.category.CategoryNotFoundException;
import com.rubikme.admin.category.CategoryPageInfo;
import com.rubikme.admin.category.CategoryService;
import com.rubikme.admin.category.exporter.CategoryCsvExporter;
import com.rubikme.admin.category.exporter.CategoryExcelExport;
import com.rubikme.admin.category.exporter.CategoryPDFExport;
import com.rubikme.admin.user.export.UserExcelExporter;
import com.rubikme.admin.user.export.UserPdfExporter;
import com.rubikme.common.entity.Category;
import com.rubikme.common.entity.User;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	@GetMapping("/categories")
	public String listFirstPage(@Param("sortDir") String sortDir, 
			Model model) {
		
		model.addAttribute("title", "Manage Category");
		return listByPage(1, sortDir, null, model);
	}
	
	@GetMapping("/categories/page/{pageNum}")
	public String listByPage(@PathVariable(name = "pageNum") int pageNum, 
			@Param("sortDir") String sortDir, String keyword, Model model) {
		
		if (sortDir == null || sortDir.isEmpty()) {
			sortDir = "asc";
		}
		
		CategoryPageInfo pageInfo = new CategoryPageInfo();
		List<Category> listCategories = service.listByPage(pageInfo, pageNum, sortDir, keyword);
		
		long startCount = (pageNum - 1) * CategoryService.CATEGORY_PER_PAGE + 1;
		long endCount = startCount + CategoryService.CATEGORY_PER_PAGE - 1;
		
		if (endCount > pageInfo.getTotalElements()) {
			endCount = pageInfo.getTotalElements();
		}
		
		String reverseSortDir = sortDir.equals("asc") ? "desc" : "asc";
		
		model.addAttribute("totalPages", pageInfo.getTotalPages());
		model.addAttribute("totalItems", pageInfo.getTotalElements());
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("sortField", "name");
		model.addAttribute("sortField", sortDir);
		model.addAttribute("keyword", keyword);
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);	
		
		model.addAttribute("listCategories", listCategories);
		model.addAttribute("reverseSortDir", reverseSortDir);
		model.addAttribute("moduleURL", "/categories");
		model.addAttribute("title", "Manage Category");
		model.addAttribute("headerTitle", "/categories");
		
		return "categories/categories";
	}
	
	@GetMapping("/categories/{id}/enabled/{status}")
	public String updateCategoryEnabledStatus(@PathVariable("id") Integer id,
			@PathVariable("status") boolean enabled, RedirectAttributes redirectAttributes) {
		
		service.updateCategoryEnabledStatus(id, enabled);
		String status = enabled ? "enabled" : "disabled";
		String message = "The category ID " + id + " has been " + status;
		
		redirectAttributes.addFlashAttribute("message", message);
		
		return "redirect:/categories";
//		return "categories/categories";
	}
	
	@GetMapping("/categories/new")
	public String newCategory(Model model) {
		List<Category> listCategories = service.listCategoriesUsedInForm();
		
		model.addAttribute("category", new Category());
		model.addAttribute("listCategories", listCategories);
		model.addAttribute("title", "Create New Category");
		model.addAttribute("headerTitle", "/categories/new");
		
		return "categories/category_form";
	}
	
	@PostMapping("/categories/save")
	public String saveCategory(Category category, 
			@RequestParam("fileImage") MultipartFile multipartFile,
			RedirectAttributes ra) throws IOException {
		if (!multipartFile.isEmpty()) {
			
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			category.setImage(fileName);
			System.out.println(multipartFile.getOriginalFilename());

			Category savedCategory = service.save(category);
			String uploadDir = "../category-images/" + savedCategory.getId();
			
			FileUploadUtil.cleanDir(uploadDir);
			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
			
//			AmazonS3Util.removeFolder(uploadDir);
//			AmazonS3Util.uploadFile(uploadDir, fileName, multipartFile.getInputStream());
		} else {
			if (category.getImage().isEmpty()) category.setImage(null);
			service.save(category);
		}
		
		ra.addFlashAttribute("message", "The category has been saved successfully.");
		return "redirect:/categories";
	}
	
	@GetMapping("/categories/edit/{id}")
	public String editCategory(@PathVariable(name = "id") Integer id, Model model,
			RedirectAttributes ra) {
		try {
			Category category = service.get(id);
			List<Category> listCategories = service.listCategoriesUsedInForm();
			
			String header = "/categories/edit/" + id;
			
			model.addAttribute("category", category);
			model.addAttribute("listCategories", listCategories);
			model.addAttribute("title", "Edit Category (ID: " + id + ")");
			model.addAttribute("headerTitle", header);
			
			return "categories/category_form";			
		} catch (CategoryNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
			return "redirect:/categories";
		}
	}
	
	@GetMapping("/categories/delete/{id}")
	public String deleteCategory(@PathVariable(name = "id") Integer id, 
			Model model,
			RedirectAttributes redirectAttributes) {
		try {
			service.delete(id);
			String categoryDir = "category-images/" + id;
			
			redirectAttributes.addFlashAttribute("message", "The category ID " + id + " has been deleted successfully");
		} catch (CategoryNotFoundException ex) {
			redirectAttributes.addFlashAttribute("message", ex.getMessage());
		}
		
		return "redirect:/categories";
	}
	
	@GetMapping("/categories/export/csv")
	public void exportToCSV(HttpServletResponse response) throws IOException {
		List<Category> listCategories = service.listCategoriesUsedInForm();
		
		CategoryCsvExporter exporter = new CategoryCsvExporter();
		
		exporter.export(listCategories, response);
	}
	
	@GetMapping("/categories/export/excel")
	public void exportToExcel(HttpServletResponse response) throws IOException {
		List<Category> listCategories = service.listAllCategory();
		
		CategoryExcelExport exporter = new CategoryExcelExport();
		
		exporter.export(listCategories, response);
	}
	
	@GetMapping("/categories/export/pdf")
	public void exportToPDF(HttpServletResponse response) throws IOException {
		List<Category> listCategories = service.listCategoriesUsedInForm();
		
		CategoryPDFExport catePdfExporter = new CategoryPDFExport();
		
		catePdfExporter.export(listCategories, response);
	}
}
