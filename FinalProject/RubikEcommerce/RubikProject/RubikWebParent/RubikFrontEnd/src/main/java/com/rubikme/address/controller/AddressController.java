package com.rubikme.address.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rubikme.Utility;
import com.rubikme.address.AddressService;
import com.rubikme.cart.CartShoppingService;
import com.rubikme.common.entity.Address;
import com.rubikme.common.entity.CartItem;
import com.rubikme.common.entity.Customer;
import com.rubikme.customer.CustomerService;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	@Autowired 
	private CustomerService customerService;	
	
	@Autowired
	private CartShoppingService cartService;
	
	@GetMapping("/address")
	public String showAddressBook(Model model, HttpServletRequest request) {
		Customer customer = getAuthenticatedCustomer(request);
		List<Address> listAddresses = addressService.listAddressBook(customer);
		
		boolean usePrimaryAddressAsDefault = true;
		for (Address address : listAddresses) {
			if (address.isDefaultForShipping()) {
				usePrimaryAddressAsDefault = false;
				break;
			}
		}
		
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		
		int countCartItems = listCartItems.size();
		
		model.addAttribute("listAddresses", listAddresses);
		model.addAttribute("customer", customer);
		model.addAttribute("usePrimaryAddressAsDefault", usePrimaryAddressAsDefault);
		model.addAttribute("countCartItems", countCartItems);
		
		return "address/addresses";
	}
	
	private Customer getAuthenticatedCustomer(HttpServletRequest request) {
		String email = Utility.getEmailOfCustomer(request);				
		return customerService.getCustomerByEmail(email);
	}		
	
	@GetMapping("/address/new")
	public String newAddress(Model model) {
		
		model.addAttribute("address", new Address());
		model.addAttribute("title", "Add New Address");
		
		return "address/address_form";
	}
	
	@PostMapping("/address/save")
	public String saveAddress(Address address, HttpServletRequest request, RedirectAttributes ra) {
		
		String email = Utility.getEmailOfCustomer(request);						
		Customer customer = customerService.getCustomerByEmail(email);
		
		address.setCustomer(customer);
		//address.setAddressLine(email);
		addressService.save(address);
		
		ra.addFlashAttribute("message", "The address has been saved successfully.");
		
		return "redirect:/address";
	}
	
	@GetMapping("/address/edit/{id}")
	public String editAddress(@PathVariable("id") Integer addressId, Model model,
			HttpServletRequest request) {
		Customer customer = getAuthenticatedCustomer(request);
		
		Address address = addressService.get(addressId, customer.getId());

		model.addAttribute("address", address);
		model.addAttribute("pageTitle", "Edit Address (ID: " + addressId + ")");
		
		return "address/address_form";
	}
	
	@GetMapping("/address/delete/{id}")
	public String deleteAddress(@PathVariable("id") Integer addressId, RedirectAttributes ra,
			HttpServletRequest request) {
		Customer customer = getAuthenticatedCustomer(request);
		addressService.delete(addressId, customer.getId());
		
		ra.addFlashAttribute("message", "The address ID " + addressId + " has been deleted.");
		
		return "redirect:/address";
	}
	
	@GetMapping("/address/default/{id}")
	public String setDefault(@PathVariable("id") Integer addressId, 
			HttpServletRequest request) {
		
		Customer customer = getAuthenticatedCustomer(request);
		addressService.setDefaultAddress(addressId, customer.getId());
		
		return "redirect:/address";
	}
}
