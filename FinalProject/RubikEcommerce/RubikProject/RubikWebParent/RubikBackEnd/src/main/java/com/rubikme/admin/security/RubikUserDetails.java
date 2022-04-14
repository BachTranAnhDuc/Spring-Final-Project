package com.rubikme.admin.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.rubikme.common.entity.Role;
import com.rubikme.common.entity.User;

public class RubikUserDetails implements UserDetails {
	
	private User user;

	public RubikUserDetails(User user) {
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		
		Set<Role> roles = user.getRoles();
		
		List<SimpleGrantedAuthority> authories = new ArrayList<>();
		
		for (Role role : roles) {
			authories.add(new SimpleGrantedAuthority(role.getName()));
		}
		
		return authories;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return user.isEnabled();
	}

	public String getFullname() {
		return this.user.getFirstName() + " " + this.user.getLastName();
	}
	
	public Character getFirstname() {
		return this.user.getFirstName().charAt(0);
	}
	
	public void setFirstName(String firstName) {
		this.user.setFirstName(firstName);
	}
	
	public void setLastName(String lastName) {
		this.user.setLastName(lastName);
	}
	
	public Character setFirstCharacterFirstName(String firstName) {
		return this.user.getFirstName().charAt(0);
	}
	
	public boolean hasRole(String roleName) {
		return this.user.hasRole(roleName);
	}
}
