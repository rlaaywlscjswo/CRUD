package com.bitcamp.dto;

public class CSDTO {

	private int service_no; // 문의 번호
	private String service_title; // 질문 제목
	private String service_contents; // 질문 내용
	private int service_secret; // 공개 여부
	private String service_reply; // 답변

	public CSDTO(int service_no, String service_title, String service_contents, int service_secret,
			String service_reply) {
		super();
		this.service_no = service_no;
		this.service_title = service_title;
		this.service_contents = service_contents;
		this.service_secret = service_secret;
		this.service_reply = service_reply;
	}
	
	public CSDTO(int service_no, String service_title, String service_contents, int service_secret) {
		super();
		this.service_no = service_no;
		this.service_title = service_title;
		this.service_contents = service_contents;
		this.service_secret = service_secret;
	}

	public CSDTO() {
		super();
	}

	public int getService_no() {
		return service_no;
	}

	public void setService_no(int service_no) {
		this.service_no = service_no;
	}

	public String getService_title() {
		return service_title;
	}

	public void setService_title(String service_title) {
		this.service_title = service_title;
	}

	public String getService_contents() {
		return service_contents;
	}

	public void setService_contents(String service_contents) {
		this.service_contents = service_contents;
	}

	public int getService_secret() {
		return service_secret;
	}

	public void setService_secret(int service_secret) {
		this.service_secret = service_secret;
	}

	public String getService_reply() {
		return service_reply;
	}

	public void setService_reply(String service_reply) {
		this.service_reply = service_reply;
	}

} // end CSDTO class
