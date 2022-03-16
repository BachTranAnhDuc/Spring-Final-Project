package com.rubikme.admin.user.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rubikme.admin.FileUploadUtil;
import com.rubikme.admin.security.RubikUserDetails;
import com.rubikme.admin.user.UserService;
import com.rubikme.common.entity.User;

@Controller
public class AccountController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/account")
	public String viewDetailsAccount(@AuthenticationPrincipal RubikUserDetails loggedUser,
			Model model) {
		String email = loggedUser.getUsername();
		User user = userService.getByEmail(email);
		
		model.addAttribute("user", user);
		
		return "users/account_form";
	}
	
	@PostMapping("/account/update")
	public String saveDetailsUser(User user, RedirectAttributes redirectAttributes,
			@AuthenticationPrincipal RubikUserDetails loggedUser,
			@RequestParam("image") MultipartFile multipartFile) throws IOException {
		if (!multipartFile.isEmpty()) {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			
			user.setPhotos(fileName);
			
			User savedUser = userService.updateAccount(user);
			
			String uploadDir = "user-photos/" + savedUser.getId();
			
			FileUploadUtil.cleanDir(uploadDir);
			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
		}   
		else {
			if (user.getPhotos().isEmpty()) user.setPhotos(null);
			userService.updateAccount(user);
		}
		
		loggedUser.setFirstName(user.getFirstName());
		loggedUser.setLastName(user.getLastName());
		
		//System.out.println(user);
		//System.out.println(multipartFile.getOriginalFilename());
		
		redirectAttributes.addFlashAttribute("message", "Your accont details have been updated!");
		
		return "redirect:/account";
	}
}
