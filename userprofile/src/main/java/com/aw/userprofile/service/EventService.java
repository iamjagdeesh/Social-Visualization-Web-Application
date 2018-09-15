package com.aw.userprofile.service;

import com.aw.userprofile.domain.EventDomain;

public interface EventService {
	
	public EventDomain addEvent(EventDomain eventDomain);
	
	public void deleteEvent(EventDomain eventDomain);
	
	public EventDomain getEventByName(String name);
	
	public EventDomain getEventById(Integer id);

}
