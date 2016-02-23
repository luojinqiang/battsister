package com.hanyou.admin.sys;

import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.Selectic;
import com.baje.sz.util.StringUtil;
import com.hanyou.util.SetupUtil;

/*
 * 后台日志
 */
public class Logdb {
    /*
     * 删除日志
     */
    public String Dellog(HttpServletRequest request, String username, int userid, int gym_group_id, int gym_id) {
        Dbc dbc = DbcFactory.getRDbcInstance();
        Base base = new Base();
        RequestUtil ru = new RequestUtil(request);
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            String ids = ru.getString("ids");
            String[] idarr = StringUtil.strs2array(ids, ",");
            int i = 0;
            StringBuffer wenhao = new StringBuffer("");
            List sqllist = new ArrayList();

            for (i = 0; i < idarr.length; i++) {
                if (i == 0) {
                    wenhao.append("?");
                } else {
                    wenhao.append(",?");
                }
                sqllist.add(idarr[i]);
            }
            base.executeUpdate("update hy_sys_log set isdel=1 where id in (" + wenhao.toString() + ")", sqllist);
            WriteSysLog(gym_group_id, gym_id, AjaxXml.getParameterStr(request), "删除日志" + i + "条", username, userid, ru.getIps(), 0, base);
            base.commit();
            return "删除成功$$ok";
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            LogUtility.log(e, "删除日志出错");
            return "删除失败$$err";
        } finally {
            dbc.closeConn();
        }
    }

    /*
     * 写入日志
     */
    public static void WriteSysLog(int gym_group_id, int gym_id, String content, String shuoming, String username, int userid, String addip, int log_type, Base base) throws Exception {
        content = URLDecoder.decode(content, "utf-8");
        long create_time = SetupUtil.getTimestamp("now");
        List list = new ArrayList();
        list.add(new Integer(gym_group_id));
        list.add(new Integer(gym_id));
        list.add(username);
        list.add(new Integer(userid));
        list.add(addip);
        list.add(content);
        list.add(shuoming);
        list.add(create_time);
        list.add(log_type);
        base.executeUpdate("insert into hy_sys_log (gym_group_id,gym_id,user_name,user_id,create_ip,log_remark,log_title,create_time,log_type) values (?,?,?,?,?,?,?,?,?)", list);
    }

    /*
     * 将渠道管理日志导出为Excel表
     */
    public JSONObject export2xls(HttpServletRequest request, HttpServletResponse response, int userid, String username) {

        JSONObject backjson = new JSONObject();

		/*JFileChooser chooser = new JFileChooser();
		chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		int returnVal = chooser.showOpenDialog(chooser);
		if (chooser.getSelectedFile()==null) {
			backjson.put("type", false);
			backjson.put("msg", "请选择保存路径");
			return backjson;
		}
		String filePath = "";
		if (returnVal==JFileChooser.APPROVE_OPTION) {
			filePath = chooser.getSelectedFile().getPath();
		}*/

        String[] title = {"用户ID", "用户名", "说明", "时间", "登陆IP", "平台类型", "平台版本"};
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        String ajaxRequest = "";
        String logtitle = "系统日志导出为Excel表";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc, false);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int log_type = 1;
            String shuoming = ru.getString("shuoming");
            String mobile_version = ru.getString("mobile_version");
            String mobile_market = ru.getString("mobile_market");
            String get_user_name = ru.getString("get_user_name");
            String start_time = ru.getString("start_time");
            String end_time = ru.getString("end_time");
            int user_distinct = ru.getInt("user_distinct");
            String wheres = " isdel=0 and log_type=?";
            List sqllist = new ArrayList();
            sqllist.add(log_type);
            if (!shuoming.equals("")) {
                wheres = wheres + " and shuoming like ?";
                sqllist.add("%" + shuoming + "%");
            }
            if (!mobile_market.equals("")) {
                wheres = wheres + " and beizhu like ?";
                sqllist.add(mobile_market + "---%");
            }
            if (!mobile_version.equals("")) {
                wheres = wheres + " and beizhu like ?";
                sqllist.add("%---" + mobile_version);
            }
            if (!get_user_name.equals("")) {
                wheres = wheres + " and user_name like ?";
                sqllist.add("%" + get_user_name + "%");
            }
            if (!start_time.equals("")) {
                wheres = wheres + " and DATEDIFF(addtime,?)>=0";
                sqllist.add(start_time);
            }
            if (!end_time.equals("")) {
                wheres = wheres + " and DATEDIFF(addtime,?)<=0";
                sqllist.add(end_time);
            }
            if (user_distinct == 1) {
                wheres = wheres
                        + " and id in ( select max(id) from hy_sys_log group by user_id )";
            }
            int pn = 20;
            String table = "hy_sys_log";
            String file = "user_id,user_name,shuoming,addtime,addip,beizhu";
            String order = " order by id desc";
            String idd = "id";
            String beizhu = "";
            Selectic utildb = new Selectic();
            int counts = utildb.Get_count(idd, table, wheres, "", sqllist);
            List list = utildb.Get_mssqlList(1, counts, counts, table, wheres, file, order, idd, "", sqllist);
            if (list != null && list.size() > 0) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                String dateStr = sdf.format(new Date());
                String xlsFilename = "渠道日志" + dateStr;
