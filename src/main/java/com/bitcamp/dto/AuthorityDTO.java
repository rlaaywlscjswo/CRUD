package com.bitcamp.dto;

public class AuthorityDTO {

	private int no; // 회원 번호
	private String auth; // 권한

	public AuthorityDTO(int no, String auth) {
		super();
		this.no = no;
		this.auth = auth;
	}

	public AuthorityDTO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

} // end AuthorityDTO class
