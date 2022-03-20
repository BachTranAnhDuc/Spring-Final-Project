package com.rubikme.admin.brand.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.rubikme.admin.category.CategoryService;
import com.rubikme.common.entity.Brand;
import com.rubikme.common.entity.Category;

@Controller
public class BrandController {
	
	@Autowired
	private BrandService service;
	
	@Autowired
	private CategoryService cateService;
	
	@GetMapping("/brands") 
	public String listAll(Model model) {
		List<Brand> listBrands = service.listAll();
		
		model.addAttribute("listBrands", listBrands);
		
		return "brands/brands";
	}
	
	@GetMapping("/brands/new")
	public String newBrand(Model model) {
		List<Category> listCategories = cateService.listCategoriesUsedInForm();
		
		model.addAttribute("listCategories", listCategories);
		model.addAttribute("brand", new Brand());
		model.addAttribute("pageTitle", "Create New Brand");
		
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
			
			model.addAttribute("brand", brand);
			model.addAttribute("listCategories", listCategories);
			model.addAttribute("pageTitle", "Edit Brand (ID: " + id + ")");
			
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
}
