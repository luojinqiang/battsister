package utils;

import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;
import java.net.ConnectException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.icepdf.core.pobjects.Document;
import org.icepdf.core.pobjects.Page;
import org.icepdf.core.util.GraphicsRenderingHints;

import com.artofsolving.jodconverter.DefaultDocumentFormatRegistry;
import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.DocumentFormat;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;

/**
 * 
 * @author yuliang
 *
 */
public class Word2ImagesUtils {
	public static void doc2Pdf(String docPath, String pdfPath) throws ConnectException {
        File inputFile = new File(docPath);
        File outputFile = new File(pdfPath);
        OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
        connection.connect();
        DocumentConverter converter = new OpenOfficeDocumentConverter(connection);
        //converter.convert(inputFile, outputFile);
        DefaultDocumentFormatRegistry formatReg = new DefaultDocumentFormatRegistry();   
        DocumentFormat txt = formatReg.getFormatByFileExtension("odt") ;
        DocumentFormat pdf = formatReg.getFormatByFileExtension("pdf") ;
        converter.convert(inputFile, txt, outputFile, pdf);
        connection.disconnect();
    }

    
    public static void doc2Imags(String docPath, String imgDirPath){
    	String pdfPath =String.format("%s%s.pdf",  FilenameUtils.getFullPath(docPath), FilenameUtils.getBaseName(docPath));
    	try {
			doc2Pdf(docPath, pdfPath);
			pdf2Imgs(pdfPath, imgDirPath);
			File pdf =  new File(pdfPath);
			if(pdf.isFile()){
				pdf.delete();
			}

		} catch (ConnectException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    public static void main(String[] args) {
		String docPath = "E:\\ppt\\2015-12.docx";
		String pdfPath = "E:\\ppt\\wordImages";
		doc2Imags(docPath, pdfPath);
	}
    /**
     * 将pdf转换成图片
     * 
     * @param pdfPath
     * @param imagePath
     * @return 返回转换后图片的名字
     * @throws Exception
     */
    public static List<String> pdf2Imgs(String pdfPath, String imgDirPath) throws Exception {
        Document document = new Document();
        document.setFile(pdfPath);

        float scale = 2f;//放大倍数
        float rotation = 0f;//旋转角度

        List<String> imgNames = new ArrayList<String>();
        int pageNum = document.getNumberOfPages();
        File imgDir = new File(imgDirPath);
        if (!imgDir.exists()) {
            imgDir.mkdirs();
        }
        for (int i = 0; i < pageNum; i++) {
            BufferedImage image = (BufferedImage) document.getPageImage(i, GraphicsRenderingHints.SCREEN,
                    Page.BOUNDARY_CROPBOX, rotation, scale);
            RenderedImage rendImage = image;
            try {
                String filePath = imgDirPath + File.separator + i + ".jpg";
                File file = new File(filePath);
                ImageIO.write(rendImage, "jpg", file);
                imgNames.add(FilenameUtils.getName(filePath));
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
            image.flush();
        }
        document.dispose();
        return imgNames;
    }
 
}
