package com.rubikme;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rubikme.cart.CartShoppingService;
import com.rubikme.category.CategoryService;
import com.rubikme.common.entity.CartItem;
import com.rubikme.common.entity.Category;
import com.rubikme.common.entity.Customer;
import com.rubikme.common.exception.CategoryNotFoundException;
import com.rubikme.customer.CustomerService;

@Controller
public class MainController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CartShoppingService cartService;
	
	
	@GetMapping("")
	public String viewHomePage(Model model, HttpServletRequest request) throws CategoryNotFoundException {
		
		List<Category> listCategoriesParent = categoryService.listNoChildrenCategories();
				
		Category c1 = categoryService.getCategoryById(1);
		
		Category c2 = categoryService.getCategoryById(2);
		
		Category c3 = categoryService.getCategoryById(3);
		
		Customer customer = getEmailByCustomer(request);		
		List<CartItem> listCartItems = cartService.listCartItems(customer);
		
		int countCartItems = listCartItems.size();
		
		model.addAttribute("listCategoriesParent", listCategoriesParent);
		model.addAttribute("cate1", c1);
		model.addAttribute("cate2", c2);
		model.addAttribute("cate3", c3);
		model.addAttribute("listCartItems", listCartItems);
		model.addAttribute("countCartItems", countCartItems);
		
		return "index";
	}
	
	@GetMapping("/login")
	public String viewLoginPage() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			return "login";
		}
		
		return "redirect:/";
	}	
	
	private Customer getEmailByCustomer(HttpServletRequest request) {
		String email = Utility.getEmailOfCustomer(request);
		
		//String email = request.getUserPrincipal().getName();
		
		
		return customerService.getCustomerByEmail(email);
	}
}
