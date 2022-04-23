package com.rubikme.admin.order.controller;

import java.util.List;
import java.util.NoSuchElementException;

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

import com.rubikme.admin.order.OrderNotFoundException;
import com.rubikme.admin.order.OrderService;
import com.rubikme.admin.security.RubikUserDetails;
import com.rubikme.admin.setting.SettingService;
import com.rubikme.common.entity.Order;
import com.rubikme.common.entity.Setting;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private SettingService settingService;
	
	@GetMapping("/orders")
	public String listFirstPage(Model model, HttpServletRequest request, @AuthenticationPrincipal RubikUserDetails loggerUser) {
		
		model.addAttribute("title", "Manage Order");
		
		return listByPage(1, model, "orderTime", "desc", null, request, loggerUser);
		
		//return "redirect:/orders/page/1?sortField=orderTime&sortDir=desc";
	}
	
	@GetMapping("/orders/page/{pageNum}")
	public String listByPage(@PathVariable(name = "pageNum") int pageNum, Model model,
			@Param("sortField") String sortField, @Param("sortDir") String sortDir,
			@Param("keyword") String keyword, HttpServletRequest request,
			@AuthenticationPrincipal RubikUserDetails loggerUser){
		
		Page<Order> pageOrder = orderService.listByPage(pageNum, sortField, sortDir, keyword);
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
		
		model.addAttribute("headerTitle", "/orders");
		
		loadCurrencySetting(request);
		
		if (!loggerUser.hasRole("Admin") && !loggerUser.hasRole("Salesperson") && loggerUser.hasRole("Shipper")) {
			model.addAttribute("title", "Manage Orders (Shipper)");
			return "orders/orders_shipper";
		}
		else {
			model.addAttribute("title", "Manage Orders (Admin)");
		}
		
		return "orders/orders";
	}
	
	private void loadCurrencySetting(HttpServletRequest request) {
		List<Setting> currencySettings = settingService.getCurrencySettings();
		
		for (Setting setting : currencySettings) {
			request.setAttribute(setting.getKey(), setting.getValue());
		}	
	}
	
	@GetMapping("/orders/detail/{id}")
	public String viewOrderDetail(@PathVariable("id") Integer id, Model model,
			RedirectAttributes ra, HttpServletRequest request, @AuthenticationPrincipal RubikUserDetails loggerUser) {
		try {
			Order order = orderService.get(id);
			loadCurrencySetting(request);
			model.addAttribute("order", order);
			
			return "orders/order_details_modal";
		}
		catch (OrderNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
			return listByPage(1, model, "orderTime", "desc", null, request, loggerUser);
		}
	}
	
	@GetMapping("/orders/delete/{id}")
	public String deleteOrder(@PathVariable("id") Integer id,
			Model model, RedirectAttributes ra, HttpServletRequest request, @AuthenticationPrincipal RubikUserDetails loggerUser) {
		try {
			orderService.delete(id);
			ra.addFlashAttribute("message", "The order ID: " + id + " has been deleted!");
		}
		catch (OrderNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
		}
		
		return listByPage(1, model, "orderTime", "desc", null, request, loggerUser);
	}
}
