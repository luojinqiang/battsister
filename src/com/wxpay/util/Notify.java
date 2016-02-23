package com.wxpay.util;

import java.io.BufferedOutputStream;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.baje.sz.ajax.LogUtility;

public class Notify {
    //编码
    public static final String encoding = "UTF-8";

    public void notify(HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        //把如下代码贴到的你的处理回调的servlet 或者.do 中即可明白回调操作
        System.out.print("微信支付回调数据开始");
        //示例报文
//		String xml = "<xml><appid><![CDATA[wxb4dc385f953b356e]]></appid><bank_type><![CDATA[CCB_CREDIT]]></bank_type><cash_fee><![CDATA[1]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[1228442802]]></mch_id><nonce_str><![CDATA[1002477130]]></nonce_str><openid><![CDATA[o-HREuJzRr3moMvv990VdfnQ8x4k]]></openid><out_trade_no><![CDATA[1000000000051249]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[1269E03E43F2B8C388A414EDAE185CEE]]></sign><time_end><![CDATA[20150324100405]]></time_end><total_fee>1</total_fee><trade_type><![CDATA[JSAPI]]></trade_type><transaction_id><![CDATA[1009530574201503240036299496]]></transaction_id></xml>";
        String inputLine;
        String notityXml = "";
        String resXml = "";

        try {
            while ((inputLine = request.getReader().readLine()) != null) {
                notityXml += inputLine;
            }
            request.getReader().close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("接收到的报文：" + notityXml);

        Map m = parseXmlToList2(notityXml);
        WxPayResult wpr = new WxPayResult();
        wpr.setAppid(m.get("appid").toString());
        wpr.setBankType(m.get("bank_type").toString());
        wpr.setCashFee(m.get("cash_fee").toString());
        wpr.setFeeType(m.get("fee_type").toString());
        wpr.setIsSubscribe(m.get("is_subscribe").toString());
        wpr.setMchId(m.get("mch_id").toString());
        wpr.setNonceStr(m.get("nonce_str").toString());
        wpr.setOpenid(m.get("openid").toString());
        wpr.setOutTradeNo(m.get("out_trade_no").toString());
        wpr.setResultCode(m.get("result_code").toString());
        wpr.setReturnCode(m.get("return_code").toString());
        wpr.setSign(m.get("sign").toString());
        wpr.setTimeEnd(m.get("time_end").toString());
        wpr.setTotalFee(m.get("total_fee").toString());
        wpr.setTradeType(m.get("trade_type").toString());
        wpr.setTransactionId(m.get("transaction_id").toString());

        if ("SUCCESS".equals(wpr.getResultCode())) {
            //支付成功
            resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
                    + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
        } else {
            resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                    + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
        }

        System.out.println("微信支付回调数据结束");

        BufferedOutputStream out = new BufferedOutputStream(
                response.getOutputStream());
        out.write(resXml.getBytes());
        out.flush();
        out.close();

    }

    /**
     * description: 解析微信通知xml
     *
     * @param xml
     * @return
     * @author cc
     * @see
     */
    @SuppressWarnings({"unused", "rawtypes", "unchecked"})
    public SortedMap parseXmlToList2(String xml) {
        SortedMap<Object, Object> retMap = new TreeMap<Object, Object>();
        try {
            /*StringReader read = new StringReader(xml);
			// 创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入
			InputSource source = new InputSource(read);
			// 创建一个新的SAXBuilder
			SAXBuilder sb = new SAXBuilder();
			// 通过输入源构造一个Document
			//LogUtility.log("xml=="+xml);
			Document doc = (Document) sb.build(source);*/
            Document doc = DocumentHelper.parseText(xml);
            Element root = doc.getRootElement();// 指向根节点
            Iterator<?> iter = root.elementIterator();
            while (iter.hasNext()) {
                Element element = (Element) iter.next();
                retMap.put(element.getName(), element.getData());
            }
        } catch (Exception e) {
            LogUtility.log(e, "");
            e.printStackTrace();
        } finally {

        }
        return retMap;
    }

    /**
     * 根据微信返回的参数生成签名
     *
     * @param characterEncoding
     * @param parameters
     * @return
     */
    public static String createMySign(String characterEncoding, SortedMap<Object, Object> parameters, String key) {
        StringBuffer sb = new StringBuffer();
        Set es = parameters.entrySet();//所有参与传参的参数按照accsii排序（升序）  
        Iterator it = es.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String k = (String) entry.getKey();
            Object v = entry.getValue();
            if (null != v && !"".equals(v)
                    && !"sign".equals(k) && !"key".equals(k)) {
                sb.append(k + "=" + v + "&");
            }
        }
        sb.append("key=" + key);
        String mySign = MD5Util.MD5Encode(sb.toString(), characterEncoding).toUpperCase();
        return mySign;
    }

