package com.aw.userprofile.domain;

public class UserTagsInputDomain {
	
	private Integer id;
	
	private UserDomain userDomain;
	
	private String commaSeparatedTags;

	public UserTagsInputDomain() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserTagsInputDomain(Integer id, UserDomain userDomain, String commaSeparatedTags) {
		super();
		this.id = id;
		this.userDomain = userDomain;
		this.commaSeparatedTags = commaSeparatedTags;
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

	public String getCommaSeparatedTags() {
		return commaSeparatedTags;
	}

	public void setCommaSeparatedTags(String commaSeparatedTags) {
		this.commaSeparatedTags = commaSeparatedTags;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((commaSeparatedTags == null) ? 0 : commaSeparatedTags.hashCode());
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
		UserTagsInputDomain other = (UserTagsInputDomain) obj;
		if (commaSeparatedTags == null) {
			if (other.commaSeparatedTags != null)
				return false;
		} else if (!commaSeparatedTags.equals(other.commaSeparatedTags))
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
		return "UserTagsInputDomain [id=" + id + ", userDomain=" + userDomain + ", commaSeparatedTags="
				+ commaSeparatedTags + "]";
	}
	
}
