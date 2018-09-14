package com.aw.userprofile.service;

import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.userprofile.domain.UserDomain;
import com.aw.userprofile.entities.User;
import com.aw.userprofile.repo.UserRepo;

@Service
public class UserProfileServiceImpl implements UserProfileService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserProfileServiceImpl.class);
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private LoginHistoryService loginHistoryService;
	
	@Override
	public UserDomain getUser(String userId) {
		// TODO Auto-generated method stub
		Optional<User> user = userRepo.findById(userId);
		if(!user.isPresent()) {
			return null;
		}
		User userEntity = user.get();
		UserDomain userDomain = convertToDomain(userEntity);
		
		loginHistoryService.saveLoginHistory(userDomain);
		
		return userDomain;
	}

	@Override
	public UserDomain createUser(UserDomain userDomain) {
		if(userRepo.existsById(userDomain.getUserId())) {
			LOGGER.debug("User already exists!");
			return null;
		}
		User user = convertToEntity(userDomain);
		userRepo.save(user);
		userDomain = convertToDomain(user);
		
		loginHistoryService.saveLoginHistory(userDomain);
		
		return userDomain;
	}

	@Override
	public void deleteUser(UserDomain userDomain) {
		// TODO Auto-generated method stub
		User user = convertToEntity(userDomain);
		userRepo.deleteById(userDomain.getUserId());
	}
	
	@Override
	public UserDomain authenticateUser(String userId, String password) {
		Optional<User> user = userRepo.findByIdAndPassword(userId, password);
		if(!user.isPresent()) {
			return null;
		}
		
		UserDomain userDomain = convertToDomain(user.get());
		
		loginHistoryService.saveLoginHistory(userDomain);
		
		return userDomain;
	}
	
	private UserDomain convertToDomain(User user) {
		// TODO Auto-generated method stub
		UserDomain userDomain = new UserDomain(user.getId(), user.getName(), user.getPassword());
		
		return userDomain;
	}
	
	private User convertToEntity(UserDomain userDomain) {
		User user = new User();
		user.setId(userDomain.getUserId());
		user.setName(userDomain.getUserName());
		user.setPassword(userDomain.getPassword());
		
		return user;
	}

}
