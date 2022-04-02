package com.rubikme.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("")
	public String viewHomePage(Model model) {
		model.addAttribute("title", "Homepage");
		model.addAttribute("headerTitle", "/");
		return "index";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@GetMapping("/index1")
	public String viewHomePage1() {
		return "index1";
	}
}
