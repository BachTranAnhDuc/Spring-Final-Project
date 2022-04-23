package com.rubikme.admin.order;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.rubikme.common.entity.Order;

public interface OrderRepository extends PagingAndSortingRepository<Order, Integer> {
	@Query("SELECT o FROM Order o WHERE o.customer.firstName LIKE %?1% OR"
			+ " o.customer.phoneNumber LIKE %?1% OR"
			+ " o.customer.addressLine LIKE %?1% OR"
			+ " o.paymentMethod LIKE %?1% OR o.status LIKE %?1% OR"
			+ " o.customer.firstName LIKE %?1% OR"
			+ " o.customer.lastName LIKE %?1%")
	public Page<Order> findAll(String keyword, Pageable pageable);
	
	public long countById(Integer id);
	
	@Query("SELECT o FROM Order o")
	public List<Order> findAll();
}
