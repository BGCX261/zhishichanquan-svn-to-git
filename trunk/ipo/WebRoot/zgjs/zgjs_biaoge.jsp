<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../include/jsp/head.jsp"%>
<%
	String where = globa.request.getParameter("where");
	String[] strdb = (String[]) globa.session.getAttribute("strdb");
	String flag = globa.request.getParameter("flag");
	boolean[] tb = new boolean[] { false, false, false, false, false };

	if (flag != null && flag.equals("open")) {
		String table = "";
		for (int i = 0; i < strdb.length; i++) {
			table = strdb[i];
			if (table.equals("fmzl_ab")) {
				tb[0] = true;
			}
			if (table.equals("syxx_ab")) {
				tb[1] = true;
			}
			if (table.equals("wgzl_ab")) {
				tb[2] = true;
			}
			if (table.equals("fmsq_ab")) {
				tb[3] = true;
			}
		}
		tb[4] = true;
	}
	System.out.println("where---" + where + "------flag--" + flag);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>中国专利检索--表格检索</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="../css/main.css" rel="stylesheet" type="text/css" />
		<Script src="../include/js/SimpleTable.js"></Script>
	</head>
	<script language="JavaScript">
function Click(str) {
	var obj = document.getElementById('txtComb').value.replace(/\s/gi, '');
	insertItem(obj, str);
}
function Click1(str) {
	var obj = document.getElementById('txtComb').value.replace(/\s/gi, '');
	insertItem1(obj, str);
}
//对二次查询,过滤查询,表选项进行的判断和操作
var ss = '<%=globa.request.getParameter("secondsearch")%>';
var fs = '<%=globa.request.getParameter("filtersearch")%>';

