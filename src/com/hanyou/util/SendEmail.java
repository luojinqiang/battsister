package com.hanyou.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.baje.sz.util.AppConf;

public class SendEmail {
    private static AppConf appconf = AppConf.getconf();
    private String Subject = "";

    private String Content1 = "";

    static String Content2 = "\n\n\n    这是一封HTML格式的邮件，请切换到HTML方式查看该邮件。";

    private InternetAddress from = null;

    public SendEmail() throws Exception {
        //from = new InternetAddress(new String(appconf.get("fromadd").getBytes("GBK"), "iso-8859-1"));
    }

    public void setFrom(String from1) throws Exception {
        from = new InternetAddress(new String(from1.getBytes("GBK"),
                "iso-8859-1"));
    }

    public void setContent(String content) throws Exception {
        Content1 = content;
    }

    public void setSubject(String subject1) {
        Subject = subject1;
    }

    public boolean sendMail_x(String tto, String strFrom, String smtp, String user, String pass) {
        try {
            Properties props = new Properties();//也可用Properties  props  =  System.getProperties();
            props.put("mail.smtp.host", smtp);//存储发送邮件服务器的信息
            props.put("mail.smtp.auth", "true");//同时通过验证
            Session s = Session.getInstance(props);//根据属性新建一个邮件会话
            s.setDebug(true);
            MimeMessage message = new MimeMessage(s);//由邮件会话新建一个消息对象
            //设置邮件
            //InternetAddress  from=new  InternetAddress("\"八界网\"<8j@8jnet.com>");
            //message.setFrom(from);//设置发件人
            //String   strFrom="微微新娘婚纱摄影网站注册用户密码找回<8j@8jnet.com>";     //     <--------------
            strFrom = new String(strFrom.getBytes(), "8859_1");
            message.setFrom(new InternetAddress(strFrom));

            InternetAddress to = new InternetAddress(tto);
            message.setRecipient(Message.RecipientType.TO, to);//设置收件人,并设置其接收类型为TO
            message.setSubject(Subject);//设置主题
            //message.setText(tcontent);//设置信件内容
            message.setSentDate(new Date());//设置发信时间

            //给消息对象设置内容
            BodyPart mdp = new MimeBodyPart();//新建一个存放信件内容的BodyPart对象
            mdp.setContent(Content1, "text/html;charset=gb2312");//给BodyPart对象设置内容和格式/编码方式
            Multipart mm = new MimeMultipart();//新建一个MimeMultipart对象用来存放BodyPart对
            //象(事实上可以存放多个)
            mm.addBodyPart(mdp);//将BodyPart加入到MimeMultipart对象中(可以加入多个BodyPart)
            message.setContent(mm);//把mm作为消息对象的内容

            message.saveChanges();

            //发送邮件
            //message.saveChanges();//存储邮件信息
            Transport transport = s.getTransport("smtp");
            transport.connect(smtp, user, pass);//以smtp方式登录邮箱
            transport.sendMessage(message, message.getAllRecipients());//发送邮件,其中第二个参数是所有
            //已设好的收件人地址
            transport.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean sendMail(String tto, String username, String sendwed, String sendpass, String sendstmp) {
        try {
            Properties props = new Properties();//也可用Properties  props  =  System.getProperties();
            props.put("mail.smtp.host", sendstmp);//存储发送邮件服务器的信息
            props.put("mail.smtp.auth", "true");//同时通过验证
            Session s = Session.getInstance(props);//根据属性新建一个邮件会话
            s.setDebug(true);
            MimeMessage message = new MimeMessage(s);//由邮件会话新建一个消息对象
            if (username.equals("")) {
                username = "移动健康伴侣管理专家<ykcare_service@sina.cn>";
            }
            String strFrom = username;     //     <--------------
            strFrom = new String(strFrom.getBytes(), "8859_1");
            message.setFrom(new InternetAddress(strFrom));

            InternetAddress to = new InternetAddress(tto);
            message.setRecipient(Message.RecipientType.TO, to);//设置收件人,并设置其接收类型为TO
            message.setSubject(Subject);//设置主题
            //message.setText(tcontent);//设置信件内容
            message.setSentDate(new Date());//设置发信时间

            BodyPart mdp = new MimeBodyPart();//新建一个存放信件内容的BodyPart对象
            mdp.setContent(Content1, "text/html;charset=gb2312");//给BodyPart对象设置内容和格式/编码方式
            Multipart mm = new MimeMultipart();//新建一个MimeMultipart对象用来存放BodyPart对
            mm.addBodyPart(mdp);//将BodyPart加入到MimeMultipart对象中(可以加入多个BodyPart)
            message.setContent(mm);//把mm作为消息对象的内容

            message.saveChanges();
            Transport transport = s.getTransport("smtp");
            transport.connect(sendstmp, sendwed, sendpass);//以smtp方式登录邮箱
            transport.sendMessage(message, message.getAllRecipients());//发送邮件,其中第二个参数是所有
            transport.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 万年康发邮件
     *
     * @param tto
     * @param username
     * @param sendwed
     * @param sendpass
     * @param sendstmp
     * @return
     */
    public boolean sendMail2(String tto, String username, String sendwed, String sendpass, String sendstmp) {
        try {
            Properties props = new Properties();//也可用Properties  props  =  System.getProperties();
            props.put("mail.smtp.host", sendstmp);//存储发送邮件服务器的信息
            props.put("mail.smtp.auth", "true");//同时通过验证
            Session s = Session.getInstance(props);//根据属性新建一个邮件会话
            s.setDebug(true);
            MimeMessage message = new MimeMessage(s);//由邮件会话新建一个消息对象
            if (username.equals("")) {
                username = "移动健康伴侣管理专家<wnk22@flyever.com.cn>";
            }
            String strFrom = username;     //     <--------------
            strFrom = new String(strFrom.getBytes(), "8859_1");
            message.setFrom(new InternetAddress(strFrom));

            InternetAddress to = new InternetAddress(tto);
            message.setRecipient(Message.RecipientType.TO, to);//设置收件人,并设置其接收类型为TO
            message.setSubject(Subject);//设置主题
            //message.setText(tcontent);//设置信件内容
            message.setSentDate(new Date());//设置发信时间

            BodyPart mdp = new MimeBodyPart();//新建一个存放信件内容的BodyPart对象
            mdp.setContent(Content1, "text/html;charset=gb2312");//给BodyPart对象设置内容和格式/编码方式
            Multipart mm = new MimeMultipart();//新建一个MimeMultipart对象用来存放BodyPart对
            mm.addBodyPart(mdp);//将BodyPart加入到MimeMultipart对象中(可以加入多个BodyPart)
            message.setContent(mm);//把mm作为消息对象的内容

            message.saveChanges();
            Transport transport = s.getTransport("smtp");
            transport.connect(sendstmp, sendwed, sendpass);//以smtp方式登录邮箱
            transport.sendMessage(message, message.getAllRecipients());//发送邮件,其中第二个参数是所有
            transport.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        try {
            SendEmail sw = new SendEmail();
            sw.setContent("<a href=\"http://www.ejuhotel.com\">您好</a>：\n您在微微新娘婚纱摄影网注册的密码是：。\n（此邮件回复无效）");
            sw.setSubject("杨保龙推荐您加入体验E居酒店式自助公寓,只要注册立马赠送你50元房费");
            sw.sendMail2("960236576@qq.com", "万年康数据健康管理专家<wnk22@flyever.com.cn>", "wnk22@flyever.com.cn", "xiaogan2008", "smtp.exmail.qq.com");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}

