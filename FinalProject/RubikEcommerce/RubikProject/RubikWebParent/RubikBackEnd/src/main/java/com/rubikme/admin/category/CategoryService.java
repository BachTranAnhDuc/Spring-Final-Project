package com.rubikme.admin.category;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
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
	
	public List<Category> listCategoriesUsedInForm() {
		List<Category> categoriesUsedInForm = new ArrayList<>();
		
		Iterable<Category> categoriesInDB = repo.findRootCategories(Sort.by("name").ascending());
		
		for (Category category : categoriesInDB) {
			categoriesUsedInForm.add(Category.copyIdAndName(category));
			
			Set<Category> children = sortSubCategories(category.getChildren());
			
			for (Category subCategory : children) {
				String name = "--" + subCategory.getName();
				categoriesUsedInForm.add(Category.copyIdAndName(subCategory.getId(), name));
				
				listSubCategoriesUsedInForm(categoriesUsedInForm, subCategory, 1);
			}
		}		
		
		return categoriesUsedInForm;
	}
	
	private SortedSet<Category> sortSubCategories(Set<Category> children) {
		return sortSubCategories(children, "asc");
	}
	
	private SortedSet<Category> sortSubCategories(Set<Category> children, String sortDir) {
		SortedSet<Category> sortedChildren = new TreeSet<>(new Comparator<Category>() {
			@Override
			public int compare(Category cat1, Category cat2) {
				if (sortDir.equals("asc")) {
					return cat1.getName().compareTo(cat2.getName());
				} else {
					return cat2.getName().compareTo(cat1.getName());
				}
			}
		});
		
		sortedChildren.addAll(children);
		
		return sortedChildren;
	}
	
	private void listSubCategoriesUsedInForm(List<Category> categoriesUsedInForm, 
			Category parent, int subLevel) {
		int newSubLevel = subLevel + 1;
		Set<Category> children = sortSubCategories(parent.getChildren());
		
		for (Category subCategory : children) {
			String name = "";
			for (int i = 0; i < newSubLevel; i++) {				
				name += "--";
			}
			name += subCategory.getName();
			
			categoriesUsedInForm.add(Category.copyIdAndName(subCategory.getId(), name));
			
			listSubCategoriesUsedInForm(categoriesUsedInForm, subCategory, newSubLevel);
		}		
	}	
}
