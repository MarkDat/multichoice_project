package com.wild.models;

import java.sql.Date;

public class History {
	private Long idUser;
	private String tittleExam;
	private float mark;
	private Date testDay;
	public History() {
		// TODO Auto-generated constructor stub
	}
	public History(Long idUser, String tittleExam, float mark, Date testDay) {
		this.idUser = idUser;
		this.tittleExam = tittleExam;
		this.mark = mark;
		this.testDay = testDay;
	}
	public Long getIdUser() {
		return idUser;
	}
	public void setIdUser(Long idUser) {
		this.idUser = idUser;
	}
	public String getTittleExam() {
		return tittleExam;
	}
	public void setTittleExam(String tittleExam) {
		this.tittleExam = tittleExam;
	}
	public float getMark() {
		return mark;
	}
	public void setMark(float mark) {
		this.mark = mark;
	}
	public Date getTestDay() {
		return testDay;
	}
	public void setTestDay(Date testDay) {
		this.testDay = testDay;
	}
	
	
}
