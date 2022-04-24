package com.rubikme.admin.order;

import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.Order;
import com.rubikme.common.entity.OrderStatus;
import com.rubikme.common.entity.OrderTrack;

@Service
public class OrderService {
	
	public static final int ORDERS_PER_PAGE = 5;
	
	@Autowired 
	private OrderRepository repo;
	
	public Page<Order> listByPage(int pageNum, String sortField, String sortDir, String keyword) { 
		
		Sort sort = Sort.by(sortField);
		
		sort = sortDir.equals("asc") ? sort.ascending() : sort.descending();
		
		Pageable pageable = PageRequest.of(pageNum - 1, ORDERS_PER_PAGE, sort);
		
		if (keyword != null) {
			return repo.findAll(keyword, pageable);
		}
		
		return repo.findAll(pageable);	
	}
	
	public Order get(Integer id) throws OrderNotFoundException {
		try {
			return repo.findById(id).get();
		}
		catch (NoSuchElementException ex) {
			throw new OrderNotFoundException("Could not find any orders with ID: " + id);
		}
	}
	
	public void delete(Integer id) throws OrderNotFoundException {
		Long count = repo.countById(id);
		
		if (count == null || count == 0) {
			throw new OrderNotFoundException("Could not find any order with ID: " + id);
		}
		
		repo.deleteById(id);
	}
	
	public void updateStatus(Integer orderId, String status) {
		Order orderInDb = repo.findById(orderId).get();
		OrderStatus statusUpdate = OrderStatus.valueOf(status);
		
		if (!orderInDb.hasStatus(statusUpdate)) {
			List<OrderTrack> listOrderTracts = orderInDb.getOrderTracks();
			
			OrderTrack track = new OrderTrack();
			track.setOrder(orderInDb);
			track.setStatus(statusUpdate);
			track.setUpdateTime(new Date());
			track.setNotes(statusUpdate.defaultDescription());
			
			listOrderTracts.add(track);
			
			orderInDb.setStatus(statusUpdate);
			
			repo.save(orderInDb);
		}
	}
	
	public List<Order> listAll() {
		List<Order> listOrders = repo.findAll();
		
		return listOrders;
	}
}
