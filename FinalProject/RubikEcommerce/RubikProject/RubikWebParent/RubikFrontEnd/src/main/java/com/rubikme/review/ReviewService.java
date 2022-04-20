package com.rubikme.review;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.Customer;
import com.rubikme.common.entity.OrderStatus;
import com.rubikme.common.entity.Product;
import com.rubikme.common.entity.Review;
import com.rubikme.order.detail.OrderDetailRepository;
import com.rubikme.product.ProductRepository;

@Service
@Transactional
public class ReviewService {
	
	public static final int REVIEWS_PER_PAGE = 5;
	
	@Autowired
	private ReviewRepository repo;
	
	@Autowired
	private OrderDetailRepository orderDetailRepo;
	
	@Autowired
	private ProductRepository productRepository;
	
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
	
	public Page<Review> listByProduct(Product product, int pageNum, String sortField, String sortDir) {
		Sort sort = Sort.by(sortField);
		sort = sortDir.equals("asc") ? sort.ascending() : sort.descending();
		Pageable pageable = PageRequest.of(pageNum - 1, REVIEWS_PER_PAGE, sort);
		
		return repo.findByProduct(product, pageable);
	}
	
	public Page<Review> listMostRecentReviewsByProduct(Product product) {
		Sort sort = Sort.by("reviewTime").descending();
		Pageable pageable = PageRequest.of(0, 3, sort);
		
		return repo.findByProduct(product, pageable);		
	}
	
	public boolean didCustomerReviewProduct(Customer customer, Integer productId) {
		Long count = repo.countByCustomerAndProduct(customer.getId(), productId);
		
		return count > 0;
	}
	
	public boolean canCustomerReview(Customer customer, Integer productId) {
		Long count = orderDetailRepo.countByProductAndCustomerOrderStatus(productId, customer.getId(), OrderStatus.DELIVERED);
		
		return count > 0;
	}
	
	public Review save(Review review) {
		review.setReviewTime(new Date());
		Review savedReview = repo.save(review);
		
		Integer productId = savedReview.getProduct().getId();
		
		productRepository.updateReviewCountAndAverageRating(productId);
		
		return savedReview;
	}
}
