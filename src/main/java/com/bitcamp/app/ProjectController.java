package com.bitcamp.app;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.dto.CategoryDTO;
import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.service.CategoryService;
import com.bitcamp.service.ProjectService;

@Controller
public class ProjectController {
	private String path = "upload"; // 파일저장 폴더명 : upload
	
	@Resource(name="service")
	private ProjectService service;
	
	@Resource(name="categoryservice")
	private CategoryService categoryservice;
	
	// 프로젝트 목록 페이지
	@RequestMapping("projectlist")
	public String list(
			@RequestParam(required=false, defaultValue="") String search,
			@RequestParam(required=false, defaultValue="") String searchtxt,
			@RequestParam(required = false, defaultValue = "1") int currPage,
			Model model
			) {
		int totalCount = service.totalCount(search, searchtxt);
		int pageSize =10;
		int blockSize = 5;
		PageDTO page = new PageDTO(currPage, totalCount, pageSize, blockSize);
		List<ProjectDTO> projectlist = service.projectList(search.trim(), searchtxt.trim(),page.getStartRow(), page.getEndRow());
		model.addAttribute("list",projectlist);
		model.addAttribute("page", page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		
		System.out.println("page : " +page);
		System.out.println("search : "+search);
		System.out.println("searchtxt : "+searchtxt);
		return "project/projectlist";
	}
	
	// 카테고리선택 json ( 프로젝트 등록페이지에서)
	@RequestMapping(value="project/category", method=RequestMethod.POST)
	public @ResponseBody List<CategoryDTO> category(	
			@RequestParam String main_category, Model model){
		 System.out.println(" ajax" + main_category) ;		
		List<CategoryDTO> subcategorylist = categoryservice.subcategoryList(main_category);
		model.addAttribute("sublist", subcategorylist);
		System.out.println(model);       
       	return subcategorylist;
	}
	
	// 프로젝트 등록 페이지
	@RequestMapping("project/project_insert")
	public String projectinsert(Model model) {
		List<CategoryDTO> maincategorylist = categoryservice.maincategoryList();		
		model.addAttribute("mainlist",maincategorylist);		
		System.out.println("insert : "+model);
		return "project/project_insert";
	
	}
	
	// 프로젝트 등록 결과 
	@RequestMapping("project/projectresult")
	public String projectinsertresult(
			HttpServletRequest request, ProjectDTO dto) { 		
		MultipartFile multi = dto.getFile();
		try {
			String uploadpath = request.getSession().getServletContext().getRealPath(path);			
			if(!multi.isEmpty()) {
				File file = new File(uploadpath, multi.getOriginalFilename());
				multi.transferTo(file);				
				System.out.println("사진 파일명 : " + dto.getProject_photo());				
				dto.setProject_photo(dto.getFile().getOriginalFilename());
			}
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}
		int result = service.projectInsert(dto);
		System.out.println("filename : "+dto.getFile().getOriginalFilename() );	
		return "redirect:/projectlist";
	}
	
}
