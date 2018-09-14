package com.aw.userprofile.service;

import com.aw.userprofile.domain.UserDomain;

public interface UserProfileService {
	
	public UserDomain getUser(String userId);
	
	public UserDomain createUser(UserDomain userDomain);
	
	public void deleteUser(UserDomain userDomain);
	
	public UserDomain authenticateUser(String id, String password);
	
}
