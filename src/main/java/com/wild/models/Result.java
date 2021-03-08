package com.wild.models;

import java.sql.Date;

public class Result extends BaseModel{
	private Long idUser;
	private Long idExam;
	private Date testDay;
	private Float mark;
	
	
	public Result(Long idUser, Long idExam, Date testDay, Float mark) {
		super();
		this.idUser = idUser;
		this.idExam = idExam;
		this.testDay = testDay;
		this.mark = mark;
	}
	public Long getIdUser() {
		return idUser;
	}
	public void setIdUser(Long idUser) {
		this.idUser = idUser;
	}
	public Long getIdExam() {
		return idExam;
	}
	public void setIdExam(Long idExam) {
		this.idExam = idExam;
	}
	public Date getTestDay() {
		return testDay;
	}
	public void setTestDay(Date testDay) {
		this.testDay = testDay;
	}
	public Float getMark() {
		return mark;
	}
	public void setMark(Float mark) {
		this.mark = mark;
	}
	
}
