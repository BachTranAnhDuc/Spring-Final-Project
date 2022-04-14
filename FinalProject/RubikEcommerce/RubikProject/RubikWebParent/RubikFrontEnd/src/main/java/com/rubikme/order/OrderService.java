package com.rubikme.order;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rubikme.checkout.CheckOutInfo;
import com.rubikme.common.entity.Address;
import com.rubikme.common.entity.CartItem;
import com.rubikme.common.entity.Customer;
import com.rubikme.common.entity.Order;
import com.rubikme.common.entity.OrderDetail;
import com.rubikme.common.entity.OrderStatus;
import com.rubikme.common.entity.PaymentMethod;
import com.rubikme.common.entity.Product;

@Service
public class OrderService {
	
	@Autowired
	private OrderRepository orderRepo;
	
	public Order createOrder(Customer customer, Address address, List<CartItem> listCartItems,
			PaymentMethod paymentMethod, CheckOutInfo checkoutInfo) {
		
		Order newOrder = new Order();
		newOrder.setOrderTime(new Date());
		newOrder.setStatus(OrderStatus.NEW);
		newOrder.setCustomer(customer);
		newOrder.setProductCost(checkoutInfo.getProductCost());
		newOrder.setSubtotal(checkoutInfo.getPaymentTotal());
		newOrder.setPaymentMethod(paymentMethod);
		newOrder.setDeliverDays(5);
		newOrder.setDeliverDate(checkoutInfo.getDeliverDate());
		
		Set<OrderDetail> listOrderDetails = newOrder.getOrderDetails();
		
		for (CartItem cart : listCartItems) {
			Product product = cart.getProduct();
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(newOrder);
			orderDetail.setProduct(product);
			orderDetail.setQuantity(cart.getQuantity());
			orderDetail.setUnitPrice(product.getDiscountPrice());
			orderDetail.setProductCost(product.getCost() * cart.getQuantity());
			orderDetail.setSubtotal(cart.getTotalPrice());
			
			listOrderDetails.add(orderDetail);
		}
		
		
		return orderRepo.save(newOrder);
	}
	
	public Order createOrderCreditCard(Customer customer, Address address, List<CartItem> listCartItems,
			PaymentMethod paymentMethod, CheckOutInfo checkoutInfo) {
		
		Order newOrder = new Order();
		newOrder.setOrderTime(new Date());
		newOrder.setCustomer(customer);
		newOrder.setProductCost(checkoutInfo.getProductCost());
		newOrder.setSubtotal(checkoutInfo.getPaymentTotal());
		newOrder.setPaymentMethod(paymentMethod);
		newOrder.setDeliverDays(5);
		newOrder.setDeliverDate(checkoutInfo.getDeliverDate());
		newOrder.setStatus(OrderStatus.PAID);
		
		Set<OrderDetail> listOrderDetails = newOrder.getOrderDetails();
		
		for (CartItem cart : listCartItems) {
			Product product = cart.getProduct();
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(newOrder);
			orderDetail.setProduct(product);
			orderDetail.setQuantity(cart.getQuantity());
			orderDetail.setUnitPrice(product.getDiscountPrice());
			orderDetail.setProductCost(product.getCost() * cart.getQuantity());
			orderDetail.setSubtotal(cart.getTotalPrice());
			
			listOrderDetails.add(orderDetail);
		}
		
		
		return orderRepo.save(newOrder);
	}
}
