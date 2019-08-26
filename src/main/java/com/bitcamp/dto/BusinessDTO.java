package com.bitcamp.dto;

public class BusinessDTO {
	private int business_no; // 사업자등록번호
	private String business_name; // 기업명
	private String business_division; // 사업자 구분
	private String business_addr; // 소재지
	private String business_startdate; // 법인 설입 연월일
	private String business_url; // 홈페이지
	private int no; // 회원번호 
	public int getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(int business_no) {
		this.business_no=1;
		//this.business_no = business_no;
	}
	public String getBusiness_name() {
		return business_name;
	}
	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}
	public String getBusiness_division() {
		return business_division;
	}
	public void setBusiness_division(String business_division) {
		this.business_division = business_division;
	}
	public String getBusiness_addr() {
		return business_addr;
	}
	public void setBusiness_addr(String business_addr) {
		this.business_addr = business_addr;
	}
	public String getBusiness_startdate() {
		return business_startdate;
	}
	public void setBusiness_startdate(String business_startdate) {
		this.business_startdate = business_startdate;
	}
	public String getBusiness_url() {
		return business_url;
	}
	public void setBusiness_url(String business_url) {
		this.business_url = business_url;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}


}
