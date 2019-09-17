package com.bitcamp.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.CSDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.mapper.AdminMapper;

@Service("adminService")
public class AdminServiceImple implements AdminService {

	@Autowired
	private AdminMapper mapper;

	// Excel Download
	@Override
	public void getExcelDown(HttpServletResponse response) {

		List<HashMap<String, Object>> list = mapper.admin_Allfmember();

		try {

			// Excel Down 시작
			Workbook workbook = new HSSFWorkbook();
			// 시트 생성
			Sheet sheet = workbook.createSheet("게시판");

			// 행, 열, 열 번호
			Row row = null;
			Cell cell = null;
			int rowNo = 0;

			// 셀 너비 설정
			sheet.autoSizeColumn(1); // 회원 이름
			sheet.setColumnWidth(1, (sheet.getColumnWidth(1)) + (short) 2048);

			sheet.autoSizeColumn(2); // 이메일
			sheet.setColumnWidth(2, (sheet.getColumnWidth(2)) + (short) 4096);

			sheet.autoSizeColumn(3); // 프로젝트 이름
			sheet.setColumnWidth(3, (sheet.getColumnWidth(3)) + (short) 2048);

			sheet.autoSizeColumn(4); // 평균 평점
			sheet.setColumnWidth(4, (sheet.getColumnWidth(4)) + (short) 2048);

			sheet.autoSizeColumn(5); // 현재 후원금 / 목표 후원금
			sheet.setColumnWidth(5, (sheet.getColumnWidth(5)) + (short) 8192);

			sheet.autoSizeColumn(6); // 달성률
			sheet.setColumnWidth(6, (sheet.getColumnWidth(6)) + (short) 1024);

			// 테이블 헤더용 스타일
			CellStyle headStyle = workbook.createCellStyle();

			// 가는 경계선을 가집니다.
			headStyle.setBorderTop(BorderStyle.THIN);
			headStyle.setBorderBottom(BorderStyle.THIN);
			headStyle.setBorderLeft(BorderStyle.THIN);
			headStyle.setBorderRight(BorderStyle.THIN);

			// 배경은 노란색입니다.
			headStyle.setFillBackgroundColor(HSSFColorPredefined.YELLOW.getIndex());
			// headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			// 데이터는 가운데 정렬합니다.
			headStyle.setAlignment(HorizontalAlignment.CENTER);

			// 데이터용 경계 스타일 테두리만 지정
			CellStyle bodyStyle = workbook.createCellStyle();
			bodyStyle.setBorderTop(BorderStyle.THIN);
			bodyStyle.setBorderBottom(BorderStyle.THIN);
			bodyStyle.setBorderLeft(BorderStyle.THIN);
			bodyStyle.setBorderRight(BorderStyle.THIN);

			// 데이터를 정렬합니다.
			bodyStyle.setAlignment(HorizontalAlignment.RIGHT);

			// 헤더 생성
			row = sheet.createRow(rowNo++);

			cell = row.createCell(0);
			cell.setCellStyle(headStyle);
			cell.setCellValue("회원 번호");

			cell = row.createCell(1);
			cell.setCellStyle(headStyle);
			cell.setCellValue("회원 이름");

			cell = row.createCell(2);
			cell.setCellStyle(headStyle);
			cell.setCellValue("이메일");

			cell = row.createCell(3);
			cell.setCellStyle(headStyle);
			cell.setCellValue("프로젝트 이름");

			cell = row.createCell(4);
			cell.setCellStyle(headStyle);
			cell.setCellValue("평균 평점 (점)");

			cell = row.createCell(5);
			cell.setCellStyle(headStyle);
			cell.setCellValue("현재 후원금 (원) / 목표 후원금 (원)");

			cell = row.createCell(6);
			cell.setCellStyle(headStyle);
			cell.setCellValue("달성률 (%)");

			// 데이터 부분 생성
			for (int i = 0; i < list.size(); i++) {

				row = sheet.createRow(rowNo++);

				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue("" + list.get(i).get("no"));

				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue("" + list.get(i).get("name"));

				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);

				cell.setCellValue("" + list.get(i).get("email"));

				cell = row.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue("" + list.get(i).get("project_title"));

				cell = row.createCell(4);
				cell.setCellStyle(bodyStyle);
				if (list.get(i).get("arating") == null) {
					cell.setCellValue("0점");
				} else {
					cell.setCellValue("" + list.get(i).get("arating") + "점");
				}

				cell = row.createCell(5);
				cell.setCellStyle(bodyStyle);
				if (list.get(i).get("sumop") == null) {
					cell.setCellValue("" + "0원" + " / " + list.get(i).get("ntargetprice") + "원");
				} else {
					cell.setCellValue(
							"" + list.get(i).get("sumop") + "원" + " / " + list.get(i).get("ntargetprice") + "원");
				}

				cell = row.createCell(6);
				cell.setCellStyle(bodyStyle);
				if (list.get(i).get("reachper") == null) {
					cell.setCellValue("0%");
				} else {
					cell.setCellValue("" + list.get(i).get("reachper") + "%");
				}
			}

			// 컨텐츠 타입과 파일명 지정
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment;filename=funding_member.xls");

			// 엑셀 출력
			workbook.write(response.getOutputStream());
			workbook.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

	} // end getExcelDown method

