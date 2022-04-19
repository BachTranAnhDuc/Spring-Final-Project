package com.rubikme.product;

import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.Product;
import com.rubikme.common.exception.ProductNotFoundException;

@Service
public class ProductService {
	
	public static final int PRODUCTS_PER_PAGE = 10;
	public static final int SEARCH_PRODUCTS_PER_PAGE = 10;
	
	@Autowired 
	private ProductRepository repo;
	
	public Page<Product> listByCategory(int pageNum, Integer categoryId) {
		
		String categoryMatch = "-" + String.valueOf(categoryId) + "-";
		
		Pageable pageable = PageRequest.of(pageNum - 1, PRODUCTS_PER_PAGE);
		
		return repo.listByCategory(categoryId, categoryMatch, pageable);
	}
	
	public Page<Product> listProductByPage(int pageNum) {
		
		Pageable pageable = PageRequest.of(pageNum - 1, PRODUCTS_PER_PAGE);
		
		return repo.listProductEnabled(pageable);
	}
	
	public Product getProduct(String alias) throws ProductNotFoundException {
		Product product = repo.findByAlias(alias);
		
		if (product == null) {
			throw new ProductNotFoundException("Could not find any product with alias " + alias);
		}
		
		return product;
	}
	
	public Product getProduct(Integer id) throws ProductNotFoundException {
		
		try {
			Product product = repo.findById(id).get();
			return product;
		}
		catch (NoSuchElementException ex) { 
			throw new ProductNotFoundException("Could not find any product with ID: " + id);
		}
		
	}
	
	public Page<Product> search(String keyword, int pageNum) {
		Pageable pageable = PageRequest.of(pageNum - 1, SEARCH_PRODUCTS_PER_PAGE);
		
		return repo.search(keyword, pageable);
	}
}
