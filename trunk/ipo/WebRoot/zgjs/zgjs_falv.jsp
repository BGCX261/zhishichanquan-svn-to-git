<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<script language=javascript>

function trim(str) {
	
	for ( var i = 0; i < str.length && str.charAt(i) == " "; i++)
		;
	for ( var j = str.length; j > 0 && str.charAt(j - 1) == " "; j--)
		;
	if (i > j)
		return "";
	return str.substring(i, j);
}

function formsubmit() {

	var num = ""; //申请（专利）号 an
	var flzt = ""; //法律状态 ls
	var flztggdate = ""; //法律状态公告日 slad
	var str = ""; //检索表达式  
	var str_leng;

	num = document.getElementById('an').value;
	flzt = document.getElementById('ls').value;
	flztggdate = document.getElementById('slad').value;
	num = num.replace(/(^\s*)|(\s*$)/g, "");
	flzt = flzt.replace(/(^\s*)|(\s*$)/g, "");
	flztggdate = flztggdate.replace(/(^\s*)|(\s*$)/g, "");

	leng = num.length;
	num = trim(num);
	if (num != "") {
		if (num.indexOf("CN") == 0) {
			num = num.substring(2);		
		}
		if (num.indexOf("cn") == 0) {
			num = num.substring(2);
		}
		if (leng == 8) {
			num = num + "%";
		}
		if(flztggdate==""&&flzt==""){
		str = str + "an like '" + num + "%'";
		
		}else if(flztggdate !=""||flzt !=""){
			str = str + "an like '" + num + "%' and ";
		}
	}
	if (flztggdate != "") {
		if(flzt ==""){
			str = str + "slad = '" + flztggdate + "' ";
		}else{
			str = str + "slad = '" + flztggdate + "' and ";
		}	
	}	
	if (flzt != "") {
		str = str + "ls like '" + flzt + " '";
	}
		str_leng = str.length;
	
	if (str_leng == 0) {
		str = "";
	} 
	document.getElementById('searchword').value = str;
	alert(str);
	if (str == "") {
		alert("检索表达式不能为空");
		return false;
	}
	document.form1.submit();
}


</script>

<body>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">检索历史 </font> &gt; 检索历史 </td>
  </tr>
</table>
<form name=form1 action="zgjs_falv_act.jsp" method="post" target="_self" language="javascript" onsubmit="return formsubmit();">
<br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="center" class="tab_tit">法律状态检索 </td>
  </tr>
</table>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="45" valign="middle" bgcolor="e1eef7"><table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="89%">申请专利号：
          <input type="text" name="an" id="an" style="width:110px;" />
         <span class="text_flzt"> 示例：88105882.3</span> 
&nbsp;&nbsp;&nbsp;法律状态公告日:
<input type="text" name="slad" id="slad" style="width:100px;" />
<span class="text_flzt">示例：&nbsp;1992.8.12</span> &nbsp;&nbsp;法律状态:    
<input type="text" name="ls" id="ls" style="width:80px;" />
<span class="text_flzt">示例：公开  </span>        
<img src="../images/search.jpg" width="58" height="28" align="absmiddle" onclick="formsubmit();"/>
<input type=hidden id="searchword" name="searchword">
</td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
</br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#88B0DD">

  <tr bgcolor="#9FBFE3">
    <td height="25" class="listtit"><div align="center" >关于专利检索系统法律状态说明</div>      </td>
  </tr>
 
  <tr>
    <td height="25" bgcolor="#E8F3FF"  class="listd" align="left" style="padding:10px 30px; font-size:14px; line-height:180%;">本检索系统的专利申请（专利）的状态信息主要来源于国家知识产权局出版的发明、实用新型和外观设计专利公报。由于专利申请（专利）的法律状态发生变化时，专利公报的公布及检索系统登录信息存在滞后性的原因，该检索系统的法律状态信息仅供参考。需要准确的法律状态信息时，请向国家知识产权局专利局请求出具专利登记簿副本，查询其法律状态。 

法律状态信息项目主要有公开、实质审查请求生效、审定、授权、专利权的主动放弃、专利权的自动放弃、专利权的视为放弃、专利权的终止、专利权的无效、专利权的撤销、专利权的恢复、权利的恢复、保护期延长、专利申请的驳回、专利申请的撤回、专利权的继承或转让、变更、更正等。 

</td>
  </tr>
</table>

</body>
</html>

