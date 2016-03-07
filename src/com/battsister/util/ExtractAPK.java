package com.battsister.util;

/**
 * Created by Cc on 2014/10/22.
 */

import android.content.res.AXmlResourceParser;
import android.util.TypedValue;
import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xmlpull.v1.XmlPullParser;

import java.io.File;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * 抽取apk中的信息
 *
 * @author
 */
public class ExtractAPK {


    /**
     * @param filePath apk路径，例如：/home/ /Qk_test.apk
     * @return versionCodee
     * @throws Exception
     */
    public String getVersionCode(String filePath) throws Exception {

        String versionCode = null;
        ZipFile zip = null;
        try {

            File file = new File(filePath);
            zip = new ZipFile(file);
            Enumeration enume = zip.entries();

            String filename = null;
            ZipEntry zipEntry = null;
            while (enume.hasMoreElements()) {
                zipEntry = (ZipEntry) enume.nextElement();
                filename = zipEntry.getName();
                if ("AndroidManifest.xml".equalsIgnoreCase(filename)) {
                    versionCode = getCode(zip.getInputStream(zipEntry), "versionCode");
                    break;
                }
            }

        } catch (Exception e) {
            log.error("读取apk文件失败", e);
            throw e;
        } finally {
            try {
                if (null != zip)
                    zip.close();
            } catch (Exception e) {
                log.error("关闭zip失败", e);
            }
        }

        return versionCode;
    }

    public JSONObject getVersion(String filePath) throws Exception {

        JSONObject backJson = new JSONObject();
        String versionCode = null;
        String versionName = null;
        String updateInfo = null;
        ZipFile zip = null;
        try {

            File file = new File(filePath);
            zip = new ZipFile(file);
            Enumeration enume = zip.entries();

            String filename = null;
            ZipEntry zipEntry = null;
            while (enume.hasMoreElements()) {
                zipEntry = (ZipEntry) enume.nextElement();
                //System.out.println("zipEntry:"+zipEntry);
                filename = zipEntry.getName();
                //System.out.println("filename:"+filename);
                if ("AndroidManifest.xml".equalsIgnoreCase(filename)) {
                    versionCode = getCode(zip.getInputStream(zipEntry), "versionCode");
                    backJson.put("versionCode", versionCode);
                    versionName = getCode(zip.getInputStream(zipEntry), "versionName");
                    backJson.put("versionName", versionName);
                    updateInfo = getCode(zip.getInputStream(zipEntry), "value");
                    backJson.put("updateInfo", updateInfo);
                    break;
                }
            }
            backJson.put("type", true);
            return backJson;
        } catch (Exception e) {
            log.error("读取apk文件失败", e);
            throw e;
        } finally {
            try {
                if (null != zip)
                    zip.close();
            } catch (Exception e) {
                log.error("关闭zip失败", e);
            }
        }

    }

    private String getCode(InputStream is, String name) throws Exception {

        String versionCode = null;
        try {
            AXmlResourceParser parser = new AXmlResourceParser();
            parser.open(is);
            boolean brek = false;
            while (true) {
                int type = parser.next();
                if (type == XmlPullParser.END_DOCUMENT) {
                    break;
                }
                switch (type) {
                    case XmlPullParser.START_TAG:
                        for (int i = 0; i != parser.getAttributeCount(); ++i) {
                            if (name.equals(parser.getAttributeName(i))) {
                                versionCode = getAttributeValue(parser, i);
                                brek = true;
                                break;
                            }
                        }
                }

                if (brek) {
                    break;
                }
            }

        } catch (Exception e) {
            log.error("读取versionCode失败", e);
            throw e;
        }

        return versionCode;
    }

    /**
     * 获取版本更新信息
     *
     * @param is   InputStream
     * @param name 要获取的对应在andriodmanifest.xml中保存的标签名
     * @return String
     * @throws Exception
     */
    private String getUpdateInfo(InputStream is, String name) throws Exception {

        String versionCode = null;
        try {
            AXmlResourceParser parser = new AXmlResourceParser();
            parser.open(is);
            boolean brek = false;
            while (true) {
                int type = parser.next();
                if (type == XmlPullParser.END_DOCUMENT) {
                    break;
                }
                switch (type) {
                    case XmlPullParser.START_TAG:
                        for (int i = 0; i != parser.getAttributeCount(); ++i) {
                            //System.out.println(parser.getAttributeName(i));
                            if (parser.getName().equals(name)) {
                                versionCode = parser.getAttributeValue(i);
                                brek = true;
                                break;
                            }
                        }
                }

                if (brek) {
                    break;
                }
            }

        } catch (Exception e) {
            log.error("读取update-info失败", e);
            throw e;
        }

        return versionCode;
    }

    private String getAttributeValue(AXmlResourceParser parser, int index) {
        int type = parser.getAttributeValueType(index);
        int data = parser.getAttributeValueData(index);
        if (type == TypedValue.TYPE_STRING) {
            return parser.getAttributeValue(index);
        }
        if (type == TypedValue.TYPE_ATTRIBUTE) {
            return String.format("?%s%08X", getPackage(data), data);
        }
        if (type == TypedValue.TYPE_REFERENCE) {
            return String.format("@%s%08X", getPackage(data), data);
        }
        if (type == TypedValue.TYPE_FLOAT) {
            return String.valueOf(Float.intBitsToFloat(data));
        }
        if (type == TypedValue.TYPE_INT_HEX) {
            return String.format("0x%08X", data);
        }
        if (type == TypedValue.TYPE_INT_BOOLEAN) {
            return data != 0 ? "true" : "false";
        }
        if (type == TypedValue.TYPE_DIMENSION) {
            return Float.toString(complexToFloat(data))
                    + DIMENSION_UNITS[data & TypedValue.COMPLEX_UNIT_MASK];
        }
        if (type == TypedValue.TYPE_FRACTION) {
            return Float.toString(complexToFloat(data))
                    + FRACTION_UNITS[data & TypedValue.COMPLEX_UNIT_MASK];
        }
        if (type >= TypedValue.TYPE_FIRST_COLOR_INT
                && type <= TypedValue.TYPE_LAST_COLOR_INT) {
            return String.format("#%08X", data);
        }
        if (type >= TypedValue.TYPE_FIRST_INT
                && type <= TypedValue.TYPE_LAST_INT) {
            return String.valueOf(data);
        }
        return String.format("<0x%X, type 0x%02X>", data, type);
    }

    private String getPackage(int id) {
        if (id >>> 24 == 1) {
            return "android:";
        }
        return "";
    }

    private float complexToFloat(int complex) {
        return (complex & 0xFFFFFF00) * RADIX_MULTS[(complex >> 4) & 3];
    }

    private final float RADIX_MULTS[] = {0.00390625F, 3.051758E-005F,
            1.192093E-007F, 4.656613E-010F};
    private final String DIMENSION_UNITS[] = {"px", "dip", "sp", "pt", "in",
            "mm", "", ""};
    private final String FRACTION_UNITS[] = {"%", "%p", "", "", "", "", "", ""};

    private final static Log log = LogFactory.getLog(ExtractAPK.class);
}