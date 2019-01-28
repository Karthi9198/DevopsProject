package com.niit.shoppingfrontend.model;

import java.io.Serializable;

import com.niit.shoppingbackend.dto.Address;
import com.niit.shoppingbackend.dto.User;

public class RegisterModel implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/*
	 * private fields
	 */

	private User user;
	private Address billing;

	/*
	 * getters and setters
	 */

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address getBilling() {
		return billing;
	}

	public void setBilling(Address billing) {
		this.billing = billing;
	}
	
	
}
