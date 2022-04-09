package com.rubikme.customer;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.Customer;

import net.bytebuddy.utility.RandomString;

@Service
@Transactional
public class CustomerService {

	@Autowired 
	private CustomerRepository customerRepo;
	
	@Autowired 
	private PasswordEncoder passwordEncoder;
	
	
	public boolean isEmailUnique(String email) {
		Customer customer = customerRepo.findByEmail(email);
		return customer == null;
	}
	
	public void registerCustomer(Customer customer) {
		encodePassword(customer);
		customer.setEnabled(false);
		customer.setCreatedTime(new Date());
		
		String randomCode = RandomString.make(64);
		customer.setVerificationCode(randomCode);
		
		customerRepo.save(customer);
		
	}

	private void encodePassword(Customer customer) {
		String encodedPassword = passwordEncoder.encode(customer.getPassword());
		customer.setPassword(encodedPassword);
	}
	
	public boolean verify(String verification) {
		
		Customer customer = customerRepo.findByVerificationCode(verification);
		
		if (customer == null || customer.isEnabled()) {
			return false;
		}
		else {
			customerRepo.enable(customer.getId());
			return true;
		}
		
	}
}
