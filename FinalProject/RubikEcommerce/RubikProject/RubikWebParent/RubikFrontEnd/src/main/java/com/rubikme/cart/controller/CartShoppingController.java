package com.rubikme.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rubikme.Utility;
import com.rubikme.cart.CartShoppingService;
import com.rubikme.common.entity.CartItem;
import com.rubikme.common.entity.Customer;
import com.rubikme.common.exception.CustomerNotFoundException;
import com.rubikme.customer.CustomerService;

@Controller
public class CartShoppingController {
	@Autowired
	private CartShoppingService cartService;
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/cart")
	public String viewCart(Model model, HttpServletRequest request) {
		
		Customer customer = getEmailByCustomer(request);
		
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		
		float totalAllPrice = 0;
		
		for (CartItem cart : listCartItems) {
			totalAllPrice += cart.getTotalPrice();
		}
		
		model.addAttribute("listCartItems", listCartItems);
		model.addAttribute("totalAllPrice", totalAllPrice);
		
		return "cart/shopping_cart";
	}
	
	private Customer getEmailByCustomer(HttpServletRequest request) {
		String email = Utility.getEmailOfCustomer(request);
		
		//String email = request.getUserPrincipal().getName();
		
		
		return customerService.getCustomerByEmail(email);
	}
}
