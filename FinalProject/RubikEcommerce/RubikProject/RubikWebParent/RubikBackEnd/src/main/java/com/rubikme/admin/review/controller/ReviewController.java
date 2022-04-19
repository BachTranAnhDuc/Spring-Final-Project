package com.rubikme.admin.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rubikme.admin.product.ProductService;
import com.rubikme.admin.review.ReviewNotFoundException;
import com.rubikme.admin.review.ReviewService;
import com.rubikme.admin.user.UserService;
import com.rubikme.common.entity.Review;
import com.rubikme.common.entity.User;

@Controller
public class ReviewController {
	@Autowired 
	private ReviewService reviewService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/reviews")
	public String listFirstPage(Model model) {
		model.addAttribute("title", "Manage Review");
		return listByPage(1, model, "id", "asc", null);
	}
	
	@GetMapping("/reviews/page/{pageNum}")
	public String listByPage(@PathVariable(name = "pageNum") int pageNum, Model model,
			@Param("sortField") String sortField, @Param("sortDir") String sortDir,
			@Param("keyword") String keyword){
		
		Page<Review> pageReview = reviewService.listByPage(pageNum, sortField, sortDir, keyword);
		List<Review> listReviews = pageReview.getContent();
		
//		System.out.println("Page number = " + pageNum);
//		System.out.println("Total elements = " + pageUser.getTotalElements());
//		System.out.println("Total pages = " + pageUser.getTotalPages());
		
		long startCount = (pageNum - 1) * UserService.USERS_PER_PAGE + 1;
		long endCount = startCount + UserService.USERS_PER_PAGE - 1;
		
		if (endCount > pageReview.getTotalElements()){ 
			endCount = pageReview.getTotalElements();
		}
		
		String reverseSortDir = sortDir.equals("asc") ? "desc" : "asc";
		
		model.addAttribute("totalPages", pageReview.getTotalPages());
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", pageReview.getTotalElements());
		model.addAttribute("listReviews", listReviews);
		model.addAttribute("sortField", sortField);
		model.addAttribute("sortDir", sortDir);
		model.addAttribute("reverseSortDir", reverseSortDir);
		model.addAttribute("keyword", keyword);
		model.addAttribute("title", "Manage Reviews");
		model.addAttribute("headerTitle", "/reviews");
			
		return "reviews/reviews";
	}
	
	@GetMapping("/reviews/detail/{id}")
	public String viewReview(@PathVariable("id") Integer id,
			Model model, RedirectAttributes ra) {
		try {
			Review review = reviewService.get(id);
			model.addAttribute("review", review);
			
			return "reviews/review_detail_modal";
		}
		catch (ReviewNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
			
			return listByPage(1, model, "id", "asc", null);
		}
	}
	
	@PostMapping("/reviews/save")
	public String saveReview(Review reviewForm, RedirectAttributes ra, Model model) {
		reviewService.save(reviewForm);
		
		ra.addFlashAttribute("message", "The review ID " + reviewForm.getId() + " has been saved successfully!");
		
		return listByPage(1, model, "id", "asc", null);
	}
	
	@GetMapping("/reviews/delete/{id}")
	public String deleteReview(@PathVariable("id") Integer id, RedirectAttributes ra, Model model) {
		try {
			reviewService.delete(id);			
			ra.addFlashAttribute("message", "The review ID " + id + " has been deleted successfully");
		}
		catch (ReviewNotFoundException ex){
			ra.addFlashAttribute("message", ex.getMessage());
		}
		
		return listByPage(1, model, "id", "asc", null);
	}
}
