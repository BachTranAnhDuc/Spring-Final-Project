package com.rubikme.order.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rubikme.Utility;
import com.rubikme.cart.CartShoppingService;
import com.rubikme.common.entity.CartItem;
import com.rubikme.common.entity.Customer;
import com.rubikme.common.entity.Order;
import com.rubikme.common.entity.OrderDetail;
import com.rubikme.common.entity.Product;
import com.rubikme.common.entity.Setting;
import com.rubikme.customer.CustomerService;
import com.rubikme.order.OrderService;
import com.rubikme.review.ReviewService;
import com.rubikme.security.CustomerUserDetails;
import com.rubikme.setting.SettingService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private SettingService settingService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CartShoppingService cartService;
	
	@GetMapping("/orders")
	public String listFirstPage(Model model, HttpServletRequest request, @AuthenticationPrincipal CustomerUserDetails loggerUser) {
		
		model.addAttribute("title", "Manage Order");
		
		return listByPage(1, model, "orderTime", "desc", null, request, loggerUser);
		
		//return "redirect:/orders/page/1?sortField=orderTime&sortDir=desc";
	}
	
	@GetMapping("/orders/page/{pageNum}")
	public String listByPage(@PathVariable(name = "pageNum") int pageNum, Model model,
			@Param("sortField") String sortField, @Param("sortDir") String sortDir,
			@Param("keyword") String keyword, HttpServletRequest request,
			@AuthenticationPrincipal CustomerUserDetails loggerUser){
		
		Customer customer = getCustomerAuthentication(request);
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		
		int countCartItems = listCartItems.size();
		
		Page<Order> pageOrder = orderService.listOrderByPage(customer, pageNum, sortField, sortDir, keyword);
		List<Order> listOrders = pageOrder.getContent();
		
		long startCount = (pageNum - 1) * OrderService.ORDERS_PER_PAGE + 1;
		long endCount = startCount + OrderService.ORDERS_PER_PAGE - 1;
		
		if (endCount > pageOrder.getTotalElements()){ 
			endCount = pageOrder.getTotalElements();
		}
		
		String reverseSortDir = sortDir.equals("asc") ? "desc" : "asc";
		
		model.addAttribute("totalPages", pageOrder.getTotalPages());
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", pageOrder.getTotalElements());
		model.addAttribute("listOrders", listOrders);
		model.addAttribute("sortField", sortField);
		model.addAttribute("sortDir", sortDir);
		model.addAttribute("reverseSortDir", reverseSortDir);
		model.addAttribute("keyword", keyword);
		model.addAttribute("moduleURL", "/orders");
		model.addAttribute("countCartItems", countCartItems);
		
		model.addAttribute("headerTitle", "/orders");
		
		loadCurrencySetting(request);
		
		
		return "orders/orders_customer";
	}
	
	private void loadCurrencySetting(HttpServletRequest request) {
		List<Setting> currencySettings = settingService.getGeneralSetting();
		
		for (Setting setting : currencySettings) {
			request.setAttribute(setting.getKey(), setting.getValue());
		}	
	}
	
	@GetMapping("/orders/detail/{id}")
	public String viewOrderDetail(@PathVariable("id") Integer id, Model model,
			RedirectAttributes ra, HttpServletRequest request, @AuthenticationPrincipal CustomerUserDetails loggerUser) {
		Customer customer = getCustomerAuthentication(request);
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		
		int countCartItems = listCartItems.size();
			
		Order order = orderService.getOrder(id, customer);
		
		setProductReviewStatus(customer, order);
		
		loadCurrencySetting(request);
		model.addAttribute("order", order);
		model.addAttribute("countCartItems", countCartItems);
			
		return "orders/order_details_modal";
	}
	
	private void setProductReviewStatus(Customer customer, Order order) {
		// TODO Auto-generated method stub
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			Product product = orderDetail.getProduct();
			Integer productId = product.getId();
			
			boolean didCustomerReview = reviewService.didCustomerReviewProduct(customer, productId);
			
			product.setReviewByCustomer(didCustomerReview);
			
			if (!didCustomerReview) {
				boolean canCustomerReview = reviewService.canCustomerReview(customer, productId);
				product.setCustomerCanReview(canCustomerReview);
			}
		}
	}

//	
//	@GetMapping("/orders/delete/{id}")
//	public String deleteOrder(@PathVariable("id") Integer id,
//			Model model, RedirectAttributes ra, HttpServletRequest request, @AuthenticationPrincipal RubikUserDetails loggerUser) {
//		try {
//			orderService.delete(id);
//			ra.addFlashAttribute("message", "The order ID: " + id + " has been deleted!");
//		}
//		catch (OrderNotFoundException ex) {
//			ra.addFlashAttribute("message", ex.getMessage());
//		}
//		
//		return listByPage(1, model, "id", "asc", null, request, loggerUser);
//	}
	
	public Customer getCustomerAuthentication(HttpServletRequest request) {
		String email = Utility.getEmailOfCustomer(request);
		
		return customerService.getCustomerByEmail(email);
	}
}
