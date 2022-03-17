package com.rubikme.admin.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.Category;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository repo;
	
	public List<Category> listAll() {
		return (List<Category>) repo.findAll();
	}

	public void updateEnableUserStatus(Integer id, boolean enabled) {
		repo.updateEnabledStatus(id, enabled);
	}
}
