package com.aw.userprofile.service;

import java.util.List;

import com.aw.userprofile.domain.EventHistoryDomain;
import com.aw.userprofile.domain.EventHistoryHourCountDomain;

public interface EventHistoryService {
	
	public EventHistoryDomain saveEventHistory(EventHistoryDomain eventHistoryDomain);
	
	public List<EventHistoryDomain> getEventHistory();
	
	public List<EventHistoryDomain> getEventHistory(String userId);
	
	public List<EventHistoryDomain> getEventHistory(Integer eventId);
	
	public List<EventHistoryDomain> getEventHistory(String userId, Integer eventId);
	
	public List<EventHistoryHourCountDomain> getEventHistoyHourCount(String userId, String eventName);

}
