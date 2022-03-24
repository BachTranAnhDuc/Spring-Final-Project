package com.rubikme.admin.product;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Date;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.rubikme.common.entity.Brand;
import com.rubikme.common.entity.Category;
import com.rubikme.common.entity.Product;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class ProductRepositoryTest {
	
	@Autowired
	private ProductRepository repo;
	
	@Autowired
	private TestEntityManager entityManager;
	
	@Test
	public void testCreateProduct() {
		Brand brand = entityManager.find(Brand.class, 4);
		Category category = entityManager.find(Category.class, 5);
		
		Product product = new Product();
		product.setName("Gan M 10 Pro");
		product.setAlias("gan m 10 pro");
		product.setShortDescription("Have a good day.");
		product.setFullDescription("This is a perfect product.");
		
		product.setBrand(brand);
		product.setCategory(category);
		
		product.setPrice(456);
		product.setCost(400);
		product.setEnabled(true);
		product.setInStock(true);
		
		product.setCreatedTime(new Date());
		product.setUpdatedTime(new Date());
		
		Product savedProduct = repo.save(product);
		
		assertThat(savedProduct).isNotNull();
	}
	
	@Test
	public void testListAllProduct() {
		Iterable<Product> iterableProducts = repo.findAll();
		
		iterableProducts.forEach(System.out::println);
	}
	
	@Test
	public void testGetProduct() {
		Integer id = 1;
		Product findById = repo.findById(id).get();
		
		System.out.println(findById);
		
		assertThat(findById).isNotNull();
	}
	
	@Test
	public void testUpdateProduct() {
		Integer id = 1;
		
		Product product = repo.findById(id).get();
		
		product.setPrice(430);
		
		repo.save(product);
		
		assertThat(product).isNotNull();
		
	}
}
