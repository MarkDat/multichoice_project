package com.wild.models;

import java.util.List;

public class FileQuestion {
	private Long idExam;
	private List<Question> lqs;
	
	public FileQuestion() {
		// TODO Auto-generated constructor stub
	}
	
	public FileQuestion(Long idExam, List<Question> lqs) {
		this.idExam = idExam;
		this.lqs = lqs;
	}
	public Long getIdExam() {
		return idExam;
	}
	public void setIdExam(Long idExam) {
		this.idExam = idExam;
	}
	public List<Question> getLqs() {
		return lqs;
	}
	public void setLqs(List<Question> lqs) {
		this.lqs = lqs;
	}
	
}