	@Override
	public int fmember_totalCount(String fmember_search) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("fmember_search", fmember_search);

		return mapper.fmember_totalCount(hm);

	} // end fmember_totalCount method

	// 펀딩 회원 관리
	@Override
	public List<MemberDTO> admin_fmember(int startRow, int pagePerSize, String fmember_search) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("pagePerSize", pagePerSize);
		hm.put("fmember_search", fmember_search);

		return mapper.admin_fmember(hm);

	} // end admin_fmember method

	// 통계
	
	// 이름 가져오기
	@Override
	public String getName(int no) {
		
		return mapper.getName(no);
		
	} // end getName method

	// 성공 횟수
	@Override
	public int successCount(int no) {
		System.out.println("성공 횟수 : " + no);

		return mapper.successCount(no);

	} // end successCount method

	// 총 프로젝트 등록 횟수
	@Override
	public int theNumbersOfRegiProject(int no) {

		return mapper.theNumbersOfRegiProject(no);

	} // end theNumbersOfRegiProject method

	// 평균 달성률
	@Override
	public float avgdal(int no) {

		return mapper.avgdal(no);

	} // end avgdal method
		// 평균 평점

	@Override
	public float avgRating(int no) {

		return mapper.avgRating(no);

	} // end avgRating method

	@Override
	public int sproject_totalCount(String sproject_search) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("sproject_search", sproject_search);

		return mapper.sproject_totalCount(hm);

	} // end fmember_totalCount method

	// 펀딩 현황 목록
	@Override
	public List<ProjectDTO> admin_sproject(int startRow, int pagePerSize, String sproject_search) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("pagePerSize", pagePerSize);
		hm.put("sproject_search", sproject_search);

		return mapper.admin_sproject(hm);

	} // end admin_sproject method
	
	// 승인 시 권한 변경
	@Override
	public int agree(int project_no) {
		
		return mapper.agree(project_no);
		
	} // end agree method
	
	// 승인 시 프로젝트 상태 변경 (1로)
	@Override
	public int psChange(int project_no) {
		
		return mapper.psChange(project_no);
		
	} // end psChange method
	
	// 거절 시 프로젝트 상태 변경 (2로)
	@Override
	public int disagree(int project_no) {
		
		return mapper.disagree(project_no);
		
	} // end disagree method

	// Excel Download
	@Override
	public void sproject_getExcelDown(HttpServletResponse response) {

		List<ProjectDTO> list = mapper.admin_Allsproject();

		try {

			// Excel Down 시작
			Workbook workbook = new HSSFWorkbook();
			// 시트 생성
			Sheet sheet = workbook.createSheet("게시판");

			// 행, 열, 열 번호
			Row row = null;
			Cell cell = null;
			int rowNo = 0;

			// 셀 너비 설정
			sheet.autoSizeColumn(0); // 프로젝트 번호
			sheet.setColumnWidth(0, (sheet.getColumnWidth(0)) + (short) 1024);

			sheet.autoSizeColumn(1); // 프로젝트 이름
			sheet.setColumnWidth(1, (sheet.getColumnWidth(1)) + (short) 4096);

			sheet.autoSizeColumn(2); // 현황
			sheet.setColumnWidth(2, (sheet.getColumnWidth(2)) + (short) 2048);

			// 테이블 헤더용 스타일
			CellStyle headStyle = workbook.createCellStyle();

			// 가는 경계선을 가집니다.
			headStyle.setBorderTop(BorderStyle.THIN);
			headStyle.setBorderBottom(BorderStyle.THIN);
			headStyle.setBorderLeft(BorderStyle.THIN);
			headStyle.setBorderRight(BorderStyle.THIN);

			// 배경은 노란색입니다.
			headStyle.setFillBackgroundColor(HSSFColorPredefined.YELLOW.getIndex());
			// headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			// 데이터는 가운데 정렬합니다.
			headStyle.setAlignment(HorizontalAlignment.CENTER);

			// 데이터용 경계 스타일 테두리만 지정
			CellStyle bodyStyle = workbook.createCellStyle();
			bodyStyle.setBorderTop(BorderStyle.THIN);
			bodyStyle.setBorderBottom(BorderStyle.THIN);
			bodyStyle.setBorderLeft(BorderStyle.THIN);
			bodyStyle.setBorderRight(BorderStyle.THIN);

			// 데이터를 정렬합니다.
			bodyStyle.setAlignment(HorizontalAlignment.CENTER);

			// 헤더 생성
			row = sheet.createRow(rowNo++);

			cell = row.createCell(0);
			cell.setCellStyle(headStyle);
			cell.setCellValue("프로젝트 번호");

			cell = row.createCell(1);
			cell.setCellStyle(headStyle);
			cell.setCellValue("프로젝트 이름");

			cell = row.createCell(2);
			cell.setCellStyle(headStyle);
			cell.setCellValue("현황");

			// 데이터 부분 생성
			for (int i = 0; i < list.size(); i++) {

				row = sheet.createRow(rowNo++);

				cell = row.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue("" + list.get(i).getProject_no());

				cell = row.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue("" + list.get(i).getProject_title());

				cell = row.createCell(2);
				cell.setCellStyle(bodyStyle);
				if (list.get(i).getProject_status() == 1) {
					cell.setCellValue("진행 중");
				} else if (list.get(i).getProject_status() == 2) {
					cell.setCellValue("거절 된 프로젝트");
				} else if (list.get(i).getProject_status() == 3) {
					cell.setCellValue("지난 프로젝트");
				} else {
					cell.setCellValue("승인 대기");
				}
			}

			// 컨텐츠 타입과 파일명 지정
			response.setContentType("ms-vnd/excel");
			response.setHeader("Content-Disposition", "attachment;filename=status_project.xls");

			// 엑셀 출력
			workbook.write(response.getOutputStream());
			workbook.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

	} // end getExcelDown method
	
	// 거절 된 프로젝트 지워주기 (매주 금요일 저녁 6시에 삭제)
	@Override
	public void deleteDisagree() {
		mapper.deleteDisagree();
		System.out.println("금요일 저녁 6시가 되었습니다..");
		System.out.println("마피아는 고개를 들어주세요..");
	} // end deleteDisagree method
	
	// 고객 문의
	@Override
	public List<CSDTO> adminCS() {
		
		return mapper.adminCS();
		
	} // end adminCS method

} // end AdminServiceImple class
