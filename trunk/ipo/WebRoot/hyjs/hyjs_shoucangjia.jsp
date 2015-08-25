<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">检索历史 </font> &gt; 检索历史 </td>
  </tr>
</table>
<br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="center" class="tab_tit">检索历史 </td>
  </tr>
</table>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#88B0DD">
  <tr>
    <td height="26" colspan="4" bgcolor="#FEFFE8" class="t1"><div style=" float:right; text-align: center; width:300px;">只能保存500条信息（超过记录会自动删除）</div>

      <div style=" float:left; text-align:left; width:260px;">&nbsp;&nbsp;以下收藏记录按收藏时间倒排序</div></td>
  </tr>
  <tr bgcolor="#9FBFE3">
    <td width="15%" height="25" class="listtit"><div align="center">序号</div></td>
    <td width="24%" class="listtit"><div align="center">申请（专利）号</div></td>
    <td width="49%" class="listtit"><div align="center">名称</div></td>
    <td width="12%" class="listtit"><div align="center">&nbsp;</div></td>
  </tr>
  <form name="favoriteList" id="favoriteList">
    <input type="hidden" name="act"/>
    <input type="hidden" name="id"/>
  </form>
  <form method="post" name="SingleDetail" target="_blank" id="SingleDetail">
    <input type="hidden" name="channelid" />
    <input type="hidden" name="an" />
    <input type="hidden" name="pn" />
    <input type="hidden" name="sf" />
    <input type="hidden" name="st" />
  </form>
  <tr>
    <td height="25" bgcolor="#E8F3FF"  class="listd" colspan="4" align="left">您的收藏夹中没有已保存的检索结果</td>
  </tr>
</table>
<div align="center">
<br>
</div>
</body>
</html>
