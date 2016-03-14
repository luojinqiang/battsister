package com.g.Tojpg;

import java.io.File;

import org.icepdf.core.pobjects.Document;

import com.baje.sz.ajax.LogUtility;

public class PdfToPng {
	
	public static int pdfToPng(String source_file,String des_file,String file_name){
		int num=0;
		Document document = null;
		//判断目录是否存在，如果不存在的话则创建
		File file = new File(des_file);
		if (!file.exists()) {
			file.mkdirs();
		}
		
		File inputFile = new File(source_file);  
		if (!inputFile.exists()) {  
			System.out.println("找不到源文件");
			return -1;// 找不到源文件, 则返回-1  
		}  
		document = new Document();
		try {
			document.setFile(source_file);
			num=document.getNumberOfPages();
			String command ="convert "+source_file+" "+des_file+"test"+Pdf2Jpg.SUFF_IMAGE;
			//LogUtility.log("command-->"+command);
			Process pro= Runtime.getRuntime().exec(command);  
			//pro.destroy();
		} catch (Exception e) {
			LogUtility.log(e,"pdfToPng is failure");
			e.printStackTrace();
		}
		return num;
	}
}
