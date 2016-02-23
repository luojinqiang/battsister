package com.hanyou.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.baje.sz.util.RequestUtil;

/**
 * Created by haihui on 2015-11-27.
 */
public class FitnessBasicType {
    /**
     * 获取健身目标-JSONObject
     *
     * @param request
     * @return
     */
    public static JSONObject getFitnessTarget(HttpServletRequest request) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String logtitle = "API-获取健身目标";
        String ajaxRequest = "";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            RequestUtil ru = new RequestUtil(request);
            ajaxRequest = AjaxXml.getParameterStr(request);
            backjson.put("type", true);
            backjson.put("errorCode", 0);
            backjson.put("msg", "获取成功");
            backjson.put("jsonArray", getFitnessTarget(base));
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
     * 获取健身目标-jsonArray
     *
     * @param base
     * @return
     */
    public static JSONArray getFitnessTarget(Base base) {
        JSONArray jsonArray = new JSONArray();
        String logtitle = "API-获取健身目标";
        try {
            List list = base.executeQuery2List("SELECT id,type_name,create_time FROM hy_member_action_type where type=1 and isdel=0 ", new Object[]{});
            jsonArray = JSONArray.fromObject(list);
            return jsonArray;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e, logtitle);
            return jsonArray;
        } finally {

        }
    }

    /**
     * 获取课程分类-JSONArray
     *
     * @return
     */
    public static JSONArray getActionType() {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            return base.executeQuery2JSONArray("select id,type_name from hy_member_action_type where isdel=0 and type=0 ", new Object[]{});
        } catch (Exception e) {
            e.printStackTrace();
            return new JSONArray();
        } finally {
            dbc.closeConn();
        }
    }

    /**
     * 获取健身课程分类详情
     *
     * @param request
     * @return
     */
    public static JSONObject getActionTypeInfo(HttpServletRequest request) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson=new JSONObject();
        try {
            RequestUtil ru = new RequestUtil(request);
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            int action_type_id = ru.getInt("action_type_id");
            int coach_id=ru.getInt("userid");
            int get_type=ru.getInt("get_type");//0是获取系统和教练的动作，1是仅获取教练自定义动作
            Doc coachDoc=base.executeQuery2Docs("select id from hy_coach where id=? and isdel=0 ",new Object[]{coach_id},1)[0];
            if(coachDoc==null||coachDoc.isEmpty()){
            	 backjson.put("type", false);
                 backjson.put("msg", "教练不存在");
                 backjson.put("errorCode",12001);
                 return backjson;
            }
            String sql=get_type==0?" and (coach_id=0 or coach_id=? )":" and coach_id=? ";
            JSONArray action_array=new JSONArray();
            List<Doc> list=base.executeQuery2List("select id as 'action_id',title,unit_type,unit_name,is_hardware,default_value,coach_id,small_pic,video_path,little_url from hy_member_plan_action where isdel=0 and action_type=?  "+sql, new Object[]{action_type_id,coach_id});
            if(list!=null){
            	for(Doc doc:list){
            		JSONObject json=new JSONObject();
            		json.put("action_id",doc.getIn("action_id"));
            		json.put("title",doc.get("title"));
            		json.put("unit_type",doc.getIn("unit_type"));//默认计量值类型
            		json.put("default_value",doc.getIn("default_value"));//默认值
            		json.put("unit_name",doc.get("unit_name"));//计量单位
            		json.put("is_hardware",doc.getIn("is_hardware"));//是否支持智能设备
            		json.put("coach_id",doc.getIn("coach_id"));
            		json.put("small_pic",SetupUtil.getAllAddress(doc.get("small_pic")));
            		json.put("video_path",SetupUtil.getAllAddress(doc.get("video_path")));
            		json.put("little_url",SetupUtil.getAllAddress(doc.get("little_url")));
            		action_array.add(json);
            	}
            }
            backjson.put("type", true);
            backjson.put("msg", "获取成功");
            backjson.put("errorCode",0);
            backjson.put("action_array", action_array);
            return backjson;
        } catch (Exception e) {
            e.printStackTrace();
            LogUtility.log(e,"");
            backjson.put("type", false);
            backjson.put("msg", "系统错误");
            backjson.put("errorCode",10001);
            return backjson;
        } finally {
            dbc.closeConn();
        }
    }

    /**
     * 健身房硬件改装，根据质量和高度，计算出克服重力做的功（焦耳），转换成kcal
     * @param weight
     * @param height
     * @return
     */
    public static  float getKcal(float weight, float height){
        try {
            //weight 单位千克
            //height 单位米
            float j=Float.valueOf("4185.85");//1kcal=4185.85 焦耳
            float g=Float.valueOf("9.8");// 重力加速度
            float kcal=Float.valueOf(weight*g*height/j);
            return (float)(Math.round(kcal*1000))/1000;
        } catch (Exception e) {
            e.printStackTrace();
            return new Float(0.0);
        }
    }

    public static void main(String[] args) {
        System.out.println(getKcal(Float.valueOf("20.0"),Float.valueOf("1.0")));
    }
}
