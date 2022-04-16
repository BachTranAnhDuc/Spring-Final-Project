package com.rubikme.admin.review;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rubikme.common.entity.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer> {

}
