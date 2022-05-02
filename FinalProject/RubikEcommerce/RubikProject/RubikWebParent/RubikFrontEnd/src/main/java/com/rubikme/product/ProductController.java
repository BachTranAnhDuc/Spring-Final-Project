package com.rubikme.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.rubikme.Utility;
import com.rubikme.cart.CartShoppingService;
import com.rubikme.category.CategoryService;
import com.rubikme.common.entity.CartItem;
import com.rubikme.common.entity.Category;
import com.rubikme.common.entity.Customer;
import com.rubikme.common.entity.Product;
import com.rubikme.common.entity.Review;
import com.rubikme.common.exception.CategoryNotFoundException;
import com.rubikme.common.exception.CustomerNotFoundException;
import com.rubikme.common.exception.ProductNotFoundException;
import com.rubikme.customer.CustomerService;
import com.rubikme.review.ReviewService;

@Controller
public class ProductController {
	
	@Autowired 
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CartShoppingService cartService;
	
	@GetMapping("/c/{category_alias}")
	public String viewCategoryFirstPage(@PathVariable("category_alias") String alias,
			Model model, HttpServletRequest request) {
		return viewCategoryByPage(alias, 1, model, request);
	}
	
	@GetMapping("/c/{category_alias}/page/{pageNum}")
	public String viewCategoryByPage(@PathVariable("category_alias") String alias,
			@PathVariable("pageNum") int pageNum,
			Model model, HttpServletRequest request) {
		
		try {
			
			Customer customer = getAuthenticationCustomer(request);
			List<CartItem> listCartItems = cartService.listCartItems(customer);
			
			int countCartItems = listCartItems.size();
			
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
			model.addAttribute("countCartItems", countCartItems);
			
			return "product/product_by_category";
		} 
		catch (CategoryNotFoundException e) {
			// TODO Auto-generated catch block
			return "error/404";
		}
	}
	
	@GetMapping("/c/standard_rubik")
	public String viewProduct(Model model, HttpServletRequest request) {
			
		return viewCategoryByPage("standard_rubik", 1, model, request);
	}
	
	@GetMapping("/c/variant_rubik")
	public String viewProductVariant(Model model, HttpServletRequest request) {
			
		return viewCategoryByPage("variant_rubik", 1, model, request);
	}
	
	@GetMapping("/c/accessory")
	public String viewProductAssesories(Model model, HttpServletRequest request) {
			
		return viewCategoryByPage("accessory", 1, model, request);
	}
	
	@GetMapping("/products/page/{pageNum}")
	public String viewProductByPage(Model model,
			@PathVariable("pageNum") int pageNum, HttpServletRequest request) {
		
		Page<Product> pageProducts = productService.listProductByPage(pageNum);
		List<Product> listResult = pageProducts.getContent();
		
		long startCount = (pageNum - 1) * ProductService.SEARCH_PRODUCTS_PER_PAGE + 1;
		long endCount = startCount + ProductService.SEARCH_PRODUCTS_PER_PAGE - 1;
		if (endCount > pageProducts.getTotalElements()) {
			endCount = pageProducts.getTotalElements();
		}
		
		Customer customer = getAuthenticationCustomer(request);		
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		
		int countCartItems = listCartItems.size();
		
		model.addAttribute("listProducts", listResult);
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", pageProducts.getTotalPages());
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", pageProducts.getTotalElements());
		model.addAttribute("title", "Product");
		model.addAttribute("countCartItems", countCartItems);
		
		return "product/products";
	}
	
	@GetMapping("/p/{product_alias}")
	public String viewProdutDetail(@PathVariable("product_alias") String alias,
			Model model,
			String sortField, String sortDir, HttpServletRequest request) {
		try {
			Product product = productService.getProduct(alias);
			List<Category> listCategoryParents = categoryService.getCategoryParents(product.getCategory());
			Page<Review> listReviews = reviewService.listByProduct(product, 1, "reviewTime", "desc");
			
			Customer customer = getAuthenticationCustomer(request);
			
			int countCartItems = 0;
			Review review = new Review();
			
			if (customer != null) {
				boolean didCustomerReview = reviewService.didCustomerReviewProduct(customer, product.getId());
				
				if (didCustomerReview) {
					model.addAttribute("didCustomerReview", didCustomerReview);
				}
				else {
					boolean didCustomerCanReview = reviewService.canCustomerReview(customer, product.getId());
					
					if (didCustomerCanReview) {
						model.addAttribute("didCustomerCanReview", didCustomerCanReview);
					}
					else {
						model.addAttribute("NoReviewPermission", true);
					}
				}
					
				List<CartItem> listCartItems = cartService.listCartItems(customer);
				
				countCartItems = listCartItems.size();
			}
			
//			Page<Review> page = reviewService.listByProduct(product, pageNum, sortField, sortDir);
//			List<Review> listReviews = page.getContent();
//			
//			long startCount = (pageNum - 1) * ReviewService.REVIEWS_PER_PAGE + 1;
//			long endCount = startCount + ReviewService.REVIEWS_PER_PAGE - 1;
//			if (endCount > page.getTotalElements()) {
//				endCount = page.getTotalElements();
//			}
//			
//			model.addAttribute("currentPage", pageNum);
//			model.addAttribute("totalPages", page.getTotalPages());
//			model.addAttribute("startCount", startCount);
//			model.addAttribute("endCount", endCount);
//			model.addAttribute("totalItems", page.getTotalElements());
//			model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
			
			model.addAttribute("listCategoryParents", listCategoryParents);
			model.addAttribute("listReviews", listReviews);
			model.addAttribute("title", product.getShortName());
			model.addAttribute("product", product);
			model.addAttribute("review", review);
			model.addAttribute("countCartItems", countCartItems);
					
			return "product/product_detail";
		}
		catch (ProductNotFoundException e) {
			return "error/404";
		}
	}
	
	@GetMapping("/search")
	public String searchFirstPage(@Param("keyword") String keyword,
			Model model, HttpServletRequest request) {
		 return searchByPage(keyword, model, 1, request);
	}
	
	@GetMapping("/search/page/{pageNum}")
	public String searchByPage(@Param("keyword") String keyword,
			Model model,
			@PathVariable("pageNum") int pageNum, HttpServletRequest request) {
		
		Page<Product> pageProducts = productService.search(keyword, pageNum);
		List<Product> listResult = pageProducts.getContent();
		
		long startCount = (pageNum - 1) * ProductService.SEARCH_PRODUCTS_PER_PAGE + 1;
		long endCount = startCount + ProductService.SEARCH_PRODUCTS_PER_PAGE - 1;
		if (endCount > pageProducts.getTotalElements()) {
			endCount = pageProducts.getTotalElements();
		}
		
		Customer customer = getAuthenticationCustomer(request);		
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		
		int countCartItems = listCartItems.size();
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("listProducts", listResult);
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", pageProducts.getTotalPages());
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", pageProducts.getTotalElements());
		model.addAttribute("title", keyword + " - Search Result");
		model.addAttribute("countCartItems", countCartItems);
		
		return "product/product_result";
	}
	
	private Customer getAuthenticationCustomer(HttpServletRequest request) {
		String email = Utility.getEmailOfCustomer(request);
		
		return customerService.getCustomerByEmail(email);
	}
}
