package com.bitcamp.service;

import java.io.FileOutputStream;
import org.springframework.stereotype.Service;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;

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

			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("d:/summer.pdf"));
			// pdf파일의 저장경로를 d드라이브의 sample.pdf로 한다는 뜻

			document.open(); // 웹페이지에 접근하는 객체를 연다

			BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H,
					BaseFont.EMBEDDED);
			// pdf가 기본적으로 한글처리가 안되기 때문에 한글폰트 처리를 따로 해주어야 한다.
			// createFont메소드에 사용할 폰트의 경로 (malgun.ttf)파일의 경로를 지정해준다.

			Font font = new Font(baseFont, 12); // 폰트의 사이즈를 12픽셀로 한다.
			
			document.add(new Paragraph(summernote, font));
			document.close();
			result = "pdf생성되었습니다.";

		} catch (Exception e) {
			e.printStackTrace();
			result = "pdf생성실패";
		}
		return result;
	}
}
