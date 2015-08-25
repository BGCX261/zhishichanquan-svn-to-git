<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.ejoysoft.util.ParamUtil"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>知识产权局系统</title>
</head>
<frameset rows="95,*" cols="*" name="cel" frameborder="NO" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="NO" noresize>
   <frameset rows="*" cols="192,*" name="cen" id="cen" framespacing="0" frameborder="NO" border="0">
      <frame src="left.jsp?actionFlag=系统首页&rootFlag=日常管理" name="leftFrame" scrolling="no" noresize>
      <frame src="#" scrolling="auto" name="mainFrame">
    </frameset>
	</frameset>
</frameset>
<noframes>
<body>
</body></noframes>
</html>
