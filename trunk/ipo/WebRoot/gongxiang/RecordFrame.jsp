<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ejoysoft.jiansuo.Patent,java.util.*"%>
<%@ include file="../include/jsp/head.jsp"%>
<html>
<head>
<title>专利细览</title>
<style>
<!--
body,td,tr,li {font-size:10pt; font-family:宋体}
a{text-decoration:underline;color:#0000ff}
a:link{text-decoration:underline;color:#0000ff}
a:visited {text-decoration:underline;color:#0000ff}
a:hover {color:#EBA007;text-decoration:underline}
-->
</style><link href="../css/main.css" rel="stylesheet" type="text/css" />

</head>
<script type="text/javascript">
function MoveTo(str){
	window.location.href="actionName.action?id=parm&password=parm";
	
}


//无提示关闭窗口
function CloseWin()
{

window.opener=null; 
window.close(); 
history.back();
}

</script>



<%
	String an=request.getParameter("an");
	String table=request.getParameter("table");
	String countNumber=request.getParameter("countNumber");
	System.out.println(countNumber);
	String m1=request.getParameter("m");
	int m=Integer.parseInt(m1);
	System.out.println(an);
	System.out.println(table);
	Patent pt=new Patent();
	pt=pt.findP(table,an);
	System.out.println(pt.getTi());
 %>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0">
<form action="RecordFrame.jsp" name="form1" method="post">
	<input type="hidden" name="table" value="<%=table %>">
	
	
</form>
<object id=obj1 classid="CLSID:106E49CF-797A-11D2-81A2-00E02C015623" codebase="alttiff.ocx#version=1,8,3,1" height=1 width=1></object>
<center>
  <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">检索历史 </font> &gt; 检索结果 </td>
    </tr>
  </table>

  </td>
  </tr>
  </table>
  <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="23" align="center" bgcolor="#DFEAF2">
      此次检索共命中记录<B><%=countNumber %></B>条，当前为第<B><%=m %></B>条</td>
    </tr>
    <tr>
      <td height="32" align="center"><input name="FirstPage2" type="button" value="第一条" class="fieldbuttonnav2" onClick="MoveTo('1');">
        &nbsp;
        <input name="PrevPage2" type="button" value="上一条" onClick="MoveTo('<%=m-1 %>');" class="fieldbuttonnav2" >
        &nbsp;
        <input name="NextPage2" type="button" value="下一条" onClick="MoveTo('<%=m+1 %>');" class="fieldbuttonnav2" >
        &nbsp;
        <input name="LastPage2" type="button" value="最末条" onClick="MoveTo('<%=countNumber %>');" class="fieldbuttonnav2" >
        &nbsp;&nbsp;
        快速定位：
        <input type="text" name="txtJumpPageNumber2" size="4"  value="">
        &nbsp;
        <input name="JumpPage2" type="button" value="转到" onClick="JumpPage();" class="fieldbuttonnav2" >
        &nbsp;
        <input name="button3" type="button" onClick="javascript:Print();" value="打印文摘" class="fieldbuttonnav2" >
        &nbsp;
      <input name="button3" type="button" onClick="javascript:Download();" value="下载文摘" class="fieldbuttonnav2" ></td>
    </tr>
    <tr>
      <td height="25" align="center">[法律状态] &nbsp;&nbsp;[专利说明书全文] &nbsp;[代码化]&nbsp;&nbsp;[审定、授权说明书]&nbsp;&nbsp;[代码化]</td>
    </tr>
  </table>
  <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="t3">
    <tr>
      <td height="25" align="center" background="images/sys_bg3.gif"  class="listtit"><%=pt.getTi() %></td>
    </tr>
  </table>
  <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="t3" style="WORD-BREAK: break-all; border-collapse:collapse; ">
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">名称: 　</td>
      <td colspan="3" bgcolor="#ffffff"><%=pt.getTi() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">申请（专利）号: 　</td>
      <td width="24%"  bgcolor="#ffffff"><%=pt.getAn() %></td>
      <td width="20%" align="right" bgcolor="#F4F4FF">申请日: 　</td>
      <td width="25%"  bgcolor="#ffffff"><%=pt.getAd() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">公开（公告）号: 　</td>
      <td width="24%"  bgcolor="#ffffff"><%=pt.getPnm() %></td>
      <td width="20%" align="right" bgcolor="#F4F4FF">公开（公告）日: 　</td>
      <td width="25%"  bgcolor="#ffffff"><%=pt.getPd() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">主分类号: 　</td>
      <td  width="24%" bgcolor="#ffffff"><%=pt.getPic() %></td>
      <td width="20%" align="right" bgcolor="#F4F4FF">范畴分类: 　</td>
      <td width="25%" bgcolor="#ffffff"><%=pt.getSsr() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">分类号: 　</td>
      <td colspan="3" bgcolor="#ffffff"><%=pt.getSic() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">优先权: 　</td>
      <td colspan="3" bgcolor="#ffffff"><%=pt.getPr() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">申请（专利权）人: 　</td>
      <td colspan="3"  bgcolor="#ffffff"><%=pt.getPa() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">地址: 　</td>
      <td colspan="3"  bgcolor="#ffffff"><%=pt.getAr() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">国省代码: 　</td>
      <td colspan="3"  bgcolor="#ffffff"><%=pt.getCo() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">发明（设计）人: 　</td>
      <td colspan="3"  bgcolor="#ffffff"><%=pt.getInn() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">国际申请: 　</td>
      <td colspan="3"  bgcolor="#ffffff"><%=pt.getIan() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">国际公布: 　</td>
      <td colspan="3"  bgcolor="#ffffff"><%=pt.getIpn() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">进入国家日期: 　</td>
      <td colspan="3"  bgcolor="#ffffff"><%=pt.getDen() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">专利代理机构: 　</td>
      <td colspan="3"  bgcolor="#ffffff"><%=pt.getAgc() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">代理人: 　</td>
      <td colspan="3"  bgcolor="#ffffff"><%=pt.getAgt() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">分案申请号: 　</td>
      <td colspan="3"  bgcolor="#ffffff"><%=pt.getDan() %></td>
    </tr>
    <tr>
      <td width="23%" align="right" bgcolor="#F4F4FF">颁证日: 　</td>
      <td colspan="3" bgcolor="#ffffff"><%=pt.getAcd() %></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F4F4FF">摘要: 　 </td>
      <td colspan="3" bgcolor="#ffffff"><%=pt.getAbst() %></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F4F4FF">主权项: 　 </td>
      <td colspan="3" bgcolor="#ffffff"><%=pt.getCl() %> </td>
    </tr>
  </table>
  <table width="97%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="40" align="center"><input name="button" type="button" onClick="CloseWin();" class="subit_2" value="关闭"></td>
    </tr>
  </table>
</center>
 
</body>
</html>



