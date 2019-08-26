package com.bitcamp.app;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.dto.BusinessDTO;
import com.bitcamp.dto.CategoryDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.service.BusinessService;
import com.bitcamp.service.CategoryService;
import com.bitcamp.service.PDFService;
import com.bitcamp.service.ProjectService;

@Controller
public class ProjectController {
	private String path = "upload"; // 파일저장 폴더명 : upload
	
	@Resource(name="service")
	private ProjectService service;
	
	@Resource(name="categoryservice")
	private CategoryService categoryservice;
	
	@Resource(name="businessservice")
	private BusinessService businessservice;
	
	@Resource
	private PDFService pdfservice;
	
	
	
	
	@RequestMapping("main")
	public String main() {
		return "main";
	}
		

	// 프로젝트 카테고리 선택 결과 목록 페이지 
	@RequestMapping("projectcategorylist={main_category}")
	public String categorylist(@PathVariable String main_category , Model model) {		
		System.out.println(main_category);
		List<ProjectDTO> projectlist = service.projectcategoryList(main_category);
		model.addAttribute("list", projectlist);
		System.out.println("나와라ㅏㅏㅏㅏㅏ");
		return "project/projectcategorylist.temp";
	}
	
	// 프로젝트 검색 결과 목록 페이지
	@RequestMapping("projectlist")
	public String list(			
			@RequestParam(required=false, defaultValue="") String searchtxt,
			@RequestParam(required = false, defaultValue = "1") int currPage,
			Model model
			) {
		int totalCount = service.totalCount(searchtxt);
		int pageSize =9;
		int blockSize = 5;
		PageDTO page = new PageDTO(currPage, totalCount, pageSize, blockSize);
		List<ProjectDTO> projectlist = service.projectList(searchtxt.trim(),page.getStartRow(), page.getEndRow());	
		model.addAttribute("list",projectlist);
		model.addAttribute("page", page);
	
		model.addAttribute("searchtxt",searchtxt);
		model.addAttribute("total", totalCount);
		System.out.println("page : " +page);
		
		System.out.println("searchtxt : "+searchtxt);
		return "project/projectlist.temp";
	}
	
	// 카테고리선택 json ( 프로젝트 등록페이지에서)
	@RequestMapping(value="project/category", method=RequestMethod.GET)
	public @ResponseBody List<CategoryDTO> category(	
		@RequestParam String main_category){
		//String main_category=ca.get("main_category");
		 System.out.println(" ajax" + main_category) ;		
		List<CategoryDTO> subcategorylist = categoryservice.subcategoryList(main_category);
		
       	return subcategorylist;
	}
	
	// 프로젝트 등록 페이지
	@RequestMapping("insert")
	public String projectinsert(Model model) {
		List<CategoryDTO> maincategorylist = categoryservice.maincategoryList();		
		model.addAttribute("mainlist",maincategorylist);		
		System.out.println("insert : "+model);
		return "project/insert.temp"; 
	
	}	
	
	// 프로젝트 등록 결과 
	// 1) 대표사진 , 프로젝트제목, 카테고리 -> 프로젝트 테이블
	// 2) 사업자명, 사업자구분, 개인, 법인, 소재지, 법인 설립연월일, 홈페이지 -> 사업자 테이블
	// 3) 창작자 프로필사진 , 창작자이름, 창작자소개 -> 프로젝트 테이블
	// 4) 프로젝트 설명글.. 근데 이건 db에 저장하는게 아니라 pdf로 변환 해줘서 pdf파일명으로 db에 저장 -> 프로젝트 테이블
	// 5) 옵션명, 가격, 내용, 수량 -> 옵션테이블 (아직 완성아님..)
	// 6) ------ summernote에 작성한 내용 pdf로 변환...... 서버에 업로드...... 파일명 디비에 저장.. ------
	public String projectinsertresult(
			HttpServletRequest request,BusinessDTO busdto, OptionDTO optdto, ProjectDTO dto
			, @RequestParam int btncnt, @RequestParam String summernote) { 				
		MultipartFile project_photo = dto.getProject_photo_file(); // 프로젝트 대표사진 파일 
		MultipartFile img = dto.getImg_file(); // 창작자 프로필사진 파일				
		try {
			String uploadpath = request.getSession().getServletContext().getRealPath(path);			
			if(!project_photo.isEmpty()&&!img.isEmpty()) { // 대표사진, 프로필사진 둘다있을때 
				File file = new File(uploadpath, project_photo.getOriginalFilename()); // 프로젝트 대표사진
				project_photo.transferTo(file);				
				dto.setProject_photo(dto.getProject_photo_file().getOriginalFilename()); 				
				File file2 = new File(uploadpath, img.getOriginalFilename());// 창작자 프로필사진
				img.transferTo(file2);
				dto.setImg(dto.getImg_file().getOriginalFilename());				
				System.out.println("프로젝트 제목 : " + dto.getProject_title());
				System.out.println("대표사진 파일명 : " + dto.getProject_photo());		
				System.out.println("창작자 프로필 사진"+ dto.getImg());			
			}
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("옵션갯수 (클릭수) : "+btncnt);
		int projectsearchno=service.projectsearchno(dto.getCategory_no());
		dto.setProject_no(projectsearchno);		
		int result = service.projectInsert(dto); // projectdto 
		
		System.out.println("1 프로젝트 번호"+dto.getProject_no());
		System.out.println("프로젝트 등록 ");  
		
		
		int result3= businessservice.businessInsert(busdto); // businesssdto	
		
		System.out.println("사업자 등록 ");  	
		
		System.out.println("========================");
		System.out.println(optdto.getProject_no());
		System.out.println(optdto.getOption_name());
		System.out.println(optdto.getOption_price());
		System.out.println(optdto.getOption_contents());
		System.out.println(optdto.getOption_quantity());
		System.out.println("========================");
		
		
		
		optdto.setProject_no(projectsearchno);
		List<OptionDTO> list = new ArrayList<OptionDTO>();
		for(int i=0 ; i<btncnt; i++) {
			optdto.getProject_no();
			optdto.getOption_name();
			optdto.getOption_price();
			optdto.getOption_contents();
			optdto.getOption_quantity();
			list.add(optdto);
		}
		
		System.out.println(list);
		
		
		int result2 = service.projectoptionInsert(list);
		
		System.out.println("옵션등록");
		
		System.out.println("2 프로젝트 번호"+((OptionDTO) optdto).getProject_no());		
		pdfservice.createPdf(summernote);
		System.out.println("컨트롤러에서 pdf서비스 실행");
	
		
		return "redirect:/projectlist.temp";
	}	
	// 프로젝트 상세 페이지
	@RequestMapping("projectdetail={project_no}")
	public String projectdetail(@PathVariable int project_no, Model model) {		
		ProjectDTO detail = service.projectDetail(project_no);
		List<OptionDTO> option= service.projectoptionList(project_no);
		int viewcnt = service.viewcnt(project_no);
		model.addAttribute("list", detail);
		model.addAttribute("option", option);
		return "project/projectdetail.temp";
	}
	
	@RequestMapping("projectoption={project_no}")
	public String projectoption(@PathVariable int project_no, Model model) {
		List<OptionDTO> option = service.projectoptionList(project_no);
		model.addAttribute("option", option);
		return "project/projectoption.temp";
	}
}
