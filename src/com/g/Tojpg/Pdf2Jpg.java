package com.g.Tojpg;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;

import com.baje.sz.ajax.LogUtility;
import org.icepdf.core.exceptions.PDFException;
import org.icepdf.core.exceptions.PDFSecurityException;
import org.icepdf.core.pobjects.Document;
import org.icepdf.core.pobjects.Page;
import org.icepdf.core.util.GraphicsRenderingHints;

public class Pdf2Jpg {
	public static final String FILETYPE_PNG = "png";

	public static final String SUFF_IMAGE = "." + FILETYPE_PNG;

	/**
	 * 
	 * 将指定pdf文件的首页转换为指定路径的缩略图
	 * 
	 *@param filepath
	 *            原文件路径，例如d:/test.pdf
	 * 
	 *@param imagepath
	 *            图片生成路径，例如 d:/test-1.jpg
	 * 
	 *@param zoom
	 *            缩略图显示倍数，1表示不缩放，0.3则缩小到30%
	 */

	public int tranfer(String sourceFile, String destFile)throws PDFException, PDFSecurityException, IOException {

		// ICEpdf document class
		
		String FileName = sourceFile.substring(sourceFile.lastIndexOf("/")+1, sourceFile.lastIndexOf("."));
		
		Document document = null;
		BufferedImage img = null;
		float rotation = 0f;
		float zoom = 1;
		
		//判断目录是否存在，如果不存在的话则创建
		File file = new File(destFile);
		if (!file.exists()) {
			file.mkdirs();
		}

		LogUtility.log("sourceFile=" + sourceFile);
		File inputFile = new File(sourceFile);  
		if (!inputFile.exists()) {  
			System.out.println("找不到源文件");
			return -1;// 找不到源文件, 则返回-1  
		}  
		document = new Document();

		document.setFile(sourceFile);

		// maxPages = document.getPageTree().getNumberOfPages();
		
		//进行pdf文件图片的转化
		int ppt_num=0;
		for (int i = 0; i < document.getNumberOfPages(); i++) {
			ppt_num++;
			img = (BufferedImage) document.getPageImage(i,GraphicsRenderingHints.SCREEN,
					Page.BOUNDARY_CROPBOX,rotation,zoom);
			//设置图片的后缀名
			Iterator iter = ImageIO.getImageWritersBySuffix(FILETYPE_PNG);
			
			ImageWriter writer = (ImageWriter) iter.next();
			
			File outFile = new File(destFile+(i+1)+SUFF_IMAGE);
			
			FileOutputStream out = new FileOutputStream(outFile);
			
			ImageOutputStream outImage = ImageIO.createImageOutputStream(out);
			
			writer.setOutput(outImage);
			
			writer.write(new IIOImage(img, null, null));
		}
		img.flush();
		document.dispose();
		System.out.println("转化成功！！！ ");
		return ppt_num;
	}
	public static void main(String[] args) {
		try {
			String sourceFile ="E:\\ppt\\2015-12.docx";
			String destFile="E:\\ppt\\wordImages";
			Pdf2Jpg pdf = new Pdf2Jpg();
			pdf.tranfer(sourceFile,destFile);
		} catch (PDFException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (PDFSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
