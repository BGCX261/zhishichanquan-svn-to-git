<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="../include/jsp/head.jsp"%>
<%
	String where = globa.request.getParameter("where");
	String[] strdb = (String[]) globa.session.getAttribute("strdb");
	String flag = globa.request.getParameter("flag");
	boolean[] tb = new boolean[13];
	String[] tbNames = new String[]{"Uspatent","Jppatent","Gbpatent","Depatent","Frpatent"
			,"Eppatent","Wopatent","Chpatent","Twpatent","Hkpatent","Krpatent","Rupatent"
			,"Aspatent"};
	if (flag != null && flag.equals("open")) {
		String table = "";
		String tbName = "";
		for (int i = 0; i < strdb.length; i++) {
			table = strdb[i];
			tbName = tbNames[i];
			if (table.equals(tbName)) {
				tb[i] = true;
			}else{
				tb[i] = false;
			}
		}
	}
	System.out.println("where---" + where + "------flag--" + flag);
%>
</html><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<Script language=javascript src="../include/js/SimpleTable.js"></Script>
<style type="text/css"></style>


<script type="text/javascript">
function Click(str) {
	var obj = document.getElementById('txtComb').value;
	insertItem(obj, str);
}
function Click1(str) {
	var obj = document.getElementById('txtComb').value;
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
	for(var i=0 ; i<<%=tb.length%>;i++){
		<%int j=0;%>
		if(<%=tb[j]%>){
			document.loginform.strdb<%=j%>.checked= true;
		}else{
			document.loginform.strdb<%=j%>.checked= false;
		}
		<%j++;%>
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
</head>
<body onload="checked()">
<form name="loginform" action="hyjs_biaoge_act.jsp" method="post" target="_self" onsubmit="return formsubmit('document.loginform','1')">
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">国外及港澳台专利检索</font> &gt; 表格检索 </td>
  </tr>
</table>
<br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="center" class="tab_tit">表格检索 </td>
  </tr>
</table><table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td>
														<table width="100%" border="0" cellspacing="0" cellpadding="0" class="listtit2">
															<tr>
															  <td>
															<!--  		<input type="hidden" value="" name="channelid">-->

																	<input type="checkbox" value="Uspatent" id="strdb1" name="strdb"
																		checked>
																	<label for="strdb1" style="cursor: hand">
																		美国																	</label>

																	<input type="checkbox" value="Jppatent" id="strdb2" name="strdb"
																		checked>
																	<label for="strdb2" style="cursor: hand">
																		日本																	</label>

																	<input type="checkbox" value="Gbpatent" id="strdb3" name="strdb"
																		checked>
																	<label for="strdb3" style="cursor: hand">
																		英国																	</label>

																	<input type="checkbox" value="Depatent" id="strdb4" name="strdb"
																		checked>
																	<label for="strdb4" style="cursor: hand">
																		德国																	</label>

																	<input type="checkbox" value="Frpatent" id="strdb5" name="strdb"
																		checked>
																	<label for="strdb5" style="cursor: hand">
																		法国																	</label>

																	<input type="checkbox" value="Eppatent" id="strdb6" name="strdb"
																		checked>
																	<label for="strdb6" style="cursor: hand">
																		欧洲																	</label>

																	<input type="checkbox" value="Wopatent" id="strdb7" name="strdb"
																		checked>
																	<label for="strdb7" style="cursor: hand">
																		WIPO																	</label>

																	<input type="checkbox" value="Chpatent" id="strdb8" name="strdb"
																		checked>
																	<label for="strdb8" style="cursor: hand">
																		瑞士																	</label>

																	<input type="checkbox" value="Twpatent" id="strdb9" name="strdb"
																		checked>
																	<label for="strdb9" style="cursor: hand">
																		台湾省																	</label>

																	<input type="checkbox" value="Hkpatent" id="strdb10" name="strdb"
																		checked>
																	<label for="strdb10" style="cursor: hand">
																		香港特区																	</label>

																	<input type="checkbox" value="Krpatent" id="strdb11" name="strdb"
																		checked>
																	<label for="strdb11" style="cursor: hand">
																		韩国																	</label>

																	<input type="checkbox" value="Rupatent" id="strdb12" name="strdb"
																		checked>
																	<label for="strdb12" style="cursor: hand">
																		俄罗斯																	</label>

																	<input type="checkbox" value="Aspatent " id="strdb13" name="strdb"
																		checked>
																	<label for="strdb14" style="cursor: hand">
																		东南亚																	</label>

																	<input name="btnSelect" type="button" value="取消"  class="ipt_esc" onclick="Select(document.loginform,'strdb');">
																	
															<tr>
														</table>

													</td>
												</tr>
												<tr>
													<td class="t2">
														&nbsp;&nbsp;
														<input type="checkbox" name="secondsearch" value="ON"
															onclick="document.loginform.filtersearch.checked=false"
															disabled id="c1" style="cursor: hand" class="search_checkbox">
														<label for="c1" style="cursor: hand">
															二次检索
														</label>
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="checkbox" name="filtersearch" value="ON"
															onclick="document.loginform.secondsearch.checked=false"
															disabled id="c2" style="cursor: hand" class="search_checkbox">
														<label for="c2" style="cursor: hand">
															过滤检索
														</label>
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="checkbox" name="synonymous" value="ON"
															id="c3" style="cursor: hand" class="search_checkbox">
														<label for="c3" style="cursor: hand">
															同义词检索
														</label>
														&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="checkbox" name="savesearchword" value="ON"
															id="c4" style="cursor: hand" class="search_checkbox">
														<label for="c4" style="cursor: hand">
															保存检索表达式
														</label>
														&nbsp;&nbsp;&nbsp;&nbsp;
														<span> &nbsp;&nbsp;排序： <select size="1"
																id="sortcolumn" name="sortcolumn">
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
															</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<select id="R1" name="R1">
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
														<TABLE width="100%" border=0 align="center" cellPadding=2 cellSpacing=0  class="t1">
															<TBODY>
																<TR bgColor=#ffffff>
  <TD UNSELECTABLE="On" align=left width="11%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="Click('A');"
																		style="cursor: hand">
																	&nbsp;&nbsp;<input type="button" class="tablebutton" value="A: 专 利 号 " />																  
																		</TD>
																<TD width="20%" height=32>
<INPUT id="txtA" name="pn" size="20%"  class="tab_ipt" alt="&nbsp;&nbsp;&nbsp;&nbsp;专利号字段检索支持<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符,字段内各检索词之间进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、输入完整专利号，如键入：<B><font color=red>CH694421</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知专利号前五位为CH69442，应键入：<B><font color=red>CH69442%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知专利号中间几位为69442，应键入：<B><font color=red>%69442%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、已知专利号不连续的几位为69和21，应键入：<B><font color=red>%69%21%</font></B>">																	
																  </TD>
<TD UNSELECTABLE="On" align=center width="11%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="Click('B');" style="cursor: hand">                                                                    
															<input type="button" class="tablebutton" value="B: 申请号 " />	
																</TD>
																	<TD width="20%" height=32>
<INPUT id="txtB" name="an" size="20%"  class="tab_ipt"  alt="&nbsp;&nbsp;&nbsp;&nbsp;申请号字段检索支持<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符,字段内各检索词之间进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、输入完整申请号，如键入：<B><font color=red>CH20010000254</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知申请号前五位为CH20010，应键入：<B><font color=red>CH20010%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知申请号中间几位为1000025，应键入：<B><font color=red>%1000025%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、已知申请号不连续的几位为CH2001和254，应键入：<B><font color=red>%CH2001%254%</font></B>">																	
																  </TD>
<TD UNSELECTABLE="On" align=left width="11%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="Click('C');" style="cursor: hand">
																	&nbsp;&nbsp;<input type="button" class="tablebutton" value="C: 申请日 " />
																	</TD>
																	<TD  height=32>
<input id="txtC" name="ad" size="20%" class="tab_ipt" alt="&nbsp;&nbsp;&nbsp;&nbsp;申请日由年、月、日三部分组成，模糊部分可直接略去（不用模糊字符）。<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、申请日为2002年01月01日，，可键入：<B><font color=red>20020101</font></B>或<B><font color=red>2002.01.01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、申请日为2002年01月，可键入：<B><font color=red>200201</font></B>或<B><font color=red>2002.01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、申请日为2002年某月01日，可键入：<B><font color=red>2002..01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、申请日为某年01月01日，可键入：<B><font color=red>.01.01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;5、检索申请日为从2002年到2003年的信息，可键入：<B><font color=red>2002 to 2003</font></B>" />																
																	</TD>
																</TR>
																<TR bgColor=#ffffff>					

<TD UNSELECTABLE="On" align="left" width="13%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="Click('D');" style="cursor: hand">&nbsp;
												<input type="button" class="tablebutton" value="D: 公开(公告)日 " />
																	</TD>
																	<TD height=32>
 <INPUT id="txtD" name="pd"   class="tab_ipt" size="20%" alt="&nbsp;&nbsp;&nbsp;&nbsp;公布日由年、月、日三部分组成，模糊部分可直接略去（不用模糊字符）。<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、公布日为2004年01月08日，，可键入：<B><font color=red>20040101</font></B>或<B><font color=red>2004.01.08</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、公布日为2004年01月，可键入：<B><font color=red>200401</font></B>或<B><font color=red>2004.01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、公布日为2004年某月01日，可键入：<B><font color=red>2004..01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、公布日为某年01月01日，可键入：<B><font color=red>.01.01</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;5、检索公布日为从2002年到2003年的信息，可键入：<B><font color=red>2002 to 2003</font></B>">																	
 																	</TD>
 <TD UNSELECTABLE="On" align=center width="11%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="Click('E');" style="cursor: hand">&nbsp;											
												<input type="button" class="tablebutton" value="E: 名　称 " />												
																	</TD>
																	<TD height=32>
<INPUT size="20%" id="txtE"   class="tab_ipt" name="ti" alt="&nbsp;&nbsp;&nbsp;&nbsp;名称字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知名称中包含computer，可键入：<B><font color=red>computer</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知名称中包含computer和System，可键入：<B><font color=red>computer and system</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知名称中包含computer或system，可键入：<B><font color=red>computer or system</font></B>">
</TD>
<TD UNSELECTABLE="On" align=left width="14%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="Click('F');" style="cursor: hand">&nbsp;&nbsp;
																	<input type="button" class="tablebutton" value="F: 摘　要 " />				 	
																	</TD>
																	<TD height=32>
<INPUT size="20%" id="txtF" class="tab_ipt"  name="abst" alt="&nbsp;&nbsp;&nbsp;&nbsp;摘要字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知摘要中包含computer，可键入：<B><font color=red>computer</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知摘要中包含computer和System，可键入：<B><font color=red>computer and system</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知摘要中包含computer或system，可键入：<B><font color=red>computer or system</font></B>">
</TD>
																</TR>
																<TR bgColor=#ffffff>
																	<TD UNSELECTABLE="On" align=left width="13%" height=32
																		background="../images/index_11.gif"
																		title="点击在组合逻辑检索中加入此字段代码" onClick="Click('G');"
																		style="cursor: hand">
																	&nbsp;	
																		<input type="button" class="tablebutton" value="G: 主分类号 " />
																	</TD>																													
																
																	<TD height=32>
									 <INPUT id="txtG" name="pic" class="tab_ipt"  size="20%" alt="&nbsp;&nbsp;&nbsp;&nbsp;同一专利申请案具有若干个分类号时，其中第一个称为主分类号。主分类号可实行模糊检索。模糊部分应使用<B><font color=red>%</font></B>代替。 <BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知主分类号为A43B5/04，应键入：<B><font color=red>A43B5/04</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知主分类号起首部分为A43B5，应键入：<B><font color=red>A43B5%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知主分类号中包含B5/04，应键入：<B><font color=red>%B5/04%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、已知主分类号中包含B5和04，应键入：<B><font color=red>%B5%04</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;5、若检索主分类号为A43B5/04或A01N43/56，应键入：<B><font color=red>A43B5/04 or A01N43/56</font></B>'" value="">
																  </TD>

																  <TD UNSELECTABLE="On" align=center width="11%" height=32
																		background="../images/index_11.gif"
																		title="点击在组合逻辑检索中加入此字段代码" onClick="Click('H');"
																		style="cursor: hand">
																		<input type="button" class="tablebutton" value="H: 分类号 " />																  
																		</TD>
																	<TD height=32>
																  <INPUT size="20%" id="txtH" class="tab_ipt"  name="sic" alt="&nbsp;&nbsp;&nbsp;&nbsp;专利申请案的分类号可由《国际专利分类表》查得。主分类号字段支持模糊检索。模糊部分应使用<B><font color=red>%</font></B>代替。 <BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知分类号为A43B5/04，应键入：<B><font color=red>A43B5/04</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知分类号起首部分为A43B5，应键入：<B><font color=red>A43B5%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知分类号中包含B5/04，应键入：<B><font color=red>%B5/04%</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;4、已知分类号中包含B5和04，应键入：<B><font color=red>%B5%04</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;5、若检索分类号为A43B5/04或A01N43/56，应键入：<B><font color=red>A43B5/04 or A01N43/56</font></B>">
																  </TD>
<TD UNSELECTABLE="On" align=left width="14%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="Click('I');" style="cursor: hand">&nbsp;&nbsp;
																		<input type="button" class="tablebutton" value="I: 申请(专利权)人 " />  	
																		 </TD>
																	<TD height=32>
																  <INPUT size="20%" id="txtI" class="tab_ipt"  name="pa" alt="&nbsp;&nbsp;&nbsp;&nbsp;申请（专利权）人字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知申请（专利权）人为LANGE INT SA，应键入：<B><font color=red>LANGE INT SA</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知申请（专利权）人中包含BONNY PHILIPPE和SINGY ALEXANDRE，应键入：<B><font color=red>BONNY PHILIPPE and SINGY ALEXANDRE</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知申请（专利权）人中包BONNY PHILIPPE或SINGY ALEXANDRE，应键入：<B><font color=red>BONNY PHILIPPE or SINGY ALEXANDRE</font></B>">
																  
																  </TD>
																</TR>
																<TR bgColor=#ffffff>

																	<TD UNSELECTABLE="On" align=left width="13%" height=32
																		background="../images/index_11.gif"
																		title="点击在组合逻辑检索中加入此字段代码" onClick="Click('J');"
																		style="cursor: hand">
																	&nbsp;
																	<input type="button" class="tablebutton" value="J: 发明(设计)人 " />	
																	</TD>	
																	<TD height=32>
																  <INPUT size="20%" id="txtJ" class="tab_ipt"  name="inn" alt="&nbsp;&nbsp;&nbsp;&nbsp;发明（设计）人字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知发明（设计）人为LANGE INT SA，应键入：<B><font color=red>LANGE INT SA</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知发明（设计）人中包含BONNY PHILIPPE和SINGY ALEXANDRE，应键入：<B><font color=red>BONNY PHILIPPE and SINGY ALEXANDRE</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知发明（设计）人中包含BONNY PHILIPPE或SINGY ALEXANDRE，应键入：<B><font color=red>BONNY PHILIPPE or SINGY ALEXANDRE</font></B>">
																  </TD>

																  <TD UNSELECTABLE="On" align=center width="11%" height=32
																		background="../images/index_11.gif"
																		title="点击在组合逻辑检索中加入此字段代码" onClick="Click('K');"
																		style="cursor: hand">
																		<input type="button" class="tablebutton" value="K: 主权项 " />																  
																		</TD>
																	<TD height=32>
																  <INPUT size="20%" id="txtK" class="tab_ipt"  name="cl" alt="&nbsp;&nbsp;&nbsp;&nbsp;主权项字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知主权项中包含computer，可键入：<B><font color=red>computer</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知主权项中包含computer和System，可键入：<B><font color=red>computer and system</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知主权项中包含computer或system，可键入：<B><font color=red>computer or system</font></B>">
																  </TD>

																	<TD UNSELECTABLE="On" align="left" width="14%"
																		height=22 background="../images/index_11.gif"
																		title="点击在组合逻辑检索中加入此字段代码" onClick="Click('L');"
																		style="cursor: hand">&nbsp;&nbsp;
																		<input type="button" class="tablebutton" value="L: 优先权" /> 
																	 </TD>
																	<TD height=22 align="left">
																  <INPUT id="txtL" name="pr" class="tab_ipt"  size="20%" alt="&nbsp;&nbsp;&nbsp;&nbsp;优先权字段中包含表示国别的字母和表示编号的数字，支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知专利的优先权属于美国，应键入：<B><font color=red>US</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知专利优先权编号为19990428321，应键入：<B><font color=red>19990428321</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知专利优先权国家为美国且优先权编号为19990428321，应键入：<B><font color=red>US and 19990428321</font></B>">
																  </TD>
                   										      </TR>
																<TR bgColor=#ffffff>
																	<TD UNSELECTABLE="On" align="left" width="13%" 
																		height=32 background="../images/index_11.gif"
																		title="点击在组合逻辑检索中加入此字段代码" onClick="Click('M');"
																		style="cursor: hand">
																	&nbsp;
																	<input type="button" class="tablebutton" value="M: 同族专利" />	
																</TD>
																	<TD colspan="5" height=32>
																		<INPUT id="txtM" name="fa" class="tab_ipt"  size="90%" alt="&nbsp;&nbsp;&nbsp;&nbsp;同族专利项字段支持模糊检索，模糊检索时应尽量选用关键字，以免检索出过多无关文献。模糊部分位于字符串中间时应使用<B><font color=red>?</font></B>代替单个字符,<B><font color=red>%</font></B>代替多个字符，位于字符串起首或末尾时模糊字符可省略。字段内各检索词之间可进行<B><font color=red>and</font></B>、<B><font color=red>or</font></B>运算<BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、已知同族专利项中包含US6354470，可键入：<B><font color=red>US6354470</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;2、已知同族专利项中包含US6354470和GR2000100304，可键入：<B><font color=red>US6354470 and GR2000100304</font></B><BR>&nbsp;&nbsp;&nbsp;&nbsp;3、已知同族专利项中包含US6354470或GR2000100304，可键入：<B><font color=red>US6354470 or GR2000100304</font></B>">
																		</TD>
																</TR>
																<TR bgColor=#E8EEF4>
																	<TD colspan="6">	
																			<TABLE cellspacing="0" cellpadding="0" border="0">
																				<TR>
																					<TD rowspan="2" width="30"></TD>
																					<TD class="tit3">组合逻辑检索：&nbsp;&nbsp;
																						<input UNSELECTABLE="On" id="btnMore" type=button onClick="Click1(' and ');"	value=" and " class="bottom2">
																						<input UNSELECTABLE="On" id="btnMore" type=button onClick="Click1(' or ');"  value=" or " class="bottom2">
																						<input UNSELECTABLE="On" id="btnMore" type=button onClick="Click1(' not ');"  value=" not " class="bottom2">
																						<input UNSELECTABLE="On" id="btnMore" type=button onClick="Click1('(');"  value="(" class="bottom2">
																				        <input UNSELECTABLE="On" id="btnMore" type=button onClick="Click1(')');"value=")" class="bottom2">																					</TD>
																				</TR>
																				<TR>
																					<TD  class="t3">
			<INPUT id="txtComb" name="txtComb" size="67"  alt="&nbsp;&nbsp;&nbsp;&nbsp;组合检索是检索表格中使用的操作对象进行布尔运算式。各操作对象在使用时均代号其字母代号，字母代号是 A 到 R 的字母(为避免混淆，字母O除外)。各操作对象之间可以使用<B><font color=red>and</font></B>、<B><font color=red>or</font></B>及改变运算顺序的 <B><font color=red>(</font></B>和<B><font color=red>)</font></B><BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、<B><font color=red>(A or B) and C</font></B><BR><BR><B>注意：</B>组合检索字段为空时(未在此行输入)，系统会自动将各检索字段之间使用＂逻辑与＂的关系。 ">																					
																					</TD>
																				</TR>
																			</TABLE>														</TD>
																</TR>
																</TBODY>
													</TABLE>				<div align="center">
																			<BR>
																			<input type="hidden" name="FTS" value="0">
																			<INPUT type=submit value=检索 name=submit1 class="subit_2" onclick="txtCombVerify()">
																			<INPUT type=reset value=清除 name=cler1 class="subit_2">
																			</div>
												  </td>
												</tr>
											</table>
</form>
</body>
</html>