<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ejoysoft.jiansuo.*,java.util.*"%>
<%@ include file="../include/jsp/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>无标题文档</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="../css/main.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../include/js/SimpleTable.js">
</script>
		<script type="text/javascript" src="../include/js/hyjs-jieguo.js">
</script>
		<style type="text/css">
<!--
body {
	overflow: hidden;
}
-->
</style>

	</head>
	<script language="javascript">
function TurnPage(pageNo) {
	var countPage = document.getElementById('countPage').value;
	alert(countPage);

	if (pageNo == 0) {
		alert("这已经是第一页！");
	} else if (parseInt(pageNo) > parseInt(countPage)) {
		alert("这已经是最后一页！");
	} else {
		document.getElementById('pageNo1').value = pageNo;
		document.pageForm.submit();
	}

}
function TiaoZhuan() {
	var countPage = document.getElementById('countPage').value;
	var yeshu = document.getElementById('textfield').value;
	if (parseInt(yeshu) < 0 || yeshu == 0
			|| parseInt(yeshu) > parseInt(countPage)) {
		alert("输入不合法！");
	} else {
		document.getElementById('pageNo1').value = yeshu;
		document.pageForm.submit();
	}

}

var Flag = true;
function Select() {

	for ( var i = 0; i < document.getElementsByName('record').length; i++) {
		var e = document.getElementsByName('record')[i];
		if (e.name == 'record')
			e.checked = Flag;
	}
	Flag = !Flag;
}

//选中后表格变色
function hLight(obj, box) {
	var c = "#BBD7FF"
	if (obj.checked)
		box.style.backgroundColor = c
	else
		box.style.backgroundColor = "";
}

function preparesw(obj) {
	if (obj.keyword.value == "" || obj.keyword.value == null) {
		alert("检索内容为空！");
		return false;
	}
	obj.keysearch.value = " " + obj.ziduan.value + " like " + "'%"
			+ obj.keyword.value + "%'";
	return true;
}

//快速搜索通道自动获取选中的文本
var text = "";
function getActiveText(e) {
	text = (document.all) ? document.selection.createRange().text : document
			.getSelection();
	document.form2a.keyword.value = text;
	return true;
}
document.onmouseup = getActiveText;
if (!document.all)
	document.captureEvents(Event.MOUSEUP);
