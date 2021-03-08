package com.wild.models;

public class Subject extends BaseModel{
	private Long idSubject;
	private String nameSubject;
	private String img;
	
	public Subject() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @param idSubject
	 * @param nameSubject
	 * @param img
	 */
	public Subject(Long idSubject, String nameSubject, String img) {
		super();
		this.idSubject = idSubject;
		this.nameSubject = nameSubject;
		this.img = img;
	}

	public String getNameSubject() {
		return nameSubject;
	}

	public void setNameSubject(String nameSubject) {
		this.nameSubject = nameSubject;
	}

	public Long getIdSubject() {
		return idSubject;
	}
	public void setIdSubject(Long idSubject) {
		this.idSubject = idSubject;
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
