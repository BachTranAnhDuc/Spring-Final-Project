package com.rubikme.checkout;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.rubikme.common.entity.PaymentMethod;
import com.rubikme.customer.CustomerService;
import com.rubikme.order.OrderService;

@Controller
public class CheckOutController {
	@Autowired
	private CheckOutService checkoutService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private CartShoppingService cartService;
	
	@Autowired
	private OrderService orderSerive;
	
	@GetMapping("/checkout")
	public String showCheckout(Model model, HttpServletRequest request) {
		
		Customer customer = getCustomerAuthencicated(request);
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		Address addressDefault = addressService.getDefaultAddressByCustomer(customer);
		CheckOutInfo checkoutInfo = checkoutService.prepareCheckout(listCartItems);
		
		int countCartItems = listCartItems.size();
		
		
		if (addressDefault != null) {
			model.addAttribute("shippingAddress", addressDefault);
		}
		else {
			model.addAttribute("shippingAddress", customer.getFullAddress());
		}
		
		
		model.addAttribute("listCartItems", listCartItems);
		model.addAttribute("customer", customer);
		model.addAttribute("checkoutInfo", checkoutInfo);
		model.addAttribute("countCartItems", countCartItems);
		
		return "checkout/checkout";
	}
	
	private Customer getCustomerAuthencicated(HttpServletRequest request) {
		
		String email = Utility.getEmailOfCustomer(request);
		return customerService.getCustomerByEmail(email);
	}
	
	@PostMapping("/place_order")
	public String placeOrder(HttpServletRequest request, Model model) {
		
		String paymentType = request.getParameter("paymentMethod");
		PaymentMethod paymentMethod = PaymentMethod.valueOf(paymentType);
		
		Customer customer = getCustomerAuthencicated(request);
		Address addressDefault = addressService.getDefaultAddressByCustomer(customer);
		
		//Address addressDefault = null;
		
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		CheckOutInfo checkoutInfo = checkoutService.prepareCheckout(listCartItems);
		int countCartItems = listCartItems.size();
		
		orderSerive.createOrder(customer, addressDefault, listCartItems, paymentMethod, checkoutInfo);
		cartService.deleteByCustomer(customer);
		
		
		model.addAttribute("listCartItems", listCartItems);
		model.addAttribute("checkoutInfo", checkoutInfo);
		model.addAttribute("countCartItems", countCartItems);
		
		return "checkout/order_completed";
	}
	
	@PostMapping("/credit_card")
	public String creditCard(HttpServletRequest request, Model model) {
		
		String paymentType = request.getParameter("paymentMethod");
		PaymentMethod paymentMethod = PaymentMethod.valueOf(paymentType);
		
		Customer customer = getCustomerAuthencicated(request);
		Address addressDefault = addressService.getDefaultAddressByCustomer(customer);
		
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		CheckOutInfo checkoutInfo = checkoutService.prepareCheckout(listCartItems);
		int countCartItems = listCartItems.size();
		
		orderSerive.createOrderCreditCard(customer, addressDefault, listCartItems, paymentMethod, checkoutInfo);
		cartService.deleteByCustomer(customer);
		
		
		model.addAttribute("listCartItems", listCartItems);
		model.addAttribute("checkoutInfo", checkoutInfo);
		model.addAttribute("countCartItems", countCartItems);
		
		return "checkout/order_completed";
	}
}
