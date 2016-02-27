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
    public String Dellog(HttpServletRequest request, String username, int userid) {
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
            base.executeUpdate("update bs_sys_log set isdel=1 where id in (" + wenhao.toString() + ")", sqllist);
            WriteSysLog( AjaxXml.getParameterStr(request), "删除日志" + i + "条", username, userid, ru.getIps(), 0, base);
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
    public static void WriteSysLog(String content, String shuoming, String username, int userid, String addip, int log_type, Base base) throws Exception {
        content = URLDecoder.decode(content, "utf-8");
        long create_time = SetupUtil.getTimestamp("now");
        List list = new ArrayList();
        list.add(username);
        list.add(new Integer(userid));
        list.add(addip);
        list.add(content);
        list.add(shuoming);
        list.add(create_time);
        list.add(log_type);
        base.executeUpdate("insert into bs_sys_log (user_name,user_id,create_ip,log_remark,log_title,create_time,log_type) values (?,?,?,?,?,?,?)", list);
    }
}
