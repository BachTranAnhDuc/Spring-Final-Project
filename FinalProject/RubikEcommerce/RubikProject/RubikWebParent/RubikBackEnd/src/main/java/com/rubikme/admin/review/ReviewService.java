package com.rubikme.admin.review;

import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.Review;

@Service
public class ReviewService {
	
	public static final int REVIEWS_PER_PAGE = 5;
	
	@Autowired
	private ReviewRepository reviewRepo;
	
	public Page<Review> listByPage(int pageNum, String sortField, String sortDir, String keyword) {
		
		Sort sort = Sort.by(sortField);
		
		sort = sortDir.equals("asc") ? sort.ascending() : sort.descending();
		
		Pageable pageable = PageRequest.of(pageNum - 1, REVIEWS_PER_PAGE, sort);
		
		if (keyword != null) {
			return reviewRepo.findAll(keyword, pageable);
		}
		
		return reviewRepo.findAll(pageable);
	}
	
	public Review get(Integer id) throws ReviewNotFoundException {
		try {
			return reviewRepo.findById(id).get();
		}
		catch (NoSuchElementException e) {
			// TODO: handle exception
			throw new ReviewNotFoundException("Could not find any reviews with ID: " + id);
		}
	}
	
	public void save(Review reviewInform) {
		Review reviewInDB = reviewRepo.findById(reviewInform.getId()).get();
		reviewInDB.setHeadline(reviewInform.getHeadline());
		reviewInDB.setComment(reviewInform.getComment());
		
		reviewRepo.save(reviewInDB);
	}
	
	public void delete(Integer id) throws ReviewNotFoundException {
		if (!reviewRepo.existsById(id)) {
			throw new ReviewNotFoundException("Could not find any reviews with ID: " + id);
		}
		
		reviewRepo.deleteById(id);
	}
}
