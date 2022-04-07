package com.rubikme.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.rubikme.category.CategoryService;
import com.rubikme.common.entity.Category;
import com.rubikme.common.entity.Product;
import com.rubikme.common.exception.CategoryNotFoundException;
import com.rubikme.common.exception.ProductNotFoundException;

@Controller
public class ProductController {
	
	@Autowired 
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/c/{category_alias}")
	public String viewCategoryFirstPage(@PathVariable("category_alias") String alias,
			Model model) {
		return viewCategoryByPage(alias, 1, model);
	}
	
	@GetMapping("/c/{category_alias}/page/{pageNum}")
	public String viewCategoryByPage(@PathVariable("category_alias") String alias,
			@PathVariable("pageNum") int pageNum,
			Model model) {
		
		try {
			Category category;
			
			category = categoryService.getCategory(alias);
				
			List<Category> listCategoryParents = categoryService.getCategoryParents(category);
			
			Page<Product> pageProducts = productService.listByCategory(pageNum, category.getId());
			List<Product> listProducts = pageProducts.getContent();
			
			long startCount = (pageNum - 1) * ProductService.PRODUCTS_PER_PAGE + 1;
			long endCount = startCount + ProductService.PRODUCTS_PER_PAGE - 1;
			if (endCount > pageProducts.getTotalElements()) {
				endCount = pageProducts.getTotalElements();
			}
			
			
			model.addAttribute("currentPage", pageNum);
			model.addAttribute("totalPages", pageProducts.getTotalPages());
			model.addAttribute("startCount", startCount);
			model.addAttribute("endCount", endCount);
			model.addAttribute("totalItems", pageProducts.getTotalElements());
			model.addAttribute("pageTitle", category.getName());
			model.addAttribute("listCategoryParents", listCategoryParents);
			model.addAttribute("listProducts", listProducts);
			model.addAttribute("category", category);
			
			return "product/product_by_category";
		} 
		catch (CategoryNotFoundException e) {
			// TODO Auto-generated catch block
			return "error/404";
		}
	}
	
	@GetMapping("/products")
	public String viewProduct(Model model) {
			
		return viewProuctByPage(model, 1);
	}
	
	@GetMapping("/products/page/{pageNum}")
	public String viewProuctByPage(Model model,
			@PathVariable("pageNum") int pageNum) {
		
		Page<Product> pageProducts = productService.listProductByPage(pageNum);
		List<Product> listResult = pageProducts.getContent();
		
		long startCount = (pageNum - 1) * ProductService.SEARCH_PRODUCTS_PER_PAGE + 1;
		long endCount = startCount + ProductService.SEARCH_PRODUCTS_PER_PAGE - 1;
		if (endCount > pageProducts.getTotalElements()) {
			endCount = pageProducts.getTotalElements();
		}
		
		model.addAttribute("listProducts", listResult);
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", pageProducts.getTotalPages());
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", pageProducts.getTotalElements());
		model.addAttribute("title", "Product");
		
		return "product/products";
	}
	
	@GetMapping("/p/{product_alias}")
	public String viewProdutDetail(@PathVariable("product_alias") String alias,
			Model model) {
		try {
			Product product = productService.getProduct(alias);
			List<Category> listCategoryParents = categoryService.getCategoryParents(product.getCategory());
			
			model.addAttribute("listCategoryParents", listCategoryParents);
			model.addAttribute("product", product);
			model.addAttribute("title", product.getShortName());
			
			
			return "product/product_detail";
		}
		catch (ProductNotFoundException e) {
			return "error/404";
		}
	}
	
	@GetMapping("/search")
	public String searchFirstPage(@Param("keyword") String keyword,
			Model model) {
		 return searchByPage(keyword, model, 1);
	}
	
	@GetMapping("/search/page/{pageNum}")
	public String searchByPage(@Param("keyword") String keyword,
			Model model,
			@PathVariable("pageNum") int pageNum) {
		
		Page<Product> pageProducts = productService.search(keyword, pageNum);
		List<Product> listResult = pageProducts.getContent();
		
		long startCount = (pageNum - 1) * ProductService.SEARCH_PRODUCTS_PER_PAGE + 1;
		long endCount = startCount + ProductService.SEARCH_PRODUCTS_PER_PAGE - 1;
		if (endCount > pageProducts.getTotalElements()) {
			endCount = pageProducts.getTotalElements();
		}
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("listProducts", listResult);
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", pageProducts.getTotalPages());
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", pageProducts.getTotalElements());
		model.addAttribute("title", keyword + " - Search Result");
		
		return "product/product_result";
	}
}
