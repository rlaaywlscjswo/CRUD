package com.bitcamp.service;

public interface PDFService {
	public String createSummernotePdf(String summernote); // 프로젝트 설명pdf 생성
	public String createContractPdf(String sign, String project_contract); // 계약서 pdf 생성
	public String pdfpdf(String sign,String project_contract); // 두번째 ㅇㅇㅇㅇ
}
