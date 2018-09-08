package com.aw.userprofile.service;

import com.aw.userprofile.domain.UserDomain;

public interface UserProfileService {
	
	public UserDomain getUser(UserDomain userDomain);
	
	public UserDomain createUser(UserDomain userDomain);
	
	public UserDomain deleteUser(UserDomain userDomain);
	
}
