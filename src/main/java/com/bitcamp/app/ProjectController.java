package com.bitcamp.app;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.dto.BusinessDTO;
import com.bitcamp.dto.CategoryDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.service.BusinessService;
import com.bitcamp.service.CategoryService;
import com.bitcamp.service.MemberService;
import com.bitcamp.service.PDFService;
import com.bitcamp.service.ProjectService;


@Controller
public class ProjectController {
	private String path = "/resources/upload"; // 파일저장 폴더명 : upload
	private String signpath ="/resources/sign"; // 파일저장 폴더명 : sign
	private String contentpdf="/resources/contentpdf"; // 파일저장 폴더명 : contentpdfpath(프로젝트설명pdf)
	private String pdfpath = "/resources/contractpdf"; // 파일저장 폴더명 : pdfpath(계약서pdf)
	
	@Resource(name="service") // 프로젝트 서비스
	private ProjectService service;
	
	@Resource // 회원 서비스
	private MemberService memberservice;
	
	@Resource(name="categoryservice") // 카테고리 서비스
	private CategoryService categoryservice;
	
	@Resource(name="businessservice") // 사업자 서비스
	private BusinessService businessservice;
	
	@Resource // pdf 서비스
	private PDFService pdfservice;
	
	// 임시 메인
	@RequestMapping("yummy")
	public String yummy(Model model) {
				// 병훈쓰 인기 프로젝트
				List<ProjectDTO> popularProject = service.popularProject();
				model.addAttribute("popularProject", popularProject);
				
				// 병훈쓰 새로운 프로젝트
				List<ProjectDTO> newProject = service.newProject();
				model.addAttribute("newProject", newProject);
				
				// 병훈쓰 성공 임박 프로젝트
				List<ProjectDTO> successApproach = service.successApproach();
				model.addAttribute("successApproach", successApproach);		
		return "index.temp";
	}	
	
	@RequestMapping("single")
	public String s() {
		return "single.temp";
	}
	// 메인 페이지
	@RequestMapping("main") 
	public String main(Model model) {			
		// 병훈쓰 인기 프로젝트
		List<ProjectDTO> popularProject = service.popularProject();
		model.addAttribute("popularProject", popularProject);
		
		// 병훈쓰 새로운 프로젝트
		List<ProjectDTO> newProject = service.newProject();
		model.addAttribute("newProject", newProject);
		
		// 병훈쓰 성공 임박 프로젝트
		List<ProjectDTO> successApproach = service.successApproach();
		model.addAttribute("successApproach", successApproach);
		
		return "main";
	}		

	// 프로젝트 카테고리 선택 결과 목록 페이지 
	@RequestMapping("/projectcategorylist={sub_category}")
	public String categorylist(@PathVariable String sub_category, 
			@RequestParam(required = false, defaultValue = "1") int currPage,
			Model model) {		
		System.out.println(sub_category);				
		int totalCount = service.categorytotalCount(sub_category);
		System.out.println("카테고리list total : "+totalCount);
		int pageSize =9;
		int blockSize = 5;
		PageDTO page = new PageDTO(currPage, totalCount, pageSize, blockSize);		
		List<ProjectDTO> projectlist = service.projectcategoryList(sub_category, page.getStartRow(), page.getEndRow());
		model.addAttribute("list", projectlist);	
		model.addAttribute("page", page);		
		return "project/projectcategorylist.temp";
	}
	
	// 프로젝트 검색 결과 목록 페이지
	@RequestMapping("/projectlist")
	public String list(			
			@RequestParam(required=false, defaultValue="") String searchtxt,
			@RequestParam(required = false, defaultValue = "1") int currPage,
			Model model
			) {
		int totalCount = service.totalCount(searchtxt);
		int pageSize =9;
		int blockSize = 5;
		PageDTO page = new PageDTO(currPage, totalCount, pageSize, blockSize);
		List<ProjectDTO> projectlist = service.projectList(searchtxt.trim(), page.getStartRow(), page.getEndRow());	
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
		 System.out.println(" ajax" + main_category) ;		
		List<CategoryDTO> subcategorylist = categoryservice.subcategoryList(main_category);
		
       	return subcategorylist;
	}
	
	
	// 프로젝트 등록 페이지
	@RequestMapping("/projectinsert")
	public String projectinsert(Model model) {		
		List<CategoryDTO> maincategorylist = categoryservice.maincategoryList();		
		model.addAttribute("mainlist",maincategorylist);		
		System.out.println("insert : "+model);		
		return "project/projectinsert.temp"; 
	
	}	
	
