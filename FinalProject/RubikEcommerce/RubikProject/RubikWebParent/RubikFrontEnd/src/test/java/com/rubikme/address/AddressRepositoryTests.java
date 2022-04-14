package com.rubikme.address;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.rubikme.common.entity.Address;
import com.rubikme.common.entity.Customer;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class AddressRepositoryTests {
	
	@Autowired 
	private AddressRepository repo;
	
	@Test
	public void testAddNew() {
		Integer customerId = 2;
		
		Address newAddress = new Address();
		newAddress.setCustomer(new Customer(customerId));
		newAddress.setAddressLine("4213 Gordon Street");
		
		Address savedAddress = repo.save(newAddress);
		
		assertThat(savedAddress).isNotNull();
		assertThat(savedAddress.getId()).isGreaterThan(0);
	}
	
	@Test 
	public void testGetDefaultAddress() {
		Integer cusId = 1;
		
		Address address = repo.findDefaultByCustomer(cusId);
		assertThat(address).isNotNull();
		System.out.println(address);
	}
}
