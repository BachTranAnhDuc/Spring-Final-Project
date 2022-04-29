package com.rubikme.admin.brand.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
import com.rubikme.admin.brand.BrandService;
import com.rubikme.admin.brand.error.BrandNotFoundException;
import com.rubikme.admin.brand.exporter.BrandCsvExporter;
import com.rubikme.admin.brand.exporter.BrandExcelExporter;
import com.rubikme.admin.brand.exporter.BrandPDFExporter;
import com.rubikme.admin.category.CategoryService;
import com.rubikme.admin.category.exporter.CategoryCsvExporter;
import com.rubikme.admin.category.exporter.CategoryExcelExport;
import com.rubikme.admin.category.exporter.CategoryPDFExport;
import com.rubikme.common.entity.Brand;
import com.rubikme.common.entity.Category;

@Controller
public class BrandController {
	
	@Autowired
	private BrandService service;
	
	@Autowired
	private CategoryService cateService;
	
	@GetMapping("/brands") 
	public String listFirstPage(Model model) {		
		model.addAttribute("title", "Manage Brands");
		
		return listByPage(1, model, "name", "asc", null);
	}

	@GetMapping("/brands/page/{pageNum}")
	public String listByPage(@PathVariable(name = "pageNum") int pageNum,
			Model model, @Param("sortField") String sortField,
			@Param("sortDir") String sortDir,
			@Param("keyword") String keyword) {
		
		Page<Brand> page = service.listByPage(pageNum, sortField, sortDir, keyword);
		List<Brand> listBrands = page.getContent();
		
		long startCount = (pageNum - 1) * BrandService.BRAND_PER_PAGE + 1;
		long endCount = startCount + BrandService.BRAND_PER_PAGE - 1;
		
		if (endCount > page.getTotalElements()) {
			endCount = page.getTotalElements();
		}
		
		String reverseSortDir = sortDir.equals("asc") ? "desc" : "asc";
		
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", page.getTotalElements());
		model.addAttribute("sortField", sortField);
		model.addAttribute("sortDir", sortDir);
		model.addAttribute("reverseSortDir", reverseSortDir);
		model.addAttribute("keyword", keyword);
		model.addAttribute("listBrands", listBrands);
		model.addAttribute("title", "Manage Brands");
		model.addAttribute("headerTitle", "/brands");
		
		return "brands/brands";
	}
	
	@GetMapping("/brands/new")
	public String newBrand(Model model) {
		List<Category> listCategories = cateService.listCategoriesUsedInForm();
		
		model.addAttribute("listCategories", listCategories);
		model.addAttribute("brand", new Brand());
		model.addAttribute("title", "Create New Brand");
		model.addAttribute("headerTitle", "/brands/new");
		
		return "brands/brand_form";
	}
	
	@PostMapping("/brands/save")
	public String saveBrand(Brand brand, 
			@RequestParam("fileImage") MultipartFile multipartFile,
			RedirectAttributes redirect) throws IOException {
		
		if (!multipartFile.isEmpty()) {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			brand.setLogo(fileName);
			
			Brand saveBrand = service.save(brand);
			String uploadDir = "../brand-logos/" + saveBrand.getId();
			
			FileUploadUtil.cleanDir(uploadDir);
			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
		}
		else {
			if (brand.getLogo().isEmpty()) brand.setLogo(null);
			service.save(brand);
		}
	
		redirect.addFlashAttribute("message", "The brand has been saved successfully.");
		return "redirect:/brands";
	}
	
	@GetMapping("/brands/edit/{id}")
	public String editBrand(@PathVariable(name = "id") Integer id, Model model,
				RedirectAttributes re) {
		try {
			Brand brand = service.get(id);
			List<Category> listCategories = cateService.listCategoriesUsedInForm();
			
			String header = "/brands/edit/" + id;
			
			model.addAttribute("brand", brand);
			model.addAttribute("listCategories", listCategories);
			model.addAttribute("title", "Edit Brand (ID: " + id + ")");
			model.addAttribute("headerTitle", header);
			
			return "brands/brand_form";
		}
		catch (BrandNotFoundException ex) {
			re.addFlashAttribute("message", ex.getMessage());
			return "redirect:/brands";
		}
	}
	
	@GetMapping("/brands/delete/{id}")
	public String deleteBrand(@PathVariable(name = "id") Integer id,
			Model model,
			RedirectAttributes re) {
		try {
			service.delete(id);
//			String brandDir = "../brand-logos/" + id;
			
//			FileUploadUtil.removeDir(brandDir);
			
			re.addFlashAttribute("message", "The brand ID: " + id + " has been deleted successfully");
		}
		catch (BrandNotFoundException ex) {
			re.addFlashAttribute("message", ex.getMessage());
		}
		
		return "redirect:/brands";
	}
	
	@GetMapping("/brands/export/csv")
	public void exportToCSV(HttpServletResponse response) throws IOException {
		List<Brand> listBrands = service.findAll();
		
		BrandCsvExporter exporter = new BrandCsvExporter();
		
		exporter.export(listBrands, response);
	}
	
	@GetMapping("/brands/export/excel")
	public void exportToExcel(HttpServletResponse response) throws IOException {
		List<Brand> listBrands = service.findAll();
		
		BrandExcelExporter exporter = new BrandExcelExporter();
		
		exporter.export(listBrands, response);
	}
	
	@GetMapping("/brands/export/pdf")
	public void exportToPDF(HttpServletResponse response) throws IOException {
		List<Brand> listBrands = service.findAll();
		
		BrandPDFExporter exporter = new BrandPDFExporter();
		
		exporter.export(listBrands, response);
	}
}
