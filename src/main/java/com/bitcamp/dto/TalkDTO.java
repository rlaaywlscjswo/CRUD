package com.bitcamp.dto;

public class TalkDTO {
	private int talk_no;		// 이야기번호
	private String talk_title;	// 제목
	private String talk;		// 내용
	private String talk_img;	// 이미지
	private String talk_date;	// 보낸 날짜
	private String talk_status;	// 읽은 날짜
	private int recipient;		// 받는이
	private int no;				// 보내는이
	
	public TalkDTO() {}
	public TalkDTO(int talk_no, String talk_title, String talk, String talk_img, String talk_date, String talk_status,
			int recipient, int no) {
		this.talk_no = talk_no;
		this.talk_title = talk_title;
		this.talk = talk;
		this.talk_img = talk_img;
		this.talk_date = talk_date;
		this.talk_status = talk_status;
		this.recipient = recipient;
		this.no = no;
	}
	public int getTalk_no() {
		return talk_no;
	}
	public String getTalk_title() {
		return talk_title;
	}
	public String getTalk() {
		return talk;
	}
	public String getTalk_img() {
		return talk_img;
	}
	public String getTalk_date() {
		return talk_date;
	}
	public String getTalk_status() {
		return talk_status;
	}
	public int getRecipient() {
		return recipient;
	}
	public int getNo() {
		return no;
	}
	public void setTalk_no(int talk_no) {
		this.talk_no = talk_no;
	}
	public void setTalk_title(String talk_title) {
		this.talk_title = talk_title;
	}
	public void setTalk(String talk) {
		this.talk = talk;
	}
	public void setTalk_img(String talk_img) {
		this.talk_img = talk_img;
	}
	public void setTalk_date(String talk_date) {
		this.talk_date = talk_date;
	}
	public void setTalk_status(String talk_status) {
		this.talk_status = talk_status;
	}
	public void setRecipient(int recipient) {
		this.recipient = recipient;
	}
	public void setNo(int no) {
		this.no = no;
	}
}
