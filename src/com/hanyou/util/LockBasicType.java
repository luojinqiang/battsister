package com.hanyou.util;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.AppConf;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.RunUrl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by haihui on 2015-06-13.
 */
public class LockBasicType {

    public static final String AES_miyao = "0102030405060708090A0B0C0D0E0F10";
    public static final String defaultkey = "112233445566778899aabbccddeeff00";

    public static final String BLE_zhulianjie1 = "4D4B4C42112233445566778800000000";
    public static final String BLE_zhulianjie2 = "4D4B484299AABBCCDDEEFF0000000000";

    public static final String BLE_ERR = "434D455200000000000000000000000019";  // 请求错误

    public static final String BLE_open = "4F50454E000000000000000000000000";
    public static final String BLE_log = "47545243000000000000000000000000";

    public static final String BLE_miyao = "112233445566778899AABBCCDDEEFF00";

    public static final String BLE_qingqiuliushui = "47545351000000000000000000000000"; //请求流水号
    public static final String BLE_qingqiuhouseka = "4754434B000000000000000000000000"; //请求房卡
    public static final String BLE_GET_OUTLET = "47545041000000000000000000000000"; //获取已配对插座
    public static final String BLE_ADD_OUTLET = "5041534B000000000000000000000000"; //配对插座
    public static final String BLE_DEL_OUTLET = "47545041000000000000000000000000"; //删除插座
    public static final String BLE_CLEAN_OUTLET = "444C5041310E0000060199C300000000"; //清空所有已配对插座

    public static final String BLE_SET_SERIAL_OK = "53544F4B000000000000000000000000"; //设置锁号、密钥和流水号成功
    public static final String BLE_ADD_OUTLET_OK = "50414F4B0E0000060199C30000000000"; //配对插座成功
    public static final String BLE_CLEAN_OUTLET_OK = "444C4F4B000000000000000000000000"; //清空插座失败
    public static final String BLE_GET_OUTLET_NULL = "414E4552000000000000000000000000"; //没有已配对的插座

