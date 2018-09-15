package com.aw.userprofile.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.aw.userprofile.entities.Event;

@Repository
public interface EventRepo extends CrudRepository<Event, Integer>{
	
	@Query("from Event e where e.name = :name")
	public Optional<Event> findByName(@Param("name") String name);

}
