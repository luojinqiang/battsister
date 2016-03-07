package com.battsister.admin.sys;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import com.baje.sz.db.Base;
import com.battsister.util.SetupUtil;

/*
 * 后台日志
 */
public class Logdb {
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