    /**
     * 汉优智能门锁开门
     *
     * @param request
     * @return
     */
    public static JSONObject setLockOpen(HttpServletRequest request) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String logtitle = "API-智能门锁-开门";
        String ajaxRequest = "";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            RequestUtil ru = new RequestUtil(request);
            ajaxRequest = AjaxXml.getParameterStr(request);
            int lock_id = ru.getInt("lock_id");
            int record_time = ru.getInt("record_time");
            backjson = setLockOpen(lock_id, record_time, base);
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest);
            backjson.put("type", false);
            backjson.put("errorCode", -99);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }

    /**
     * 汉优智能门锁开门
     *
     * @param lock_id
     * @param record_time
     * @param base
     * @return
     */
    public static JSONObject setLockOpen(int lock_id, int record_time, Base base) {
        JSONObject backjson = new JSONObject();
        String logtitle = "API-智能门锁-开门";
        try {
            String deveice_mac = "";
            String suohao = "";
            int liushuihao = 1;
            String miyao = "";
            String zhu_miyao = "";
            int miyao_update_time = 0;

            Doc lockDoc = base.executeQuery2Docs("select id,suohao,liushuihao,miyao,zhu_miyao,miyao_update_time,deveice_mac from hy_deveice where id=? and isdel=0 ", new Object[]{lock_id}, 1)[0];
            if (lockDoc != null && !lockDoc.isEmpty()) {
                suohao = lockDoc.get("suohao");
                liushuihao = lockDoc.getIn("liushuihao");
                miyao = lockDoc.get("miyao");
                zhu_miyao = lockDoc.get("zhu_miyao");
                miyao_update_time = lockDoc.getIn("miyao_update_time");
                deveice_mac = lockDoc.get("deveice_mac");
            }
//这边多接，门锁的协议
            String lianjie = "4E56454E" + AESutil.fanzhuantoByte(AESutil.toHex(AESutil.int2bytes((int) (System.currentTimeMillis() / 1000L)))) + "0000000000000000";
            String jiaoyan = AESutil.toHex(AESutil.jiaoyanyihuo(AESutil.toByte(lianjie)));
            String encryptingCode = "";
            try {
                encryptingCode = AESutil.encrypt_byte(AES_miyao, lianjie);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //发送指令
            //app.Send2(AESutil.toByte(encryptingCode + jiaoyan));
            String zhilin = CHexConver.byte2HexStr(AESutil.toByte(encryptingCode + jiaoyan));
            //String sport_type = URLEncoder.encode("步行", "utf-8");
            // int movementsteps=am_data+pm_data;
            System.out.println("开始下发连接指令=" + zhilin);
            String url = AppConf.getconf().get("tuisongurl") + "/lockstatus";
            String param = "?mac=" + deveice_mac + "&zhilin=" + zhilin;
            // String jsonObject = UtilHttpRequest.sendGet(url, param);
            String jsonObject = RunUrl.getHTMLStr(url + param, "utf-8");
            JSONObject jsonObject1 = JSONObject.fromObject(jsonObject);
            if (jsonObject1.getBoolean("type")) {
                String msg = jsonObject1.get("msg").toString();
                String decryptingCode = AESutil.decrypt_byte(AES_miyao, msg);
                System.out.println("指令发送成功");
                if (decryptingCode.substring(0, 4).equals("")) {
                    String kaimen = BLE_open;
                    String kaimen_jiaoyan = AESutil.toHex(AESutil.jiaoyanyihuo(AESutil.toByte(kaimen)));
                    String kaimen_encryptingCode = "";
                    try {
                        kaimen_encryptingCode = AESutil.encrypt_byte(AES_miyao, kaimen);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    //发送指令
                    //app.Send2(AESutil.toByte(encryptingCode + jiaoyan));
                    String kaimen_zhilin = CHexConver.byte2HexStr(AESutil.toByte(encryptingCode + jiaoyan));
                    //String sport_type = URLEncoder.encode("步行", "utf-8");
                    // int movementsteps=am_data+pm_data;
                    System.out.println("开始下发开门指令=" + kaimen_zhilin);
                    String kaimen_url = AppConf.getconf().get("tuisongurl") + "/lockstatus";
                    String kaimen_param = "?mac=" + deveice_mac + "&zhilin=" + zhilin;
                    String kaimen_jsonObject = RunUrl.getHTMLStr(kaimen_url + kaimen_param, "utf-8");
                    JSONObject kaimen_jsonObject1 = JSONObject.fromObject(kaimen_jsonObject);
                    if (jsonObject1.getBoolean("type")) {
                        String kaimen_msg = kaimen_jsonObject1.get("msg").toString();
                        String kaimen_decryptingCode = AESutil.decrypt_byte(AES_miyao, kaimen_msg);
                        if (kaimen_decryptingCode.substring(0, 4).equals("")) {
                            backjson.put("type", true);
                            backjson.put("msg", "获取成功");
                            backjson.put("errorCode", 0);
                            return backjson;
                        }
                    }
                }
            } else {
                System.out.println("指令发送失败，" + jsonObject1);
            }


            backjson.put("type", true);
            backjson.put("msg", "获取成功");
            backjson.put("errorCode", 0);
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle);
            backjson.put("type", false);
            backjson.put("errorCode", -99);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {

        }
    }


    public static JSONObject setLockOpen(String mac, int lock_id, int record_time, Base base) {
        JSONObject backjson = new JSONObject();
        String logtitle = "API-智能门锁-开门";
        try {
            String deveice_mac = mac.toLowerCase();
            String suohao = "";
            int liushuihao = 1;
            String miyao = "";
            String zhu_miyao = "";
            int miyao_update_time = 0;

            /*Doc lockDoc = base.executeQuery2Docs("select id,suohao,liushuihao,miyao,zhu_miyao,miyao_update_time,deveice_mac from hy_deveice where id=? and isdel=0 ", new Object[]{lock_id}, 1)[0];
            if (lockDoc != null && !lockDoc.isEmpty()) {
                suohao = lockDoc.get("suohao");
                liushuihao = lockDoc.getIn("liushuihao");
                miyao = lockDoc.get("miyao");
                zhu_miyao = lockDoc.get("zhu_miyao");
                miyao_update_time = lockDoc.getIn("miyao_update_time");
                deveice_mac = lockDoc.get("deveice_mac");
            }*/
//这边多接，门锁的协议
            String lianjie = "4E56454E" + AESutil.fanzhuantoByte(AESutil.toHex(AESutil.int2bytes((int) (System.currentTimeMillis() / 1000L)))) + "0000000000000000";

//lianjie="4E56454EC048ED540000000000000000";
            System.out.println("lianjie:" + lianjie);
            String jiaoyan = AESutil.toHex(AESutil.jiaoyanyihuo(AESutil.toByte(lianjie)));
            System.out.println("jiaoyan:" + jiaoyan);
            String encryptingCode = "";
            try {
                encryptingCode = AESutil.encrypt_byte(AES_miyao, lianjie);
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println("encryptingCode:" + encryptingCode);
            //发送指令
            //app.Send2(AESutil.toByte(encryptingCode + jiaoyan));
            String zhilin = CHexConver.byte2HexStr(AESutil.toByte(encryptingCode + jiaoyan)).replace(" ", "");
            //System.out.println("开始下发连接指令1="+zhilin);
            LogUtility.log("连接指令：zhilin=" + zhilin);
            zhilin = "4E0A03A81541C9AF2CB1B2C0988CD39B22";
            //String sport_type = URLEncoder.encode("步行", "utf-8");
            // int movementsteps=am_data+pm_data;
            //deveice_mac = "20C38F8B0ACC".toLowerCase();
            //zhilin="544312014E0A03A81541C9AF2CB1B2C0988CD39B22";
            System.out.println("开始下发连接指令=" + zhilin);
            String url = AppConf.getconf().get("tuisongurl") + "/lockstatus";
            String param = "?mac=" + deveice_mac + "&zhilin=54431201" + zhilin;
            // String jsonObject = UtilHttpRequest.sendGet(url, param);
            LogUtility.log("url=" + url + param);
            String jsonObject = RunUrl.getHTMLStr(url + param, "GBK");
            LogUtility.log("jsonObject===" + jsonObject);

            if (!jsonObject.equals("")) {
                JSONObject jsonObject1 = JSONObject.fromObject(jsonObject);
                System.out.println("jsonObject1=" + jsonObject1);
                if (jsonObject1.getBoolean("type")) {
                    String msg = jsonObject1.get("msg").toString();
                    msg = msg.substring(2, msg.length() - 2);
                    System.out.println("sub_msg:" + msg);
                    String decryptingCode = AESutil.decrypt_byte(AES_miyao, msg);
                    System.out.println("decryptingCode=" + decryptingCode);
                    System.out.println("指令发送成功");
                    if (decryptingCode.substring(0, 8).toUpperCase().equals("434E4F4B")) {
                        String kaimen = BLE_open;
                        String aes_suijimiyao = decryptingCode.substring(8, 16) + "000000000000000000000000";
                        System.out.println("随机数=" + aes_suijimiyao);
                        //aes_suijimiyao = "3CD954FC"+ "000000000000000000000000";
                        //kaimen = decryptingCode.substring(8, 16) + "000000000000000000000000";
                        //System.out.println("kaime:" + kaimen);
                        String kaimen_jiaoyan = AESutil.toHex(AESutil.jiaoyanyihuo(AESutil.toByte(kaimen)));
                        String kaimen_encryptingCode = "";
                        try {
                            kaimen_encryptingCode = AESutil.encrypt_byte(BLE_miyao, kaimen);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        System.out.println("随机数加密开门指令=" + kaimen_encryptingCode);
                        //发送指令
                        //app.Send2(AESutil.toByte(encryptingCode + jiaoyan));
                        String kaimen_zhilin = CHexConver.byte2HexStr(AESutil.toByte(kaimen_encryptingCode + kaimen_jiaoyan)).replace(" ", "");
                        LogUtility.log("开门指令：kaimen_zhilin=" + kaimen_zhilin);

                        //System.out.println("开始下发开门指令1=" + kaimen_zhilin);
                        kaimen_zhilin = "0940A4901054496375784DF1DB1C7ED914";
                        //String sport_type = URLEncoder.encode("步行", "utf-8");
                        // int movementsteps=am_data+pm_data;
                        System.out.println("开始下发开门指令=" + kaimen_zhilin);
                        String kaimen_url = AppConf.getconf().get("tuisongurl") + "/lockstatus";
                        String kaimen_param = "?mac=" + deveice_mac + "&zhilin=54431201" + kaimen_zhilin;
                        String kaimen_jsonObject = RunUrl.getHTMLStr(kaimen_url + kaimen_param, "GBK");
                        System.out.println("kaimen_jsonObject:" + kaimen_jsonObject);
                        LogUtility.log("kaimen_url=" + kaimen_url + kaimen_param);

                        JSONObject kaimen_jsonObject1 = JSONObject.fromObject(kaimen_jsonObject);
                        System.out.println("kaimen_jsonObject1:" + kaimen_jsonObject1);
                        if (jsonObject1.getBoolean("type")) {
                            String kaimen_msg = kaimen_jsonObject1.get("msg").toString();
                            //String kaimen_decryptingCode = AESutil.decrypt_byte(AES_miyao, kaimen_msg);
                            if (kaimen_msg.substring(0, 4).equals("")) {
                                backjson.put("type", true);
                                backjson.put("msg", "获取成功1");
                                backjson.put("errorCode", 0);
                                return backjson;
                            }
                        }
                    }
                } else {
                    System.out.println("指令发送失败，" + jsonObject1);
                    backjson = jsonObject1;
                    return backjson;
                }
            } else {
                backjson.put("type", false);
                backjson.put("msg", "开启失败");
                backjson.put("errorCode", -1);
                return backjson;
            }
            backjson.put("type", true);
            backjson.put("msg", "开启取成功");
            backjson.put("errorCode", 0);
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle);
            backjson.put("type", false);
            backjson.put("errorCode", -99);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {

        }
    }

    /**
     * 获取开门历史
     *
     * @param request
     * @return
     */

    public static JSONObject getLockOpenHistroy(HttpServletRequest request) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String logtitle = "API-智能门锁-开门记录";
        String ajaxRequest = "";
        try {

            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            RequestUtil ru = new RequestUtil(request);
            ajaxRequest = AjaxXml.getParameterStr(request);
            int lock_id = ru.getInt("lock_id");
            int record_time = ru.getInt("record_time");
            backjson = getLockOpenHistroy(lock_id, record_time, base);
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest);
            backjson.put("type", false);
            backjson.put("errorCode", -99);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }

    /**
     * 获取开门历史
     *
     * @param lock_id
     * @param record_time
     * @param base
     * @return
     */
    public static JSONObject getLockOpenHistroy(int lock_id, int record_time, Base base) {
        JSONObject backjson = new JSONObject();
        String logtitle = "API-智能门锁-开门记录";
        try {
            String deveice_mac = "";
            String suohao = "";
            int liushuihao = 1;
            String miyao = "";
            String zhu_miyao = "";
            int miyao_update_time = 0;

            Doc lockDoc = base.executeQuery2Docs("select id,suohao,liushuihao,miyao,zhu_miyao,miyao_update_time,deveice_mac from hy_deveice where id=? and isdel=0 ", new Object[]{lock_id}, 1)[0];
            if (lockDoc != null && !lockDoc.isEmpty()) {
                suohao = lockDoc.get("suohao");
                liushuihao = lockDoc.getIn("liushuihao");
                miyao = lockDoc.get("miyao");
                zhu_miyao = lockDoc.get("zhu_miyao");
                miyao_update_time = lockDoc.getIn("miyao_update_time");
                deveice_mac = lockDoc.get("deveice_mac");
            }
//这边多接，门锁的协议
            String lianjie = "4E56454E" + AESutil.fanzhuantoByte(AESutil.toHex(AESutil.int2bytes((int) (System.currentTimeMillis() / 1000L)))) + "0000000000000000";
            String jiaoyan = AESutil.toHex(AESutil.jiaoyanyihuo(AESutil.toByte(lianjie)));
            String encryptingCode = "";
            try {
                encryptingCode = AESutil.encrypt_byte(AES_miyao, lianjie);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //发送指令
            //app.Send2(AESutil.toByte(encryptingCode + jiaoyan));
            String zhilin = CHexConver.byte2HexStr(AESutil.toByte(encryptingCode + jiaoyan));
            //String sport_type = URLEncoder.encode("步行", "utf-8");
            // int movementsteps=am_data+pm_data;
            System.out.println("开始下发连接指令=" + zhilin);
            String url = AppConf.getconf().get("tuisongurl") + "/lockstatus";
            String param = "?mac=" + deveice_mac + "&zhilin=" + zhilin;
            // String jsonObject = UtilHttpRequest.sendGet(url, param);
            String jsonObject = RunUrl.getHTMLStr(url + param, "utf-8");
            JSONObject jsonObject1 = JSONObject.fromObject(jsonObject);
            if (jsonObject1.getBoolean("type")) {
                String msg = jsonObject1.get("msg").toString();
                String decryptingCode = AESutil.decrypt_byte(AES_miyao, msg);
                System.out.println("指令发送成功");
                if (decryptingCode.substring(0, 4).equals("")) {
                    String kaimen = BLE_log;
                    String kaimen_jiaoyan = AESutil.toHex(AESutil.jiaoyanyihuo(AESutil.toByte(kaimen)));
                    String kaimen_encryptingCode = "";
                    try {
                        kaimen_encryptingCode = AESutil.encrypt_byte(AES_miyao, kaimen);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    //发送指令
                    //app.Send2(AESutil.toByte(encryptingCode + jiaoyan));
                    String kaimen_zhilin = CHexConver.byte2HexStr(AESutil.toByte(encryptingCode + jiaoyan));
                    //String sport_type = URLEncoder.encode("步行", "utf-8");
                    // int movementsteps=am_data+pm_data;
                    System.out.println("开始下发获取门锁日志指令=" + kaimen_zhilin);
                    String kaimen_url = AppConf.getconf().get("tuisongurl") + "/lockstatus";
                    String kaimen_param = "?mac=" + deveice_mac + "&zhilin=" + zhilin;
                    String kaimen_jsonObject = RunUrl.getHTMLStr(kaimen_url + kaimen_param, "utf-8");
                    JSONObject kaimen_jsonObject1 = JSONObject.fromObject(kaimen_jsonObject);
                    if (jsonObject1.getBoolean("type")) {
                        String kaimen_msg = kaimen_jsonObject1.get("msg").toString();
                        String kaimen_decryptingCode = AESutil.decrypt_byte(AES_miyao, kaimen_msg);
                        if (kaimen_decryptingCode.substring(0, 4).equals("")) {
                            backjson.put("type", true);
                            backjson.put("msg", "获取成功");
                            backjson.put("errorCode", 0);
                            return backjson;
                        }
                    }
                }
            } else {
                System.out.println("指令发送失败，" + jsonObject1);
            }


            backjson.put("type", true);
            backjson.put("msg", "获取成功");
            backjson.put("errorCode", 0);
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle);
            backjson.put("type", false);
            backjson.put("errorCode", -99);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {

        }
    }

    /**
     * 远程断电
     *
     * @param request
     * @return
     */
    public static JSONObject setLockDuandian(HttpServletRequest request) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String logtitle = "API-智能门锁-开门记录";
        String ajaxRequest = "";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            RequestUtil ru = new RequestUtil(request);
            ajaxRequest = AjaxXml.getParameterStr(request);
            int lock_id = ru.getInt("lock_id");
            int record_time = ru.getInt("record_time");
            backjson = setLockDuandian(lock_id, record_time, base);
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest);
            backjson.put("type", false);
            backjson.put("errorCode", -99);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }

    public static JSONObject setLockDuandian(int lock_id, int record_time, Base base) {
        JSONObject backjson = new JSONObject();
        String logtitle = "API-智能门锁-远程断电";
        try {
            String deveice_mac = "";
            String suohao = "";
            int liushuihao = 1;
            String miyao = "";
            String zhu_miyao = "";
            int miyao_update_time = 0;

            Doc lockDoc = base.executeQuery2Docs("select id,suohao,liushuihao,miyao,zhu_miyao,miyao_update_time,deveice_mac from hy_deveice where id=? and isdel=0 ", new Object[]{lock_id}, 1)[0];
            if (lockDoc != null && !lockDoc.isEmpty()) {
                suohao = lockDoc.get("suohao");
                liushuihao = lockDoc.getIn("liushuihao");
                miyao = lockDoc.get("miyao");
                zhu_miyao = lockDoc.get("zhu_miyao");
                miyao_update_time = lockDoc.getIn("miyao_update_time");
                deveice_mac = lockDoc.get("deveice_mac");
            }
//这边多接，门锁的协议
            String lianjie = "DD";
            String jiaoyan = AESutil.toHex(AESutil.jiaoyanyihuo(AESutil.toByte(lianjie)));
            String encryptingCode = "";
            try {
                encryptingCode = AESutil.encrypt_byte(AES_miyao, lianjie);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //发送指令
            //app.Send2(AESutil.toByte(encryptingCode + jiaoyan));
            String zhilin = CHexConver.byte2HexStr(AESutil.toByte(encryptingCode + jiaoyan));
            //String sport_type = URLEncoder.encode("步行", "utf-8");
            // int movementsteps=am_data+pm_data;
            System.out.println("开始下发断电指令=" + zhilin);
            String url = AppConf.getconf().get("tuisongurl") + "/lockstatus";
            String param = "?mac=" + deveice_mac + "&zhilin=" + zhilin;
            // String jsonObject = UtilHttpRequest.sendGet(url, param);
            String jsonObject = RunUrl.getHTMLStr(url + param, "utf-8");
            JSONObject jsonObject1 = JSONObject.fromObject(jsonObject);
            if (jsonObject1.getBoolean("type")) {
                String msg = jsonObject1.get("msg").toString();
                String decryptingCode = AESutil.decrypt_byte(AES_miyao, msg);
                System.out.println("指令发送成功");
                if (decryptingCode.substring(0, 4).equals("")) {

                }
            } else {
                System.out.println("指令发送失败，" + jsonObject1);
            }


            backjson.put("type", true);
            backjson.put("msg", "获取成功");
            backjson.put("errorCode", 0);
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle);
            backjson.put("type", false);
            backjson.put("errorCode", -99);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {

        }
    }

    /**
     * 获取智能门锁开门记录
     *
     * @param request
     * @return
     */
    public static JSONObject getLockOnlineList(HttpServletRequest request) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String logtitle = "API-智能门锁-开门记录";
        String ajaxRequest = "";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            RequestUtil ru = new RequestUtil(request);
            ajaxRequest = AjaxXml.getParameterStr(request);
            int lock_id = ru.getInt("lock_id");
            int record_time = ru.getInt("record_time");
            backjson = getLockOnlineList(record_time, base);
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest);
            backjson.put("type", false);
            backjson.put("errorCode", -99);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }

    /**
     * 获取智能门锁开门记录
     *
     * @param record_time
     * @param base
     * @return
     */
    public static JSONObject getLockOnlineList(int record_time, Base base) {
        JSONObject backjson = new JSONObject();
        String logtitle = "API-智能门锁-在线列表";
        try {

            System.out.println("开始查询列表");
            String url = AppConf.getconf().get("tuisongurl") + "/leds";
            String param = "?" + System.currentTimeMillis();
            // String jsonObject = UtilHttpRequest.sendGet(url, param);
            String jsonObject = RunUrl.getHTMLStr(url + param, "utf-8");
            JSONArray jsonObject1 = JSONArray.fromObject(jsonObject);
            backjson.put("type", true);
            backjson.put("msg", "获取成功");
            backjson.put("errorCode", 0);
            backjson.put("datajsonarray", jsonObject1);
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle);
            backjson.put("type", false);
            backjson.put("errorCode", -99);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {

        }
    }

    public static void main(String[] args) {
    }
}
