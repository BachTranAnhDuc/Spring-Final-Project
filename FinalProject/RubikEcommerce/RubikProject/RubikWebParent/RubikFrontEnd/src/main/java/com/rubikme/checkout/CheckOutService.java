package com.rubikme.checkout;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rubikme.common.entity.CartItem;

@Service
public class CheckOutService {
	
	public CheckOutInfo prepareCheckout(List<CartItem> listCartItems) {
		CheckOutInfo checkInfo = new CheckOutInfo();
		
		float productCost = calculateProductCost(listCartItems);
		float productTotal = calculateProductTotal(listCartItems);
		
		checkInfo.setProductCost(productCost);
		checkInfo.setProductTotal(productTotal);
		checkInfo.setPaymentTotal(productTotal);
		checkInfo.setDeliverDays(5);
		
		return checkInfo;
	}

	private float calculateProductTotal(List<CartItem> listCartItems) {
		// TODO Auto-generated method stub
		
		float total = 0.0f;
		
		for (CartItem item : listCartItems) {
			total += item.getTotalPrice();
		}
		
		return total;
	}

	private float calculateProductCost(List<CartItem> listCartItems) {
		// TODO Auto-generated method stub
		
		float cost = 0.0f;
		
		for (CartItem item : listCartItems) {
			cost += item.getQuantity() * item.getProduct().getCost();
		}
		
		return cost;
	}
	
	
}
