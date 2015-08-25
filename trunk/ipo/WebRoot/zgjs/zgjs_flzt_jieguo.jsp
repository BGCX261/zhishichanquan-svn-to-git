<%@ page  language="java" contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.ejoysoft.jiansuo.Patent,com.ejoysoft.jiansuo.LawState,java.util.*"%>
<%@ include file="../include/jsp/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>法律状态检索结果页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
</style>
</head>
<%
	Patent pt=new Patent();
	LawState lawState=new LawState();
	List<LawState> lawStates=new ArrayList<LawState>();
	String twhere=(String)globa.session.getAttribute("twhere");
	String sort=(String)globa.session.getAttribute("sort");
	String[] tables=new String[]{"flzt","flzt_1"};
	String table="";
	int pageNum=0;
	int countNum=0;//总记录数
	int countPage=0;//总页数
 %>
<body>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"> <img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">检索历史 </font> &gt; 检索历史 </td>
  </tr>
</table>
<br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="center" class="tab_tit">法律状态检索 </td>
  </tr>
</table>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td height="120" valign="top" >
	<div style="overflow:auto; height:200px;"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="t3">
      <tr>
        <td height="25" align="center" background="images/sys_bg3.gif"  class="listtit">记录号</td>
        <td  align="center"  background="images/sys_bg3.gif"  class="listtit">申请号</td>
        <td align="center"  background="images/sys_bg3.gif" class="listtit">法律状态信息</td>
      </tr>
      <%
      
     int j=1;
     String m=request.getParameter("j");
     if(m==null){
     	j=1;
     }else{
     	j=Integer.parseInt(m);
     }
    System.out.println(m+"mmmmmmmm");
  	 int i=0;
 		for(int x=0;x<tables.length;x++){
 			table=tables[x];
 			lawStates=lawState.showFY(table,twhere,pageNum);
 			
 			for(LawState lawS:lawStates){	
 				i++;		
 					
 	 %>
      <tr>
        <td height="24"><span><%=i%></span></td>
        <td height="24"><a href="zgjs_flzt_jieguo.jsp?j=<%=i %>" target="_parent"><span><%=lawS.getAn() %></span></a></td>
        <td height="24"><span><%=lawS.getLsi() %></span></td>
     
      </tr>
       <%
    		}
    		// countPage一共多少页    countNum 一个多少记录
    		int countB=pt.count(table,twhere);
    		countNum +=countB;
    	}
    	if(countNum%10!=0){
    		countPage=countNum/10 +1;
    	}else{
    		countPage=countNum/10;
    	}
    	
     %>
    </table>
	</div></td>
  </tr>
</table>
</br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="40" class="STYLE4">&nbsp;&nbsp;共有<%=countNum %> 条记录，当前第 1/<%=countPage %> 页</td>
    <td><table border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td width="40"><img src="../images/first.gif" width="37" height="15" /></td>
        <td width="45"><img src="../images/back.gif" width="43" height="15" /></td>
        <td width="45"><img src="../images/next.gif" width="43" height="15" /></td>
        <td width="40"><img src="../images/last.gif" width="37" height="15" /></td>
        <td width="100"><div align="center"><span class="STYLE5">转到第
          <input name="textfield3" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" />
          页 </span></div></td>
        <td width="40"><img src="../images/go.gif" width="37" height="15" /></td>
      </tr>
    </table></td>
  </tr>
</table>
<br />
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" style=" border-top:1px solid #D7D7D7;">
  <tbody>
    <tr align="middle" valign="middle" class="bottom_sm">
      <td height="65"><table width="60%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="CCD5DD">
        <tr>
          <td width="22%"  height="28" align="right" bgcolor="#DFEAF2">申请号：</td>
          <td width="30%" align="left" bgcolor="#FFFFFF">&nbsp;<%=lawStates.get(j).getAn() %></td>
          <td width="21%" align="right" bgcolor="#DFEAF2">法律状态：</td>
          <td width="26%" align="left" bgcolor="#FFFFFF" >&nbsp;<%=lawStates.get(j).getLs() %> </td>
          </tr>
       
        <tr>
          <td height="28" align="right" bgcolor="#DFEAF2">法律状态信息：</td>
          <td align="left" bgcolor="#FFFFFF">&nbsp;<%=lawStates.get(j).getLsi() %></td>
          <td align="right" bgcolor="#DFEAF2">法律状态公告日：</td>
          <td align="left" bgcolor="#FFFFFF">&nbsp;<%=lawStates.get(j).getSlad() %></td>
          </tr>
        
      </table></td>
    </tr>
  </tbody>
</table>
</body>
</html>