package com.bitcamp.dto;

import java.util.List;

public class MemberDTO {

	private int no; // 회원 번호
	private String name; // 이름
	private String email; // 이메일
	private String password; // 비밀번호
	private String photo; // 프로필 사진
	private String phone; // 연락처
	private String birth; // 생년월일
	private String joindate; // 가입일
	private boolean enabled; // 접근
	private int rank_no; // 등급 번호
	private int auth_no; // 권한 번호

	private List<AuthorityDTO> authList; // 권한 list

	public List<AuthorityDTO> getAuthList() {
		return authList;
	}

	public void setAuthList(List<AuthorityDTO> authList) {
		this.authList = authList;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public int getRank_no() {
		return rank_no;
	}

	public void setRank_no(int rank_no) {
		this.rank_no = rank_no;
	}

	public int getAuth_no() {
		return auth_no;
	}

	public void setAuth_no(int auth_no) {
		this.auth_no = auth_no;
	}

} // end MemberDTO class
