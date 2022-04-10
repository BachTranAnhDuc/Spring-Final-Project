package com.rubikme.cart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rubikme.Utility;
import com.rubikme.cart.CartShoppingService;
import com.rubikme.cart.ShoppingCartException;
import com.rubikme.common.entity.CartItem;
import com.rubikme.common.entity.Customer;
import com.rubikme.common.exception.CustomerNotFoundException;
import com.rubikme.customer.CustomerService;

@RestController
public class CartShoppingRestController {
	
	@Autowired
	private CartShoppingService cartService;
	
	@Autowired
	private CustomerService customerService;
	
	@PostMapping("/cart/add/{productId}/{quantity}")
	public String addProductToCart(@PathVariable("productId") Integer productId,
			@PathVariable("quantity") Integer quantity,
			HttpServletRequest request) {
		
		try {
			Customer customer = getEmailByCustomer(request);
			Integer updatedQuantity = cartService.addProduct(productId, quantity, customer);
			
			return updatedQuantity + " item(s) of this product were add to shop cart.";
		}
		catch (CustomerNotFoundException e) {
			return "You must login to add this product to cart.";
		}
		catch (ShoppingCartException e) {
			return e.getMessage();
		}
	}
	
	private Customer getEmailByCustomer(HttpServletRequest request) throws CustomerNotFoundException {
		String email = Utility.getEmailOfCustomer(request);
		
		//String email = request.getUserPrincipal().getName();
		
		if (email == null) {
			throw new CustomerNotFoundException("Not found customer!");
		}
		
		return customerService.getCustomerByEmail(email);
	}
}
