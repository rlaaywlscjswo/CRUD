package com.bitcamp.service;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.nio.charset.Charset;

import org.springframework.stereotype.Service;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

@SuppressWarnings("deprecation")
@Service
public class PDFServiceImple implements PDFService {

	//summernote
	@Override
	public String createSummernotePdf(String summernote, String contents_pdfpath_realpath) {
		String result = ""; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정	
		try {
			Document document = new Document(); // pdf문서를 처리하는 객체

			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(contents_pdfpath_realpath));	// pdf파일의 저장경로를 d드라이브의 sample.pdf로 한다는 뜻

			document.open(); // 웹페이지에 접근하는 객체를 연다	
			//css
			CSSResolver cssresolver = new StyleAttrCSSResolver();				
			//html, font
			XMLWorkerFontProvider fontprovider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
			fontprovider.register("c:/windows/fonts/malgun.ttf","malgun");
			CssAppliers cssappliers = new CssAppliersImpl(fontprovider);
			
			HtmlPipelineContext htmlcontext = new HtmlPipelineContext(cssappliers);
			htmlcontext.setTagFactory(Tags.getHtmlTagProcessorFactory());
			
			//pipelines
			PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
			HtmlPipeline html = new HtmlPipeline(htmlcontext, pdf);		
			CssResolverPipeline css= new CssResolverPipeline(cssresolver, html);		
			
				
			System.out.println("summernote:"+summernote);
			
			XMLWorker worker = new XMLWorker(css, true);
			XMLParser xmlparser = new XMLParser(worker);
			
			String str = "<html><head></head><body style='font-family: malgun;'>"+
			summernote	
			+"</body></html>";
			
			StringReader strreader = new StringReader(str);
			xmlparser.parse(strreader);
			document.close();
			result = "pdf생성되었습니다.";

		} catch (Exception e) {
			e.printStackTrace();
			result = "pdf생성실패";
		}
		return result;
	}
	
	@Override
	public void htmlcreate(String sign, String project_contract) {
		
	String result = ""; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정
		
		try {
			Document document = new Document(); // pdf문서를 처리하는 객체
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(project_contract)); 		
			document.open(); // 웹페이지에 접근하는 객체를 연다				
			XMLWorkerHelper helper = XMLWorkerHelper.getInstance();			
			
			//css
			CSSResolver cssresolver = new StyleAttrCSSResolver();		
	        CssFile cssFile = helper.getCSS(new FileInputStream("d:/pdf.css"));
	        System.out.println("css주소 맞냐"+cssFile);
	        cssresolver.addCss(cssFile);
	        
			//html, font
			XMLWorkerFontProvider fontprovider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
			fontprovider.register("c:/windows/fonts/malgun.ttf","malgun");
			CssAppliers cssappliers = new CssAppliersImpl(fontprovider);
			
			HtmlPipelineContext htmlcontext = new HtmlPipelineContext(cssappliers);
			htmlcontext.setTagFactory(Tags.getHtmlTagProcessorFactory());
			
			//pipelines
			PdfWriterPipeline pdf = new PdfWriterPipeline(document,writer);
			HtmlPipeline html = new HtmlPipeline(htmlcontext, pdf);		
			CssResolverPipeline css= new CssResolverPipeline(cssresolver, html);		
		
			XMLWorker worker = new XMLWorker(css, true);
			XMLParser xmlparser = new XMLParser(worker, Charset.forName("UTF-8"));
			
			// 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
			String htmlStr = "<html><head><body style='font-family: malgun;'>"			
			            + " <h1>펀딩 계약서</h1>" + 
			            "    <p>회원이름</p>" + 
			            "    <p>프로젝트 제목</p>" + 
			            "    <p>사업자등록번호</p>" + 
			            "    <p>서명</p>" + 
			            "    <p>(인)</p>"
					+ "</body></head></html>";
			 
			StringReader strReader = new StringReader(htmlStr);
			xmlparser.parse(strReader);		
			Image jpg =Image.getInstance(sign);
			jpg.setAbsolutePosition(280,0);
			document.add(jpg);	
			document.close();
		} catch (Exception e) {
			e.printStackTrace();			
		}
	}
	
	
	

}
	

