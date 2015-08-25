<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.ejoysoft.util.ParamUtil"%>
<%@page import="java.util.Vector"%>
<%@page import="com.ejoysoft.conf.SysModule"%>
<%@page import="com.ejoysoft.conf.Module"%>
<%@page import="com.ejoysoft.common.exception.ApplicationException"%>
<%@page import="com.ejoysoft.wlanyz.business.Ac"%>
<%@page import="java.util.ArrayList"%> 
<%@include file="include/jsp/head.jsp"%>

<% 
try{
String actionFlag = ParamUtil.getString(request,"actionFlag","系统首页");
String rootFlag = ParamUtil.getString(request,"rootFlag","日常管理");
String tempName = "";
 %>
 <%  
Vector vctRoot = SysModule.getModules();
Module modRoot = null;
if(vctRoot !=null)
{
  //判断顶级模块是否存在
	for (int i = 0; i < vctRoot.size(); i++) { 
		if (((Module)vctRoot.get(i)).getName().equals(rootFlag)) {
			modRoot = (Module)vctRoot.get(i);
			break;
		}
	} 
	if (modRoot == null) {
		throw new ApplicationException("系统配置错误1：不存在" + rootFlag + "顶级模块！");
	}
}
%>
<html>
<head>
<title><%=application.getAttribute("APP_TITLE") %></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="css/left.css" rel="stylesheet" type="text/css">

<script src="../scripts/jsframework.js"></script>
<style type="text/css">
<!--
body {
	background-color: #f2f8ff;font-size:12px;
}
.lft{ color:#FFFFFF; font-size:12px; line-height:25px; text-align:left}
.lf2{ color:#619DDB; font-size:12px;} 
-->
</style> 
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<form name=frm id=frm action="left.jsp" method="post" target="leftFrame">
<div class="left">
<div class="lf_tit">功能菜单</div>
<div class="lf_list">
	<ul> 
	  <%if(rootFlag.equals("日常管理")){
	 	    //判断二级模块是否存在和权限
	 	    boolean chileModuleExist = false,chileModuleRight=false;
	  		Vector vctModule = modRoot.getChildren();
	  		Module childMod = null; 
	  		if(vctModule != null)
	  		{
	  			for (int i = 0; i < vctModule.size(); i++) {
					Module mod2 = (Module)vctModule.get(i);
					if (mod2.getName().equals(actionFlag)) {
						childMod = mod2;
						chileModuleExist = true;
						if(globa.userSession.hasRight(mod2.getCode()))
							chileModuleRight = true;
						break;
					}
	  			}
	  		}
			if (!chileModuleExist) {
				throw new ApplicationException("系统配置错误：不存在" + rootFlag + "顶级模块！");
			}
			else if(!chileModuleRight)
			{
				out.println("<script>alert('对不起！您无该模块的操作权限！')</script>");
			}
		    else{
		    	Vector vctModule2 = childMod.getChildren();
		    	if(vctModule2 != null )
		    	{
		    	%><%
			    	for(int i=0;i<vctModule2.size();i++){
				    	Module childMod2 = (Module)vctModule2.get(i);
				    	if(globa.userSession.hasRight(childMod2.getCode()))
				    	{
				    		tempName = childMod2.getName();
				    		String random = String.valueOf(Math.random());
		   %>
		   			 <li><a href="<%=childMod2.getUrl()+"?random="+random %>" target="mainFrame" ><%=childMod2.getName() %></a></li>
			<%
		 				}
				    }
		 		}
			 }
		 }
		%>
	</ul>

			  </form>     
</body>
</html>
<%}
catch(Exception e){e.printStackTrace();} %>
<%@ include file="include/jsp/footer.jsp"%>