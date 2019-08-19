package com.bitcamp.app;

import java.io.File;
import java.io.IOException;
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
	
	
	
/*	@RequestMapping("projectin")
	public String ininin() {
		return "project/projectinsert.temp";
	}
	*/
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
	// 프로젝트 등록 페이지 2
	@RequestMapping("project_insert2")
	public String projectinsert2() {
		return "project/project_insert2";
	}
	
	// 프로젝트 등록 결과 
	@RequestMapping("projectresult")
	public String projectinsertresult(
			HttpServletRequest request, ProjectDTO dto) { 		
		MultipartFile multi = dto.getFile();
		try {
			String uploadpath = request.getSession().getServletContext().getRealPath(path);			
			if(!multi.isEmpty()) {
				File file = new File(uploadpath, multi.getOriginalFilename());
				multi.transferTo(file);				
				dto.setProject_photo(dto.getFile().getOriginalFilename());
				System.out.println("프로젝트 제목 : " + dto.getProject_title());
				System.out.println("사진 파일명 : " + dto.getProject_photo());				
				System.out.println("카테고리 번호 : " + dto.getCategory_no());
			}
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}
		int result = service.projectInsert(dto);
		System.out.println("filename : "+dto.getFile().getOriginalFilename() );	
		return "redirect:/projectlist.temp";
	}
	
	// 프로젝트 등록 결과2
	@RequestMapping("projectresult2")
	public String projectinsertresult2(BusinessDTO dto) {
		int result = businessservice.businessInsert(dto);
		System.out.println(dto.getBusiness_name());
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
