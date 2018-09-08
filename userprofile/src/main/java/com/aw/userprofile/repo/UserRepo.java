package com.aw.userprofile.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.aw.userprofile.entities.User;

public interface UserRepo extends CrudRepository<User, String>{
	
	@Query("from User u order by u.id asc")
	public List<User> findAll();
	
	@Query("from User u where u.id = :userId")
	public Optional<User> findById(@Param("userId") String userId);
	
	@Query("from User u where u.id = :userId and u.password = :password")
	public Optional<User> findByIdAndPassword(@Param("userId") String userId, @Param("password") String password);
	
	public boolean existsById(@Param("id") String id);
	
}