package com.rubikme.admin.user;

import org.springframework.data.repository.CrudRepository;

import com.rubikme.common.entity.User;

public interface UserRepository extends CrudRepository<User, Integer>{

}
