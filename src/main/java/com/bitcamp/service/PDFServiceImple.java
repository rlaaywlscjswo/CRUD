package com.bitcamp.service;

import java.io.FileOutputStream;
import java.io.StringReader;

import org.springframework.stereotype.Service;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
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

@Service
public class PDFServiceImple implements PDFService {

	/*@Inject
	ProjectService projectservice; */
	// project 안에있는 내용들을 pdf만들기 위해 프로젝트 서비스객체를 사용하기 위해서 의존성을 주입

	@Override
	public String createPdf(String summernote) {
		String result = ""; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정
	
		try {
			Document document = new Document(); // pdf문서를 처리하는 객체

			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("d:/55myojinlove.pdf"));
			// pdf파일의 저장경로를 d드라이브의 sample.pdf로 한다는 뜻

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
}
