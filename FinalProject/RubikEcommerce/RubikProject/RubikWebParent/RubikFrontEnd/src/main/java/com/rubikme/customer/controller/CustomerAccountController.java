package com.rubikme.customer.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rubikme.Utility;
import com.rubikme.common.entity.Customer;
import com.rubikme.customer.CustomerService;
import com.rubikme.security.CustomerUserDetails;

@Controller
public class CustomerAccountController {
	
	@Autowired
	private CustomerService service;
	
	@GetMapping("/account_details")
	public String viewAccountDetails(Model model, HttpServletRequest request) {
		
		String email = Utility.getEmailOfCustomer(request);
		
		Customer customer = service.getCustomerByEmail(email);
		
		model.addAttribute("customer", customer);
		
		return "customer/account_form";
	}
	
	@PostMapping("/update_account_details")
	public String updateAccountDetails(Customer customer, RedirectAttributes ra,
			HttpServletRequest request, Model model) {
		
		service.update(customer);
		
		ra.addFlashAttribute("message", "Your account details have been updated.");
		
		Object principal = request.getUserPrincipal();
		
		if (principal instanceof UsernamePasswordAuthenticationToken 
				|| principal instanceof RememberMeAuthenticationToken) {
			CustomerUserDetails userDetails = getCustomerUserDetailsObject(principal);
			Customer authenticatedCustomer = userDetails.getCustomer();
			authenticatedCustomer.setFirstName(customer.getFirstName());
			authenticatedCustomer.setLastName(customer.getLastName());
		}
		
		return "redirect:/account_details";
	}
	
	private CustomerUserDetails getCustomerUserDetailsObject(Object principal) {
		CustomerUserDetails userDetails = null;
		if (principal instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) principal;
			userDetails = (CustomerUserDetails) token.getPrincipal();
		} else if (principal instanceof RememberMeAuthenticationToken) {
			RememberMeAuthenticationToken token = (RememberMeAuthenticationToken) principal;
			userDetails = (CustomerUserDetails) token.getPrincipal();
		}
		
		return userDetails;
	}
}
