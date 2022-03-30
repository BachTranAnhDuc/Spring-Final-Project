package com.rubikme.admin.user;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.rubikme.common.entity.User;
import com.rubikme.common.entity.Role;

@Service
@Transactional
public class UserService {
	
	public static final int USERS_PER_PAGE = 6;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private RoleRepository roleRepo;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public User getByEmail(String email) {
		return userRepo.getUserByEmail(email);
	}
	
	public List<User> listAll() {
		return (List<User>) userRepo.findAll();
	}
	
	public List<Role> listRoles() {
		return (List<Role>) roleRepo.findAll();
	}

	public User save(User user) {
		boolean isUpdatingUser = (user.getId() != null);
		
		if (isUpdatingUser) {
			User existingUser = userRepo.findById(user.getId()).get();
			
			if (user.getPassword().isEmpty()) {
				user.setPassword(existingUser.getPassword());
			}
			else {
				encodePassword(user);
			}
		}
		else {
			encodePassword(user);
		}
		return userRepo.save(user);
	}
	
	public User updateAccount(User userInform) {
		User userInDb = userRepo.findById(userInform.getId()).get();
		
		if (!userInform.getPassword().isEmpty()) {
			userInDb.setPassword(userInform.getPassword());
			encodePassword(userInDb);
		}
		
		if (userInform.getPhotos() != null) {
			userInDb.setPhotos(userInform.getPhotos());
		}
		
		userInDb.setFirstName(userInform.getFirstName());
		userInDb.setLastName(userInform.getLastName());
		
		return userRepo.save(userInDb);
	}
	
	private void encodePassword(User user) {
		String encoderPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encoderPassword);
	}
	
	public boolean isEmailUnique(Integer id, String email) {
		User userByEmail = userRepo.getUserByEmail(email);
		
		if (userByEmail == null) {
			return true;
		}
		
		boolean isCreatingNew = (id == null);
		
		if (isCreatingNew) {
			if (userByEmail != null) return false;
		}
		else {
			if (userByEmail.getId() != id) {
				return false;
			}
		}
		
		return true;
	}

	public User get(Integer id) throws UserNotFoundException {
		
		try {
			return userRepo.findById(id).get();
		}
		catch (NoSuchElementException ex) {
			throw new UserNotFoundException("Could not find any user with ID" + id);
		}
	}
	
	public void delete(Integer id) throws UserNotFoundException{
		long countId = userRepo.countUserById(id);
		
		if (countId == 0) {
			throw new UserNotFoundException("Could not find any user with ID" + id);
		}
		
		userRepo.deleteById(id);
	}
	
	public void updateEnableUserStatus(Integer id, boolean enabled) {
		userRepo.updateEnabledStatus(id, enabled);
	}
	
	public Page<User> listByPage(int pageNum, String sortField, String sortDir, String keyword) {
		Sort sort = Sort.by(sortField);
		
		sort = sortDir.equals("asc") ? sort.ascending() : sort.descending();
		
		Pageable pageable = PageRequest.of(pageNum - 1, USERS_PER_PAGE, sort);
		
		if (keyword != null) {
			return userRepo.findAll(keyword, pageable);
		}
		
		return userRepo.findAll(pageable);
		
	}
}