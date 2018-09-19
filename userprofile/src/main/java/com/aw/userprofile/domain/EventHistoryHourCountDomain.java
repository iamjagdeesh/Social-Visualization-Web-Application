package com.aw.userprofile.domain;

public class EventHistoryHourCountDomain {
	
	private String eventName;
	
	private String timeOfDay;
	
	private Integer count;

	public EventHistoryHourCountDomain() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EventHistoryHourCountDomain(String eventName, String timeOfDay, Integer count) {
		super();
		this.eventName = eventName;
		this.timeOfDay = timeOfDay;
		this.count = count;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getTimeOfDay() {
		return timeOfDay;
	}

	public void setTimeOfDay(String timeOfDay) {
		this.timeOfDay = timeOfDay;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((count == null) ? 0 : count.hashCode());
		result = prime * result + ((eventName == null) ? 0 : eventName.hashCode());
		result = prime * result + ((timeOfDay == null) ? 0 : timeOfDay.hashCode());
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
		EventHistoryHourCountDomain other = (EventHistoryHourCountDomain) obj;
		if (count == null) {
			if (other.count != null)
				return false;
		} else if (!count.equals(other.count))
			return false;
		if (eventName == null) {
			if (other.eventName != null)
				return false;
		} else if (!eventName.equals(other.eventName))
			return false;
		if (timeOfDay == null) {
			if (other.timeOfDay != null)
				return false;
		} else if (!timeOfDay.equals(other.timeOfDay))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "EventHistoryHourCountDomain [eventName=" + eventName + ", timeOfDay=" + timeOfDay + ", count=" + count
				+ "]";
	}
	
}
