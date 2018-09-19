package com.aw.userprofile.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.aw.userprofile.entities.EventHistory;

@Repository
public interface EventHistoryRepo extends CrudRepository<EventHistory, Integer>{
	
	@Query("from EventHistory e order by e.id asc")
	public List<EventHistory> findAll();
	
	@Query("from EventHistory e where e.user.id= :userId")
	public List<EventHistory> findByUserId(@Param("userId") String userId);
	
	@Query("from EventHistory e where e.event.id= :eventId")
	public List<EventHistory> findByEventId(@Param("eventId") Integer eventId);
	
	@Query("from EventHistory e where e.user.id= :userId and e.event.id= :eventId")
	public List<EventHistory> findByUserIdAndEventId(@Param("userId") String userId, @Param("eventId") Integer eventId);
	
	@Query("from EventHistory e where e.user.id= :userId and e.event.name= :eventName")
	public List<EventHistory> findByUserIdAndEventName(@Param("userId") String userId, @Param("eventName") String eventName);

}
