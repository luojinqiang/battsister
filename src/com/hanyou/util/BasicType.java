package com.hanyou.util;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.db.Base;
import com.baje.sz.db.Dbc;
import com.baje.sz.db.DbcFactory;
import com.baje.sz.util.Doc;
import com.qiniu.storage.UploadManager;

/**
 * 系统数据字典类
 *
 * @author xhq-pc
 */
public class BasicType {

    /**
     * 管理员说的状态
     * hy_sys_user表的is_lock字段
     *
     * @param i
     * @return
     */
    public final static int deviceType = 5;
    private final static int deviceDataType = 3;
    private final static int getGymCartType = 5;
    private final static int getServiceShopType = 5;
    private static UploadManager uploadManage=null;//七牛上传文件的主要对象，一般在一个应用中只需要一个
    public synchronized static UploadManager getUploadManage() {//获取七牛上传文件的对象
    	if(uploadManage==null){
    		uploadManage=new UploadManager();
    	}
		return uploadManage;
	}
    public final static String myspace_url="http://7xouve.com1.z0.glb.clouddn.com/";//七牛myspace空间的域名，暂时只有后台在用
    public final static String space_name="myspace";//空间名
    public final static String pipeline_name="mps";//数据处理的专用队列名
    public static int getDevicedatatype() {
        return deviceDataType;
    }

    public static int getDevicetype() {
        return deviceType;
    }

    public static int getGymCartType() {
        return getGymCartType;
    }

    public static int getServiceShopType() {
        return getServiceShopType;
    }

    public static String getSysUserLock(int i) {
        if (i == 1) {
            return "锁定";
        } else if (i == 0) {
            return "正常";
        } else {
            return "";
        }
    }

    /**
     * 日志类型
     * hy_sys_log表的log_type
     *
     * @param i
     * @return
     */
    public static String getSysLogType(int i) {
        if (i == 0) {
            return "管理后台日志";
        } else {
            return "";
        }
    }

    /**
     * 系统关键字类型
     *
     * @param i
     * @return
     */
    public static String getKeywordType(int i) {
        if (i == 0) {
            return "不能出现";
        } else if (i == 1) {
            return "替换字符";
        } else {
            return "";
        }
    }

    /**
     * 支付类型
     *
     * @param payMode
     * @return
     */
    public static String getPayMode(int payMode) {
        if (payMode == 1) {
            return "支付宝";
        } else if (payMode == 2) {
            return "微信支付";
        } else {
            return "未支付";
        }
    }

    /**
     * 获取商品类型
     *
     * @param shopType
     * @return
     */
    public static String getShopType(int shopType) {
        String typeName = null;
        switch (shopType) {
            case 1:
                typeName = "年卡";
                break;
            case 2:
                typeName = "月卡";
                break;
            case 3:
                typeName = "次卡";
                break;
        /*case 4:
			typeName="面对面教练年卡";
			break;
		case 5:
			typeName="面对面教练月卡";
			break;
		case 6:
			typeName="面对面教练次卡";
			break;
		case 7:
			typeName="视频教练卡";
			break;*/
            default:
                typeName = "";
                break;
        }
        return typeName;
    }

    /**
     * 获取教练等级
     *
     * @param grade
     * @return
     */
    public static String getCoach_grade(int grade) {
        if (grade == 1) {
            return "普通";
        } else if (grade == 2) {
            return "高级";
        } else if (grade == 3) {
            return "专业";
        } else {
            return "";
        }
    }

    /**
     * 获取教练等级列表
     *
     * @return
     */
    public static List getCoach_GradeList() {
        List valueList = new ArrayList();
        for (int i = 1; i <= 3; i++) {
            valueList.add(getCoach_grade(i));
        }
        return valueList;
    }

    /**
     * 获取渠道名称
     *
     * @param
     * @return
     */
    public static String getQudao(int qudao) {
        if (qudao == 1001) {
            return "汉优渠道";
        } else if (qudao == 1002) {
            return "小辣椒渠道";
        } else if (qudao == 1003) {
            return "动吖渠道";
        } else {
            return "";
        }
    }

