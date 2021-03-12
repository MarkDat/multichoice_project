package com.wild.models;

public class Role {
	private long idRole;
	private String roleName;
	private String code;
	
	
	public Role() {
		// TODO Auto-generated constructor stub
	}
	public Role(long idRole, String roleName, String code) {
		this.idRole = idRole;
		this.roleName = roleName;
		this.code = code;
	}
	public Role(String code) {
		this.code = code;
	}
	public Long getIdRole() {
		return idRole;
	}
	public void setIdRole(long idRole) {
		this.idRole = idRole;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
}
