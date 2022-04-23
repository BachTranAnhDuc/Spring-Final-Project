package com.rubikme.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rubikme.Utility;
import com.rubikme.cart.CartShoppingService;
import com.rubikme.common.entity.CartItem;
import com.rubikme.common.entity.Customer;
import com.rubikme.common.entity.Product;
import com.rubikme.common.entity.Review;
import com.rubikme.common.exception.ProductNotFoundException;
import com.rubikme.customer.CustomerService;
import com.rubikme.product.ProductService;
import com.rubikme.review.ReviewNotFoundException;
import com.rubikme.review.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired 
	private CartShoppingService cartService;
	
	@GetMapping("/reviews")
	public String listFirstPage(Model model, HttpServletRequest request) {
		return listReviewByCustomerByPage(model, request, 1, null, "reviewTime", "desc");
	}
	
	@GetMapping("/reviews/page/{pageNum}")
	public String listReviewByCustomerByPage(Model model, HttpServletRequest request, 
			@PathVariable(name = "pageNum") int pageNum,
			String keyword, String sortField, String sortDir) {
		Customer customer = getCustomer(request);
		Page<Review> page = reviewService.listByCustomerPage(customer, keyword, pageNum, sortField, sortDir);
		List<Review> listReviews = page.getContent();
		
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		
		int countCartItems = listCartItems.size();
		
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalItems", page.getTotalElements());
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("sortField", sortField);
		model.addAttribute("sortDir", sortDir);
		model.addAttribute("keyword", keyword);
		model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		model.addAttribute("headerTitle", "/reviews");
		model.addAttribute("countCartItems", countCartItems);
		
		model.addAttribute("listReviews", listReviews);
		
		long startCount = (pageNum - 1) * ReviewService.REVIEWS_PER_PAGE + 1;
		long endCount = startCount + ReviewService.REVIEWS_PER_PAGE - 1;
		
		if (endCount > page.getTotalElements()) {
			endCount = page.getTotalElements();
		}
		
		model.addAttribute("endCount", endCount);
		model.addAttribute("startCount", startCount);
		
		return "reviews/reviews_customer";
	}

	
	
	@GetMapping("/reviews/detail/{id}")
	public String viewReview(@PathVariable("id") Integer id, Model model,
			RedirectAttributes ra, HttpServletRequest request) {
		Customer customer = getCustomer(request);
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		
		int countCartItems = listCartItems.size();
		
		try {
			Review review = reviewService.getCustomerAndId(customer, id);
			model.addAttribute("review", review);
			model.addAttribute("countCartItems", countCartItems);
			
			return "reviews/review_detail_modal";
		}
		catch (ReviewNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
			
			return listReviewByCustomerByPage(model, request, 1, null, "reviewTime", "desc");
		}
	}
	
	
	
	@GetMapping("/ratings/{productAlias}/page/{pageNum}")
	public String listByProductByPage(Model model, 
			@PathVariable(name = "productAlias") String productAlias,
			@PathVariable(name = "pageNum") int pageNum,
			String sortField, String sortDir) {
		Product product = null;
		
		try {
			product = productService.getProduct(productAlias);
		}
		catch (ProductNotFoundException ex) {
			return "error/404";
		}
		
		Page<Review> page = reviewService.listByProduct(product, pageNum, sortField, sortDir);
		List<Review> listReviews = page.getContent();
		
		long startCount = (pageNum - 1) * ReviewService.REVIEWS_PER_PAGE + 1;
		long endCount = startCount + ReviewService.REVIEWS_PER_PAGE - 1;
		if (endCount > page.getTotalElements()) {
			endCount = page.getTotalElements();
		}
		
		model.addAttribute("listReviews", listReviews);
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", page.getTotalElements());
		model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");
		model.addAttribute("product", product);
		
		return "reviews/reviews_product";
	}
	
	@GetMapping("/ratings/{productAlias}")
	public String listByProductFirstPage(@PathVariable(name = "productAlias") String productAlias,
			Model model) {
		return listByProductByPage(model, productAlias, 1, "reviewTime", "desc");
	}
	
	@GetMapping("/write_review/product/{productId}")
	public String reviewForm(@PathVariable("productId") Integer productId, Model model, HttpServletRequest request) {
		
		Review review = new Review();
		Product product = null;
		
		try {
			product = productService.getProduct(productId);
		} catch (ProductNotFoundException e) {
			// TODO Auto-generated catch block
			return "error/404";
		}
		
		model.addAttribute("product", product);
		model.addAttribute("review", review);
		
		return "reviews/review_form";
	}
	
	@PostMapping("/post_review")
	public String saveReview(Model model, Review review, Integer productId, HttpServletRequest request) {
		
		Customer customer = getCustomer(request);
		Product product = null;
		
		try {
			product = productService.getProduct(productId);
		} catch (ProductNotFoundException e) {
			// TODO Auto-generated catch block
			return "error/404";
		}
		
		review.setProduct(product);
		review.setCustomer(customer);
		
		Review savedReview = reviewService.save(review);
		
		model.addAttribute("review", savedReview);
		
		return "reviews/review_done";
	}
	
	private Customer getCustomer(HttpServletRequest request) {
		
		String email = Utility.getEmailOfCustomer(request);
		
		return customerService.getCustomerByEmail(email);
	}
}