    /**
     * 获取渠道列表
     *
     * @return
     */
    public static List getQudaoList() {
        List valueList = new ArrayList();
        for (int i = 1001; i <= 1003; i++) {
            valueList.add(getQudao(i));
        }
        return valueList;
    }

    /**
     * 获得设备的数据上传类型
     *
     * @param type
     * @return
     */
    public static String getDateType(int type) {
        if (type == 1) {
            return "蓝牙";
        } else if (type == 2) {
            return "GPRS";
        } else if (type == 3) {
            return "WIFI";
        } else {
            return "";
        }
    }

    /**
     * 获取设备类型
     *
     * @param typeFlag
     * @return
     */
    public static String getDeviceType(int typeFlag) {
        if (typeFlag == 1) {
            return "门锁";
        } else if (typeFlag == 2) {
            return "监控";
        } else if (typeFlag == 3) {
            return "跑步机";
        } else if (typeFlag == 4) {
            return "电单车";
        } else if (typeFlag == 5) {
            return "体质秤";
        } else {
            return "";
        }
    }

    /**
     * 获取会员卡类型
     *
     * @param typeFlag
     * @return
     */
    public static String getGymCartType(int cart_type) {
        if (cart_type == 1) {
            return "会员卡";
        } else if (cart_type == 2) {
            return "健身季度卡";
        } else if (cart_type == 3) {
            return "VIP会员卡";
        } else if (cart_type == 4) {
            return "智能VIP会员卡";
        } else if (cart_type == 5) {
            return "超级VIP会员卡";
        } else if (cart_type == 0) {
            return "非会员";
        } else {
            return "";
        }
    }

    /**
     * 获取健身房消费类型
     *
     * @param typeFlag
     * @return
     */
    public static String getServiceShopType(int shop_type) {
        if (shop_type == 1) {
            return "私教";
        } else if (shop_type == 2) {
            return "团队私教";
        } else if (shop_type == 3) {
            return "次卡";
        } else if (shop_type == 4) {
            return "体测";
        } else if (shop_type == 5) {
            return "网络私教";
        } else {
            return "";
        }
    }

    /**
     * 获取会员卡价格类型
     *
     * @param typeFlag
     * @return
     */
    public static String getServiceCartType(int card_type) {
        if (card_type == 0) {
            return "非会员价格";
        } else if (card_type == 1) {
            return "会员卡";
        } else if (card_type == 2) {
            return "健身季度卡";
        } else if (card_type == 3) {
            return "VIP会员卡";
        } else if (card_type == 4) {
            return "智能VIP会员卡";
        } else if (card_type == 5) {
            return "超级VIP会员卡";
        } else {
            return "";
        }
    }

    /**
     * 获取用户余额流向会员卡类型
     *
     * @param typeFlag
     * @return
     */
    public static String getMemUserCard(int mem_user_card) {
        if (mem_user_card == 0) {
            return "非会员";
        } else if (mem_user_card == 1) {
            return "会员卡";
        } else if (mem_user_card == 2) {
            return "健身季度卡";
        } else if (mem_user_card == 3) {
            return "VIP会员卡";
        } else if (mem_user_card == 4) {
            return "智能VIP会员卡";
        } else if (mem_user_card == 5) {
            return "超级VIP会员卡";
        } else {
            return "";
        }
    }

    /**
     * 获取用户余额流向的类型
     *
     * @param typeFlag
     * @return
     */
    public static String getOverageShopType(int overage_shop_type) {
        if (overage_shop_type == 0) {
            return "购买消费商品";
        } else if (overage_shop_type == 1) {
            return "购买私教";
        } else if (overage_shop_type == 2) {
            return "购买团队私教";
        } else if (overage_shop_type == 3) {
            return "购买次卡";
        } else if (overage_shop_type == 4) {
            return "购买体测";
        } else if (overage_shop_type == 5) {
            return "购买网络计划";
        } else if (overage_shop_type == 6) {
            return "充值";
        } else if (overage_shop_type == 7) {
            return "取消预约返回";
        } else {
            return "";
        }
    }

