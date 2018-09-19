package com.aw.userprofile.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aw.userprofile.entities.UserTags;

@Repository
public interface UserTagsRepo extends CrudRepository<UserTags, Integer>{
	
	@Query("from UserTags u order by u.id asc")
	public List<UserTags> findAll();
	
	@Query("from UserTags u where u.user.id= :userId order by u.count desc")
	public List<UserTags> findByUserId(@Param("userId") String userId);
	
	@Query("from UserTags u where u.user.id= :userId and u.tag= :tag")
	public Optional<UserTags> findByUserIdAndTag(@Param("userId") String userId, @Param("tag") String tag);
	
	@Modifying
	@Transactional
    @Query("UPDATE UserTags u SET u.count = :count WHERE u.id = :userTagId")
	int updateCount(@Param("userTagId") Integer userTagId, @Param("count") Integer count);

}
