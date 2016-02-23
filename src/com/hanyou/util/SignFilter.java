package com.hanyou.util;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.xml.sax.InputSource;

import com.baje.sz.ajax.AjaxXml;
import com.baje.sz.ajax.LogUtility;
import com.baje.sz.util.RequestUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.StringReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//实现Filter接口
public class SignFilter implements Filter {
    protected FilterConfig config;
    protected String filterURI;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
        filterURI = config.getInitParameter("filterURI");
        System.out.println("----start sign filter----");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        RequestDispatcher dispatcher = servletRequest.getRequestDispatcher("/action/errSign.jsp");
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        RequestUtil ru = new RequestUtil(request);
        ((HttpServletResponse) servletResponse).addHeader("Access-Control-Allow-Origin", "http://api.hanyouapp.com");
        try {
            //LogUtility.log("ajaxxx=="+AjaxXml.getParameterStr(request));
            boolean skipSign = false;
            //判断web.xml文件是配置了要过滤的URI（多个以","隔开）
            if (filterURI != null && !filterURI.equals("")) {
                String[] uris = filterURI.split(",");
                for (String uri : uris) {
                    if (uri.equals(request.getRequestURI())) { //如果请求的URI存在例外，则skipSign = true
                        skipSign = true;
                        break;
                    }
                }
            }
            if (skipSign) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                if (servletRequest.getContentType() != null && servletRequest.getContentType().contains("multipart/form-data")) {
                    filterChain.doFilter(servletRequest, servletResponse);
                } else {
                    if (!Sign.getBooleanSign(request)) {
                        dispatcher.forward(servletRequest, servletResponse);
                    } else {
                        filterChain.doFilter(servletRequest, servletResponse);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
    }

    public Map parseXmlToList2(String xml) {
        Map retMap = new HashMap();
        try {
            StringReader read = new StringReader(xml);
            // 创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入
            InputSource source = new InputSource(read);
            // 创建一个新的SAXBuilder
            SAXBuilder sb = new SAXBuilder();
            // 通过输入源构造一个Document
            Document doc = (Document) sb.build(source);
            Element root = doc.getRootElement();// 指向根节点
            List<Element> es = root.getChildren();
            if (es != null && es.size() != 0) {
                for (Element element : es) {
                    retMap.put(element.getName(), element.getValue());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return retMap;
    }
}