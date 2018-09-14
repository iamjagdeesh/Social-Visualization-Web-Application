package com.aw.userprofile.service;

import java.util.List;

import com.aw.userprofile.domain.LoginHistoryDomain;
import com.aw.userprofile.domain.UserDomain;

public interface LoginHistoryService {
	
	public void saveLoginHistory(UserDomain userDomain);
	
	public List<LoginHistoryDomain> getLoginHistory(UserDomain userDomain);
	
}
