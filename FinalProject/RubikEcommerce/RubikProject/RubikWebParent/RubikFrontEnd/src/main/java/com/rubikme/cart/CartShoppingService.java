package com.rubikme.cart;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.CartItem;
import com.rubikme.common.entity.Customer;
import com.rubikme.common.entity.Product;
import com.rubikme.product.ProductRepository;

@Service
@Transactional
public class CartShoppingService {
	
	@Autowired
	private CartItemRepository cartRepo;
	
	@Autowired
	private ProductRepository productRepository;
	
	public Integer addProduct(Integer productId, Integer quantity, Customer customer) throws ShoppingCartException {
		
		Integer updateQuantity = quantity;
		Product product = new Product(productId);
		
		CartItem cartItem = cartRepo.findByCustomerAndProduct(customer, product);
		
		if (cartItem != null) {
			updateQuantity = cartItem.getQuantity() + quantity;
			
			if (updateQuantity > 5) {
				throw new ShoppingCartException("Could not add more " + quantity + " item(s)"
						+ " because there's already " + cartItem.getQuantity() + " item(s) "
						+ "in your shopping cart. Maximum allowed quantity is 5.");
			}
		}
		else {
			cartItem = new CartItem();
			cartItem.setCustomer(customer);
			cartItem.setProduct(product);
		}
		
		cartItem.setQuantity(updateQuantity);
		
		cartRepo.save(cartItem);
		
		return updateQuantity;
	}
	
	public List<CartItem> listCartItems(Customer customer) {
		return cartRepo.findByCustomer(customer);
	}
	
	public float updateQuantity(Integer productId, Integer quantity, Customer customer) {
		cartRepo.updateQuantity(quantity, customer.getId(), productId);
		
		Product product = productRepository.findById(productId).get();
		
		float totalAll = product.getDiscountPrice() * quantity;
		
		return totalAll;
	}
	
	public void removeProduct(Integer productId, Customer customer) {
		cartRepo.deleteByCustomerAndProduct(customer.getId(), productId);
	}
	
	public void deleteByCustomer(Customer customer) {
		cartRepo.deleteByCustomer(customer.getId());
	}
	
	public void applyCouponCode(Integer productId, Customer customer, String code) {
		
		Product product = productRepository.findById(productId).get();
		
		float totalApplyCode = product.getDiscountPercent() * (float)(0.9);
		
	}
}