    /**
     * 微信支付回调验证
     *
     * @param sign
     * @param key
     * @param param
     * @return
     */
    public boolean weixin_verify(String key, SortedMap<Object, Object> param) {
        String sign = param.get("sign") != null ? param.get("sign").toString() : "";
        String mySign = createMySign(encoding, param, key);
        if (sign.equals(mySign)) {
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
		/*Notify n=new Notify();
		String xml="<xml><appid><![CDATA[wx36de1b156f14161f]]></appid><bank_type><![CDATA[ICBC_DEBIT]]></bank_type><cash_fee><![CDATA[1]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[N]]></is_subscribe><mch_id><![CDATA[1261056601]]></mch_id><nonce_str><![CDATA[8f19793b2671094e63a15ab883d50137]]></nonce_str><openid><![CDATA[oM5HasmCBdOaQrd_YJmL_LJYJghI]]></openid><out_trade_no><![CDATA[287e041302f34b11ddfb57afc8048cd8]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[6D2DF135167C6A69638786F1E61AC6B3]]></sign><time_end><![CDATA[20150804150244]]></time_end><total_fee>1</total_fee><trade_type><![CDATA[APP]]></trade_type><transaction_id><![CDATA[1006600339201508040546665296]]></transaction_id></xml>";
		Map m=n.parseXmlToList2(xml);
		Iterator<Entry<String, String>> ite=m.entrySet().iterator();
		while(ite.hasNext()){
			Entry<String, String> entry=ite.next();
			System.out.println(entry.getKey()+"=="+entry.getValue());
		}*/
        //System.out.println(n.createLinkString(m));
		
		 /*is_subscribe==N
		appid==wx36de1b156f14161f
		fee_type==CNY
		nonce_str==8f19793b2671094e63a15ab883d50137
		out_trade_no==287e041302f34b11ddfb57afc8048cd8
		transaction_id==1006600339201508040546665296
		trade_type==APP
		result_code==SUCCESS
		sign==6D2DF135167C6A69638786F1E61AC6B3
		mch_id==1261056601
		total_fee==1
		time_end==20150804150244
		openid==oM5HasmCBdOaQrd_YJmL_LJYJghI
		bank_type==ICBC_DEBIT
		return_code==SUCCESS
		cash_fee==1
		*/ 
		/*Notify n=new Notify();
		String xml="<xml><appid><![CDATA[wx36de1b156f14161f]]></appid><bank_type><![CDATA[ICBC_DEBIT]]></bank_type><cash_fee><![CDATA[1]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[N]]></is_subscribe><mch_id><![CDATA[1261056601]]></mch_id><nonce_str><![CDATA[8f19793b2671094e63a15ab883d50137]]></nonce_str><openid><![CDATA[oM5HasmCBdOaQrd_YJmL_LJYJghI]]></openid><out_trade_no><![CDATA[287e041302f34b11ddfb57afc8048cd8]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[6D2DF135167C6A69638786F1E61AC6B3]]></sign><time_end><![CDATA[20150804150244]]></time_end><total_fee>1</total_fee><trade_type><![CDATA[APP]]></trade_type><transaction_id><![CDATA[1006600339201508040546665296]]></transaction_id></xml>";
		Map m=n.parseXmlToList2(xml);
		n.paraFilter(m);
		String signString=n.createLinkString(m);
		System.out.println(signString);
		MD5 md5=new MD5();
		String sign=m.get("sign")!=null?m.get("sign").toString():"";
		String mySign=md5.toDigest(signString).toUpperCase();
		System.out.println("sign="+sign);
		System.out.println("mySign="+mySign);*/

    }


}
