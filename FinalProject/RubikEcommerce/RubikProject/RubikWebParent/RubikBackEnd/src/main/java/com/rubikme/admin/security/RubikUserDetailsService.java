package com.rubikme.admin.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.rubikme.admin.user.UserRepository;
import com.rubikme.common.entity.User;

public class RubikUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		User user = userRepository.getUserByEmail(username);
		
		if (user != null) {
			return new RubikUserDetails(user);
		}
		
		throw new UsernameNotFoundException("Could not find user with email: " + username);
	}

}
