package com.aw.userprofile.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.userprofile.domain.LoginHistoryDomain;
import com.aw.userprofile.domain.UserDomain;
import com.aw.userprofile.entities.LoginHistory;
import com.aw.userprofile.entities.User;
import com.aw.userprofile.repo.LoginHistoryRepo;

@Service
public class LoginHistoryServiceImpl implements LoginHistoryService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginHistoryServiceImpl.class);
	
	@Autowired
	private LoginHistoryRepo loginHistoryRepo;

	@Override
	public void saveLoginHistory(UserDomain userDomain) {
		LoginHistory loginHistory = new LoginHistory();
		User user = new User();
		user.setId(userDomain.getUserId());
		user.setName(userDomain.getUserName());
		user.setPassword(userDomain.getPassword());
		loginHistory.setUser(user);
		loginHistory.setLoginTime(new Timestamp(System.currentTimeMillis()));
		loginHistoryRepo.save(loginHistory);
	}
	
	public LoginHistory convertToEntity(LoginHistoryDomain loginHistoryDomain) {
		LoginHistory loginHistory = new LoginHistory();
		UserDomain userDomain = loginHistoryDomain.getUserDomain();
		User user = new User();
		user.setId(userDomain.getUserId());
		user.setName(userDomain.getUserName());
		user.setPassword(userDomain.getPassword());
		loginHistory.setUser(user);
		loginHistory.setLoginTime(loginHistoryDomain.getLoginTime());
		
		return loginHistory;
	}
	
	public LoginHistoryDomain convertToDomain(LoginHistory loginHistory) {
		User user = loginHistory.getUser();
		UserDomain userDomain = new UserDomain(user.getId(), user.getName(), user.getPassword());
		LoginHistoryDomain loginHistoryDomain = new LoginHistoryDomain(loginHistory.getId(), userDomain, loginHistory.getLoginTime());
		
		return loginHistoryDomain;
	}

	@Override
	public List<LoginHistoryDomain> getLoginHistory(UserDomain userDomain) {
		List<LoginHistory> loginHistoryList = loginHistoryRepo.findByUserId(userDomain.getUserId());
		List<LoginHistoryDomain> loginHistoryDomainList = new ArrayList<LoginHistoryDomain>();
		for(LoginHistory loginHistory: loginHistoryList) {
			LoginHistoryDomain loginHistoryDomain = convertToDomain(loginHistory);
			loginHistoryDomainList.add(loginHistoryDomain);
		}
		
		return loginHistoryDomainList;
	}
	
}
