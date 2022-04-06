package com.rubikme.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.rubikme.category.CategoryService;
import com.rubikme.common.entity.Category;

@Controller
public class ProductController {
	
	@Autowired 
	private CategoryService categoryService;
	
	@GetMapping("/c/{category_alias}")
	public String viewCategory(@PathVariable("category_alias") String alias,
			Model model) {
		
		Category category = categoryService.getCategory(alias);
		
		if (category == null) {
			return "error/404";
		}
		
		List<Category> listCategoryParents = categoryService.getCategoryParents(category);
		
		model.addAttribute("title", category.getName());
		model.addAttribute("listCategoryParents", listCategoryParents);
		
		return "product_by_category";
	}
	
	@GetMapping("/products")
	public String viewHomePage(Model model) {
		
		List<Category> listCategoriesParent = categoryService.listNoChildrenCategories();
		
		model.addAttribute("listCategoriesParent", listCategoriesParent);
		
		return "products";
	}
}
