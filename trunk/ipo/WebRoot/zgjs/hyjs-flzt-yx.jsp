<%@ page contentType="text/html;charset=UTF-8"%> 
<%@ include file="../include/jsp/head.jsp"%>

<html>
<head>
<STYLE type=text/css>

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	scrollbar-face-color: ffffff;
	scrollbar-shadow-color: C1C1BB;
	scrollbar-highlight-color: C1C1BB;
	scrollbar-3dlight-color: EBEBE4;
	scrollbar-darkshadow-color: EBEBE4;
	scrollbar-track-color: F4F4F0;
	scrollbar-arrow-color: CACAB7;
}
td{font-family:ARIAL; font-size: 10.8pt;}
		A:link 
		{font-family:ARIAL; font-size: 10.8pt;text-decoration: none}
		A:visited 
		{font-family:ARIAL; font-size: 10.8pt;text-decoration: none}
		A:Hover 
		{font-family:ARIAL;text-decoration:underline;font-size: 10.8pt; color:ff3366}
.style1 {color: #999999}
	
</STYLE>
<link href="../../analyse/css/analyse.css" rel="stylesheet" type="text/css" ></link>
<base target="rbottom">
</head>
<body bgcolor="#F0F7FF">
<hr size="1" color="#3D72D3" width="90%" align="center">
<center>

               <table border=0>
               <%
               	
               
                %>
                <tr><td bgcolor=#D9F0FD>申请号</td>
                 <td><%%></td>
                </tr>
                 <tr><td bgcolor=#D9F0FD>法律状态</td>
                 <td><pre><%ls %></pre></td></tr>
				 <tr><td bgcolor=#D9F0FD>法律状态信息</td>
				 <td><pre><%lsi %></pre></td></tr>
                 <tr><td bgcolor=#D9F0FD>法律状态公告日</td>
                 <td><%slad %></td></tr>
               </table>


</center>
<hr size="1" color="#3D72D3" width="90%" align="center">
</div>
</body>
</html>


