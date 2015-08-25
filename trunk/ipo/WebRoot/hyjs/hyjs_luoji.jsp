<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>港澳台及外国专利检索--逻辑检索</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<script language=javascript src="js/hyjs-logic-y.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
<form name="loginform" action="hyjs-jieguo-fr.jsp" method="post" target="_self" language=javascript >    
  <tr> 
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><div align="center"><img src="../images/luoji.gif" width=288 height=20 alt=""></div></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="43" background="../images/index_07.gif" class="t1">
                	
<table border="0" cellpadding="0" cellspacing="0"><tr><td>
<table border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="72">
<input type="checkbox" value="18" id="18" name="strdb"  
	checked ><label for="18" style="cursor:hand">美国</label>
</td>
<td width="72">
<input type="checkbox" value="19" id="19" name="strdb"  
	checked ><label for="19" style="cursor:hand">日本</label>
</td>
<td width="72">
<input type="checkbox" value="20" id="20" name="strdb"  
	checked ><label for="20" style="cursor:hand">英国</label>
</td>
<td width="72">
<input type="checkbox" value="21" id="21" name="strdb"  
	checked ><label for="21" style="cursor:hand">德国</label>
</td>
<td width="72">
<input type="checkbox" value="22" id="22" name="strdb"  
	checked ><label for="22" style="cursor:hand">法国</label>
</td>
<td width="72">
<input type="checkbox" value="23" id="23" name="strdb"  
	checked ><label for="23" style="cursor:hand">欧洲</label>
</td>
<td width="72">
<input type="checkbox" value="24" id="24" name="strdb"  
	checked ><label for="24" style="cursor:hand">WIPO</label>
</td>
<td width="72">
<input type="checkbox" value="25" id="25" name="strdb"  
	checked ><label for="25" style="cursor:hand">瑞士</label>
</td>
<td width="72">
<input type="checkbox" value="5" id="5" name="strdb"  
	checked ><label for="5" style="cursor:hand">台湾省</label>
</td>
<td width="72">
<input type="checkbox" value="6" id="6" name="strdb"  
	checked ><label for="6" style="cursor:hand">香港特区</label>
</td>
<td width="72">
<input type="checkbox" value="26" id="26" name="strdb"  
	checked ><label for="26" style="cursor:hand">韩国</label>
</td>
<td width="72">
<input type="checkbox" value="27" id="27" name="strdb"  
	checked ><label for="27" style="cursor:hand">俄罗斯</label>
</td>
<td width="72">
<input type="checkbox" value="28" id="28" name="strdb"  
	checked ><label for="28" style="cursor:hand">东南亚</label>
</td>

 
</table></td>
<td valign="middle">
<input name="btnSelect" type="button" value="取消" style="cursor:hand;color: black;background-color:#efefef;font-size:10pt;width:42;height:21;border-style:solid;border-width:1" onclick="Select(document.loginform,'strdb');">
</td><tr></table>
</td>
</tr>
<tr> 
<td height="35" valign="middle" background="../images/index_09.gif" class="t1"><div align="left">&nbsp; 
 <!--二次检索相关 二次检索需要内置的字段，选中表示在上一次检索表达式的基础上进行检索-->
<input type="checkbox" value="ON" name="secondsearch" onclick="document.loginform.filtersearch.checked=false"  disabled  id="c1" style="cursor:hand"><label for="secondsearch" style="CURSOR: hand">二次检索</label>
<!--过滤检索相关 选中表示对当前的条件进行非的检索，可以修改name，但是需要修改相应js中-->
<input type="checkbox" name="filtersearch" value="ON"  onclick="document.loginform.secondsearch.checked=false"  disabled  id="c2" style="cursor:hand"><label for="filtersearch" style="CURSOR: hand">过滤检索</label>
<input type="checkbox" value="1" name="synonymous" id="labelsynonymouse" style="CURSOR: hand"><label for="labelsynonymouse" style="CURSOR: hand">同义词检索</label>
<input type="checkbox" name="savesearchword" value="ON" id="savesearchword" style="CURSOR: hand"><label for="savesearchword" style="CURSOR: hand">保存检索表达式</label>　 
&nbsp;&nbsp;排序：
	<select size="1" name="sortcolumn">
    		<option value="公开（公告）日">公开（公告）日</option>
		<option value="公开（公告）号">公开（公告）号</option>
		<option value="申请日">申请日</option>
		<option value="申请（专利）号">申请（专利）号</option>
		<option value="颁证日">颁证日</option>
		<option value="名称">名称</option>
		<option value="主分类号">主分类号</option>
		<option value="RELEVANCE" selected>相关性</option>
  	</select>
  <select name="R1">
  	<option value="-">降序</option>
  	<option value="+">升序</option>
  </select>
 
                  </td>
              </tr>
              <tr> 
                <td height="30"><TABLE width="100%" border=1 align="center" cellPadding=2 cellSpacing=0 borderColorLight=#646464 borderColorDark=#ffffff class="t1">
                      <TBODY>
                        <TR bgColor=#ffffff> 
                          <TD align=middle width="10" height=200>历史表达式 </TD>
                          <TD>
 
