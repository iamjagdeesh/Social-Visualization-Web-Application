package com.aw.userprofile.service;

import java.util.List;

import com.aw.userprofile.domain.UserTagsCountOutputDomain;
import com.aw.userprofile.domain.UserTagsInputDomain;

public interface UserTagsService {
	
	public boolean updateOrInsert(UserTagsInputDomain userTagsInputDomain);
	
	public List<UserTagsCountOutputDomain> getTagCountForUser(String userId);

}
