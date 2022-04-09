package com.rubikme.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rubikme.customer.CustomerService;

@RestController
public class CustomerRestController {
	@Autowired
	private CustomerService cusService;
	
	@PostMapping("/customers/check_unique_email")
	public String checkDuplicateEmail(@Param("email") String email) {
		return cusService.isEmailUnique(email) ? "OK" : "Duplicated";
	}
}
