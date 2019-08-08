package com.bitcamp.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.service.ProjectService;

@Controller
public class ProjectController {
	@Resource(name="service")
	private ProjectService service;
	
	@RequestMapping("projectlist")
	public String list(
			@RequestParam(required=false, defaultValue="") String search,
			@RequestParam(required=false, defaultValue="") String searchtxt,
			@RequestParam(required = false, defaultValue = "1") int currPage,
			Model model
			) {
		int totalCount = service.totalCount(search, searchtxt);
		int pageSize =2;
		int blockSize = 5;
		PageDTO page = new PageDTO(currPage, totalCount, pageSize, blockSize);
		List<ProjectDTO> list = service.projectList(search.trim(), searchtxt.trim(),page.getStartRow(), page.getEndRow());
		model.addAttribute("list",list);
		model.addAttribute("page", page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		
		System.out.println("page : " +page);
		System.out.println("search : "+search);
		System.out.println("searchtxt : "+searchtxt);
		return "project/projectlist";
	}
	
	
	
}
