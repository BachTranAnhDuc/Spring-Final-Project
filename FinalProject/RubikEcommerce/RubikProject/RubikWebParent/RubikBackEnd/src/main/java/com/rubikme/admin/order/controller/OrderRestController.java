package com.rubikme.admin.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rubikme.admin.order.OrderService;
import com.rubikme.admin.order.Reponse;

@RestController
public class OrderRestController {
	@Autowired
	private OrderService service;
	
	@PostMapping("/orders_shipper/update/{id}/{status}")
	public Reponse updateOrderStatus(@PathVariable("id") Integer orderId,
			@PathVariable("status") String status) {
		service.updateStatus(orderId, status);
		
		return new Reponse(orderId, status);
	}
}
