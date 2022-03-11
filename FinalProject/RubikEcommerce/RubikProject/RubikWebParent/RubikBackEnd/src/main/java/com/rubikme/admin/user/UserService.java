package com.rubikme.admin.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.User;

@Service
public class UserService {
	
	@Autowired
	private UserRepository repo;
	
	public List<User> listAll() {
		return (List<User>) repo.findAll();
	}
}