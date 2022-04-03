package com.rubikme.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rubikme.admin.brand.BrandService;
import com.rubikme.admin.category.CategoryService;
import com.rubikme.admin.product.ProductService;
import com.rubikme.admin.user.UserService;
import com.rubikme.common.entity.Brand;
import com.rubikme.common.entity.Category;
import com.rubikme.common.entity.Product;
import com.rubikme.common.entity.User;

@Controller
public class MainController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired 
	private BrandService brandService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("")
	public String viewHomePage(Model model) {
		
		List<User> listUsers = userService.listAll();
		List<Category> listCategories = categoryService.listAllCategory();
		List<Brand> listBrands = brandService.listAll();
		List<Product> listProducts = productService.listAll();
		
		Integer countUsers = listUsers.size();
		Integer countCategories = listCategories.size();
		Integer countBrands = listBrands.size();
		Integer countProducts = listProducts.size();
		
		
		model.addAttribute("title", "Homepage");
		model.addAttribute("headerTitle", "/");
		model.addAttribute("totalUsers", countUsers);
		model.addAttribute("totalBrands", countBrands);
		model.addAttribute("totalCategories", countCategories);
		model.addAttribute("totalProducts", countProducts);
		
		return "index";
	}
	
	@GetMapping("/login")
	public String viewLoginPage() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			return "login";
		}
		
		return "redirect:/";
	}
	
}
