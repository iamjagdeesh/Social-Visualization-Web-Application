package com.aw.userprofile.domain;

import java.sql.Timestamp;

public class LoginHistoryDomain {
	
	private Integer id;
	
	private UserDomain userDomain;
	
	private Timestamp loginTime;

	public LoginHistoryDomain() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoginHistoryDomain(Integer id, UserDomain userDomain, Timestamp loginTime) {
		super();
		this.id = id;
		this.userDomain = userDomain;
		this.loginTime = loginTime;
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

	public Timestamp getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((loginTime == null) ? 0 : loginTime.hashCode());
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
		LoginHistoryDomain other = (LoginHistoryDomain) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (loginTime == null) {
			if (other.loginTime != null)
				return false;
		} else if (!loginTime.equals(other.loginTime))
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
		return "LoginHistoryDomain [id=" + id + ", userDomain=" + userDomain + ", loginTime=" + loginTime + "]";
	}

}
