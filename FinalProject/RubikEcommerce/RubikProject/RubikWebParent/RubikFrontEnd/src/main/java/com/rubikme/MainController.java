package com.rubikme;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rubikme.category.CategoryService;
import com.rubikme.common.entity.Category;

@Controller
public class MainController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("")
	public String viewHomePage(Model model) {
		
		List<Category> listCategoriesParent = categoryService.listNoChildrenCategories();
		
		model.addAttribute("listCategoriesParent", listCategoriesParent);
		
		return "index";
	}
}