//				OutputStream os = new FileOutputStream(new File(filePath, dateStr + ".xls"));
                OutputStream os = response.getOutputStream();
                response.reset();// 清空输出流
                response.setHeader("Content-disposition", "attachment; filename=" + new String(xlsFilename.getBytes("gbk"), "ISO-8859-1") + ".xls");// 设定输出文件头
                response.setContentType("application/x-msdownload");// 定义输出类型

                WritableWorkbook wwb = Workbook.createWorkbook(os);
                WritableSheet sheet = wwb.createSheet("渠道日志", 0);
                WritableFont wf = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);
                WritableCellFormat wct = new WritableCellFormat(wf);
                wct.setAlignment(Alignment.CENTRE);
                for (int i = 0; i < title.length; i++) {
                    Label label = new Label(i, 0, title[i], wct);
                    sheet.addCell(label);
                }
                WritableCellFormat wc = new WritableCellFormat();
                wc.setAlignment(Alignment.CENTRE);
                Iterator its = list.listIterator();
                for (int i = 1; its.hasNext(); i++) {
                    Doc doc = (Doc) its.next();
                    String user_id = doc.get("user_id");
                    String user_name = doc.get("user_name");
                    String shuo_ming = doc.get("shuoming");
                    String addtime = doc.get("addtime");
                    String addip = doc.get("addip");
                    String bei_zhu = doc.get("beizhu");
                    if (bei_zhu.length() > 50) {
                        bei_zhu = bei_zhu.substring(0, 50);
                    }
                    String mobilemarket = "";
                    String mobileversion = "";
                    String[] beizhus = bei_zhu.split("---");
                    if (beizhus.length == 2) {
                        mobilemarket = beizhus[0];
                        mobileversion = beizhus[1];
                    }

                    Label user_idL = new Label(0, i, user_id, wc);
                    Label user_nameL = new Label(1, i, user_name, wc);
                    Label shuomingL = new Label(2, i, shuo_ming, wc);
                    Label addtimeL = new Label(3, i, addtime, wc);
                    Label addipL = new Label(4, i, addip, wc);
                    Label mobile_marketL = new Label(5, i, mobilemarket, wc);
                    Label mobile_versionL = new Label(6, i, mobileversion, wc);

                    sheet.addCell(user_idL);
                    sheet.addCell(user_nameL);
                    sheet.addCell(shuomingL);
                    sheet.addCell(addtimeL);
                    sheet.addCell(addipL);
                    sheet.addCell(mobile_marketL);
                    sheet.addCell(mobile_versionL);
                }
                wwb.write();
                wwb.close();
                os.close();
            } else {
                backjson.put("type", false);
                backjson.put("msg", "没有日志可以导出");
                return backjson;
            }
            //Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid,ru.getIps(), base);
            base.commit();
            backjson.put("type", true);
            backjson.put("msg", "导出成功");
            return backjson;
        } catch (Exception e) {
            base.rollback();
            e.printStackTrace();
            if (e instanceof FileNotFoundException) {
                backjson.put("type", false);
                backjson.put("msg", "路径不存在，请重新选择");
                return backjson;
            }
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }
}
