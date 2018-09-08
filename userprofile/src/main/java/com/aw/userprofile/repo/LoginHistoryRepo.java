package com.aw.userprofile.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.aw.userprofile.entities.LoginHistory;

public interface LoginHistoryRepo extends CrudRepository<LoginHistory, String>{
	
	@Query("from LoginHistory l order by l.id asc")
	public List<LoginHistory> findAll();
	
	@Query("from LoginHistory l where l.user.id= :userId")
	public List<LoginHistory> findByUserId(@Param("userId") String userId);

}
