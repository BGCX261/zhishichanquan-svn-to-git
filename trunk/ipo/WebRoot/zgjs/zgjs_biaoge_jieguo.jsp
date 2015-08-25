<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ejoysoft.jiansuo.*,java.util.*"%>
<%@ include file="../include/jsp/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>无标题文档</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="../css/main.css" rel="stylesheet" type="text/css" />
		<style type="text/css"></style>
		<script src="../include/js/SimpleTable.js"></script>
		<script src="../include/js/hyjs-jieguo.js"></script>
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
//选中后表格变色
	function hLight(obj, box) {
		alert("PPPP");
		var c = "#BBD7FF";
		if (obj.checked)
			box.style.backgroundColor = c;
		else
			box.style.backgroundColor = "";
		
	}
	var Flag=true;
	function Select() 
	{
		
   		 for (var i=0;i<document.getElementsByName('record').length;i++)
    	{
      		 var e = document.getElementsByName('record')[i];
       		 if (e.name == 'record')
    	 		  e.checked=Flag;
   			 }
   			 		Flag=!Flag;
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
	</head>
	
	<body>
		<form action="zgjs_biaoge_jieguo.jsp" name="pageForm" method="post">
			<input type="hidden" id="pageNo1" name="pageNo1" value="1" />

		</form>
		<table width="97%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="30">
					<img src="../images/ri_list.jpg" width="14" height="14"
						align="absbottom" />
					&nbsp;您现在所在的位置：
					<font color="#0e7cc9">中国专利检索</font> &gt; 表格检索
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
				<table width="97%" border="0" align="center" cellpadding="0"
					cellspacing="0" >
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td height="26" colspan="4" bgcolor="#FEFFE8" class="t1">
										&nbsp;&nbsp;
										<%
											Patent pt = new Patent();
											UnescapeStr us = new UnescapeStr();
											FiledStr fs = new FiledStr();
											List<Patent> pts = new ArrayList<Patent>();
											//获取检索方法中sql语句条件
											String twhere = (String) globa.session.getAttribute("twhere");
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
	
											for (int i = 0; i < strdb.length; i++) {
												table = strdb[i];
												count = pt.count(table, twhere);
												if (table.equals("fmzl_ab")) {
													ZWtable = "发明专利";
												}
												if (table.equals("syxx_ab")) {
													ZWtable = "实用新型";
												}
												if (table.equals("wgzl_ab")) {
													ZWtable = "外观设计";
												}
												if (table.equals("fmsq_ab")) {
													ZWtable = "发明授权";
												}
										%>
	
										<img src="images/mbi_014.gif" width="16" height="16" />
										<input name="button" type="button" class="fieldbuttonnav"
											onclick="return ShowChannelRecord('<%=table%>|<%=count%>');"
											value="<%=ZWtable%>" />
										(<%=count%>)&nbsp;&nbsp;
										
									</td>
									<%} %>
								</tr>
							</table>
						</td>
					</tr>
	
					<tr>
						<td height="120" valign="top">
							<div  style="overflow-x: scroll; width:1150px; height: 260px;">
							<table width="100%"  border="0" align="center" cellpadding="0"
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
									<td height="25" width="24"></td>
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
								countNumber += count;
								for (int i = 0; i < strdb.length; i++) {
									table = strdb[i];
									if (table.equals("fmzl_ab")) {
										ZWtable = "发明专利";
									}
									if (table.equals("syxx_ab")) {
										ZWtable = "实用新型";
									}
									if (table.equals("wgzl_ab")) {
										ZWtable = "外观设计";
									}
									if (table.equals("fmsq_ab")) {
										ZWtable = "发明授权";
									}
									List<Patent> pts1 = pt.showFY(table, twhere, pageNum);
										int m=0;
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
	
	
				</table>
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
					<tr align=middle valign="middle" class="bottom_sm">
						<td height="25" align="center" bgcolor="#DFEAF2">
							<font color="#214263" size=2>
								<a href="javascript:Select()">全选</a>&nbsp;|&nbsp;
								<a href="javascript:Print()">打印文摘</a>&nbsp;|&nbsp;
								<a href="javascript:Download('1')">下载文摘</a>&nbsp;|&nbsp;
								<a href="javascript:DownloadTIF()">批量下载说明书</a>&nbsp;|&nbsp;
								<a href="javascript:savehistory()">放入收藏夹</a>&nbsp;|&nbsp;
								<a href="#" onclick="javascript:openModalwin()">设定显示字段</a>
							</font>
						</td>
					</tr>
					<tr>
						<td height="25" colspan="2" align="center" class="STYLE4">
							<form name="form1" action="zgjs_biaoge.jsp" method="post">
								<!-- 用到的隐藏域 -->
								<input type="hidden" name="flag" value="open" />
								<input type="hidden" name="secondsearch" value="" />
								<input type="hidden" name="filtersearch" value="" />
								<input type="hidden" name="where" value="<%=twhere%>" />

								<span class="fieldbut"> <a href="zgjs_biaoge.jsp?t=null"
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
										<form method="post" action="zgjs_biaoge_jieguo.jsp"
											name="form2a" onsubmit="return preparesw(this)">

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
														<!-- 自己设置的 -->
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