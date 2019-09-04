package com.bitcamp.dto;

public class ReplyDTO {
	private int reply_no; // 댓글 번호
	private String reply_contents; // 댓글 내용
	private String rating; // 평점
	private int project_no; // 프로젝트 번호
	private int no; // 회원번호
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_contents() {
		return reply_contents;
	}
	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	
}
