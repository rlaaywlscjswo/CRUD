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
	public String createSummernotePdf(String summernote) {
		String result = ""; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정	
		try {
			Document document = new Document(); // pdf문서를 처리하는 객체

			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("d:/0myojinlove.pdf"));	// pdf파일의 저장경로를 d드라이브의 sample.pdf로 한다는 뜻

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

	//계약서pdf
	@Override
	public String createContractPdf(String sign, String project_contract) { // 경로값 넘겨주기 
		String result = ""; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정
		
		try {
			Document document = new Document(); // pdf문서를 처리하는 객체
			System.out.println("pdf경로경로경로 :"+project_contract);
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(project_contract)); 
		
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
			
			Image jpg =Image.getInstance(sign);			
			System.out.println("sign:"+sign);		
			document.add(jpg);				
			
			document.close();
			result = "pdf생성되었습니다.";

		} catch (Exception e) {
			e.printStackTrace();
			result = "pdf생성실패";
		}
		return result;		
	}	

	@Override
	public void htmlcreate(String sign) {
		
	String result = ""; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정
		
		try {
			Document document = new Document(); // pdf문서를 처리하는 객체
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("d:/filename12.pdf")); 		
			document.open(); // 웹페이지에 접근하는 객체를 연다				
			/*StringBuffer sBuff =new StringBuffer("<html>");
	        sBuff.append("<head></head>");
	        sBuff.append("<body>");	   	       
	        sBuff.append("<p>good</p>");
	        sBuff.append("<p>야 한글</p>");
	        sBuff.append("<p> 김묘진 입니다 </p>");
	        sBuff.append("</body>");
	        sBuff.append("</html>");	*/		
				
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
	
	
	
/*	
	// 두번째 방법 ㅇㅇㅇㅇㅇ 스탬프
		@Override
		public String pdfpdf(String sign, String project_contract) {
			String result = ""; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정
			String baseRoot ="/resources"; // 뒤에 갖다씀 (html)
			try {
				Document document = new Document(); // pdf문서를 처리하는 객체
				System.out.println("pdf경로경로경로=========== :"+project_contract);
				PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(project_contract)); 
			
				
				document.open(); // 웹페이지에 접근하는 객체를 연다	
				
				XMLWorkerHelper helper = XMLWorkerHelper.getInstance(); //			
				
				
				//css 없어도 ㅇㅋㅇㅋ
				CSSResolver cssresolver = new StyleAttrCSSResolver();	
				
				//html, font (한글지원폰트 꼭)
				XMLWorkerFontProvider fontprovider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
				fontprovider.register("c:/windows/fonts/malgun.ttf","malgun");
				CssAppliers cssappliers = new CssAppliersImpl(fontprovider);
				
				HtmlPipelineContext htmlcontext = new HtmlPipelineContext(cssappliers);
				htmlcontext.setTagFactory(Tags.getHtmlTagProcessorFactory());
				
				//pipelines
				PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
				HtmlPipeline html = new HtmlPipeline(htmlcontext, pdf);		
				CssResolverPipeline css= new CssResolverPipeline(cssresolver, html);		
				
				
				XMLWorker worker = new XMLWorker(css, true);
				XMLParser xmlparser = new XMLParser(worker);
				
				BufferedReader br = null;
				String content = "";
				try {
					StringBuffer sb_content = new StringBuffer();
					String tr_cmfn = baseRoot + "/html/test.html";
					File file = new File(tr_cmfn);
					if(!file.exists()) {
						if(document != null)document.close();
						if(writer!=null) writer.close();
						System.out.println("html존재 ㄴ ㄴ");
					}
					br = new BufferedReader(new FileReader(file));
					String line;
					while((line=br.readLine())!=null) {
						sb_content.append(line);
					}
					content =sb_content.toString();
					
				// 파라미터 셋팅 - html에서 변경할 파라미터를 지정하고 업무에 맞게 변경 ㅇㅇ
				//메모장 복붙

				StringReader strReader = new StringReader(content);
				xmlparser.parse(strReader);			
		
				document.close();
				writer.close();
				result = "pdf생성되었습니다.";
				
				PdfReader reader = new PdfReader(project_contract);
				PdfStamper stamp = new PdfStamper(reader, new FileOutputStream("d:/stamp.pdf"));
				PdfGState gs1 = new PdfGState();
				gs1.setFillOpacity(0.7f); // 이미지 농도
				
				//이미지 스탬프			
				Image jpg =Image.getInstance(sign); // 이미지 파일
				jpg.scalePercent(50,50); // 이미지 사이즈
				jpg.setAlignment(Image.ALIGN_RIGHT); // 정렬
				jpg.setAbsolutePosition(510f, 370f); // 이미지 위치(가로,세로)
				
				// 생성된이미지를 워터마크??
				PdfContentByte under = stamp.getUnderContent(1);
				under = stamp.getOverContent(1);
				under.saveState();
				under.setGState(gs1);
				under.addImage(jpg);
				under.restoreState();
				
				stamp.close();
				reader.close();
				
				// 임시파일 제거
				File tm = new File(project_contract);
				if(tm.exists()) tm.delete();
			} catch (Exception e) {
				e.printStackTrace();
				result = "pdf생성실패";
			}
			
			}catch(Exception e) {
				
			}	
			return result;
		}*/
}
	

