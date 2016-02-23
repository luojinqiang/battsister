package com.hanyou.util.sms;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.db.Base;

import java.util.ArrayList;
import java.util.List;

public class SDKClient {

    public static void smsAddDB(int userid, String device_id, String shoumobile, String verify, String smsData, String back, String sys_type, Base base) throws Exception {
        List list = new ArrayList();
        list.add(userid);
        list.add(device_id);
        list.add(AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS"));
        list.add(shoumobile);
        list.add(verify);
        list.add(smsData);
        list.add(AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS"));
        list.add(back);
        list.add(sys_type);
        base.executeUpdate("insert into hy_sms(uuid,device_id,sendtime,shoumobile,verify,smsData,createtime,fanhui,sys_type) values (?,?,?,?,?,?,?,?,?)", list);
    }

    public static void WritesmsLogDB(String sms, String chinaname, String mobile, String jieshouname, int waibao_id, String fanhui, String sys_type, Base base) throws Exception {
        String addtime = AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS");
        String logstarttime = addtime;
        List list = new ArrayList();
        list.add(sms);
        list.add(addtime);
        list.add(chinaname);
        list.add(new Integer(waibao_id));
        list.add(mobile);
        list.add(jieshouname);
        list.add(1);
        list.add(fanhui);
        list.add(sys_type);
        base.executeUpdate("insert into hy_xitong_sms (sms,addtime,chinaname,waibao_id,mobile,jieshouname,isok,fanhui,sys_type) values (?,?,?,?,?,?,?,?,?)", list);
    }
}
