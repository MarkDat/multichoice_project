package com.wild.dtos;

import com.wild.models.BaseModel;

public class ExamDTO extends BaseModel{
	private Long idExam;
	private Long idSubject;
	private Long idGrade;
	private String titleExam;
	private String nameSubject;
	private String nameGrade;
	
	public ExamDTO() {
		// TODO Auto-generated constructor stub
	}
	public ExamDTO(Long idExam, Long idSubject, Long idGrade, String titleExam, String nameSubject, String nameGrade) {
		super();
		this.idExam = idExam;
		this.idSubject = idSubject;
		this.idGrade = idGrade;
		this.titleExam = titleExam;
		this.nameSubject = nameSubject;
		this.nameGrade = nameGrade;
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
	public Long getIdGrade() {
		return idGrade;
	}
	public void setIdGrade(Long idGrade) {
		this.idGrade = idGrade;
	}
	public String getTitleExam() {
		return titleExam;
	}
	public void setTitleExam(String titleExam) {
		this.titleExam = titleExam;
	}
	public String getNameSubject() {
		return nameSubject;
	}
	public void setNameSubject(String nameSubject) {
		this.nameSubject = nameSubject;
	}
	public String getNameGrade() {
		return nameGrade;
	}
	public void setNameGrade(String nameGrade) {
		this.nameGrade = nameGrade;
	}
	
	
}
