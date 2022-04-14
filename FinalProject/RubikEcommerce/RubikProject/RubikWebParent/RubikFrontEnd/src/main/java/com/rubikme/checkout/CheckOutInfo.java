package com.rubikme.checkout;

import java.util.Calendar;
import java.util.Date;

public class CheckOutInfo {
	
	private float productCost;
	private float productTotal;
	private float paymentTotal;
	
	private int deliverDays;
	private Date deliverDate;
	
	public CheckOutInfo() {
		
	}

	
	public float getProductCost() {
		return productCost;
	}
	
	public void setProductCost(float productCost) {
		this.productCost = productCost;
	}
	public float getProductTotal() {
		return productTotal;
	}
	
	public void setProductTotal(float productTotal) {
		this.productTotal = productTotal;
	}
	
	public float getPaymentTotal() {
		return paymentTotal;
	}
	
	public void setPaymentTotal(float paymentTotal) {
		this.paymentTotal = paymentTotal;
	}
	
	public int getDeliverDays() {
		return deliverDays;
	}
	
	public void setDeliverDays(int deliverDays) {
		this.deliverDays = deliverDays;
	}
	
	public Date getDeliverDate() {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, deliverDays);
		
		return calendar.getTime();
	}
	
	public void setDeliverDate(Date deliverDate) {
		this.deliverDate = deliverDate;
	}
		
}