    /**
     * 获取健身房用户预约类型
     *
     * @param typeFlag
     * @return
     */
    public static String getGymMemberBook(int book_type) {
        if (book_type == 1) {
            return "私教";
        } else if (book_type == 2) {
            return "团队私教";
        } else if (book_type == 3) {
            return "健身房";
        } else if (book_type == 4) {
            return "体测";
        } else if (book_type == 5) {
            return "网路私教";
        } else {
            return "";
        }
    }

    /**
     * 获取订单支付类型
     *
     * @param typeFlag
     * @return
     */
    public static String getPayModeType(int pay_mode) {
        if (pay_mode == 1) {
            return "支付宝";
        } else if (pay_mode == 2) {
            return "微信支付";
        } else if (pay_mode == 3) {
            return "余额支付";
        } else if (pay_mode == 4) {
            return "店面现金支付";
        } else {
            return "";
        }
    }

    /**
     * 获取订单详细类型
     *
     * @param typeFlag
     * @return
     */
    public static String getOrderShopType(int order_shop_type) {
        if (order_shop_type == 0) {
            return "购买消费商品";
        } else if (order_shop_type == 1) {
            return "购买私教";
        } else if (order_shop_type == 2) {
            return "购买团队私教";
        } else if (order_shop_type == 3) {
            return "购买次卡";
        } else if (order_shop_type == 4) {
            return "购买体测";
        } else if (order_shop_type == 5) {
            return "充值";
        } else {
            return "";
        }
    }

    /**
     * 获得设备的种类
     *
     * @return
     */
    public static String getDeviceClass(int classType) {
        if (classType == 1) {
            return "身份识别类";
        } else if (classType == 2) {
            return "智能体侧类";
        } else if (classType == 3) {
            return "热量消耗类";
        } else {
            return "";
        }
    }

    /**
     * 获取健身房营业时间的代号
     *
     * @param time
     * @return
     */
    public static int getTimeFlag(String time) {
        if (time.equals("6:00")) {
            return 1;
        } else if (time.equals("6:30")) {
            return 2;
        } else if (time.equals("7:00")) {
            return 3;
        } else if (time.equals("7:30")) {
            return 4;
        } else if (time.equals("8:00")) {
            return 5;
        } else if (time.equals("8:30")) {
            return 6;
        } else if (time.equals("9:00")) {
            return 7;
        } else if (time.equals("9:30")) {
            return 8;
        } else if (time.equals("10:00")) {
            return 9;
        } else if (time.equals("10:30")) {
            return 10;
        } else if (time.equals("11:00")) {
            return 11;
        } else if (time.equals("11:30")) {
            return 12;
        } else if (time.equals("12:00")) {
            return 13;
        } else if (time.equals("12:30")) {
            return 14;
        } else if (time.equals("13:00")) {
            return 15;
        } else if (time.equals("13:30")) {
            return 16;
        } else if (time.equals("14:00")) {
            return 17;
        } else if (time.equals("14:30")) {
            return 18;
        } else if (time.equals("15:00")) {
            return 19;
        } else if (time.equals("15:30")) {
            return 20;
        } else if (time.equals("16:00")) {
            return 21;
        } else if (time.equals("16:30")) {
            return 22;
        } else if (time.equals("17:00")) {
            return 23;
        } else if (time.equals("17:30")) {
            return 24;
        } else if (time.equals("18:00")) {
            return 25;
        } else if (time.equals("18:30")) {
            return 26;
        } else if (time.equals("19:00")) {
            return 27;
        } else if (time.equals("19:30")) {
            return 28;
        } else if (time.equals("20:00")) {
            return 29;
        } else if (time.equals("20:30")) {
            return 30;
        } else if (time.equals("21:00")) {
            return 31;
        } else if (time.equals("21:30")) {
            return 32;
        } else if (time.equals("22:00")) {
            return 33;
        } else if (time.equals("22:30")) {
            return 34;
        } else if (time.equals("23:00")) {
            return 35;
        } else if (time.equals("23:30")) {
            return 36;
        }
        return 0;
    }

