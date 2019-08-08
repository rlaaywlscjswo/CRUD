package com.bitcamp.dto;

public class SupportDTO {

	private int support_no; // 후원 번호
	private String support_date; // 후원 일자
	private int support_status; // 처리 상태

	public int getSupport_no() {
		return support_no;
	}

	public void setSupport_no(int support_no) {
		this.support_no = support_no;
	}

	public String getSupport_date() {
		return support_date;
	}

	public void setSupport_date(String support_date) {
		this.support_date = support_date;
	}

	public int getSupport_status() {
		return support_status;
	}

	public void setSupport_status(int support_status) {
		this.support_status = support_status;
	}

} // end SupportDTO class
