package com.bitcamp.app;

public class Function {
	
	public static String url(String str) {
		String urlarr[] = str.split("80/");
		String url = urlarr[1];
		if("talkdetail".equals(urlarr[1])) {
			url = "talk";
		} else {
			url = str.substring(str.lastIndexOf("8080/")+5);
		}
		return url;
	}
}
