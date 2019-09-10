package com.bitcamp.service;

public interface PDFService {
	public String createSummernotePdf(String summernote); // 프로젝트 설명pdf 생성
	//public String createContractpdf(String project_contract); // 계약서 pdf 생성 (사인받기전)
	// public String pasteSign(String sign); // 계약서에 서명합치기
	
	public String createContractPdf(String sign, String project_contract); // 계약서 pdf 생성
	//public String pdfpdf(String sign,String project_contract); // 두번째 ㅇㅇㅇㅇ
	public void htmlcreate(String sign);
	
}
