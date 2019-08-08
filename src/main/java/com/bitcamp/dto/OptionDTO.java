package com.bitcamp.dto;

public class OptionDTO {

	private int option_no; // 옵션 번호
	private String option_name; // 옵션명
	private int option_price; // 가격
	private String option_contents; // 내용
	private int option_quantity; // 수량
	private int project_no; // 프로젝트 번호

	public int getOption_no() {
		return option_no;
	}

	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}

	public String getOption_name() {
		return option_name;
	}

	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}

	public int getOption_price() {
		return option_price;
	}

	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}

	public String getOption_contents() {
		return option_contents;
	}

	public void setOption_contents(String option_contents) {
		this.option_contents = option_contents;
	}

	public int getOption_quantity() {
		return option_quantity;
	}

	public void setOption_quantity(int option_quantity) {
		this.option_quantity = option_quantity;
	}

	public int getProject_no() {
		return project_no;
	}

	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}

} // end OptionDTO class
