<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zgjs_luoji_HistoryList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  
  <body>
    

<style type="text/css"> 

body {
	margin-left: 0px;
	margin-top: 0px;
	scrollbar-face-color:ffffff; 
	scrollbar-shadow-color:C1C1BB; 
	scrollbar-highlight-color:C1C1BB; 
	scrollbar-3dlight-color:EBEBE4; 
	scrollbar-darkshadow-color:EBEBE4; 
	scrollbar-track-color:F4F4F0; 
	scrollbar-arrow-color:CACAB7; 
}
 
td{
font size:12px;
}
A:link {text-decoration:none;}
A:visited {text-decoration:none;}
A:active {text-decoration:none;}
A:hover {text-decoration:none;}
 
#tipBox {position: absolute;
width: 110px;
z-index: 100;
border: 1pt black solid;
font-family:宋体;
font-size: 9pt;
background: #fffacd;
visibility: hidden}

</style>
 
<div ID="tipBox"></div>
<table width="800" cellpadding="3">
 
  <tr bgcolor="#EEEEEE" align="center">
    <td height="24" width="310"><B>表达式名称</B></td>
    <td><B>命中数</B></td>
    <td colspan="4"><B>操作</B></td>
    <td><B>检索库</B></td>
  </tr>
 
  <tr>
    <td height="24" colspan="5">------------------------------- 没有存历史表达式 -------------------------------</td>
  </tr>
 
</table>

  </body>
</html>
