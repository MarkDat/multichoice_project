package com.wild.models;

import java.sql.Date;

public class User  extends BaseModel{
	private Long idUser;
	private String fullName="";
	private String email="";
	private String address="";
	private String phone="";
	private String userName="";
	private String password="";
	private Role role = new Role();
	public User() {
		// TODO Auto-generated constructor stub
	}


	public User(Long idUser, String fullName, String email, String address, String phone, String userName,
			String password, Role role) {
		this.idUser = idUser;
		this.fullName = fullName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.userName = userName;
		this.password = password;
		this.role = role;
	}

	public User(String fullName, String email, String address, String phone, String userName,
			String password, Role role) {
		this.fullName = fullName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.userName = userName;
		this.password = password;
		this.role = role;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
	
	public Role getRole() {
		return role;
	}


	public void setRole(Role role) {
		this.role = role;
	}




	
}
