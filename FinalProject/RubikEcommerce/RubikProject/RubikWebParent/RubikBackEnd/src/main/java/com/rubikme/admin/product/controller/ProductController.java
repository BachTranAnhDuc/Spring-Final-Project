package com.rubikme.admin.product.controller;

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
import com.rubikme.admin.product.ProductNotFoundException;
import com.rubikme.admin.product.ProductService;
import com.rubikme.common.entity.Brand;
import com.rubikme.common.entity.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BrandService brandService;
	
	@GetMapping("/products")
	public String listAll(Model model) {
		
		List<Product> listProducts = productService.listAll();
		
		model.addAttribute("listProducts", listProducts);
		
		return "products/products";
	}
	
	@GetMapping("/products/new")
	public String newProduct(Model model) {
		
		List<Brand> listBrands = brandService.listAll();
		
		Product product = new Product();
		
		product.setEnabled(true);
		product.setInStock(true);
		
		model.addAttribute("product", product);
		model.addAttribute("listBrands", listBrands);
		model.addAttribute("pageTitle", "Create New Product");
		
		return "products/product_form";
	}
	
	@PostMapping("/products/save")
	public String saveProduct(Product product,
				RedirectAttributes re,
				@RequestParam("fileImage") MultipartFile mainMultipartFile,
				@RequestParam("extraImage") MultipartFile[] extraImageMul) 
						throws IOException {
		
//		System.out.println("Product Name: " + product.getName());
//		System.out.println("Brand ID: " + product.getBrand().getId());
//		System.out.println("Category ID: " + product.getCategory().getId());
		
		setMainImageName(mainMultipartFile, product);
		setExtraImageNames(extraImageMul, product);
			
		Product saveProduct = productService.save(product);
		
		saveUploadImages(mainMultipartFile, extraImageMul, saveProduct);
		
		
		
		
		
		re.addFlashAttribute("message", "The product has been saved successfully!");
		
		return "redirect:/products";
	}
	
	private void saveUploadImages(MultipartFile mainMultipartFile, MultipartFile[] extraImageMul, Product saveProduct) throws IOException {
		// TODO Auto-generated method stub
		
		if (!mainMultipartFile.isEmpty()) {
			String fileName = StringUtils.cleanPath(mainMultipartFile.getOriginalFilename());
			
			String uploadDir = "../product-images/" + saveProduct.getId();
			
			FileUploadUtil.cleanDir(uploadDir);
			FileUploadUtil.saveFile(uploadDir, fileName, mainMultipartFile);
		}
		
		if (extraImageMul.length > 0) {
			
			String uploadDir = "../product-images/" + saveProduct.getId() + "/extras";
			
			for (MultipartFile mul : extraImageMul) {
				if (mul.isEmpty()) continue;
				
				String fileName = StringUtils.cleanPath(mul.getOriginalFilename());
				FileUploadUtil.saveFile(uploadDir, fileName, mul);
			}
		}
	}

	private void setExtraImageNames(MultipartFile[] extraImageMul, Product product) {
		// TODO Auto-generated method stub
		
		if (extraImageMul.length > 0) {
			for (MultipartFile mul : extraImageMul) {
				if (!mul.isEmpty()) {
					String fileName = StringUtils.cleanPath(mul.getOriginalFilename());
					product.addExtraImage(fileName);
				}
			}
		}
	}

	private void setMainImageName(MultipartFile mainImageMul, Product product) {
		// TODO Auto-generated method stub
		
		if (!mainImageMul.isEmpty()) {
			String fileName = StringUtils.cleanPath(mainImageMul.getOriginalFilename());
			product.setMainImage(fileName);
		}
	}

	@GetMapping("/products/{id}/enabled/{status}")
	public String updateCategoryEnabledStatus(@PathVariable("id") Integer id,
			@PathVariable("status") boolean enabled, RedirectAttributes re) {
		productService.updateProductEnabledStatus(id, enabled);
		String status = enabled ? "enabled" : "disabled";
		String message = "The product ID " + id + " has been" + status;
		
		re.addFlashAttribute("message", message);
		
		return "redirect:/products";
	}
	
	@GetMapping("/products/delete/{id}")
	public String deleteProduct(@PathVariable(name = "id") Integer id,
			Model model,
			RedirectAttributes re) {
		try {
			productService.delete(id);
			
			String productExtraImageDir = "../product-images/" + id + "/extras";
			String productImageDir = "../product-images/" + id;
			
			FileUploadUtil.removeDir(productExtraImageDir);
			FileUploadUtil.removeDir(productImageDir);
			
			re.addFlashAttribute("message", "The product ID: " + id + " has been deleted successfully");
		}
		catch (ProductNotFoundException ex) {
			re.addFlashAttribute("message", ex.getMessage());
		}
		
		return "redirect:/products";
	}
}