    /**
     * 列出教练排班的时间
     *
     * @param flag int
     * @return String
     */
    public static String getCoachBookTime(int flag) {
        if (flag >= 10) {
            return flag + ":00";
        } else {
            return "0" + flag + ":00";
        }
    }
/**
 * 通过代号获取健身房营业时间
 * @param flag
 * @return
 *//*
	public String getGymTime(int flag){
		String time="";
		switch (flag) {
		case 1:
			time="6:00";
			break;

		default:
			break;
		}
		return time;
	}*/

    /**
     * 把连锁封装好方便JSP.页面调用，可以直接调用这个方法
     * gymGroupId是页面上传过来。
     * gym_group_id是账号登录传过来。
     */
    public static String getLianSuo(int gymGroupId, int gym_group_id) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            StringBuffer group_name = new StringBuffer("");
            //List<Doc> gymGroupList=utildb.Get_List("id,group_name", "hy_gym_group", " where isdel=0 ","mysqlss");
            String sql = "SELECT  id,group_name from  hy_gym_group  where isdel=0";
            List<Doc> gymGroupList = base.executeQuery2List(sql, new ArrayList());
            if (gymGroupList != null) {
                for (Doc doc : gymGroupList) {
                    if (gymGroupId == doc.getIn("id")) {
                        group_name.append("<option value=\"" + gymGroupId + "\" selected=\"selected\">" + doc.get("group_name") + "</option>");
                    } else {
                        group_name.append("<option value=\"" + doc.getIn("id") + "\">" + doc.get("group_name") + "</option>");
                    }
                }
            }
            return group_name.toString();
        } catch (Exception e) {
            return "";
        } finally {
            dbc.closeConn();
        }

    }

    /**
     * 把健身房封装好方便JSP.页面调用，可以直接调用这个方法
     * gymId是页面上传过来。
     * gym_group_id是账号登录传过来。
     * gym_id是账号登录传过来。
     */
    public static String getJianShenFang(int gymId, int gym_group_id, int gym_id) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            StringBuffer gym_name = new StringBuffer("");
            StringBuffer wheres = new StringBuffer(" where isdel=0 ");
            List valueList = new ArrayList();
            if (gym_group_id > 0) {
                wheres.append(" and gym_group_id=? ");
                valueList.add(gym_group_id);
            }
            if (gym_id > 0) {
                wheres.append(" and id=? ");
                valueList.add(gym_id);
            }
 			/*LogUtility.log("gymId="+gymId);
 			LogUtility.log("gym_id="+gym_id);*/
            //List<Doc> gymList=utildb.Get_List("id,gym_name", "hy_gym",wheres.toString(),"mysqlss",valueList);
            String sql = "SELECT  id,gym_name from  hy_gym" + wheres.toString();
            List<Doc> gymList = base.executeQuery2List(sql, valueList);
            //LogUtility.log("sql="+sql);
            if (gymList != null) {
                for (Doc doc : gymList) {
                    if (gymId == doc.getIn("id")) {
                        gym_name.append("<option value=\"" + gymId + "\" selected=\"selected\">" + doc.get("gym_name") + "</option>");
                    } else {
                        gym_name.append("<option value=\"" + doc.getIn("id") + "\">" + doc.get("gym_name") + "</option>");
                    }
                }
            }
            return gym_name.toString();
        } catch (Exception e) {
            LogUtility.log(e, "");
            return "";
        } finally {
            dbc.closeConn();
        }

    }

    /**
     * 把健身房封装好方便JSP.页面调用，可以直接调用这个方法
     * coach_id是页面传穿过来。
     * gym_id是账号登录传过来。
     */
    public static String getJiaoLian(int coach_id, int gym_id) {
        Dbc dbc = DbcFactory.getBbsInstance();
        Base base = new Base();
        try {
            dbc.openConn("mysqlss");
            base.setDbc(dbc);
            StringBuffer coach_name = new StringBuffer("");
            StringBuffer wheres = new StringBuffer(" where isdel=0 ");
            List valueList = new ArrayList();
            if (gym_id > 0) {
                wheres.append(" and gym_id=? ");
                valueList.add(gym_id);
            }
            //List<Doc> gymList=utildb.Get_List("id,gym_name", "hy_gym",wheres.toString(),"mysqlss",valueList);
            String sql = "SELECT  id,coach_name from  hy_coach " + wheres.toString();
            List<Doc> coachList = base.executeQuery2List(sql, valueList);
            if (coachList != null) {
                for (Doc doc : coachList) {
                    if (coach_id == doc.getIn("id")) {
                        coach_name.append("<option value=\"" + coach_id + "\" selected=\"selected\">" + doc.get("coach_name") + "</option>");
                    } else {
                        coach_name.append("<option value=\"" + doc.getIn("id") + "\">" + doc.get("coach_name") + "</option>");
                    }
                }
            }
            return coach_name.toString();
        } catch (Exception e) {
            return "";
        } finally {
            dbc.closeConn();
        }
    }

    //获取体能测试的类型1是三分钟台阶测试，2是手握力测试，3是仰卧起坐一分钟，4是俯卧撑测试，5是坐地体前伸测试，6是心率测试
    public static String getTiNengTypeName(int type) {
        String value = "";
        switch (type) {
            case 1:
                value = "三分钟台阶测试";
                break;
            case 2:
                value = "手握力测试";
                break;
            case 3:
                value = "仰卧起坐一分钟";
                break;
            case 4:
                value = "俯卧撑测试";
                break;
            case 5:
                value = "坐地体前伸测试";
                break;
            case 6:
                value = "心率测试";
                break;
        }
        return value;
    }

    //获取体测的类型名称1是体重，2是BMI,3是脂肪，4是肌肉，5是骨量，6是水分，7是基础代谢率
    public static String getTiCeTypeName(int type) {
        String value = "";
        switch (type) {
            case 1:
                value = "体重";
                break;
            case 2:
                value = "BMI";
                break;
            case 3:
                value = "脂肪";
                break;
            case 4:
                value = "肌肉";
                break;
            case 5:
                value = "骨量";
                break;
            case 6:
                value = "水分";
                break;
            case 7:
                value = "基础代谢率";
                break;
        }
        return value;
    }

    //获取体能的测试结果
    public static String getTiNengResult(int type) {
        String value = "";
        switch (type) {
            case 1:
                value = "欠佳";
                break;
            case 2:
                value = "尚可";
                break;
            case 3:
                value = "一般";
                break;
            case 4:
                value = "良好";
                break;
            case 5:
                value = "优异";
                break;
        }
        return value;
    }

    /**
     * 获取预约的状态
     *
     * @param type
     * @return
     */
    public static String getBookStatus(int type) {
        switch (type) {
            case 0:
                return "处理中";
            case 1:
                return "已预约";
            case 2:
                return "已取消";
            case 3:
                return "已拒绝";
            case 4:
                return "未完成";
            case 5:
                return "已完成";
            case 6:
                return "已过期";
            default:
                return "";
        }
    }
    
    /**
     * 获取预约状态列表
     * @return
     */
    public static List<Doc> getBookStatusList(){
    	List<Doc> list=new ArrayList<Doc>();
    	for(int i=0;i<7;i++){
    		Doc doc=new Doc();
    		doc.put("id",i);
    		doc.put("status",getBookStatus(i));
    		list.add(doc);
    	}
    	return list;
    }
    /**
     * 计算bmi
     * @param weight 单位kg
     * @param height 单位cm
     * @return
     */
    public static String getBmi(float weight,float height){
    	String bmi="";
    	DecimalFormat df=new DecimalFormat("0.00");
    	if(weight>0&&height>0){
    		double weight2=AjaxXml.getDouble(weight+"")/2;
    		double height2=AjaxXml.getDouble(height+"")/100;
    		return df.format(weight2/(height2*height2));
    	}
    	return bmi;
    }
    
    /**
     * 获取常用语类型
     * @param type
     * @return
     */
    public static String getCommonLanguageTypeName(int type){
    	if(type==1){
    		return "体态头部";
    	}else if(type==2){
    		return "体态肩部";
    	}else if(type==3){
    		return "体态肩胛骨";
    	}else if(type==4){
    		return "课程总结";
    	}else{
    		return "";
    	}
    }
    
    public static List<Doc> getCommonLanguageList(){
    	List<Doc> list=new ArrayList<Doc>();
    	for(int i=1;i<=4;i++){
    		Doc doc=new Doc();
    		doc.put("id",i);
    		doc.put("name",getCommonLanguageTypeName(i));
    		list.add(doc);
    	}
    	return list;
    }
    
   /**
    * 获取单位类型名称
    * @param unit_type
    * @return
    */
    public static String getUnitTypeName(int unit_type){
    	if(unit_type==1){
    		return "千克";
    	}else if(unit_type==2){
    		return "千米";
    	}else if(unit_type==3){
    		return "分钟";
    	}else if(unit_type==4){
    		return"千卡";
    	}else if(unit_type==5){
    		return "个";
    	}else {
    		return "";
    	}
    }
    /**
     * 获取单位名称列表
     * @return
     */
    public static List<Doc> getUnitTypeList(){
    	List<Doc> list=new ArrayList<Doc>();
    	for(int i=1;i<=5;i++){
    		Doc doc=new Doc();
    		doc.put("id",i);
    		doc.put("name",getUnitTypeName(i));
    		list.add(doc);
    	}
    	return list;
    }
    /**
     * 获取订单状态(0为未付款，1为已付款，2为卖家已发货，3为已确认收货，4为已完成，5为已取消)
     * @return
     */
    public static String getOrderStatus(int type){
    	if(type==0){
    		return "未付款";
    	}else if(type==1){
    		return "已付款";
    	}else if(type==2){
    		return "卖家已发货";
    	}else if(type==3){
    		return "已确认收货";
    	}else if(type==3){
    		return "已完成";
    	}else if(type==4){
    		return "已取消";
    	}else{
    		return "";
    	}
    }
    
    /**
     * 获取订单状态列表
     * @return
     */
    public List<Doc> getOrderStatusList(){
    	List<Doc> list=new ArrayList<Doc>();
    	for(int i=0;i<5;i++){
    		Doc doc=new Doc();
    		doc.put("id",i);
    		doc.put("status",getBookStatus(i));
    		list.add(doc);
    	}
    	return list;
    }
    /**
     * 获取体测项目类型
     * @param type
     * @return
     */
    public static String getItemType(int type){
    	if(type==1){
    		return "体能";
    	}else{
    		return "";
    	}
    }
    /**
     * 获取体测项目类型列表
     * @return
     */
    public static List<Doc> getItemList(){
    	List<Doc> list=new ArrayList();
    	for(int i=1;i<=1;i++){
    		Doc doc=new Doc();
    		doc.put("id",i);
    		doc.put("item_name",getItemType(i));
    		list.add(doc);
    	}
    	return list;
    }
    
    public static void main(String[] args) {
		String ss="abd.bnkfjdk.ddf";
		System.out.println(ss.lastIndexOf("."));
		System.out.println(ss.substring(0,ss.lastIndexOf(".")));
	}
}

