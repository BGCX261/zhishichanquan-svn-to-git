package com.ejoysoft.wlanyz.system;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

/**
 * HelloWorld Servlet.
 * @author JY
 */
public class FirstServlet extends HttpServlet {
    /** serialVersionUID. */
    private static final long serialVersionUID = 217251451801586160L;
    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
                throws ServletException, IOException {
        // 设定内容类型为HTML网页UTF-8编码
    	String strTerminalNo = req.getParameter("strTerminalNo");
    	System.out.println("************"+strTerminalNo);
        resp.setContentType("text/html;charset=UTF-8");
        // 输出页面
        StringBuffer sbReturn = new StringBuffer();
        sbReturn.append("<html><head>");
        sbReturn.append("<title>First Servlet Hello</title>");
        sbReturn.append("</head><body>");
        sbReturn.append("Hello!大家好!");
        sbReturn.append("</body></html>");
       //PrintWriter out = resp.getWriter();
        String strFileName = "ap.ini";//自定义csv文件的文件名
	    resp.setContentType("APPLICATION/*");
	    resp.setHeader( "Content-Disposition", "attachment;filename="  + new String( strFileName.getBytes("gbk"), "ISO8859-1" ));
	   // out.clearBuffer(); 
	   // out = pageContext.pushBody();
	    ServletOutputStream output = resp.getOutputStream();
	    output.write(sbReturn.toString().getBytes());
 
        //out.println("<html><head>");
       // out.println("<title>First Servlet Hello</title>");
        //out.println("</head><body>");
        //out.println("Hello!大家好!");
        //out.println("</body></html>");
       // out.close();
    }
}