<iframe name="HWindow" border="0" marginwidth="0" marginheight="0" src="hyjs_luoji_HistoryList.jsp?st=1&r=91064220" frameborder="No" width="100%" height="100%" scrolling="auto"></iframe>
 </TD>
                        </TR>
                        <TR bgcolor="#D0EAFF"> 
                          <TD>&nbsp;</TD>
                          <TD>&nbsp;</TD>
                        </TR>
                        <TR bgColor=#ffffff> 
                          <TD align=middle width="10" height=40>检索表达式 </TD>
                          <TD> <TABLE width="100%" border=0>
                              <TBODY>
                                <TR> 
                                  <TD align=left><TEXTAREA cols=70 name=txtSearchWord rows="4" onkeydown="confirm()" onfocus="cc()"></TEXTAREA>
                                  </TD>
                                  <TD align=left><input type="submit" name=submit1 value="检　索" onclick="return formsubmit()"  style="cursor:hand;color: black;background-color:#efefef;font-size:10pt;width:60;height:21;border-style:solid;border-width:1">
                                    <P> 
                                      <INPUT type=reset value=重　置 name=cler1 style="cursor:hand;color: black;background-color:#efefef;font-size:10pt;width:60;height:21;border-style:solid;border-width:1">
                                    </P></TD>
                                </TR>
                              </TBODY>
                            </TABLE>
                            <TABLE cellSpacing=0 cellPadding=0 width="100%" align=left border=0>
                              <TBODY>
                                <TR align=left> 
                                  <TD>
                                  <IMG src="../images/and.gif" alt=逻辑与运算符and width="52" height="22" style="CURSOR: hand" onclick=insertAtCaret(this); value=" and ">
                                  <IMG src="../images/or.gif" alt=逻辑或运算符or width="42" height="22" style="CURSOR: hand" onclick=insertAtCaret(this); value=" or ">
                                  <IMG src="../images/not.gif" alt=逻辑非运算符not width="52" height="22" style="CURSOR: hand" onclick=insertAtCaret(this); value=" not ">
                                  <IMG src="../images/left.gif" alt=括号运算符 width="15" height="22" style="CURSOR: hand" onclick=insertAtCaret(this); value=" ( ">
                                  <IMG src="../images/right.gif" alt=括号运算符 width="15" height="22" style="CURSOR: hand" onclick=insertAtCaret(this); value=" ) ">
                                  <img id="btnMore" border="0" onclick="ShowMore()" src="../images/btnShow.gif" alt="点击显示更多运算符" style="cursor:hand"></TD>
            			  <TD>
                                  <div id="extend" style="display: none">
                                  <TABLE>
                                  <TR>
                                  <TD>
                                  <IMG src="../images/xor.gif" alt="逻辑异或运算符xor。<例如>：1.摘要=(computer xor system)；2.摘要=computer xor 摘要=system" width="52" height="22" style="CURSOR: hand" onclick=insertAtCaret(this); value=" xor ">
                                  <IMG src="../images/adj.gif" alt="属性运算符--两者邻接，次序有关。<例如>：1.摘要=(computer adj system)；2.摘要=computer adj 摘要=system" width="52" height="22" style="CURSOR: hand" onclick=insertAtCaret(this); value=" adj ">
                                  <IMG src="../images/equ.gif" alt="属性运算符--两者相隔n个字，次序有关(默认相隔10个字)。<例如>：1.摘要=(computer equ/10 system)；2.摘要=computer equ/10 摘要=system" width="84" height="22" style="CURSOR: hand" onclick=insertAtCaret(this); value=" equ/10 ">
                                  <IMG src="../images/nor.gif" alt="属性运算符--两者在n个字之内不能同时出现(默认相隔10个字)。<例如>：1.摘要=(computer xor/10 system)；2.摘要=computer xor/10 摘要=system" width="84" height="22" style="CURSOR: hand" onclick=insertAtCaret(this); value=" xor/10 ">
                                  <IMG src="../images/pre_10.gif" alt="两者相隔至多n个字，次序有关(默认相隔10个字)。<例如>：1.摘要=(computer pre/10 system)；2.摘要=computer pre/10 摘要=system" width="84" height="22" style="CURSOR: hand" onclick=insertAtCaret(this); value=" pre/10 ">
                                  </TD>
            			  </TR>
            			  </TABLE>
            			  </div>
            			  </TD>
            			  <TD align="right">&nbsp;</TD>
                                </TR>
                              </TBODY>
                            </TABLE></TD>
                        </TR>
                        <TR bgcolor="#E2F4FF"> 
                          <TD>&nbsp;</TD>
                          <TD>&nbsp;</TD>
                        </TR>
                        <TR bgColor=#ffffff> 
                          <TD align=middle width="10">字段名称</TD>
                          <TD> 
                           <P><FONT size=2>点击字段代码可直接将字段代码加入检索条件输入框中(字段名称/代码)</FONT> 
                            <TABLE width="100%" border=1 align=center cellPadding=2 cellSpacing=0 borderColorLight=#cccccc borderColorDark=#ffffff class="t1">
                              <TBODY>
                                <TR> 
                                  <TD align="center"><span title="例：computer/TI" style="CURSOR: hand" onclick=insertAtCaret(this); value="\\/TI">名称/TI</span></TD>
                                  <TD align="center"><span title="例：CH20010000254/AN" style="CURSOR: hand" onclick=insertAtCaret(this); align=middle value="\\/AN">申请号/AN</span> </TD>
                                  <TD align="center"><span title="例：20030103/AD" style="CURSOR: hand" onclick=insertAtCaret(this); value="\\/AP">申请日/AD</span> </TD>
                                </TR>
                                <TR> 
                                  <TD align="center"><span title="例：CH694421/PN" style="CURSOR: hand" onclick=insertAtCaret(this); value="\\/PN">专利号/PN</span> </TD>
                                  <TD align="center"><span title="例：20040108/PD" style="CURSOR: hand" onclick=insertAtCaret(this); align=middle value="\\/PD">公开（公告）日/PD</span> </TD>
                                  <TD align="center"><span title="例：BONNY PHILIPPE/PA" style="CURSOR: hand" onclick=insertAtCaret(this); align=middle value="\\/PA">申请（专利权）人/PA</span> </TD>
                                </TR>
                                <TR> 
                                  <TD align="center"><span title="例：BONNY PHILIPPE/IN" style="CURSOR: hand" onclick=insertAtCaret(this); align=middle value="\\/IN">发明（设计）人/IN </TD>
                                  <TD align="center"><span title="例：A43B5/04/PIC" style="CURSOR: hand" onclick=insertAtCaret(this); align=middle value="\\/PIC">主分类号/PIC </TD>
                                  <TD align="center"><span title="例：A43B5/04/SIC" style="CURSOR: hand" onclick=insertAtCaret(this); align=middle value="\\/SIC">分类号/SIC </TD>
                                </TR>
                                <TR> 
                                  <TD align="center"><span title="例：computer/CL" style="CURSOR: hand" onclick=insertAtCaret(this); align=middle value="\\/CL">主权项/CL </TD>
                                  <TD align="center"><span title="例：computer/AB" style="CURSOR: hand" onclick=insertAtCaret(this); align=middle value="\\/AB">摘要/AB </TD>
                                  <TD align="center"><span title="例：19990428321/PR" style="CURSOR: hand" onclick=insertAtCaret(this); align=middle value="\\/PR">优先权/PR </TD>
                                </TR>
                              </TBODY>
                            </TABLE>
                            </TD>
                        </TR>
                        <TR bgcolor="#F1F9FF"> 
                          <TD>&nbsp;</TD>
                          <TD>&nbsp;</TD>
                        </TR>
                        <!--TR bgColor=#a5dad5> 
                          <TD align=middle bgColor=#ffffff>使用说明</TD>
                          <TD 
      bgColor=#ffffff>1.检索方式一：点击历史表达式，直接检索.<BR>
                            2.检索方式二：输入表达式，可以利用提供的各种运算符进行组合。<BR>
                            3.检索方式三：利用历史表达式的编号进行组合检索。例：（@1 and @2）<BR>
                            4.检索方式四：利用字段的英文代码进行组合检索。例：（APO=998% and IN=林） </TD>
                        </TR-->
                  </TABLE></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="200"></td>
        </tr>
      </table></td>
    <td width="1" bgcolor="#000000"></td>
  </tr></form>
</table>
</body>
</html>

