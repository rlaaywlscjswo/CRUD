package com.bitcamp.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProjectDTO {
	private int project_no; // 프로젝트 번호
	private String project_title; // 프로젝트 제목
	private MultipartFile project_photo_file; // 프로젝트 대표사진 파일
	private String project_photo; // 프로젝트 대표사진 경로
	private int targetprice; // 달성금액
	private String alias; // 창작자 이름 (별칭)
	private MultipartFile img_file; // 창작자 프로필사진 파일 
	private String img; // 창작자 프로필 사진 경로
	private String introduce; // 창작자 소개글
	private String startdate; // 시작일
	private String enddate; // 종료일		
	private MultipartFile project_contents_file; // 내용pdf 파일
	private String project_contents; // 내용pdf
	private MultipartFile project_contract_file; // 계약서pdf 파일
	private String project_contract; // 계약서pdf 경로
	private int project_views; // 조회수
	private int project_status; // 승인여부
	private int no; // 회원번호
	private int category_no; // 카테고리 번호
	
	public MultipartFile getProject_contract_file() {
		return project_contract_file;
	}
	public void setProject_contract_file(MultipartFile project_contract_file) {
		this.project_contract_file = project_contract_file;
	}	
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public String getProject_title() {
		return project_title;
	}
	public void setProject_title(String project_title) {
		this.project_title = project_title;
	}
	public MultipartFile getProject_photo_file() {
		return project_photo_file;
	}
	public void setProject_photo_file(MultipartFile project_photo_file) {
		this.project_photo_file = project_photo_file;
	}
	public String getProject_photo() {
		return project_photo;
	}
	public void setProject_photo(String project_photo) {
		this.project_photo = project_photo;
	}
	public int getTargetprice() {
		return targetprice;
	}
	public void setTargetprice(int targetprice) {
		this.targetprice = targetprice;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public MultipartFile getImg_file() {
		return img_file;
	}
	public void setImg_file(MultipartFile img_file) {
		this.img_file = img_file;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	public String getProject_contents() {
		return project_contents;
	}
	public void setProject_contents(String project_contents) {
		this.project_contents = project_contents;
	}
	public String getProject_contract() {
		return project_contract;
	}
	public void setProject_contract(String project_contract) {
		this.project_contract = project_contract;
	}
	public int getProject_views() {
		return project_views;
	}
	public void setProject_views(int project_views) {
		this.project_views = project_views;
	}
	public int getProject_status() {
		return project_status;
	}
	public void setProject_status(int project_status) {
		this.project_status = project_status;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	
	public MultipartFile getProject_contents_file() {
		return project_contents_file;
	}
	public void setProject_contents_file(MultipartFile project_contents_file) {
		this.project_contents_file = project_contents_file;
	}
	
	
}