</script>
	<body>
		<form action="hyjs_biaoge_jieguo.jsp" name="pageForm" method="post">
			<input type="hidden" id="pageNo1" name="pageNo1" value="1" />

		</form>

		<table width="97%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="30">
					<img src="../images/ri_list.jpg" width="14" height="14"
						align="absbottom" />
					&nbsp;您现在所在的位置：
					<font color="#0e7cc9">海外及港澳台专利检索</font> &gt; 表格检索
				</td>
			</tr>
		</table>
		<br>
			<table width="97%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="30" align="center" class="tab_tit">
						表格检索
					</td>
				</tr>
			</table>
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="26" colspan="4" background="../images/index_05.gif">
									<%
										Patent pt = new Patent();
										UnescapeStr us = new UnescapeStr();
										FiledStr fs = new FiledStr();
										List<Patent> pts = new ArrayList<Patent>();
										//获取检索方法中sql语句条件
										String twhere = (String) globa.session.getAttribute("twhere");
										
										System.out.println("aaaaaaaaaaaaaaa"+twhere);
										String[] strdb = (String[]) globa.session.getAttribute("strdb");
										String sort = (String) globa.session.getAttribute("sort");
										String table = "";
										String ZWtable = "";

										//快速检索通道条件转换
										String ks = request.getParameter("keysearch");
										if (ks != null && !ks.equals("")) {
											twhere = ks;
										}

										int pageNum = 0;//前一页的rownum最大值
										int count = 0;//每张表的记录数
										int countNumber = 0;//所有表的记录总数
										int pageNo = 1;
										String nn = request.getParameter("pageNo1");
										if (nn != null) {
											pageNo = Integer.parseInt(nn);
										} else {
											pageNo = 1;
										}
										if (pageNo < 1) {
											pageNo = 1;
										}
										pageNum = pageNo * 10 - 10;
										System.out.println(pageNum
												+ "===========================================");
									%>
									<td height="30" align="center" nowrap
										background="../images/index_05.gif">
										<span class="style2">按国家或地区分别查看检索结果:</span>
										<select name="select">
											<%
												for (int i = 0; i < strdb.length; i++) {
													table = strdb[i];
													count = pt.count(table, twhere);

													if (table.equals("Uspatent")) {
														ZWtable = "美国";
													}
													if (table.equals("Jppatent")) {
														ZWtable = "日本";
													}
													if (table.equals("Gbpatent")) {
														ZWtable = "英国";
													}
													if (table.equals("Depatent")) {
														ZWtable = "德国";
													}
													if (table.equals("Frpatent")) {
														ZWtable = "法国";
													}
													if (table.equals("Eppatent")) {
														ZWtable = "欧洲";
													}
													if (table.equals("Wopatent")) {
														ZWtable = "WIPO";
													}
													if (table.equals("Chpatent")) {
														ZWtable = "瑞士";
													}
													if (table.equals("Twpatent")) {
														ZWtable = "台湾省";
													}
													if (table.equals("Hkpatent")) {
														ZWtable = "香港特区";
													}
													if (table.equals("Krpatent")) {
														ZWtable = "韩国";
													}
													if (table.equals("Rupatent")) {
														ZWtable = "俄罗斯";
													}
													if (table.equals("Aspatent")) {
														ZWtable = "东南亚";
													}

													countNumber += count;
											%>
											<option value="" selected>
												全部(<%=countNumber%>)
											</option>
											<option value='18'><%=ZWtable%>(<%=count%>)
											</option>
											<%
												}
											%>
										</select>
									</td>
							</tr>
						</table>



						<tr>
							<td height="120" valign="top">
								<div  style="overflow-x: scroll; width:1150px; height: 260px;">
									<table width="100%" border="0" align="center" cellpadding="0"
										cellspacing="0" class="t3">
										<%
								Cookie[] cookies = globa.request.getCookies();
								String tdlist = "";
								String timelist = "";
								String[] fileds = null;
								String filed = "";
								String filed1 = "";
								System.out.println(",,,,,,,,,,,,,,,,,,,,,,"+cookies.length);
								if(cookies.length!=0){
							        for(int j=0;j<cookies.length;j++){
							            if("CNDisplayCookies".equals(cookies[j].getName())){
							            	tdlist = cookies[j].getValue();
							                System.out.println("CNDisplayCookies-->"+tdlist);
							                tdlist = us.unescape(tdlist);
									       	fileds = tdlist.split("#");
							            }else{
							            	fileds = new String[]{"申请（专利）号","主分类号","名称"}; 
							            }
										if("expires".equals(cookies[j].getName())){
							            	
							                timelist = cookies[j].getValue();
							                System.out.println("expires-->"+timelist);
							            }
							        }
							       
							     }
								
								%>
										<tr>
											<td height="25" nowrap="nowrap" align="center"
												background="../images/sys_bg3.gif" class="listtit">
												<font size="2" color="#000000"></font>
											</td>
									<% 
									for(int k = 0;k<fileds.length;k++){
										filed = fileds[k];
										System.out.println(filed);
										if(k==0){
											filed1 = fileds[0];
										}
									%>
									<td height="25" align="center" background="images/sys_bg3.gif"
										class="listtit" style="white-space: nowrap">
									<%=filed %>
									</td>
									<%
									}
									%>
										</tr>

										<%
											for (int i = 0; i < strdb.length; i++) {
												table = strdb[i];
												if (table.equals("Uspatent")) {
													ZWtable = "美国";
												}
												if (table.equals("Jppatent")) {
													ZWtable = "日本";
												}
												if (table.equals("Gbpatent")) {
													ZWtable = "英国";
												}
												if (table.equals("Depatent")) {
													ZWtable = "德国";
												}
												if (table.equals("Frpatent")) {
													ZWtable = "法国";
												}
												if (table.equals("Eppatent")) {
													ZWtable = "欧洲";
												}
												if (table.equals("Wopatent")) {
													ZWtable = "WIPO";
												}
												if (table.equals("Chpatent")) {
													ZWtable = "瑞士";
												}
												if (table.equals("Twpatent")) {
													ZWtable = "台湾省";
												}
												if (table.equals("Hkpatent")) {
													ZWtable = "香港特区";
												}
												if (table.equals("Krpatent")) {
													ZWtable = "韩国";
												}
												if (table.equals("Rupatent")) {
													ZWtable = "俄罗斯";
												}
												if (table.equals("Aspatent")) {
													ZWtable = "东南亚";
												}
												List<Patent> pts1 = pt.showFY(table, twhere, pageNum);
												int m = 0;
												for (Patent patent : pts1) {
													m++;
										%>
										<tr id="box0">
									<td height="24" nowrap="nowrap" align="center">
										<input name="record" value="1" onclick="javascript:hLight(this,box0)" type="checkbox" />
									</td>
									<td height="24" style="white-space: nowrap">
										<a href="../gongxiang/RecordFrame.jsp?an=<%=patent.getAn() %>
										&table=<%=table %>&countNumber=<%=countNumber %>&m=<%=m %>">
										<%=patent.getAn()%>
										</a>
									</td>
									<%
										for(int l = 1;l<fileds.length;l++){
											filed = fileds[l];
									%>
									<td height="24" style="white-space: nowrap">
										<%=fs.getFiledValue(filed,patent)%>
									</td>
									<% }%>
									</tr>
										<%
											}
												countNumber += count;
											}
											//一共多少页
											int countPage = 1;
											if (countNumber % 10 != 0) {
												countPage = countNumber / 10 + 1;
											} else {
												countPage = countNumber / 10;
											}
										%>
									</table>
								</div>
							</td>
						</tr>
			</TABLE>
			<input id="countPage" type="hidden" value='<%=countPage%>' />
			<table width="97%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="40" class="STYLE4">
						&nbsp;&nbsp;共有
						<%=countNumber%>条记录，当前第
						<span id="pageNo" style="color: red;"><%=pageNo%></span> /
						<span id="countPage" style="color: red;"><%=countPage%></span> 页
					</td>
					<td>
						<table border="0" align="right" cellpadding="0" cellspacing="0">
							<tr>
								<td width="40">
									<img src="../images/first.gif" onclick="TurnPage('1')"
										width="37" height="15" value="1" />
								</td>
								<td width="45">
									<img src="../images/back.gif"
										onclick="TurnPage('<%=pageNo - 1%>')" width="43" height="15"
										value="" />
								</td>
								<td width="45">
									<img src="../images/next.gif"
										onclick="TurnPage('<%=pageNo + 1%>')" width="43" height="15"
										value="" />
								</td>
								<td width="40">
									<img src="../images/last.gif"
										onclick="TurnPage('<%=countPage%>')" width="37" height="15"
										value="" />
								</td>
								<td width="100">
									<div align="center">
										<span class="STYLE5">转到第 <input id="textfield"
												name="textfield" type="text" size="4"
												style="height: 12px; width: 20px; border: 1px solid #999999;" />
											页 </span>
									</div>
								</td>
								<td width="40">
									<img src="../images/go.gif" width="37" height="15"
										onclick="TiaoZhuan()" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="97%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<TBODY>
					<TR align=middle valign="middle" class="bottom_sm">
						<TD height="25" align="center" bgcolor="#DFEAF2">
							<FONT color="#214263" size=2> <A
								href="javascript:Select()">全选/全不选</A>&nbsp;|&nbsp; <A
								href="javascript:Print()">打印文摘</A>&nbsp;|&nbsp; <A
								href="javascript:Download('1')">下载文摘</A>&nbsp;|&nbsp; <A
								href="javascript:DownloadTIF()">批量下载说明书</A>&nbsp;|&nbsp; <A
								href="javascript:savehistory()">放入收藏夹</A>&nbsp;|&nbsp; <A
								href="#" onClick="javascript:openModalwin()">设定显示字段</A>
							</FONT>
						</TD>
					</TR>
					<tr>
						<td height="25" colspan="2" align="center" class="STYLE4">
							<form name="form1" action="hyjs_biaoge.jsp" method="post">
								<!-- 用到的隐藏域 -->
								<input type="hidden" name="flag" value="open" />
								<input type="hidden" name="secondsearch" value="" />
								<input type="hidden" name="filtersearch" value="" />
								<input type="hidden" name="where" value="<%=twhere%>" />

								<span class="fieldbut"> <a href="hyjs_biaoge.jsp?t=null"
									target="_self">重新检索</a> |&nbsp;
									 <input type="button"
										name="sub" value="二次检索" class="fieldbuttonnav"
										onclick="formsubmit('1');" /> |&nbsp;&nbsp; 
									<input type="button" name="sub1" value="过滤检索" class="fieldbuttonnav"
										onclick="formsubmit('2');" /> 
								</span>
							</form>
						</td>
					</tr>
				</TBODY>
			</table>
			<table width="97%" align="center">
				<tr>
					<td width="97%" valign="middle">
						<fieldset>
							<legend class="STYLE6">
								快速检索通道
							</legend>
							<table width="560">
								<tr>
									<td align="center">
										<form method="post" action="hyjs_biaoge_jieguo.jsp"
											name="form2a" onsubmit="return preparesw(this);">

											在字段
											<select size="1" name="ziduan">
												<option value="ti">
													发明名称
												</option>
												<option value="ab">
													文摘
												</option>
												<option value="cl">
													权利要求
												</option>
											</select>
											中检索：
											<input id="keyword" maxLength="45">
												<input type="submit" value="检索" width="96" height="25">
													&nbsp; <input type="checkbox" name="secondsearch"
														value="ON" id="se">
														<label for="se" class="i" style="cursor: hand">
															在结果中检索
														</label>
														<input type="hidden" name="keysearch" value="" />
										</form>
									</td>
								</tr>
							</table>
						</fieldset>
					</td>
				</tr>
			</table>
	</body>
</html>