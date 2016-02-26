package com.hanyou.admin.sys;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;
import com.baje.sz.util.StringUtil;

public class UserMember {
    /**
     * 会员编辑增加
     * @param request
     * @param userid
     * @param username
     * @param gym_group_id
     * @param gym_id
     * @return
     */
    public JSONObject addOrEditmember(HttpServletRequest request, int userid, String username, int gym_group_id, int gym_id) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "会员-增加";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            String mem_name = ru.getString("mem_name", "");
            String mem_mobile = ru.getString("mem_mobile", "");
            int mem_sex = ru.getInt("mem_sex");
            String mem_email = ru.getString("mem_email", "");
            String mem_weixin = ru.getString("mem_weixin", "");
            int mem_birth = AjaxXml.getTimestamp(AjaxXml.Get_Date(ru.getString("mem_birth", ""), "YY04-MM-DD 00:00:00"));
            int men_shengao = ru.getInt("men_shengao");
            int men_tizhong = ru.getInt("men_tizhong");
            int provinceId = ru.getInt("provinceId");
            int cityId = ru.getInt("cityId");
            int areaId = ru.getInt("areaId");
            int men_bufu = ru.getInt("men_bufu");
            String mem_username = ru.getString("mem_username");
            String mem_headpic = ru.getString("mem_headpic");

            List valueList = new ArrayList();
            valueList.add(URLEncoder.encode(mem_name, "utf-8"));
            valueList.add(mem_mobile);
            valueList.add(mem_headpic);
            valueList.add(mem_email);
            valueList.add(mem_sex);
            valueList.add(mem_birth);
            valueList.add(men_shengao);
            valueList.add(men_tizhong);
            valueList.add(men_bufu);
            valueList.add(provinceId);
            valueList.add(cityId);
            valueList.add(areaId);
            if (id > 0) {
                logtitle = "会员-编辑";
                valueList.add(id);
                base.executeUpdate("update hy_member set mem_name=?,mem_mobile=?,mem_headpic=?,"
                        + "mem_email=?,mem_sex=?,mem_birth=?,men_shengao=?,men_tizhong=?,men_bufu=?,mem_province=?,mem_city=?,mem_area=? where id=?", valueList);
            } else {
                valueList.add(mem_username);
                valueList.add(AjaxXml.getTimestamp(AjaxXml.Get_Date("now", "YY04-MM-DD HH:MI:SS")));
                if (mem_username == null || "".equals(mem_username)) {
                    backjson.put("type", false);
                    backjson.put("msg", "请输入会员账号");
                    return backjson;
                }
                if (mem_name == null || "".equals(mem_name)) {
                    backjson.put("type", false);
                    backjson.put("msg", "请输入会员名称");
                    return backjson;
                }
                base.executeUpdate("insert into hy_member (mem_name,mem_mobile,mem_headpic,mem_email,"
                        + " mem_sex,mem_birth,men_shengao,men_tizhong,men_bufu,mem_province,mem_city,mem_area,mem_username,mem_addtime) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)", valueList);
            }
            Logdb.WriteSysLog(gym_group_id, gym_id, ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
            backjson.put("type", true);
            backjson.put("msg", "操作成功");
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle + "\r\n" + ajaxRequest);
            backjson.put("type", false);
            backjson.put("msg", "系统忙，请稍候再试");
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }
}
