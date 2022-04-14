package com.rubikme.order;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rubikme.common.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}
