package com.rubikme.admin.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rubikme.admin.user.UserService;

@RestController
public class UserRestController {
	
	@Autowired
	private UserService service;
	 
	@PostMapping("/users/check_email")
	public String checkDuplicationEmail(@Param("id") Integer id, @Param("email") String email) {
		return service.isEmailUnique(id, email) ? "OK" : "Duplicated";
	}
}
