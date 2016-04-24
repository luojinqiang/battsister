package com.battsister.admin.sys;

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
import com.baje.sz.util.KeyBean;
import com.baje.sz.util.RequestUtil;

public class Teacher {
    /**
     * 会员编辑增加
     * @param request
     * @param userid
     * @param username
     * @param gym_group_id
     * @param gym_id
     * @return
     */
    public JSONObject editTeacher(HttpServletRequest request, int userid, String username) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "API--教师账号--增加";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            String user_name=ru.getString("username");
            String name=ru.getString("name");
            String account_status=ru.getString("account_status");
            int school_id=ru.getInt("school_id");
            int sex=ru.getInt("sex");
            String birth=ru.getString("birth");
            String email=ru.getString("email");
            String ips=ru.getString("ips");
            JSONArray ipArray=new JSONArray();
            if(ips!=null){
            	String ipss[]=ips.split(",");
            	if(ipss!=null){
            		for(int i=0;i<ipss.length;i++){
            			if(ipss[i]!=null&&!"".equals(ipss[i])){
            				ipArray.add(ipss[i]);
            			}
            		}
            	}
            }
            int birthTemp=0;
            if(birth!=null&&!"".equals(birth)){
            	birthTemp=AjaxXml.getTimestamp(birth+" 00:00:00");
            }
            if(user_name==null||"".equals(user_name)){
            	 backjson.put("type", false);
                 backjson.put("msg", "请输入教师登陆账号");
                 return backjson;
            }
            if(name==null||"".equals(name)){
           	 	backjson.put("type", false);
                backjson.put("msg", "请输入教师姓名");
                return backjson;
           }
            if(email!=null&&!"".equals(email)){
            	if(!AjaxXml.checkEmail(email)){
            		backjson.put("type", false);
                    backjson.put("msg", "邮箱地址格式不正确");
                    return backjson;
            	}
            }
            String headpic=ru.getString("headpic");
            String password=ru.getString("password");
            String password1=ru.getString("password1");
            if(id<=0){
            	if(password==null||"".equals(password)){
            		backjson.put("type", false);
                    backjson.put("msg", "请输入教师登陆密码");
                    return backjson;
            	}
            	if(!password.equals(password1)){
            		backjson.put("type", false);
                    backjson.put("msg", "两次输入密码不一致");
                    return backjson;
            	}
            }
            List valueList = new ArrayList();
            valueList.add(user_name);
            valueList.add(name);
            valueList.add(account_status);
            valueList.add(sex);
            valueList.add(birthTemp);
            valueList.add(headpic);
            valueList.add(email);
            valueList.add(school_id);
            valueList.add(ipArray.toString());
            String addString="";
            String insertString="";
            String insertSql="";
            if(password!=null&&!"".equals(password)){
            	if(!password.equals(password1)){
            		 backjson.put("type",false);
                     backjson.put("msg", "两次密码输入不一致");
                     return backjson;
            	}else{
            		addString=",password=? ";
            		insertString=",?";
            		insertSql=",password";
            		password= new KeyBean().getkeyBeanofStr(password).toLowerCase();
            		valueList.add(password);
            	}
            }
            if (id > 0) {
                logtitle = "API--教师账号--编辑";
                valueList.add(id);
                base.executeUpdate("update bs_teachers set username=?,name=?,account_status=?,sex=?,birth=?,headpic=?,email=?,school_id=?,ip_limit=? "+addString+" where id=? ", valueList);
            } else {
                valueList.add(AjaxXml.getTimestamp("now"));
                base.executeUpdate("insert into bs_teachers (username,name,account_status,sex,"
                        + " birth,headpic,email,school_id,ip_limit "+insertSql+",addtime) values(?,?,?,?,?,?,?,?,?"+insertString+",?)", valueList);
            }
            Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
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
    
    
    /**
     * 更改教师的课程权限
     * @param request
     * @param userid
     * @param username
     * @return
     */
    public JSONObject editBuyClass(HttpServletRequest request, int userid, String username){
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        JSONObject backjson = new JSONObject();
        String ajaxRequest = "";
        String logtitle = "API--教师账号--更改课程权限";
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            ajaxRequest = AjaxXml.getParameterStr(request);
            RequestUtil ru = new RequestUtil(request);
            int id = ru.getInt("id");
            Doc teacherDoc=base.executeQuery2Docs("select id,course_flag from bs_teachers where id=? and isdel=0", new Object[]{id},1)[0];
            if(teacherDoc==null||teacherDoc.isEmpty()){
            	 backjson.put("type", false);
                 backjson.put("msg", "教师账号不存在");
                 return backjson;
            }
            JSONArray old_chapterArray=new JSONArray();
            if(teacherDoc.get("course_flag")!=null&&!"".equals(teacherDoc.get("course_flag"))){
            	old_chapterArray=JSONArray.fromObject(teacherDoc.get("course_flag"));
            }
            String chapter_str=ru.getString("chapter_str");//课程权限
            JSONArray new_chapterArray=new JSONArray();
            if(chapter_str!=null&&!"".equals(chapter_str)){
            	String chapters[]=chapter_str.split(",");
            	if(chapters!=null){
            		for(String s:chapters){
            			if(s!=null&&!"".equals(s.trim())){
            				Doc chapterDoc=base.executeQuery2Docs("select id,course_id from bs_chapter where id=? and isdel=0 ",new Object[]{s},1)[0];
            				if(chapterDoc!=null){
            					boolean is_exist=false;
            					for(int i=0;i<new_chapterArray.size();i++){
            						if(new_chapterArray.getJSONObject(i).optInt("course_id")==chapterDoc.getIn("course_id")){
            							is_exist=true;
            							JSONArray chapter_array=new_chapterArray.getJSONObject(i).getJSONArray("chapters");
            							chapter_array=chapter_array==null?new JSONArray():chapter_array;
            							JSONObject json=new JSONObject();
            							json.put("chapter_id",chapterDoc.getIn("id"));
            							json.put("add_time",AjaxXml.getTimestamp("now"));
            							chapter_array.add(json);
            							new_chapterArray.getJSONObject(i).put("chapters", chapter_array);
            							break;
            						}
            					}
            					if(!is_exist){
            						JSONArray chapter_array=new JSONArray();
        							JSONObject json=new JSONObject();
        							json.put("chapter_id",chapterDoc.getIn("id"));
        							json.put("add_time",AjaxXml.getTimestamp("now"));
        							chapter_array.add(json);
        							JSONObject chapters_json=new JSONObject();
        							chapters_json.put("course_id", chapterDoc.getIn("course_id"));
        							chapters_json.put("chapters", chapter_array);
        							new_chapterArray.add(chapters_json);
            					}
            				}
            			}
            		}
            	}
            }
            //更新添加时间
            for(int i=0;i<new_chapterArray.size();i++){
            	JSONObject new_json=new_chapterArray.getJSONObject(i);
            	for(int j=0;j<old_chapterArray.size();j++){
            		JSONObject old_json=old_chapterArray.getJSONObject(j);
            		if(new_json.getInt("course_id")==old_json.getInt("course_id")){
            			JSONArray new_array=new_json.optJSONArray("chapters");
            			JSONArray old_array=old_json.optJSONArray("chapters");
            			for(int s=0;s<new_array.size();s++){
            				for(int n=0;n<old_array.size();n++){
            					if(new_array.optJSONObject(s).getInt("chapter_id")==old_array.optJSONObject(n).getInt("chapter_id")){
            						new_array.optJSONObject(s).put("add_time", old_array.optJSONObject(n).getInt("add_time"));
            					}
            				}
            			}
            		}
            	}
            	new_chapterArray.set(i, new_json);
            }
            base.executeUpdate("update bs_teachers set course_flag=? where id=? ",new Object[]{new_chapterArray.toString(),id});
            Logdb.WriteSysLog(ajaxRequest, logtitle, username, userid, ru.getIps(), 0, base);
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
