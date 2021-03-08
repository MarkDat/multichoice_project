package com.wild.models;

import java.sql.Date;

public class User  extends BaseModel{
	private Long idUser;
	private String fullName;
	private String email;
	private String address;
	private String phone;
	
	
	public User(Long idUser, String fullName, String email, String address, String phone) {
		super();
		this.idUser = idUser;
		this.fullName = fullName;
		this.email = email;
		this.address = address;
		this.phone = phone;
	}
	public Long getIdUser() {
		return idUser;
	}
	public void setIdUser(Long idUser) {
		this.idUser = idUser;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
