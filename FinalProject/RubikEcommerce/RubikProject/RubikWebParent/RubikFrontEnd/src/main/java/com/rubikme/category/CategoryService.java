package com.rubikme.category;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.Category;
import com.rubikme.common.exception.CategoryNotFoundException;

@Service
public class CategoryService {
	@Autowired
	private CategoryRepository repo;
	
	public List<Category> listNoChildrenCategories() {
		List<Category> listNoCategories = new ArrayList<>();
		
		List<Category> listEnabledCategories = repo.findAllEnabled();
		
		listEnabledCategories.forEach(category -> {
			Set<Category> children = category.getChildren();
			
			if (children == null || children.size() == 0) {
				listNoCategories.add(category);
			}
		});
		
		return listNoCategories;
	}
	
	public Category getCategory(String alias) throws CategoryNotFoundException {
		Category category = repo.findByAliasEnabled(alias);
		
		if (category == null) {
			throw new CategoryNotFoundException("Could not find any categories with alias " + alias);
		}
		
		return category;
	}
	
	public Category getCategoryById(Integer id) throws CategoryNotFoundException {
		Category category = repo.findById(id).get();
		
		if (category == null) {
			throw new CategoryNotFoundException("Could not find any categories with ID " + id);
		}
		
		return category;
	}
	
	public List<Category> getCategoryParents(Category child) {
		List<Category> listParents = new ArrayList<>();
		
		Category parent = child.getParent();
		
		while (parent != null) {
			listParents.add(0, parent);
			parent = parent.getParent();
		}
		
		listParents.add(child);
		
		return listParents;
	}
}
