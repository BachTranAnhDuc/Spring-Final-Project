package com.rubikme.admin.product;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.rubikme.common.entity.Product;

public interface ProductRepository extends PagingAndSortingRepository<Product, Integer> {

}
