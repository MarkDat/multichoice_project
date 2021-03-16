package com.wild.models;

public class ResultOfClient {
	private Long idExam;
	private Long idQ;
	private String resultU;
	private Boolean isTrue=false;
	
	public ResultOfClient() {
		// TODO Auto-generated constructor stub
	}
	
	public ResultOfClient(Long idExam, Long idQ, String resultU, Boolean isTrue) {
		this.idExam = idExam;
		this.idQ = idQ;
		this.resultU = resultU;
		this.isTrue = isTrue;
	}

	public Long getIdExam() {
		return idExam;
	}
	public void setIdExam(Long idExam) {
		this.idExam = idExam;
	}
	public Long getIdQ() {
		return idQ;
	}
	public void setIdQ(Long idQ) {
		this.idQ = idQ;
	}
	
	public Boolean getIsTrue() {
		return isTrue;
	}
	public void setIsTrue(Boolean isTrue) {
		this.isTrue = isTrue;
	}

	public String getResultU() {
		return resultU;
	}

	public void setResultU(String resultU) {
		this.resultU = resultU;
	}
	
}
