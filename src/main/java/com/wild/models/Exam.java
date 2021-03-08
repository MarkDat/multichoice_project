package com.wild.models;

public class Exam extends BaseModel{
	private Long idExam;
	private Long idSubject;
	private String titleExam;
	
	public Exam() {}
	public Exam(Long idExam, Long idSubject, String titleExam) {
		super();
		this.idExam = idExam;
		this.idSubject = idSubject;
		this.titleExam = titleExam;
	}
	public Long getIdExam() {
		return idExam;
	}
	public void setIdExam(Long idExam) {
		this.idExam = idExam;
	}
	public Long getIdSubject() {
		return idSubject;
	}
	public void setIdSubject(Long idSubject) {
		this.idSubject = idSubject;
	}
	public String getTitleExam() {
		return titleExam;
	}
	public void setTitleExam(String titleExam) {
		this.titleExam = titleExam;
	}
	
}
