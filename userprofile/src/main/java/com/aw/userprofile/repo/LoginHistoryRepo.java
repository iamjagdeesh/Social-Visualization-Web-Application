package com.aw.userprofile.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.aw.userprofile.entities.LoginHistory;

@Repository
public interface LoginHistoryRepo extends CrudRepository<LoginHistory, Integer>{
	
	@Query("from LoginHistory l order by l.id asc")
	public List<LoginHistory> findAll();
	
	@Query("from LoginHistory l where l.user.id= :userId")
	public List<LoginHistory> findByUserId(@Param("userId") String userId);

}
