package com.bitcamp.service;

public interface PDFService {
	public String createSummernotePdf(String summernote,String contents_pdfpath_realpath); // 프로젝트 설명pdf 생성
	public void htmlcreate(String sign,String project_contract);
	
}
