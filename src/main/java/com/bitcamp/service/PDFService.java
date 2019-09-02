package com.bitcamp.service;

import com.bitcamp.dto.ProjectDTO;

public interface PDFService {
	public String createSummernotePdf(String summernote); // 프로젝트 설명pdf 생성
	public String createContractPdf(String sign, String project_contract); // 계약서 pdf 생성
}
