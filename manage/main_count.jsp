<%@ page import="com.baje.sz.util.*" %>
<%@ page import="com.baje.sz.ajax.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ include file="ini_sys.jsp" %>
<%
    int gymGroupNum = 0;
    int gymGroupBydata = 0;
    int gymNum = 0;
    int gymBydata = 0;
    String wheres = " isdel=0 ";
    if (gym_group_id > 0) {
        wheres += " and gym_group_id=" + gym_group_id;
    }

/*if(gym_group_id>0 && gym_id>0){
	wheres+=" and gym_group_id="+gym_group_id+" and gym_id="+gym_id;
}*/
//用户统计信息
    int menNum = utildb.Get_count("id", "hy_member", " isdel=0", "mysqlss");
    if (gym_id == 0) {
        //健身房统计信息
        gymNum = utildb.Get_count("id", "hy_gym ", wheres, "mysqlss");
        gymBydata = utildb.Get_count("id", "hy_gym hy_gym ",
                wheres + "  and  DATE_FORMAT(FROM_UNIXTIME(create_time),'%Y-%m-%d')=DATE_FORMAT(CURDATE(),'%Y-%m-%d')", "mysqlss");
    }

//教练统计信息
    int coachNum = utildb.Get_count("id", "hy_coach", wheres, "mysqlss");
    int coachBydata = utildb.Get_count("id", "hy_coach",
            wheres + "  and  DATE_FORMAT(FROM_UNIXTIME(create_time),'%Y-%m-%d')=DATE_FORMAT(CURDATE(),'%Y-%m-%d')", "mysqlss");

%>