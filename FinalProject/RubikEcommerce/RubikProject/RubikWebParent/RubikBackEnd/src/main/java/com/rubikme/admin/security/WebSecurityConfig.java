package com.rubikme.admin.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Bean
	public UserDetailsService userDetailsService() {
		return new RubikUserDetailsService();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setUserDetailsService(userDetailsService());
		authProvider.setPasswordEncoder(passwordEncoder());
		
		return authProvider;
	}
	
	

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
//		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
//		
//		auth.inMemoryAuthentication()
//			.withUser("vinhduong@gmail.com").password(encoder.encode("123456789"))
//			.roles("Admin");
		
//		auth.inMemoryAuthentication()
//        .withUser("anhduc@gmail.com").password("{bcrypt}$2a$10$rVUKaS7LhsvUSDsMgtreR.LmsRq.x/W5kBwT3rj.0GtYvneqRPcX.")
//        .roles("Admin");
		auth.authenticationProvider(authenticationProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/users/**").hasAuthority("Admin")
			.antMatchers("/categories/**", "/brands/**").hasAnyAuthority("Admin", "Editor")
			
			.antMatchers("/products/new", "/products/delete/**").hasAnyAuthority("Admin", "Editor")
			
			.antMatchers("/products/edit/**", "/products/save", "/products/check_unique")
				.hasAnyAuthority("Admin", "Editor", "Salesperson")
				
			.antMatchers("/products", "/products/", "/products/detail/**", "/products/page/**")
				.hasAnyAuthority("Admin", "Editor", "Salesperson", "Shipper", "Assistant")
				
			.antMatchers("/products/**").hasAnyAuthority("Admin", "Editor", "Assistant")
			
			.antMatchers("/products/detail/**", "/customers/detail/**").hasAnyAuthority("Admin", "Editor", "Salesperson", "Assistant")
			
			.antMatchers("/orders", "/orders/", "/orders/page/**", "/orders/detail/**")
				.hasAnyAuthority("Admin", "Salesperson", "Shipper")
			
			.antMatchers("/customers/**", "/orders/**").hasAnyAuthority("Admin", "Salesperson")
			
			.antMatchers("/orders_shipper/update/**").hasAuthority("Shipper")
			
			.antMatchers("/reviews/**").hasAnyAuthority("Admin", "Assistant")
			
			.anyRequest()
			.authenticated()
			.and()
			.formLogin()
				.loginPage("/login")
				.usernameParameter("email")
				.permitAll()
			.and()
			.logout()
			.permitAll()
			.and().
			rememberMe()
				.key("AbcDefgHijKlmnOpqrs_1234567890")
				.tokenValiditySeconds(7 * 24 * 60 * 60);
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/images/**", "/js/**", "/webjars/**");		
	}

	
}
