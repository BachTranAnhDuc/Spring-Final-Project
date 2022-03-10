package com.rubikme.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan({"com.rubikme.common.entity", "com.rubikme.admin.user"})
public class RubikBackEndApplication {

	public static void main(String[] args) {
		SpringApplication.run(RubikBackEndApplication.class, args);
	}

}
