package com.wild.models;

public class RankUser {
	private String name;
	private int totalMark;
	
	public RankUser() {
		// TODO Auto-generated constructor stub
	}

	public RankUser(String name, int totalMark) {
		this.name = name;
		this.totalMark = totalMark;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotalMark() {
		return totalMark;
	}

	public void setTotalMark(int totalMark) {
		this.totalMark = totalMark;
	}
	 
	
	
 }