	// 서명 ajax 
	@RequestMapping(value="sign", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String sign(@RequestParam String sign									
									,HttpServletRequest request // 업로드
									,Principal principal
									){	
		System.out.println("들어는갔냐?");
		String s = StringUtils.split(sign,",")[1];
		System.out.println("싸인    "+s);
		String fileName = "sign"+System.currentTimeMillis()+".jpg";	
		System.out.println("파일 내임"+fileName);		
		MemberDTO mdto = memberservice.memberinfo(principal.getName());
		int no = mdto.getNo();	
		System.out.println("회원번호"+no);				
		try {					
			String uploadpath = request.getSession().getServletContext().getRealPath(signpath);	// 경로	
			System.out.println(uploadpath);						
				FileUtils.writeByteArrayToFile(new File(uploadpath,fileName), Base64.decodeBase64(s));
				mdto.setSign(uploadpath+"\\"+fileName);	
			
		}catch(IOException e) {			
			System.out.println(e.getMessage());			
		}		
		String signsignpath =  mdto.getSign();
		
		System.out.println("서명이미지 경로: "+ mdto.getSign());		
		service.sign(signsignpath, no); // update sign service			
		return signsignpath;
	}
	
	// 프로젝트 등록 결과 
	@RequestMapping("projectresult")
	public String projectinsertresult(
			HttpServletRequest request 
			,BusinessDTO busdto
			,@ModelAttribute ProjectDTO dto			
			,@RequestParam String[] option_name			
			,@RequestParam int[] option_price
			,@RequestParam String[] option_contents
			,@RequestParam int[] option_quantity		   
		    ,@RequestParam int btncnt
			,@RequestParam String summernote
			,Principal principal) throws Exception { 		
		MemberDTO mdto = memberservice.memberinfo(principal.getName());
		System.out.println("회원 이름 : "+mdto.getName());
		System.out.println("회원 싸인 --------"+mdto.getSign());
		MultipartFile project_photo = dto.getProject_photo_file(); // 프로젝트 대표사진 파일 
		MultipartFile img = dto.getImg_file(); // 창작자 프로필사진 파일			
		MultipartFile project_contract = dto.getProject_contract_file(); // 계약서pdf 파일	
		MultipartFile project_contents = dto.getProject_contents_file(); // 내용pdf 파일
		String contents_filename= "content"+System.currentTimeMillis()+".pdf"; //내용pdf 파일 이름
		String contract_filename = "pdf"+System.currentTimeMillis()+".pdf";	//계약서pdf 파일 이름	
		try {				
			String uploadpath = request.getSession().getServletContext().getRealPath(path);	// 경로
			String contents_pdfpath = request.getSession().getServletContext().getRealPath(contentpdf); // 내용pdf 경로
			String contract_pdfpath = request.getSession().getServletContext().getRealPath(pdfpath); // 계약서pdf 경로	
			String contents_pdfpath_realpath = contents_pdfpath+"\\"+contents_filename;
			String contract_pdfpath_realpath = contract_pdfpath+"\\"+contract_filename;	
			System.out.println("contract_pdfpath_realpath?"+contract_pdfpath_realpath);
			
			pdfservice.createSummernotePdf(summernote,contents_pdfpath_realpath);
			pdfservice.htmlcreate(mdto.getSign(),contract_pdfpath_realpath); // 계약서pdf 생성 service		
		
			dto.setProject_contract(pdfpath+"/"+contract_filename); 
			System.out.println("리소스거시기냐?"+dto.getProject_contract());
			
			if(!project_photo.isEmpty()&&!img.isEmpty()) { // 대표사진, 프로필사진 둘다있을때 
				File file = new File(uploadpath, project_photo.getOriginalFilename()); // 프로젝트 대표사진
				project_photo.transferTo(file);								
				dto.setProject_photo(path+"/"+dto.getProject_photo_file().getOriginalFilename()); 	
				
				File file2 = new File(uploadpath, img.getOriginalFilename());// 창작자 프로필사진
				img.transferTo(file2);
				dto.setImg(path+"/"+dto.getImg_file().getOriginalFilename());					
				
				File file3 = new File(contents_pdfpath, project_contents.getOriginalFilename()); //직접올리는pdf
				project_contents.transferTo(file3);
				dto.setProject_contents(contentpdf+"/"+dto.getProject_contents_file().getOriginalFilename());
				
				System.out.println("프로젝트 제목 : " + dto.getProject_title());
				System.out.println("대표사진 파일명 : " + dto.getProject_photo());		
				System.out.println("창작자 프로필 사진"+ dto.getImg());			
				System.out.println("경로 : "+dto.getProject_photo());	
				System.out.println("pdf경로 맞냐? : "+dto.getProject_contract());
			}						
		}catch(IOException e) {			
			System.out.println(e.getMessage());			
		}				
		
		System.out.println("옵션갯수 (클릭수) : "+btncnt);
		
		int projectsearchno=service.projectsearchno(dto.getCategory_no());
		
		dto.setProject_no(projectsearchno);		
		dto.setNo(mdto.getNo()); // 로그인한 no값을 insert쿼리문으로
		System.out.println("회원번호 : "+dto.getNo());
		
		//계약서 pdf		
		System.out.println("사인 경로 :"+mdto.getSign());		
		
		int result = service.projectInsert(dto); // projectdto 		
		
		//계약서 pdf		
		System.out.println("사인 경로 :"+mdto.getSign());
		
		
		System.out.println("1 프로젝트 번호"+dto.getProject_no());
		System.out.println("프로젝트 등록 ");  		
		
		int result3= businessservice.businessInsert(busdto); // businesssdto			
		System.out.println("사업자 등록 ");  					
		
		List<OptionDTO> list = new ArrayList<OptionDTO>();
		
		for(int i=0; i<option_price.length; i++) {
			OptionDTO optdto = new OptionDTO();
			optdto.setProject_no(projectsearchno);
			optdto.setOption_name(option_name[i]);
			optdto.setOption_price(option_price[i]);
			optdto.setOption_contents(option_contents[i]);
			optdto.setOption_quantity(option_quantity[i]);
			list.add(optdto);			
			System.out.println("이름 : "+option_name[i]);
			System.out.println("금액 : "+option_price[i]);
			System.out.println("내용 : "+option_contents[i]);
		}			
		System.out.println("리스트 : " +list);		
		
		int result2 = service.projectoptionInsert(list);
		
		System.out.println("옵션등록");		
		
		
		System.out.println("컨트롤러에서 pdf서비스 실행");			

		return "project/projectinsertresult.temp";
	}		
	
	// 프로젝트 상세 페이지
	@RequestMapping("projectdetail/{project_no}")
	public String projectdetail(@PathVariable int project_no, Model model) {	
		ProjectDTO detail = service.projectDetail(project_no);
		List<OptionDTO> option= service.projectoptionList(project_no);
		int viewcnt = service.viewcnt(project_no);			
		model.addAttribute("list", detail);
		model.addAttribute("option", option);	
		return "single.temp";
	}
	
	// 프로젝트 상세 페이지2
/*	@RequestMapping("projectdetail/{project_no}")
	public String projectdetail2(@PathVariable int project_no, Model model) {	
		ProjectDTO detail = service.projectDetail(project_no);
		List<OptionDTO> option= service.projectoptionList(project_no);
		int viewcnt = service.viewcnt(project_no);
		model.addAttribute("list", detail);
		model.addAttribute("option", option);		
		return "single.temp";
	}*/

}
