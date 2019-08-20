package com.bitcamp.dto;

public class AddressDTO {
	private int no; //회원 번호
	private String address_name; //수령인
	private String address_photo; //연락처
	private String alias; //배송지명
	private String zipno; //우편번호
	private String roadaddrPart1; //도로명주소
	private String roadaddrPart2; //도로명주소
	private String jibunaddr; //지번주소
	private String addrDetail; //상세주소
	public int getNo() {
		return no;
	}
	public String getAddress_name() {
		return address_name;
	}
	public String getAddress_photo() {
		return address_photo;
	}
	public String getAlias() {
		return alias;
	}
	public String getZipno() {
		return zipno;
	}
	public String getJibunaddr() {
		return jibunaddr;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public void setAddress_photo(String address_photo) {
		this.address_photo = address_photo;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public void setZipno(String zipno) {
		this.zipno = zipno;
	}
	public String getRoadaddrPart1() {
		return roadaddrPart1;
	}
	public String getRoadaddrPart2() {
		return roadaddrPart2;
	}
	public void setRoadaddrPart1(String roadaddrPart1) {
		this.roadaddrPart1 = roadaddrPart1;
	}
	public void setRoadaddrPart2(String roadaddrPart2) {
		this.roadaddrPart2 = roadaddrPart2;
	}
	public void setJibunaddr(String jibunaddr) {
		this.jibunaddr = jibunaddr;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	
}
