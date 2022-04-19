package com.rubikme.review;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.rubikme.common.entity.Product;
import com.rubikme.common.entity.Review;

public interface ReviewRepository extends PagingAndSortingRepository<Review, Integer> {
	
	@Query("SELECT r FROM Review r WHERE r.customer.id = ?1")
	public Page<Review> findByCustomer(Integer customerId, Pageable pageable);
	
	@Query("SELECT r FROM Review r WHERE r.customer.id = ?1 AND r.headline LIKE %?2% OR r.comment LIKE %?2% OR r.product.name LIKE %?2%")
	public Page<Review> findByCustomer(Integer customerId, String keyword, Pageable pageable);
	
	@Query("SELECT r FROM Review r WHERE r.customer.id = ?1 AND r.id = ?2")
	public Review findByCustomerAndId(Integer customerId, Integer reviewId);
	
	public Page<Review> findByProduct(Product product, Pageable pageable);
	
	@Query("SELECT COUNT(r.id) FROM Review r WHERE r.customer.id = ?1 AND r.product.id = ?2")
	public Long countByCustomerAndProduct(Integer customerId, Integer productId);
}
