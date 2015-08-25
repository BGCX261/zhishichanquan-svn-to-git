<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest;"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>中国专利检索--逻辑检索</title>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<script language=javascript src="js/hyjs-logic-y.js">
	</script>
	<script type="text/javascript">
		function insertAtCaret(insertNode){
			
			var insertValue = insertNode.value;
			var textArea = document.getElementById("txtSearchWord");
			if(textArea==""){
				textArea.value=insertValue;
			}else if(textArea!=""){
				textArea.value+=insertValue;
			}
			alert(textArea.value);
			}
		
		function ShowMore(btn){

			var extendNode = document.getElementById("extend");
			if(btn.src="../images/btnShow.gif" && extendNode.style.display=="none"){
				extendNode.style.display="inline";
				btn.src="../images/btnHide.gif";
				btn.alt="点击隐藏运算符";
			}else if(btn.src="../images/btnHide.gif" && extendNode.style.display=="inline"){
				extendNode.style.display="none";
				btn.src="../images/btnShow.gif";
				btn.alt="点击显示更多运算符";
			}
		}
		
	</script>
		<link href="css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<table width="100%" height="80%" border="0" cellspacing="0" cellpadding="0">
		<form name="loginform" action="zgjs_luoji_act.jsp" method="post" target="_self" language=javascript>
        <td valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<div align="center">
									<img src="../images/luoji.gif" width=288 height=20 alt="">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="43" background="../images/index_07.gif" class="t1"
											nowrap>
											<div align="left">
												&nbsp;

												<input type="checkbox" value="fmzl_ab" name="strdb" checked
													id="channel14" style="cursor: hand">
												<label for="channel14" style="cursor: hand">
													发明专利
												</label>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" value="wgzl_ab" name="strdb" checked
													id="channel16" style="cursor: hand">
												<label for="channel16" style="cursor: hand">
													外观设计
												</label>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" value="syxx_ab" name="strdb" checked
													id="channel15" style="cursor: hand">
												<label for="channel15" style="cursor: hand">
													实用新型
												</label>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" value="fmsq_ab" name="strdb"
													id="channel17" style="cursor: hand">
												<label for="channel17" style="cursor: hand">
													发明授权
												</label>
												&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
										</td>
									</tr>
									<tr>
										<td height="35" valign="middle"
											background="../images/index_09.gif" class="t1" nowrap>
											<!--二次检索相关 二次检索需要内置的字段，选中表示在上一次检索表达式的基础上进行检索-->
											<input type="checkbox" value="ON" name="secondsearch"
												onclick="document.loginform.filtersearch.checked=false"
												disabled id="c1" style="cursor: hand">
											<label for="secondsearch" style="CURSOR: hand">
												二次检索
											</label>
											<input type="checkbox" name="filtersearch" value="ON"
												onclick="document.loginform.secondsearch.checked=false"
												disabled id="c2" style="cursor: hand">
											<label for="filtersearch" style="CURSOR: hand">
												过滤检索
											</label>
											<input type="checkbox" value="1" name="synonymous"
												id="labelsynonymouse" style="CURSOR: hand">
											<label for="labelsynonymouse" style="CURSOR: hand">
												同义词检索
											</label>
											<input type="checkbox" name="savesearchword" value="ON"
												id="savesearchword" style="CURSOR: hand">
											<label for="savesearchword" style="CURSOR: hand">
												保存检索表达式
											</label>


											<select size="1" name="cizi">
												<option value="0" selected>
													按词检索
												</option>
												<option value="2">
													按字检索
												</option>
											</select>
											排序：
											<select size="1" name="sortcolumn">
												<option value="pd">
													公开（公告）日
												</option>
												<option value="pnm">
													公开（公告）号
												</option>
												<option value="ad">
													申请日
												</option>
												<option value="an">
													申请（专利）号
												</option>
												<option value="acd">
													颁证日
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
											</select>
											<select name="R1">
												<option value="desc">
													降序
												</option>
												<option value="asc">
													升序
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<td height="30">
											<TABLE width="100%" border=1 align="center" cellPadding=2
												cellSpacing=0 borderColorLight=#646464
												borderColorDark=#ffffff class="t1">
												<TBODY>
													<TR bgColor=#ffffff>
														<TD align=middle width="20" height=100>
															历史表达式
														</TD>
														<TD>

															<iframe name="HWindow" border="0" marginwidth="0"
																marginheight="0"
																src="zgjs_luoji_HistoryList.jsp?st=0&r=75309409"
																frameborder="No" width="100%" height="100%"
																scrolling="auto"></iframe>
														</TD>
													</TR>
													<TR bgcolor="#D0EAFF">
														<TD>
															&nbsp;
														</TD>
														<TD>
															&nbsp;
														</TD>
													</TR>
													<TR bgcolor="#D0EAFF">
														<TD align=middle height="40" width="20">
															检索表达式
														</TD>
														<TD>
															<TABLE width="100%" border=0>
																<TBODY>
																	<TR>
																		<TD align=left >
																			<input  style="width: 850px;height: 66px" id="txtSearchWord" name="txtSearchWord"
																			></input>
																		</TD>
																		<TD align=left>
																			<input type="submit" name=submit1 value="检　索"
																				onclick="return formsubmit()"
																				style="cursor: hand; color: black; background-color: #efefef; font-size: 10pt; width: 60; height: 21; border-style: solid; border-width: 1">
																			<P>
																				<INPUT type=reset value=重　置 name=cler1
																					style="cursor: hand; color: black; background-color: #efefef; font-size: 10pt; width: 60; height: 21; border-style: solid; border-width: 1">
																			</P>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
															<TABLE cellSpacing=0 cellPadding=0 width="100%"
																align=left border=0>
																<TBODY>
																	<TR align=left>
																		<TD valign="middle">
																			<IMG src="../images/and.gif" alt=逻辑与运算符and width="52"
																				height="22" style="CURSOR: hand"
																				onclick=insertAtCaret(this); value=" and ">
																			<IMG src="../images/or.gif" alt=逻辑或运算符or width="42"
																				height="22" style="CURSOR: hand"
																				onclick=insertAtCaret(this); value=" or ">
																			<IMG src="../images/not.gif" alt=逻辑非运算符not width="52"
																				height="22" style="CURSOR: hand"
																				onclick=insertAtCaret(this); value=" not ">
																			<IMG src="../images/left.gif" alt=括号运算符 width="15"
																				height="22" style="CURSOR: hand"
																				onclick=insertAtCaret(this); value=" ( ">
																			<IMG src="../images/right.gif" alt=括号运算符 width="15"
																				height="22" style="CURSOR: hand"
																				onclick=insertAtCaret(this); value=" ) ">
																			<img id="btnMore" border="0" onclick="ShowMore(this)"
																				src="../images/btnShow.gif" alt="点击显示更多运算符"
																				style="cursor: hand">
																		</TD>

																		<TD>
																			<div id="extend" style="display: none">
																				<TABLE>
																					<TR>
																						<TD>
																							<IMG src="../images/xor.gif"
																								alt="逻辑异或运算符xor。<例如>：1.摘要=(变速 xor 装置)；2.摘要=变速 xor 摘要=装置"
																								width="52" height="22" style="CURSOR: hand"
																								onclick=insertAtCaret(this); value=" xor ">
																							<IMG src="../images/adj.gif"
																								alt="属性运算符--两者邻接，次序有关。<例如>：1.摘要=(变速 adj 装置)；2.摘要=变速 adj 摘要=装置"
																								width="52" height="22" style="CURSOR: hand"
																								onclick=insertAtCaret(this); value=" adj ">
																							<IMG src="../images/equ.gif"
																								alt="属性运算符--两者相隔n个字，次序有关(默认相隔10个字)。<例如>：1.摘要=(方法 equ/10 装置)；2.摘要=方法 equ/10 摘要=装置"
																								width="84" height="22" style="CURSOR: hand"
																								onclick=insertAtCaret(this); value=" equ/10 ">
																							<IMG src="../images/nor.gif"
																								alt="属性运算符--两者在n个字之内不能同时出现(默认相隔10个字)。<例如>：1.摘要=(方法 xor/10 装置)；2.摘要=方法 xor/10 摘要=装置"
																								width="84" height="22" style="CURSOR: hand"
																								onclick=insertAtCaret(this); value=" xor/10 ">
																							<IMG src="../images/pre_10.gif"
																								alt="两者相隔至多n个字，次序有关(默认相隔10个字)。<例如>：1.摘要=(方法 pre/10 装置)；2.摘要=方法 pre/10 摘要=装置"
																								width="84" height="22" style="CURSOR: hand"
																								onclick=insertAtCaret(this); value=" pre/10 ">
																						</TD>
																					</TR>
																				</TABLE>
																			</div>
																		</TD>
																		<TD align="right">
																			&nbsp;
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
														</TD>
													</TR>
													<TR bgcolor="#E2F4FF">
														<TD>
															&nbsp;
														</TD>
														<TD>
															&nbsp;
														</TD>
													</TR>
													<TR bgColor=#ffffff>
														<TD align=middle width="20">
															字段名称
														</TD>
														<TD>
															<P>
																<FONT size=2>点击字段代码可直接将字段代码加入检索条件输入框中(字段名称/代码)</FONT>
																<TABLE width="100%" border=1 align=center cellPadding=2
																	cellSpacing=0 borderColorLight=#cccccc
																	borderColorDark=#ffffff class="t1">
																	<TBODY>
																		<TR>
																			<TD align="center">
																				<span title="例：计算机/TI" style="CURSOR: hand"
																					onclick=insertAtCaret(this); value="TI like '%输入内容%'">TI='名称'</span>
																			</TD>
																			<TD align="center">
																				<span title="例：CN02144686%/AN" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="AN like '%输入内容%'">AN='申请（专利）号'</span>
																			</TD>
																			<TD align="center">
																				<span title="例：20040101/AD" style="CURSOR: hand"
																					onclick=insertAtCaret(this); value="AD='输入内容'">AD='申请日'</span>
																			</TD>
																			<TD align="center">
																				<span title="例：CN1387751/PNM" style="CURSOR: hand"
																					onclick=insertAtCaret(this); value="PNM like '%输入内容%'">PNM='公开（公告）号'</span>
																			</TD>
																		</TR>
																		<TR>
																			
																			<TD align="center">
																				<span title="例：20030101/PD" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="PD like '输入内容'">PD='公开（公告）日'</span>
																			</TD>
																			<TD align="center">
																				<span title="例：丁水波/PA" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="PA like '%输入内容%'">PA='申请（专利权）人'</span>
																			</TD>
																			<TD align="center">
																				<span title="例：丁水波/IN" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="INN like '%输入内容%'">INN='发明（设计）人'
																			</TD>
																			<TD align="center">
																				<span title="例：G06F15/16/PIC" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="PIC like '%输入内容%'">PIC='主分类号 '
																			</TD>
																		</TR>
																		<TR>
																			
																			<TD align="center">
																				<span title="例：G06F15/16/SIC" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="SIC like '%输入内容%'">SIC='分类号 '
																			</TD>
																			<TD align="center">
																				<span title="例：鞍山市/AR" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="AR like '%输入内容%'">AR='地址' 
																			</TD>
																			<TD align="center">
																				<span title="例：计算机/AB" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="ABST like '%输入内容%'">ABST='摘要 '
																			</TD>
																			<TD align="center">
																				<span title="例：CN/PR" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="PR like '%输入内容%'">PR='优先权 '
																			</TD>
																		</TR>
																		
																		<TR>
																			<TD align="center">
																				<span title="例：长春科宇/AGC" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="AGC like '%输入内容%'">AGC='专利代理机构 '
																			</TD>
																			<TD align="center">
																				<span title="例：李恩庆/AGT" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="AGT like '%输入内容%'">AGT='代理人 '
																			</TD>
																			<TD align="center">
																				<span title="例：计算机/CL" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="CL like '%输入内容%'">CL='主权项 '
																			</TD>
																			<TD align="center">
																				<span title="例：WO98.20027%/IPN" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="IPN like '%输入内容%'">IPN='国际公布 '
																			</TD>
																		</TR>
																		<TR>
																			
																			<TD align="center">
																				<span title="例：2001.06.16/IPD" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="ACD='输入内容'">ACD='颁证日 '
																			</TD>
																			<TD align="center">
																				<span title="例：85101350.0/DAN" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="DAN like '%输入内容%'">DAN='分案原申请号' 
																			</TD>
																			<TD align="center">
																				<span title="例：11/CO" style="CURSOR: hand"
																					onclick=insertAtCaret(this); align=middle
																					value="CO like '%输入内容%'">CO='国省代码'
																			</TD>
																			<TD align="center">
																				&nbsp;
																			</TD>
																			<TD align="center">
																				&nbsp;
																			</TD>
																		</TR>
																	</TBODY>
																</TABLE>
														</TD>
													</TR>
													<TR bgcolor="#F1F9FF">
														<TD>
															&nbsp;
														</TD>
														<TD>
															&nbsp;
														</TD>
													</TR>
													<!--TR bgColor=#a5dad5> 
                          <TD align=middle bgColor=#ffffff>使用说明</TD>
                          <TD bgColor=#ffffff>1.检索方式一：点击历史表达式，直接检索.<BR>
                            2.检索方式二：输入表达式，可以利用提供的各种运算符进行组合。<BR>
                            3.检索方式三：利用历史表达式的编号进行组合检索。例：（@1 and @2）<BR>
                            4.检索方式四：利用字段的英文代码进行组合检索。例：（APO=998% and IN=林） </TD>
                        </TR-->
											</TABLE>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr>
							<td height="100"></td>
						</tr>

      </table></td>
    <td width="1" bgcolor="#000000"></td>
  </tr></td>
  </form>
</table>
</body>
</html>
