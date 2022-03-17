package com.rubikme.admin.category;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.rubikme.common.entity.Category;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class CategoryRepositoryTest {
	
	@Autowired
	private CategoryRepository repo;
	
	@Test
	public void testCreateRootCategory() {
		Category cate = new Category("Computer");
		
		Category saveCate = repo.save(cate);
		
		assertThat(saveCate.getId()).isGreaterThan(0);
	}
	
	@Test
	public void testCreateSubCategory() {
		Category parent = new Category(1);
		Category subCategory = new Category("Rubik_3x3", parent);
		Category saveCate = repo.save(subCategory);
		
		assertThat(saveCate.getId()).isGreaterThan(0);
	}
}
