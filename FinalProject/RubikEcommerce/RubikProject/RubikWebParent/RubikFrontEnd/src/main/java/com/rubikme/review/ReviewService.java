package com.rubikme.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.Customer;
import com.rubikme.common.entity.Review;

@Service
public class ReviewService {
	
	public static final int REVIEWS_PER_PAGE = 5;
	
	@Autowired
	private ReviewRepository repo;
	
	public Page<Review> listByCustomerPage(Customer customer, String keyword, int pageNum, String sortField, String sortDir) {
		Sort sort = Sort.by(sortField);
		sort = sortDir.equals("asc") ? sort.ascending() : sort.descending();
		
		Pageable pageable = PageRequest.of(pageNum - 1, REVIEWS_PER_PAGE, sort);
		
		if (keyword != null) {
			return repo.findByCustomer(customer.getId(), keyword, pageable);
		}
		
		return repo.findByCustomer(customer.getId(), pageable);
	}
	
	public Review getCustomerAndId(Customer customer, Integer reviewId) throws ReviewNotFoundException {
		Review review = repo.findByCustomerAndId(customer.getId(), reviewId);
		
		if (review == null) {
			throw new ReviewNotFoundException("Customer does not have any reviews with ID: " + reviewId);
		}
		
		
		return review;
	}
}
