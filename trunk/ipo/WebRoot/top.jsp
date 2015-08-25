<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.ejoysoft.common.Constants,java.net.URLEncoder" %>
<%@ include file="include/jsp/head.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>知识产权局系统</title>
<link href="css/top.css" rel="stylesheet" type="text/css" />
</head>
<script language="javaScript">

function logout(){
	
	if (confirm("您确定要退出吗？"))
		top.location = "<%=application.getContextPath()%>/Auth?actiontype=<%=Constants.LOGOFF%>";
	return false;
}

</script>

<div class=top>
	<img src="images/top_01.jpg" style="display:block; float:left">
	<div class=top_nav>
	  <UL>
		<LI class=index_nav><A class=current  href="#.jsp ?random=123" target="mainFrame" onclick="window.parent.leftFrame.location='left.jsp?actionFlag=系统首页&rootFlag=日常管理';window.parent.mainFrame.location='';">首页</A></LI>
		<LI class=act_regulate><A class=current  href="zgjs/zgjs_biaoge.jsp?random=123" target="mainFrame" onclick="window.parent.leftFrame.location='left.jsp?actionFlag=中国专利检索&rootFlag=日常管理';window.parent.mainFrame.location='zgjs/zgjs_biaoge.jsp';">中国专利检索</A></LI>
		<LI class=zxyh><A class=current  href="hyjs/hyjs_biaoge.jsp?random=123" target="mainFrame" onclick="window.parent.leftFrame.location='left.jsp?actionFlag=港澳台及外国专利检索&rootFlag=日常管理';window.parent.mainFrame.location='hyjs/hyjs_biaoge.jsp';">港澳台及国外专利检索</A></LI>
	    <LI class=cpcx><A class=current  href="system/unit_list.jsp?random=123" target="mainFrame" onclick="window.parent.leftFrame.location='left.jsp?actionFlag=系统管理&rootFlag=日常管理';window.parent.mainFrame.location='system/unit_list.jsp';">系统管理</A></LI>
	  </UL>
	  </DIV>
<div class="top_right"><img src="images/user.jpg" align="absmiddle" />&nbsp;系统管理员&nbsp;&nbsp;
<a onclick="logout();"><img src="images/exit1.gif" align="absmiddle"  />&nbsp;退出</a></div>
</div>



