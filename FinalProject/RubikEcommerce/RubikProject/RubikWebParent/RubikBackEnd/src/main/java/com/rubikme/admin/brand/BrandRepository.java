package com.rubikme.admin.brand;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.rubikme.common.entity.Brand;

public interface BrandRepository extends PagingAndSortingRepository<Brand, Integer> {
	
	@Query("SELECT b FROM Brand b")
	public List<Brand> findAll();
	
	public Long countById(Integer id);
}
