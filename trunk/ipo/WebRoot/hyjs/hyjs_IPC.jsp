<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>港澳台及外国专利检索--IPC分类检索</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
<body>
<div ID="tipBox"></div>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#E5E5E5">
<form name="loginform" action="hyjs-jieguo-fr.jsp" method="post" target="_self" onsubmit="return formsubmit('document.loginform','1')">
  <tr> 
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td bgcolor="#FFFFFF"><div align="center"><img src="../images/biaoge.gif" width=288 height=20 alt=""></div></td>
        </tr>
        <tr> 
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="43" background="../images/index_07.gif" class="t1"><input type="hidden" value="" name="channelid">
 
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
<td height="35" background="../images/index_09.gif" class="t1">&nbsp;
<input type="checkbox" name="secondsearch" value="ON" onclick="document.loginform.filtersearch.checked=false"  disabled  id="c1" style="cursor:hand"><label for="c1" style="cursor:hand">二次检索</label>
<input type="checkbox" name="filtersearch" value="ON"  onclick="document.loginform.secondsearch.checked=false"  disabled  id="c2" style="cursor:hand"><label for="c2" style="cursor:hand">过滤检索</label>
<input type="checkbox" name="synonymous" value="ON" id="c3" style="cursor:hand"><label for="c3" style="cursor:hand">同义词检索</label>
<input type="checkbox" name="savesearchword" value="ON" id="c4" style="cursor:hand"><label for="c4" style="cursor:hand">保存检索表达式</label>
<span>
&nbsp;&nbsp;排序: 
 <select size="1" name="sortcolumn">
    <option value="公开（公告）日">公开（公告）日</option>
	<option value="公开（公告）号">公开（公告）号</option>
	<option value="申请日">申请日</option>
	<option value="申请号">申请（专利）号</option>
	<!--<option value="颁证日">颁证日</option>-->
	<option value="名称">名称</option>
	<option value="主分类号">主分类号</option>
	<option value="RELEVANCE" selected>相关性</option>
  </select>
  <select name="R1">
  	<option value="-">降序</option>
  	<option value="+">升序</option>
  </select>
  </span>
 </td>
              </tr>
              <tr> 
                <td height="30"><TABLE width="100%" border=1 align="center" cellPadding=2 cellSpacing=0 borderColorLight=#646464 borderColorDark=#ffffff bgColor=#ffffff class="t1">
                    <TBODY>
                      <TR bgColor=#ffffff> 
                        <TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'A');" style="cursor:hand"><input type="button"  class="tablebutton" value="A:专　　利　　 号"></TD>
                        <TD width="25%" height=32><INPUT name="txtA" size="30%"  alt=""></TD>
                        <TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'B');" style="cursor:hand"><input type="button"  class="tablebutton" value="B:申　　请　　 号"></TD>
                        <TD width="25%" height=32><INPUT name="txtB" size="30%"  alt=""></TD>
                     	<TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'C');" style="cursor:hand"><input type="button"  class="tablebutton" value="C:申　　请　　 日"></TD>
                        <TD width="25%" height=32><INPUT name="txtC" size="30%" alt=""></TD>
                      </TR>
                      <TR bgColor=#ffffff> 
                        
                        <TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'D');" style="cursor:hand"><input type="button"  class="tablebutton" value="D:公 开（公告）日"></TD>
                        <TD width="25%" height=32><INPUT name="txtD" size="30%" alt=""></TD>
                     	<TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'E');" style="cursor:hand"><input type="button"  class="tablebutton" value="E:名　　　　　 称"></TD>
                        <TD width="25%" height=32><INPUT size="30%" name="txtE" alt=""></TD>
                        <TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'F');" style="cursor:hand"><input type="button"  class="tablebutton" value="F:摘　　　　　 要"></TD>
                        <TD width="25%" height=32><INPUT size="30%" name="txtF" alt=""></TD>
                      </TR>
                      <TR bgColor=#ffffff> 
                        <TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'G');" style="cursor:hand"><input type="button"  class="tablebutton" value="G:主　分　类　 号"></TD>
                        <TD width="25%" height=32><INPUT name="txtG"  size="30%" alt=""></TD>
                        <TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'H');" style="cursor:hand"><input type="button"  class="tablebutton" value="H:分　　类　　 号"></TD>
                        <TD width="25%" height=32><INPUT size="30%" name="txtH" alt=""></TD>
                     	<TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'I');" style="cursor:hand"><input type="button"  class="tablebutton" value="I:申请（专利权）人"></TD>
                        <TD width="25%" height=32><INPUT size="30%" name="txtI" alt=""></TD>
                      </TR>
                      <TR bgColor=#ffffff> 
                       
                        <TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'J');" style="cursor:hand"><input type="button"  class="tablebutton" value="J:发 明（设计）人"></TD>
                        <TD width="25%" height=32><INPUT size="30%" name="txtJ" alt=""></TD>
                      	<TD UNSELECTABLE="On" align=left width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'K');" style="cursor:hand"><input type="button"  class="tablebutton" value="K:主　　权　　 项"></TD>
                        <TD width="25%" height=32><INPUT size="30%" name="txtK" alt=""></TD>
                        <TD UNSELECTABLE="On" align="left" width="20%" height=22 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'L');" style="cursor:hand"><input type="button"  class="tablebutton" value="L:优　　先　　 权"></TD>
                        <TD width="25%" height=22 align="left"><INPUT name="txtL" size="30%" alt=""></TD>
                      </TR>
                      <TR bgColor=#ffffff> 
                       <TD UNSELECTABLE="On" align="center" width="20%" height=32 background="../images/index_11.gif" title="点击在组合逻辑检索中加入此字段代码" onClick="insertItem(obj, 'M');" style="cursor:hand"><input type="button"  class="tablebutton" value="M:同　族　专　 利"/></TD>
                        <TD width="25%" height=32 ><INPUT name="txtM" size="30%" alt=""></TD>
                      </TR>
                      <TR bgColor=#ffffff>
                        <TD colspan="4" background="../images/bgimage.gif">
                          <fieldset>
                          <TABLE>
                            <TR>
                              <TD rowspan="2" width="20%"><B>组合逻辑检索：</B></TD>
                              <TD>
                                <input UNSELECTABLE="On" id="btnMore" type=button onClick="insertItem1(obj, ' and ');" style="cursor:hand;color: black;background-color:#efefef;font-size:10pt;width:40;height:21;border-style:solid;border-width:1" value=" and ">
                                <input UNSELECTABLE="On" id="btnMore" type=button onClick="insertItem1(obj, ' or ');" style="cursor:hand;color: black;background-color:#efefef;font-size:10pt;width:32;height:21;border-style:solid;border-width:1" value=" or ">
                                <input UNSELECTABLE="On" id="btnMore" type=button onClick="insertItem1(obj, ' not ');" style="cursor:hand;color: black;background-color:#efefef;font-size:10pt;width:40;height:21;border-style:solid;border-width:1" value=" not ">
                                <input UNSELECTABLE="On" id="btnMore" type=button onClick="insertItem1(obj, '(');" style="cursor:hand;color: black;background-color:#efefef;font-size:10pt;width:22;height:21;border-style:solid;border-width:1" value="(">
                                <input UNSELECTABLE="On" id="btnMore" type=button onClick="insertItem1(obj, ')');" style="cursor:hand;color: black;background-color:#efefef;font-size:10pt;width:22;height:21;border-style:solid;border-width:1" value=")"></TD>
                              </TR>
                            <TR>
                              <TD><INPUT name="txtComb" size="67" alt="&nbsp;&nbsp;&nbsp;&nbsp;组合检索是检索表格中使用的操作对象进行布尔运算式。各操作对象在使用时均代号其字母代号，字母代号是 A 到 R 的字母(为避免混淆，字母O除外)。各操作对象之间可以使用<B><font color=red>and</font></B>、<B><font color=red>or</font></B>及改变运算顺序的 <B><font color=red>(</font></B>和<B><font color=red>)</font></B><BR><BR><B>检索示例：</B><BR>&nbsp;&nbsp;&nbsp;&nbsp;1、<B><font color=red>(A or B) and C</font></B><BR><BR><B>注意：</B>组合检索字段为空时(未在此行输入)，系统会自动将各检索字段之间使用＂逻辑与＂的关系。 "></TD>
                            </TR>
                          </TABLE>
                          </fieldset>
                        </TD>
                      </TR>
                      <TR bgColor=#ffffff> 
                        <TD colspan="4" align=middle height="32">
                          <div align="center"><BR>
                            <input type="hidden" name="FTS" value="0">
                            <INPUT type=submit value=检　索 name=submit1 style="cursor:hand;color: black;background-color:#efefef;font-size:10pt;width:70;height:21;border-style:solid;border-width:1">
                            <INPUT type=reset value=清　除 name=cler1 style="cursor:hand;color: black;background-color:#efefef;font-size:10pt;width:70;height:21;border-style:solid;border-width:1">
                            <!--INPUT onclick="return formsubmit('document.loginform','0');" type=button value="查看/验证表达式（临时）" name=makeexp-->
                          </div></TD>
                      </TR>
                      
                    </TBODY>
                  </TABLE></td>
              </tr>
            </table></td>
        </tr>
        <tr > 
          <td height="15" bgcolor="#E5E5E5"></td>
        </tr>
        <tr > 
          <td height="300" bgcolor="#E5E5E5"></td>
        </tr>
      </table></td>
    <td width="1" bgcolor="#000000"></td>
</tr>
</form>
</table>
</body>
</html>
