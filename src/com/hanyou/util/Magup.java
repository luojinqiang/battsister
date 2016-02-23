package com.hanyou.util;

import com.baje.sz.util.AppConf;
import org.im4java.core.ConvertCmd;
import org.im4java.core.IMOperation;

/**
 * * ImageMagick和im4java处理图片 * @author sunlightcs * 2011-6-1 *
 * http://hi.juziku.com/sunlightcs/
 */
public class Magup {
    /**
     * ImageMagick的路径
     */
    public static String imageMagickPath = AppConf.getconf().get("Magsteup");

    // imageMagickPath=C:\\ImageMagick-6.6.5-Q16C:\Program Files
    // (x86)\GraphicsMagick-1.3.15-Q16

    static {
        /** * 获取ImageMagick的路径 */
        // Properties prop = new PropertiesFile().getPropertiesFile();
        // linux下不要设置此值，不然会报错
        // imageMagickPath = prop.getProperty("imageMagickPath");
    }

    /**
     * * 根据坐标裁剪图片 * * @param srcPath 要裁剪图片的路径 * @param newPath 裁剪图片后的路径 * @param
     * x 起始横坐标 * @param y 起始挫坐标 * @param x1 结束横坐标 * @param y1 结束挫坐标
     */
    public static void cutImage(String srcPath, String newPath, int x, int y, int x1, int y1) throws Exception {
        int width = x1 - x;
        int height = y1 - y;
        IMOperation op = new IMOperation();
        op.addImage(srcPath);
        /**
         * * width：裁剪的宽度 * height：裁剪的高度 * x：裁剪的横坐标 * y：裁剪的挫坐标
         * */
        op.crop(width, height, x, y);
        op.addImage(new String(newPath.getBytes("utf-8")));
        // op.addImage(newPath);
        ConvertCmd convert = new ConvertCmd();
        // linux下不要设置此值，不然会报错
        if (!AppConf.getconf().get("servertype").equals("linux")) {
            convert.setSearchPath(imageMagickPath);
        }
        convert.run(op);
    }

    /**
     * * 根据尺寸缩放图片 * @param width 缩放后的图片宽度 * @param height 缩放后的图片高度 * @param
     * srcPath 源图片路径 * @param newPath 缩放后图片的路径
     */
    public static void cutImage(int width, int height, String srcPath,
                                String newPath) throws Exception {
        IMOperation op = new IMOperation();
        op.addImage(srcPath);
        op.resize(width, height);
        op.addImage(new String(newPath.getBytes("utf-8")));
        ConvertCmd convert = new ConvertCmd();
        // linux下不要设置此值，不然会报错
        if (!AppConf.getconf().get("servertype").equals("linux")) {
            convert.setSearchPath(imageMagickPath);
        }
        convert.run(op);
    }

    /**
     * * 根据宽度缩放图片 * @param width 缩放后的图片宽度 * @param srcPath 源图片路径 * @param
     * newPath 缩放后图片的路径
     */
    public static void cutImage(int width, String srcPath, String newPath)
            throws Exception {
        IMOperation op = new IMOperation();

        op.addImage(new String(srcPath.getBytes("utf-8")));
        op.resize(width, null);
        op.quality(0.7);
        // newPath=newPath.replace("/","\\");
        // newPath="e:\\未命名81.jpg";
        // e:\\你好1.jpg

        op.addImage(new String(newPath.getBytes("utf-8")));
        //System.out.println("新图片" + newPath);
        ConvertCmd convert = new ConvertCmd();
        // linux下不要设置此值，不然会报错
        if (!AppConf.getconf().get("servertype").equals("linux")) {
            convert.setSearchPath(imageMagickPath);
        }
        convert.run(op);

    }

    public static void cutImage(int width, String srcPath, String newPath,
                                double qa) throws Exception {
        IMOperation op = new IMOperation();
        op.addImage(new String(srcPath.getBytes("utf-8")));
        op.resize(width, null);
        if (qa > 0) {
            op.quality(qa);
        }
        // newPath=newPath.replace("/","\\");
        // newPath="e:\\未命名81.jpg";
        // e:\\你好1.jpg

        op.addImage(new String(newPath.getBytes("utf-8")));
        //System.out.println("新图片" + newPath);
        ConvertCmd convert = new ConvertCmd();
        // linux下不要设置此值，不然会报错
        if (!AppConf.getconf().get("servertype").equals("linux")) {
            convert.setSearchPath(imageMagickPath);
        }
        convert.run(op);

    }

    /**
     * * 给图片加水印 * @param srcPath 源图片路径 fontsize=18; fonttext="juziku.com"
     */
    public static void cutImage(String srcPath, String newPath, double qa) throws Exception {
        /*System.out.println("srcPath="+srcPath);
        System.out.println("newPath="+newPath);*/
        IMOperation op = new IMOperation();
        op.addImage(new String(srcPath.getBytes("utf-8")));
        if (qa > 0) {
            op.quality(qa);
        }
        op.addImage(new String(newPath.getBytes("utf-8")));
        ConvertCmd convert = new ConvertCmd();
        if (!AppConf.getconf().get("servertype").equals("linux")) {
            convert.setSearchPath(imageMagickPath);
        }
        convert.run(op);
    }

    public static void addImgText(String srcPath, int fontsize, String fonttext) throws Exception {
        IMOperation op = new IMOperation();
        op.font("宋体").gravity("southeast").pointsize(fontsize).fill("#BCBFC8").draw("text 5,5 " + fonttext);
        op.addImage();
        op.addImage();
        ConvertCmd convert = new ConvertCmd();
        // linux下不要设置此值，不然会报错
        if (!AppConf.getconf().get("servertype").equals("linux")) {
            convert.setSearchPath(imageMagickPath);
        }
        convert.run(op, srcPath, new String(srcPath.getBytes("utf-8")));
    }

    // public static void main(String[] args) throws Exception{
    // cutImage("D:\\apple870.jpg", "D:\\apple870eee.jpg", 98, 48, 370, 320);
    // cutImage(200,300, "/home/steven/a.jpg", "/home/steven/aa.jpg");
    // addImgText("//home//steven//a.jpg");
    // } }
    // }
    public static void main(String[] args) throws Exception {

        cutImage("D:/b.jpg", "D:/a.jpg", 0.7);

    }

}
