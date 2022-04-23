package com.rubikme.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.rubikme.Utility;
import com.rubikme.address.AddressService;
import com.rubikme.cart.CartShoppingService;
import com.rubikme.common.entity.Address;
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
	
	@Autowired
	private AddressService addressService;
	
	@GetMapping("/cart")
	public String viewCart(Model model, HttpServletRequest request) {
		
		Customer customer = getEmailByCustomer(request);
		
		List<CartItem> listCartItems = cartService.listCartItems(customer);
	
		
		int countCartItems = listCartItems.size();
		
		float totalAllPrice = 0;
		
		for (CartItem cart : listCartItems) {
			totalAllPrice += cart.getTotalPrice();
		}
		
		Address defaultAddress = addressService.getDefaultAddressByCustomer(customer);
		boolean usePrimaryAddressAsDefault = false;
		
		if (defaultAddress == null) {
			usePrimaryAddressAsDefault = true;
		}
		
		
		model.addAttribute("usePrimaryAddressAsDefault", usePrimaryAddressAsDefault);
		model.addAttribute("listCartItems", listCartItems);
		model.addAttribute("totalAllPrice", totalAllPrice);
		model.addAttribute("countCartItems", countCartItems);
		
		return "cart/shopping_cart";
	}
	
	@PostMapping("/cart/code")
	public String applyCode(Model model, HttpServletRequest request) {
		
		Customer customer = getEmailByCustomer(request);
		
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		
		String code = request.getParameter("couponCode");
		
		float totalAllPrice = 0;
		
		for (CartItem cart : listCartItems) {
			totalAllPrice += cart.getTotalPrice();
		}
		
		Address defaultAddress = addressService.getDefaultAddressByCustomer(customer);
		boolean usePrimaryAddressAsDefault = false;
		
		if (defaultAddress == null) {
			usePrimaryAddressAsDefault = true;
		}
		
		if (code == null) {
			totalAllPrice = totalAllPrice;
		}
		else {
			if (code.equals("code")) {
				totalAllPrice = totalAllPrice * (float)(0.9);
			}
		}
		
		int countCartItems = listCartItems.size();
		
		
		model.addAttribute("usePrimaryAddressAsDefault", usePrimaryAddressAsDefault);
		model.addAttribute("listCartItems", listCartItems);
		model.addAttribute("totalAllPrice", totalAllPrice);
		model.addAttribute("countCartItems", countCartItems);
		
		return "cart/shopping_cart";
	}
	
	private Customer getEmailByCustomer(HttpServletRequest request) {
		String email = Utility.getEmailOfCustomer(request);
		
		//String email = request.getUserPrincipal().getName();
		
		
		return customerService.getCustomerByEmail(email);
	}
}
