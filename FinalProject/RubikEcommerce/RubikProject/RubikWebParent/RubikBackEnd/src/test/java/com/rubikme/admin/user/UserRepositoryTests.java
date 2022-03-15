package com.rubikme.admin.user;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.annotation.Rollback;

import com.rubikme.common.entity.Role;
import com.rubikme.common.entity.User;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class UserRepositoryTests {
	@Autowired
	private UserRepository repo;
	
	@Autowired
	private TestEntityManager entityManager;
	
	@Test
	public void testCreateUserWithOneRole() {
//		Role roleAdmin = entityManager.find(Role.class, 1);
		Role roleAdmin = new Role(3);
		User userAnhDuc = new User("anhduc@gmail.com", "duc2001", "Anh Duc", "Bach Tran");
		userAnhDuc.addRole(roleAdmin);
		
		User savedUser = repo.save(userAnhDuc);
		
		assertThat(savedUser.getId()).isGreaterThan(0);
	}
	
	@Test
	public void testCreateUserWithOneRole2() {
//		Role roleAdmin = entityManager.find(Role.class, 1);
		Role roleAdmin = new Role(1);
		User userAnhDuc = new User("anhduc1@gmail.com", "duc2001", "Anh Duc", "Bach Tran", true);
		userAnhDuc.addRole(roleAdmin);
		
		User savedUser = repo.save(userAnhDuc);
		
		assertThat(savedUser.getId()).isGreaterThan(0);
	}
	
	@Test
	public void testCreateUserWithTwoRoles() {
		User userLan = new User("lan@gmail.com", "lan2001", "lan", "lan");
		Role roleEditor = new Role(3);
		Role roleAssistant = new Role(5);

		
		userLan.addRole(roleEditor);
		userLan.addRole(roleAssistant);
		
		
		User savedUser = repo.save(userLan);
		
		assertThat(savedUser.getId()).isGreaterThan(0);
	}
	
	@Test
	public void testListAllUsers() {
		Iterable<User> listUsers = repo.findAll();
		
		listUsers.forEach(user -> System.out.println(user));
	}
	
	@Test
	public void testGetUserById() {
		User userName = repo.findById(1).get();
		System.out.println(userName);
		assertThat(userName).isNotNull();
	}
	
	@Test
	public void testUpdateUserDetails() {
		User userName = repo.findById(2).get();
		userName.setEnabled(true);
		userName.setEmail("lanlan@gmail.com");
		
		repo.save(userName);
		
	}
	
	@Test 
	public void testUpdateUserRoles() {
		User userName = repo.findById(2).get();
		
		Role roleEditor = new Role(3);
		Role roleSalesPerson = new Role(2);
		
		userName.getRoles().remove(roleEditor);
		userName.addRole(roleSalesPerson);
		
		repo.save(userName);
	}
	
	@Test
	public void testDeleteUser() {
		Integer userId = 9;
		repo.deleteById(userId);
		
	}
	
	@Test
	public void testGetUserByEmail() {
		String email = "lan@gmail.com";
		
		User user = repo.getUserByEmail(email);
		
		assertThat(user).isNotNull();
	} 
	
	@Test
	public void testCoundById() {
		Integer id = 1;
		
		Long countId = repo.countUserById(id);
		assertThat(countId).isNotNull().isGreaterThan(0);
	}
	
	@Test
	public void testDiableUser() {
		Integer id = 5;
		
		repo.updateEnabledStatus(id, false);
	}
	
	@Test
	public void testEnableUser() {
		Integer id = 5;
		
		repo.updateEnabledStatus(id, true);
	}
	
	@Test
	public void testFirstListPage() {
		int pageNumber = 0;
		int pageSize = 4;
		
		Pageable pageable = PageRequest.of(pageNumber, pageSize);
		Page<User> page = repo.findAll(pageable);
		
		List<User> listUsers = page.getContent();
		
		listUsers.forEach(user -> System.out.println(user));
		
		assertThat(listUsers.size()).isEqualTo(pageSize);
	}
	
	@Test
	public void testSearchUser() {
		String keyword = "duc";
		
		int pageNumber = 0;
		int pageSize = 4;
		
		Pageable pageable = PageRequest.of(pageNumber, pageSize);
		Page<User> page = repo.findAll(keyword, pageable);
		
		List<User> listUsers = page.getContent();
		
		listUsers.forEach(user -> System.out.println(user));
		
		assertThat(listUsers.size()).isGreaterThan(0);
	}
}
