package com.aw.userprofile.domain;

import java.sql.Timestamp;

public class EventHistoryDomain {
	
	private Integer id;
	
	private UserDomain userDomain;
	
	private EventDomain eventDomain;
	
	private String description;
	
	private Timestamp eventTime;

	public EventHistoryDomain() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EventHistoryDomain(Integer id, UserDomain userDomain, EventDomain eventDomain, String description,
			Timestamp eventTime) {
		super();
		this.id = id;
		this.userDomain = userDomain;
		this.eventDomain = eventDomain;
		this.description = description;
		this.eventTime = eventTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public UserDomain getUserDomain() {
		return userDomain;
	}

	public void setUserDomain(UserDomain userDomain) {
		this.userDomain = userDomain;
	}

	public EventDomain getEventDomain() {
		return eventDomain;
	}

	public void setEventDomain(EventDomain eventDomain) {
		this.eventDomain = eventDomain;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getEventTime() {
		return eventTime;
	}

	public void setEventTime(Timestamp eventTime) {
		this.eventTime = eventTime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((eventDomain == null) ? 0 : eventDomain.hashCode());
		result = prime * result + ((eventTime == null) ? 0 : eventTime.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((userDomain == null) ? 0 : userDomain.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EventHistoryDomain other = (EventHistoryDomain) obj;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (eventDomain == null) {
			if (other.eventDomain != null)
				return false;
		} else if (!eventDomain.equals(other.eventDomain))
			return false;
		if (eventTime == null) {
			if (other.eventTime != null)
				return false;
		} else if (!eventTime.equals(other.eventTime))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (userDomain == null) {
			if (other.userDomain != null)
				return false;
		} else if (!userDomain.equals(other.userDomain))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "EventHistoryDomain [id=" + id + ", userDomain=" + userDomain + ", eventDomain=" + eventDomain
				+ ", description=" + description + ", eventTime=" + eventTime + "]";
	}
	
}
