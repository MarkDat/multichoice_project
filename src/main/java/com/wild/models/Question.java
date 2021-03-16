package com.wild.models;

public class Question extends BaseModel{
	private Long idQ;
	private Long idExam;
	private String content;
	private String img="";
	private String rsA=null;
	private String rsB=null;
	private String rsC=null;
	private String rsD=null;
	private String rs=null;
	private Boolean choseA=false;
	private Boolean choseB=false;
	private Boolean choseC=false;
	private Boolean choseD=false;
	
	public Question() {
		super();
	}
	public Question(Long idQ, Long idExam, String content, String img, String rsA, String rsB, String rsC, String rsD,
			String rs) {
		super();
		this.idQ = idQ;
		this.idExam = idExam;
		this.content = content;
		this.img = img;
		this.rsA = rsA;
		this.rsB = rsB;
		this.rsC = rsC;
		this.rsD = rsD;
		this.rs = rs;
	}
	public Long getIdQ() {
		return idQ;
	}
	public void setIdQ(Long idQ) {
		this.idQ = idQ;
	}
	public Long getIdExam() {
		return idExam;
	}
	public void setIdExam(Long idExam) {
		this.idExam = idExam;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getRsA() {
		return rsA;
	}
	public void setRsA(String rsA) {
		this.rsA = rsA;
	}
	public String getRsB() {
		return rsB;
	}
	public void setRsB(String rsB) {
		this.rsB = rsB;
	}
	public String getRsC() {
		return rsC;
	}
	public void setRsC(String rsC) {
		this.rsC = rsC;
	}
	public String getRsD() {
		return rsD;
	}
	public void setRsD(String rsD) {
		this.rsD = rsD;
	}
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	public Boolean getChoseA() {
		return choseA;
	}
	public void setChoseA(Boolean choseA) {
		this.choseA = choseA;
	}
	public Boolean getChoseB() {
		return choseB;
	}
	public void setChoseB(Boolean choseB) {
		this.choseB = choseB;
	}
	public Boolean getChoseC() {
		return choseC;
	}
	public void setChoseC(Boolean choseC) {
		this.choseC = choseC;
	}
	public Boolean getChoseD() {
		return choseD;
	}
	public void setChoseD(Boolean choseD) {
		this.choseD = choseD;
	}
	
	
}
