package com.aw.userprofile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aw.userprofile.domain.EventDomain;
import com.aw.userprofile.domain.LoginHistoryDomain;
import com.aw.userprofile.domain.UserDomain;
import com.aw.userprofile.service.EventService;
import com.aw.userprofile.service.LoginHistoryService;
import com.aw.userprofile.service.UserProfileService;

@CrossOrigin
@RestController
@RequestMapping("/aw")
public class UserProfileController {
	
	@Autowired
	private UserProfileService userProfileService;
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private LoginHistoryService loginHistoryService;
	
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
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/addEvent", method = RequestMethod.POST)
	public ResponseEntity<EventDomain> addEvent(@RequestBody EventDomain eventDomain) {
		EventDomain e = eventService.addEvent(eventDomain);
		HttpStatus httpStatus;
		if(e != null) {
			httpStatus = HttpStatus.OK;
		} else {
			httpStatus = HttpStatus.BAD_REQUEST;
		}
		
		return new ResponseEntity<EventDomain>(e, httpStatus);
	}
	
	@RequestMapping(value = "/deleteEvent", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteEvent(@RequestBody EventDomain eventDomain) {
		eventService.deleteEvent(eventDomain);
		
		return new ResponseEntity<String>("deleted!", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getLoginHistory", method = RequestMethod.GET)
	public ResponseEntity<List<LoginHistoryDomain>> getLoginHistory(@RequestParam("userId") String userId) {
		UserDomain userDomain = new UserDomain(userId, null, null);
		List<LoginHistoryDomain> loginHistoryDomainList = loginHistoryService.getLoginHistory(userDomain);
		HttpStatus httpStatus;
		if(loginHistoryDomainList != null) {
			httpStatus = HttpStatus.OK;
		} else {
			httpStatus = HttpStatus.BAD_REQUEST;
		}
		
		return new ResponseEntity<List<LoginHistoryDomain>>(loginHistoryDomainList, httpStatus);
	}

}
