package com.wild.models;

public class UserMark {
	private Long idUser;
	private String fullName="";
	private String email="";
	private String phone="";
	private String userName="";
	private String address="";
	private int point=0;
	private int times=0;
	
	public UserMark() {
		// TODO Auto-generated constructor stub
	}

	

	public UserMark(Long idUser, String fullName, String email, String phone, String userName, String address,
			int point, int times) {
		this.idUser = idUser;
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.userName = userName;
		this.address = address;
		this.point = point;
		this.times = times;
	}
	
	public UserMark(String fullName, String phone, String userName, String address,
			int point, int times) {
		this.fullName = fullName;
		this.phone = phone;
		this.userName = userName;
		this.address = address;
		this.point = point;
		this.times = times;
	}

	
	public double averagePointByTimes() {
		return (this.point/this.times);
		
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
