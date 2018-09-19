package com.aw.userprofile.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.userprofile.domain.UserDomain;
import com.aw.userprofile.domain.UserTagsCountOutputDomain;
import com.aw.userprofile.domain.UserTagsInputDomain;
import com.aw.userprofile.entities.User;
import com.aw.userprofile.entities.UserTags;
import com.aw.userprofile.repo.UserTagsRepo;

@Service
public class UserTagsServiceImpl implements UserTagsService {
	
	@Autowired
	private UserTagsRepo userTagsRepo;

	@Override
	public boolean updateOrInsert(UserTagsInputDomain userTagsInputDomain) {
		String[] arrayOfTags = userTagsInputDomain.getCommaSeparatedTags().split(",");
		UserDomain userDomain = userTagsInputDomain.getUserDomain();
		String userId = userDomain.getUserId();
		User user = new User();
		user.setId(userId);
		for(String inputTag: arrayOfTags) {
			Optional<UserTags> userTags = userTagsRepo.findByUserIdAndTag(userId, inputTag);
			if(userTags.isPresent()) {
				userTagsRepo.updateCount(userTags.get().getId(), (userTags.get().getCount())+1);
			} else {
				UserTags userTagsToInsert = new UserTags();
				userTagsToInsert.setCount(1);
				userTagsToInsert.setTag(inputTag);
				userTagsToInsert.setUser(user);
				userTagsToInsert.setLastVisited(new Timestamp(System.currentTimeMillis()));
				userTagsRepo.save(userTagsToInsert);
			}
		}
		return true;
	}

	@Override
	public List<UserTagsCountOutputDomain> getTagCountForUser(String userId) {
		List<UserTags> userTagsList = userTagsRepo.findByUserId(userId);
		List<UserTagsCountOutputDomain> userTagsCountOutputDomainList = new ArrayList<UserTagsCountOutputDomain>();
		int count = 0;
		for(UserTags userTags: userTagsList) {
			if(count >= 10) {
				break;
			}
			UserTagsCountOutputDomain userTagsCountOutputDomain = new UserTagsCountOutputDomain(userId, userTags.getTag(), userTags.getCount());
			userTagsCountOutputDomainList.add(userTagsCountOutputDomain);
			count++;
		}
		return userTagsCountOutputDomainList;
	}
	
}
