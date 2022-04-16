package com.rubikme.review;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.rubikme.common.entity.Review;

public interface ReviewRepository extends PagingAndSortingRepository<Review, Integer> {
	
	
}
