package com.aw.userprofile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.aw.userprofile.domain.UserDomain;
import com.aw.userprofile.service.UserProfileService;

@CrossOrigin
@RestController
@RequestMapping("/aw")
public class UserProfileController {
	
	@Autowired
	private UserProfileService userProfileService;
	
	@RequestMapping(value = "/info", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> getInfo() {
		return new ResponseEntity<String>("UserProfile is running!", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<UserDomain> registerUser(@RequestBody UserDomain userDomain) {
		UserDomain u = userProfileService.createUser(userDomain);
		HttpStatus httpStatus;
		if(u != null) {
			httpStatus = HttpStatus.OK;
		} else {
			httpStatus = HttpStatus.BAD_REQUEST;
		}
		
		return new ResponseEntity<UserDomain>(u, httpStatus);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.PUT)
	public ResponseEntity<UserDomain> loginUser(@RequestBody UserDomain userDomain) {
		UserDomain u = userProfileService.authenticateUser(userDomain.getUserId(), userDomain.getPassword());
		HttpStatus httpStatus;
		if(u != null) {
			httpStatus = HttpStatus.OK;
		} else {
			httpStatus = HttpStatus.BAD_REQUEST;
		}
		
		return new ResponseEntity<UserDomain>(u, httpStatus);
	}

}