function checked() {
	//二次检索
	if (ss != null && ss == "ON") {
		document.loginform.secondsearch.disabled = false;
		document.loginform.secondsearch.checked = true;

	} else {
		document.loginform.secondsearch.disabled = true;
	}
	//过滤检索
	if (fs != null && fs == "ON") {
		document.loginform.filtersearch.disabled = false;
		document.loginform.filtersearch.checked = true;

	} else {
		document.loginform.filtersearch.disabled = true;
	}
	//表选择
if(<%=tb[0]%>){
		document.loginform.strdb1.checked= true;
	}
	if(<%=tb[1]%>){
		document.loginform.strdb2.checked= true;
	}
	if(<%=tb[2]%>){
		document.loginform.strdb3.checked= true;
	}
	if(<%=tb[3]%>){
		document.loginform.strdb4.checked= true;
	}
	if(!<%=tb[4]%>){
		document.loginform.strdb1.checked= true;
		document.loginform.strdb2.checked= true;
		document.loginform.strdb3.checked= true;
		document.loginform.strdb4.checked= false;
	}
}
function txtCombVerify(){
	if(ss != null && ss == "ON"){
		if("<%=where%>"!="null" && "<%=where%>"!=""){
			document.getElementById("txtComb").value = document.getElementById("txtComb").value+" and "+"<%=where%>";
		}
	}
	else if(fs != null && fs == "ON"){
		if("<%=where%>"!="null" && "<%=where%>"!=""){
			document.getElementById("txtComb").value = document.getElementById("txtComb").value+" and not "+"<%=where%>";
		}
	}
	//document.getElementById("loginform").submit();
	
}
</script>
	<body onload="checked()">
		<form name="loginform" action="zgjs_biaoge_act.jsp" method="post"
			onsubmit="return lformsubmit('document.loginform','1');" target="_self">
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

			<table width="97%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="30" align="center" class="tab_tit">
						表格检索
					</td>
				</tr>
			</table>
			<table width="97%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="listtit2">
							<tr>
								<td>
									<table width="439" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<input type="checkbox" value="fmzl_ab" id="strdb1"
													name="strdb"/>
												<label for="strdb1" style="cursor: hand">
													发明专利
												</label>
											</td>
											<td>
												<input type="checkbox" value="wgzl_ab" id="strdb2"
													name="strdb"/>
												<label for="strdb2" style="cursor: hand">
													外观专利
												</label>
											</td>
											<td>
												<input type="checkbox" value="syxx_ab" id="strdb3"
													name="strdb"/>
												<label for="strdb3" style="cursor: hand">
													实用新型
													</labl>
											</td>
											<td>
												<input type="checkbox" value="fmsq_ab" id="strdb4"
													name="strdb"/>
												<label for="strdb4" style="cursor: hand">
													发明授权
												</label>
											</td>
										</tr>
									</table>
								</td>
								<tr>
						</table>

					</td>
				</tr>
				<tr>
					<td class="t2">
						&nbsp;&nbsp;
						<input type="checkbox" name="secondsearch" value="ON"
							onclick="document.loginform.filtersearch.checked=false" disabled
							id="c1" style="cursor: hand" class="search_checkbox">
							<label for="c1" style="cursor: hand">
								二次检索
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
								name="filtersearch" value="ON"
								onclick="document.loginform.secondsearch.checked=false" disabled
								id="c2" style="cursor: hand" class="search_checkbox">
								<label for="c2" style="cursor: hand">
									过滤检索
								</label>
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
									name="synonymous" value="ON" id="c3" style="cursor: hand"
									class="search_checkbox">
									<label for="c3" style="cursor: hand">
										同义词检索
									</label>
									&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox"
										name="savesearchword" value="ON" id="c4" style="cursor: hand"
										class="search_checkbox">
										<label for="c4" style="cursor: hand">
											保存检索表达式
										</label>
										&nbsp;&nbsp;&nbsp;&nbsp; <span> &nbsp;&nbsp;排序： <select
												size="1" id="sortcolumn" name="sortcolumn">
												<option value="pd">
													公开(公告)日
												</option>
												<option value="pnm">
													公开(公告)号
												</option>
												<option value="ad">
													申请日
												</option>
												<option value="an">
													申请(专利)号
												</option>
												<option value="ti">
													名称
												</option>
												<option value="pic">
													主分类号
												</option>
												<option value="RELEVANCE" selected>
													相关性
												</option>
											</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select id="R1"
												name="R1">
												<option value="desc">
													降序
												</option>
												<option value="asc">
													升序
												</option>
											</select> </span>
					</td>
				</tr>
				<tr>
					<td height="30">
						<TABLE width="100%" border=0 align="center" cellPadding=2
							cellSpacing=0 class="t1">
							<TBODY>
								<TR bgColor=#ffffff>
									<TD UNSELECTABLE="On" align=left width="13%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('A');" style="cursor: hand">
										<input type="button" id="a" class="tablebutton"
											value="A:申     请    号">
									</TD>
									<TD width="20%" height=32>
										<INPUT id="txtA" name="an" size="20%" class="tab_ipt"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;申请号字段检索支持<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符,字段内各检索词之间进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、输入完整申请号，如键入：<B><font color=red>CN02144686.5</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知申请号前五位为02144，应键入：<B><font color=red>CN02144%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知申请号中间几位为2144，应键入：<B><font color=red>%2144%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、已知申请号不连续的几位为021和468，应键入：<B><font color=red>%021%468%</font></B>">
									</TD>
									<TD UNSELECTABLE="On" align=center width="11%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('B');" style="cursor: hand">
										<input type="button" class="tablebutton" value="B:申　请　 日">
									</TD>
									<TD width="20%" height=32>
										<INPUT id="txtB" name="ad" size="20%" class="tab_ipt"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;申请日由年、月、日三部分组成，模糊部分可直接略去（不用模糊字符）。<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、申请日为2002年01月01日，，可键入：<B><font color=red>20020101</font></B>或<B><font color=red>2002.01.01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、申请日为2002年01月，可键入：<B><font color=red>200201</font></B>或<B><font color=red>2002.01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、申请日为2002年某月01日，可键入：<B><font color=red>2002..01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、申请日为某年01月01日，可键入：<B><font color=red>.01.01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;5、检索申请日为从2002年到2003年的信息，可键入：<B><font color=red>2002 to 2003</font></B>">
									</TD>
									<TD UNSELECTABLE="On" align=left width="14%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('C');" style="cursor: hand">
										<input type="button" class="tablebutton" value="C:公 开(公告)号">
									</TD>

									<TD width="22%" height=32>
										<INPUT id="txtC" name="pnm" size="20%" class="tab_ipt"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;公开（公告）号字段支持模糊检索。模糊部分位于公开（公告）号起首或中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符,位于公开（公告）号末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知公开（公告）号为CN1387751，应键入：<B><font color=red>CN1387751</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知公开（公告）号前面几位为CN13877，可键入：<B><font color=red>CN13877%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知公开（公告）号中包含13877，可键入：<B><font color=red>%13877</font></B>">
									</TD>
								</TR>
								<TR bgColor=#ffffff>

									<TD UNSELECTABLE="On" align="left" width="13%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('D');" style="cursor: hand">
										<input type="button" class="tablebutton"
											value="D:公  开 (公 告) 日">
									</TD>
									<TD height=32>
										<INPUT id="txtD" name="pd" class="tab_ipt" size="20%"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;公布日由年、月、日三部分组成，模糊部分可直接略去（不用模糊字符）。<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、公布日为2004年01月08日，，可键入：<B><font color=red>20040101</font></B>或<B><font color=red>2004.01.08</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、公布日为2004年01月，可键入：<B><font color=red>200401</font></B>或<B><font color=red>2004.01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、公布日为2004年某月01日，可键入：<B><font color=red>2004..01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、公布日为某年01月01日，可键入：<B><font color=red>.01.01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;5、检索公布日为从2002年到2003年的信息，可键入：<B><font color=red>2002 to 2003</font></B>">
									</TD>
									<TD UNSELECTABLE="On" align=center width="11%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('E');" style="cursor: hand">
										<input type="button" class="tablebutton" value="E:名　　　 称">
									</TD>
									<TD height=32>
										<INPUT size="20%" id="txtE" class="tab_ipt" name="ti"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;名称字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知名称中包含computer，可键入：<B><font color=red>computer</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知名称中包含computer和System，可键入：<B><font color=red>computer and system</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知名称中包含computer或system，可键入：<B><font color=red>computer or system</font></B>">
									</TD>
									<TD UNSELECTABLE="On" align=left width="14%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('F');" style="cursor: hand">
										<input type="button" class="tablebutton" value="F:摘        要">
									</TD>
									<TD height=32>
										<INPUT size="20%" id="txtF" class="tab_ipt" name="abst"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;摘要字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知摘要中包含computer，可键入：<B><font color=red>computer</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知摘要中包含computer和System，可键入：<B><font color=red>computer and system</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知摘要中包含computer或system，可键入：<B><font color=red>computer or system</font></B>">
									</TD>
								</TR>
								<TR bgColor=#ffffff>
									<TD UNSELECTABLE="On" align=left width="13%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('G');" style="cursor: hand">
										<input type="button" class="tablebutton" value="G:主   分  类  号">
									</TD>
									<TD height=32>
										<INPUT id="txtG" name="pic" class="tab_ipt" size="20%"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;同一专利申请案具有若干个分类号时，其中第一个称为主分类号。主分类号可实行模糊检索。模糊部分应使用<B><font color=red>%</font></B>代替。 <BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知主分类号为A43B5/04，应键入：<B><font color=red>A43B5/04</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知主分类号起首部分为A43B5，应键入：<B><font color=red>A43B5%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知主分类号中包含B5/04，应键入：<B><font color=red>%B5/04%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、已知主分类号中包含B5和04，应键入：<B><font color=red>%B5%04</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;5、若检索主分类号为A43B5/04或A01N43/56，应键入：<B><font color=red>A43B5/04 or A01N43/56</font></B>'"
											value="">
									</TD>

									<TD UNSELECTABLE="On" align=center width="11%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('H');" style="cursor: hand">
										<input type="button" class="tablebutton" value="H:分　类　 号">
									</TD>
									<TD height=32>
										<INPUT size="20%" id="txtH" class="tab_ipt" name="sic"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;专利申请案的分类号可由《国际专利分类表》查得。主分类号字段支持模糊检索。模糊部分应使用<B><font color=red>%</font></B>代替。 <BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知分类号为A43B5/04，应键入：<B><font color=red>A43B5/04</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知分类号起首部分为A43B5，应键入：<B><font color=red>A43B5%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知分类号中包含B5/04，应键入：<B><font color=red>%B5/04%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、已知分类号中包含B5和04，应键入：<B><font color=red>%B5%04</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;5、若检索分类号为A43B5/04或A01N43/56，应键入：<B><font color=red>A43B5/04 or A01N43/56</font></B>">
									</TD>
									<TD UNSELECTABLE="On" align=left width="14%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('I');" style="cursor: hand">
										<input type="button" class="tablebutton" value="I:申请(专利权)人">
									</TD>
									<TD height=32>
										<INPUT size="20%" id="txtI" class="tab_ipt" name="pa"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;申请（专利权）人字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知申请（专利权）人为LANGE INT SA，应键入：<B><font color=red>LANGE INT SA</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知申请（专利权）人中包含BONNY PHILIPPE和SINGY ALEXANDRE，应键入：<B><font color=red>BONNY PHILIPPE and SINGY ALEXANDRE</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知申请（专利权）人中包BONNY PHILIPPE或SINGY ALEXANDRE，应键入：<B><font color=red>BONNY PHILIPPE or SINGY ALEXANDRE</font></B>">
									</TD>
								</TR>
								<TR bgColor=#ffffff>

									<TD UNSELECTABLE="On" align=left width="13%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('J');" style="cursor: hand">
										<input type="button" class="tablebutton"
											value="J:发  明 (设 计) 人">
									</TD>
									<TD height=32>
										<INPUT size="20%" id="txtJ" class="tab_ipt" name="inn"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;发明（设计）人字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知发明（设计）人为LANGE INT SA，应键入：<B><font color=red>LANGE INT SA</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知发明（设计）人中包含BONNY PHILIPPE和SINGY ALEXANDRE，应键入：<B><font color=red>BONNY PHILIPPE and SINGY ALEXANDRE</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知发明（设计）人中包含BONNY PHILIPPE或SINGY ALEXANDRE，应键入：<B><font color=red>BONNY PHILIPPE or SINGY ALEXANDRE</font></B>">
									</TD>

									<TD UNSELECTABLE="On" align=center width="11%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('K');" style="cursor: hand">
										<input type="button" class="tablebutton" value="K:主　权　 项">
									</TD>
									<TD height=32>
										<INPUT size="20%" id="txtK" class="tab_ipt" name="cl"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;主权项字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知主权项中包含computer，可键入：<B><font color=red>computer</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知主权项中包含computer和System，可键入：<B><font color=red>computer and system</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知主权项中包含computer或system，可键入：<B><font color=red>computer or system</font></B>">
									</TD>

									<TD UNSELECTABLE="On" align="left" width="14%" height=22
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('L');" style="cursor: hand">
										<input type="button" class="tablebutton" value="L:地        址">
									</TD>
									<TD height=22 align="left">
										<INPUT id="txtL" name="ar" size="20%" class="tab_ipt"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;地址字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知地址中包含辽宁省鞍山市，可键入：<B><font color=red>辽宁省鞍山市</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知地址中包含辽宁省和鞍山市，可键入：<B><font color=red>辽宁省 and 鞍山市</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知地址中包含鞍山市或德阳市，可键入：<B><font color=red>鞍山市 or 德阳市</font></B>">
									</TD>
								</TR>
								<tr bgColor=#ffffff>

									<TD UNSELECTABLE="On" align=left width="11%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('M');" style="cursor: hand">
										<input type="button" class="tablebutton" value="M:专利 代 理 机构">
									</TD>
									<TD height=32>
										<INPUT id="txtM" name="agc" size="20%" class="tab_ipt"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;专利代理机构字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知专利代理机构中包含长春科宇，可键入：<B><font color=red>长春科宇</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知专利代理机构中包含长春和科宇，可键入：<B><font color=red>长春 and 科宇</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知专利代理机构中包含长春科宇或沈阳科苑，可键入：<B><font color=red>长春科宇 or 沈阳科苑</font></B>">
									</TD>

									<TD UNSELECTABLE="On" align=center width="11%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('N');" style="cursor: hand">
										<input type="button" class="tablebutton" value="N:代　理　 人">
									</TD>
									<TD height=32>
										<INPUT id="txtN" name="agt" size="20%" class="tab_ipt"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;代理人字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知代理人中包含李恩庆，可键入：<B><font color=red>李恩庆</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知代理人中包含李恩庆和马守忠，可键入：<B><font color=red>李恩庆 and 马守忠</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知代理人中包含李恩庆或周秀梅，可键入：<B><font color=red>李恩庆 or 周秀梅</font></B>">
									</TD>

									<TD UNSELECTABLE="On" align="left" width="11%" height=32
										background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
										onClick="Click('P');" style="cursor: hand">
										<input type="button" class="tablebutton" value="P:优   先　 权">
									</TD>
									<TD height=22 align="left">
										<INPUT id="txtP" name="pr" size="20%" class="tab_ipt"
											alt="&nbsp;&nbsp;&nbsp;&nbsp;优先权字段中包含表示国别的字母和表示编号的数字，支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知专利优先权编号为02112242，应键入：<B><font color=red>02112242</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知专利优先权国家为中国且优先权编号为02112242，应键入：<B><font color=red>CN and 02112242</font></B>">
									</TD>
								</TR>
								<tr>
								<td UNSELECTABLE="On" align="left" width="11%" height=32
									background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
									onClick="Click('Q');" style="cursor: hand">
									<input type="button" class="tablebutton" value="Q:国   省  代  码"/>
								</td>
								<TD height=22 align="left">
									<INPUT id="txtQ" name="co" size="20%" class="tab_ipt"
										alt="&nbsp;&nbsp;&nbsp;&nbsp;国省代码字段中包含表示国省的字母和表示编号的数字，支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符。<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知国省代码为江苏(32)，应键入：<B><font color=red>江苏%</font></B>或<B><font color=red>%32%</font></B><BR>">
								</TD>

								<TD UNSELECTABLE="On" align="left" width="11%" height=32
									background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码"
									onClick="Click('R');" style="cursor: hand">
									&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
									<input type="button" class="tablebutton" value="R:全 文 检  索">
								</TD>
								<td colspan="5" height=32>
									<input id="txtR" name="txtR" size="20%" class="tab_ipt"
										alt="&nbsp;&nbsp;&nbsp;&nbsp;全文检索是对专利的权利要求书、说明书、说明书附图、附件等字段的全文信息进行检索，支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知全文信息中包含计算机，可键入：<B><font color=red>计算机</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知全文信息中包含计算机和应用，可键入：<B><font color=red>计算机 and 应用</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知全文信息中包含计算机或控制，可键入：<B><font color=red>计算机 or 控制</font></B>">
								</td>
								</tr>
								<TR bgColor=#E8EEF4>
									<TD colspan="6">
										<TABLE cellspacing="0" cellpadding="0" border="0">
											<TR>
												<TD rowspan="2" width="30"></TD>
												<TD class="tit3">
													组合逻辑检索：&nbsp;&nbsp;
													<input UNSELECTABLE="On" id="btnMore" type=button
														onClick="Click1(' and ');" value=" and " class="bottom2">
													<input UNSELECTABLE="On" id="btnMore" type=button
															onClick="Click1(' or ');" value=" or " class="bottom2">
													<input UNSELECTABLE="On" id="btnMore" type=button
																onClick="Click1(' not ');" value=" not " class="bottom2">
													<input UNSELECTABLE="On" id="btnMore" type=button
																	onClick="Click1('(');" value="(" class="bottom2">
													<input UNSELECTABLE="On" id="btnMore" type=button
																		onClick="Click1(')');" value=")" class="bottom2">
												</TD>
											</TR>
											<TR>
												<TD class="t3">
													<INPUT id="txtComb" name="txtComb" size="67"
														alt="&nbsp;&nbsp;&nbsp;&nbsp;组合检索是检索表格中使用的操作对象进行布尔运算式。各操作对象在使用时均代号其字母代号，字母代号是 A 到 R 的字母(为避免混淆，字母O除外)。各操作对象之间可以使用<B><font color=red>and</font></B>、<B><font color=red>or</font></B>及改变运算顺序的 <B><font color=red>(</font></B>和<B><font color=red>)</font></B><BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、<B><font color=red>(A or B) and C</font></B><BR><BR><B>注意：</B>组合检索字段为空时(未在此行输入)，系统会自动将各检索字段之间使用＂逻辑与＂的关系。 ">
												</TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
						<div align="center">
							<br>
								<input type="hidden" name="FTS" value="0"/>
								<input type="submit"  value="检　索" name="submit1" onclick="txtCombVerify()" class="subit_2"/>
								<input type=reset value=清除 name=cler1 class="subit_2"/>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>