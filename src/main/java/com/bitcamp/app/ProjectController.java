package com.bitcamp.app;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.CategoryDTO;
import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.service.CategoryService;
import com.bitcamp.service.ProjectService;

@Controller
public class ProjectController {
	
	@Resource(name="service")
	private ProjectService service;
	
	@Resource(name="categoryservice")
	private CategoryService categoryservice;
	
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
	
	@RequestMapping(value="category", method=RequestMethod.POST)
	public void  category(	
			@RequestParam String main_category, Model model){
		 System.out.println(" ajax" + main_category) ;		
		List<CategoryDTO> subcategorylist = categoryservice.subcategoryList(main_category);
		model.addAttribute("sublist", subcategorylist);
		System.out.println(model);
	}
	
	
	@RequestMapping("project/project_insert")
	public String projectinsert(Model model) {
		List<CategoryDTO> maincategorylist = categoryservice.maincategoryList();		
		model.addAttribute("mainlist",maincategorylist);		
		return "project/project_insert";
	}
	
	
}
