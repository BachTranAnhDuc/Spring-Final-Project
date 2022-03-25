package com.rubikme.admin.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rubikme.admin.brand.BrandService;
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
				RedirectAttributes re) {
		
//		System.out.println("Product Name: " + product.getName());
//		System.out.println("Brand ID: " + product.getBrand().getId());
//		System.out.println("Category ID: " + product.getCategory().getId());
		
		productService.save(product);
		
		re.addFlashAttribute("message", "The product has been saved successfully!");
		
		return "redirect:/products";
	}
}
