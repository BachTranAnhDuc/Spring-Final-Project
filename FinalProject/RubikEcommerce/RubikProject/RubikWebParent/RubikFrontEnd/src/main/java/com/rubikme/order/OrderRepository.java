package com.rubikme.order;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.rubikme.common.entity.Customer;
import com.rubikme.common.entity.Order;

public interface OrderRepository extends PagingAndSortingRepository<Order, Integer> {
	
	@Query("SELECT DISTINCT o FROM Order o JOIN o.orderDetails od JOIN od.product p WHERE o.customer.id = ?2 AND (p.name LIKE %?1% OR o.status LIKE %?1%)")
	public Page<Order> findAllByPageByKeyword(String keyword, Integer customerId, Pageable pageable);
	
	@Query("SELECT o FROM Order o WHERE o.customer.id = ?1")
	public Page<Order> findAllByPage(Integer customerId, Pageable pageable);
	
	public Order findByIdAndCustomer(Integer id, Customer customer);
}
