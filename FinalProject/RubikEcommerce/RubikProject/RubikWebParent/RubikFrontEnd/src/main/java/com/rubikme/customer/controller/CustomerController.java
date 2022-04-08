package com.rubikme.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rubikme.customer.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService cusService;
	
	@GetMapping("/register")
	public String showFormRegister(Model model) {
		
		return "register/register_form";
	}
}
