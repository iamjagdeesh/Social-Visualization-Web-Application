package com.aw.userprofile.service;

import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aw.userprofile.domain.EventDomain;
import com.aw.userprofile.entities.Event;
import com.aw.userprofile.repo.EventRepo;

@Service
public class EventServiceImpl implements EventService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EventServiceImpl.class);
	
	@Autowired
	private EventRepo eventRepo;

	@Override
	public EventDomain addEvent(EventDomain eventDomain) {
		Optional<Event> optEvent = eventRepo.findByName(eventDomain.getName());
		if(optEvent.isPresent()) {
			LOGGER.debug("Event already present to add!");
			return null;
		}
		Event event = new Event();
		event.setName(eventDomain.getName());
		Event savedEvent = eventRepo.save(event);
		EventDomain eventDomainR = convertToDomain(savedEvent);
		
		return eventDomainR;
	}

	@Override
	public void deleteEvent(EventDomain eventDomain) {
		Optional<Event> optEvent = eventRepo.findByName(eventDomain.getName());
		if(!optEvent.isPresent()) {
			LOGGER.debug("Event is not present to delete!");
		}
		eventRepo.delete(optEvent.get());
	}
	
	@Override
	public EventDomain getEventByName(String name) {
		Optional<Event> optEvent = eventRepo.findByName(name);
		if(!optEvent.isPresent()) {
			LOGGER.debug("Event is not present to return!");
			return null;
		}
		EventDomain eventDomain = convertToDomain(optEvent.get());
		
		return eventDomain;
	}

	@Override
	public EventDomain getEventById(Integer id) {
		Optional<Event> optEvent = eventRepo.findById(id);
		if(!optEvent.isPresent()) {
			LOGGER.debug("Event is not present to return!");
			return null;
		}
		EventDomain eventDomain = convertToDomain(optEvent.get());
		
		return eventDomain;
	}
	
	public EventDomain convertToDomain(Event event) {
		EventDomain eventDomain = new EventDomain(event.getId(), event.getName());
		
		return eventDomain;
	}

}
