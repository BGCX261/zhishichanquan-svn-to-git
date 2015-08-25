package com.ejoysoft.auth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import com.ejoysoft.common.Constants;
import com.ejoysoft.common.Globa;
import com.ejoysoft.util.ParamUtil;

import java.io.PrintWriter;

public class AppClass extends javax.servlet.http.HttpServlet
{
	private String homeUrl = "/index.jsp";
	private String logonUrl = "/login.jsp"; 

	public AppClass()
	{
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException
	{
		String s = request.getLocalName();
		
		ServletContext application = getServletContext();
	
		String actionType = ParamUtil.getAction(request);
		System.out.println("********"+actionType);
		LogonForm form = new LogonForm(application, request, response);
		try
		{
			if (Constants.LOGON.equals(actionType))
			{
				 
				int intType = form.authenticate();
		
				if (intType == -1 || intType !=0) {
					getFullwinScript(actionType,response, form.getError());
				}else
				{
			
					gotoPage(homeUrl, request, response);
				}
			} else if (Constants.LOGOFF.equals(actionType))
			{
				form.doExit();
		
				gotoPage(logonUrl, request, response);
			}  
			else
			{
			
				getFullwinScript(actionType,response, "Illegal ationType specified!");
			}
		} catch (java.lang.Throwable _jsp_e)
		{
			_jsp_e.printStackTrace();
			doError(_jsp_e, request, response);
		}
	}

	public PrintWriter getFullwinScript(String actionType,HttpServletResponse response, String strError) throws java.io.IOException
	{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.println("<object id='WebBrowser' width=0 height=0 classid='CLSID:8856F961-340A-11D0-A96B-00C04FD705A2'></object>");
		pw.println(" <script>");
		pw.println(" <!--");
		pw.println("var w=screen.width-2; if (w>1100)w=1024");
		pw.println("var h=screen.height-54; if (h>780) h=780");
		pw.println("function fullwin(targeturl){");
		pw.println("window.open(targeturl,'sx','top=0,left=0,width='+w+',height='+h)");
		pw.println(" }");
		pw.println(" //-->");
		pw.println(" </script>");
		if (Constants.LOGON.equals(actionType))
		{
			pw.println("<script>alert('" + strError + "');location.href='" + logonUrl + "';</script>");
		} 
		return pw;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException
	{
		doGet(request, response);
	}

	private void gotoPage(String targetURL, HttpServletRequest request, HttpServletResponse response) throws java.io.IOException,
			javax.servlet.ServletException
	{
		if (targetURL == null || targetURL.equals(""))
			targetURL = logonUrl;
		RequestDispatcher rd;
		rd = getServletContext().getRequestDispatcher(targetURL);
		System.out.println("-----------"+targetURL);
		rd.forward(request, response);
	}

	private java.util.HashMap _errorPageMap = null;

	private void doError(java.lang.Throwable _e, HttpServletRequest request, HttpServletResponse response) throws java.io.IOException,
			javax.servlet.ServletException
	{
		String str = _e.toString().substring(0, _e.toString().indexOf(":"));
		request.setAttribute("com.framwork.action.ERROR", _e);
		gotoPage((String) _errorPageMap.get(str), request, response);
	}

	public void destroy()
	{
	}

	public static void main(String[] args) {
		
	}
}
