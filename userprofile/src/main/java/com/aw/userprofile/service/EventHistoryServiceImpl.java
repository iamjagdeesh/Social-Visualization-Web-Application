package com.aw.userprofile.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.userprofile.domain.EventDomain;
import com.aw.userprofile.domain.EventHistoryDomain;
import com.aw.userprofile.domain.UserDomain;
import com.aw.userprofile.entities.Event;
import com.aw.userprofile.entities.EventHistory;
import com.aw.userprofile.entities.User;
import com.aw.userprofile.repo.EventHistoryRepo;
import com.aw.userprofile.repo.EventRepo;

@Service
public class EventHistoryServiceImpl implements EventHistoryService {
	
	@Autowired
	private EventHistoryRepo eventHistoryRepo;
	
	@Autowired
	private EventService eventService;

	@Override
	public EventHistoryDomain saveEventHistory(EventHistoryDomain eventHistoryDomain) {
		EventHistory eventHistory = convertToEntity(eventHistoryDomain);
		EventHistory returnedEventHistory = eventHistoryRepo.save(eventHistory);
		
		return convertToDomain(returnedEventHistory);
	}

	@Override
	public List<EventHistoryDomain> getEventHistory() {
		List<EventHistory> eventHistoryList = eventHistoryRepo.findAll();
		List<EventHistoryDomain> eventHistoryDomainList = new ArrayList<EventHistoryDomain>();
		for(EventHistory e: eventHistoryList) {
			EventHistoryDomain eventHistoryDomain = convertToDomain(e);
			eventHistoryDomainList.add(eventHistoryDomain);
		}
		
		return eventHistoryDomainList;
	}

	@Override
	public List<EventHistoryDomain> getEventHistory(String userId) {
		List<EventHistory> eventHistoryList = eventHistoryRepo.findByUserId(userId);
		List<EventHistoryDomain> eventHistoryDomainList = new ArrayList<EventHistoryDomain>();
		for(EventHistory e: eventHistoryList) {
			EventHistoryDomain eventHistoryDomain = convertToDomain(e);
			eventHistoryDomainList.add(eventHistoryDomain);
		}
		
		return eventHistoryDomainList;
	}

	@Override
	public List<EventHistoryDomain> getEventHistory(Integer eventId) {
		List<EventHistory> eventHistoryList = eventHistoryRepo.findByEventId(eventId);
		List<EventHistoryDomain> eventHistoryDomainList = new ArrayList<EventHistoryDomain>();
		for(EventHistory e: eventHistoryList) {
			EventHistoryDomain eventHistoryDomain = convertToDomain(e);
			eventHistoryDomainList.add(eventHistoryDomain);
		}
		
		return eventHistoryDomainList;
	}

	@Override
	public List<EventHistoryDomain> getEventHistory(String userId, Integer eventId) {
		List<EventHistory> eventHistoryList = eventHistoryRepo.findByUserIdAndEventId(userId, eventId);
		List<EventHistoryDomain> eventHistoryDomainList = new ArrayList<EventHistoryDomain>();
		for(EventHistory e: eventHistoryList) {
			EventHistoryDomain eventHistoryDomain = convertToDomain(e);
			eventHistoryDomainList.add(eventHistoryDomain);
		}
		
		return eventHistoryDomainList;
	}
	
	public EventHistoryDomain convertToDomain(EventHistory eventHistory) {
		User user = eventHistory.getUser();
		UserDomain userDomain = new UserDomain(user.getId(), user.getName(), user.getPassword());
		Event event = eventHistory.getEvent();
		EventDomain eventDomain = new EventDomain(event.getId(), event.getName());
		EventHistoryDomain eventHistoryDomain = new EventHistoryDomain(eventHistory.getId(), userDomain, eventDomain, eventHistory.getDescription(), eventHistory.getEventTime());
		
		return eventHistoryDomain;
	}
	
	public EventHistory convertToEntity(EventHistoryDomain eventHistoryDomain) {
		UserDomain userDomain = eventHistoryDomain.getUserDomain();
		User user = new User();
		user.setId(userDomain.getUserId());
		user.setName(userDomain.getUserName());
		user.setPassword(userDomain.getPassword());
		EventDomain eventDomain = eventHistoryDomain.getEventDomain();
		eventDomain = eventService.getEventByName(eventDomain.getName());
		if(eventDomain == null) {
			eventDomain = eventService.addEvent(eventHistoryDomain.getEventDomain());
		}
		Event event = new Event();
		event.setId(eventDomain.getId());
		event.setName(eventDomain.getName());
		EventHistory eventHistory = new EventHistory();
		eventHistory.setId(eventHistoryDomain.getId());
		eventHistory.setUser(user);
		if(eventHistoryDomain.getEventTime() != null)
			eventHistory.setEventTime(eventHistoryDomain.getEventTime());
		else
			eventHistory.setEventTime(new Timestamp(System.currentTimeMillis()));
		eventHistory.setEvent(event);
		eventHistory.setDescription(eventHistoryDomain.getDescription());
		return eventHistory;
	}

}
