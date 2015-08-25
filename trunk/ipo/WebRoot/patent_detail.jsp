<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>专利细览</title>
<Script src="../include/js/hyjs-yx.js"></Script>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<style>
<!--
body,td,tr,li {font-size:10pt; font-family:宋体}
a{text-decoration:underline;color:#0000ff}
a:link{text-decoration:underline;color:#0000ff}
a:visited {text-decoration:underline;color:#0000ff}
a:hover {color:#EBA007;text-decoration:underline}
-->
</style>
<Script src="../include/js/hyjs-yx.js"></Script>
<script language="javascript">
strMsg = "提示：\r\r此功能为会员功能，需要注册后才能正常使用。\r如需咨询注册会员及相关服务信息，请与我们取得联系：\r联系电话：010-82000860转8228\r联系人：李王媛\r---------------------------------\r点击确定后您看到的信息为静态示例信息";
self.moveTo(0,0)
self.resizeTo(screen.availWidth,screen.availHeight)

var nwin;      
function openwindow(url,sTitle,sWidth,sHeight)      
{      
    if (url==''){
      return false;
    }

    if (nwin && !nwin.closed){      
       nwin.close();      
    }      
  
/*
    if (sSize == undefined) {
       alert("请指定窗口型号!");
       return false;
    }
    else if (sSize == 100) {
       sWidth  = screen.availWidth;
       sHeight = screen.availHeight;
    }

   else if (sSize == 1) {
       sWidth  = 280;
       sHeight = 120;
    }
    else if (sSize == 2) {
       sWidth  = 600;
       sHeight = 400;
    }
*/

    var l = ( screen.availWidth - sWidth ) / 2;
    var  t = ( screen.availHeight - sHeight ) / 2;      

     
    nwin = window.open(url,sTitle,'left=' + l +',top=' + t +',width='+sWidth+',height='+sHeight+',scrollbars=yes,resizable=yes');
    nwin.focus();      
}

//弹出窗口
function openwin(sUrl,sArgs)
{ 
  //window.showModelessDialog(sUrl,sArgs,"dialogHeight:"+sHeight+"px;dialogWidth:"+sWidth+"px;center:yes;resizable:no;help:no;status:no;scroll:no");
  //window.location.reload();
  window.open(sUrl+"?strUrl="+escape(sArgs),"patent","toolbar=no,titlebar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes,left=0,width="+(screen.width)+",height="+(screen.height-40));
}

//self.moveTo(0,0)
//self.resizeTo(screen.availWidth,screen.availHeight)

//无提示关闭窗口
function CloseWin()
{
	var ua=navigator.userAgent
	var ie=navigator.appName=="Microsoft Internet Explorer"?true:false
	if(ie)
	{
	    	var IEversion=parseFloat(ua.substring(ua.indexOf("MSIE ")+5,ua.indexOf(";",ua.indexOf("MSIE "))))
		if(IEversion< 5.5)
		{
	    	var str  = '<object id=noTipClose classid="clsid:ADB880A6-D8FF-11CF-9377-00AA003B7A11">'
	    	str += '<param name="Command" value="Close"></object>';
	    	document.body.insertAdjacentHTML("beforeEnd", str);
	    	document.all.noTipClose.Click();
		}
		else
		{
		    window.opener =null;
		    window.close();
		}
	}
	else
	{
		window.close()
	}
}

function DrawImage(ImgD,iwidth,iheight)
{
	 var image=new Image(); 
	 //var iwidth = 400;  //定义允许图片宽度 
	 //var iheight = 400;  //定义允许图片高度 
	 image.src=ImgD.src;
	 if(image.width > iwidth)
	 {
		 if(image.width>0 && image.height>0)
		 { 
			 flag=true; 
			 if(image.width/image.height>= iwidth/iheight)
			 { 
				  if(image.width>iwidth)
				  {   
					  ImgD.width=iwidth; 
					  ImgD.height=(image.height*iwidth)/image.width; 
				  }
				  else
				  { 
					  ImgD.width=image.width;   
					  ImgD.height=image.height; 
				  } 
				  //ImgD.alt=image.width+"×"+image.height; 
			 } 
			 else
			 { 
				  if(image.height>iheight)
				  {
					  ImgD.height=iheight; 
					  ImgD.width=(image.width*iheight)/image.height;   
				  }
				  else
				  { 
					  ImgD.width=image.width;   
					  ImgD.height=image.height; 
				  } 
				  //ImgD.alt=image.width+"×"+image.height; 
		  	} 
		 }
	}
}

function showXML(an,channelIDs,pd,CLM_Page,DES_Page,DRA_Page,strTI){
	document.ViewXML.an.value = an;
	document.ViewXML.channelIDs.value = channelIDs;
	document.ViewXML.pd.value = pd;
	document.ViewXML.CLM_Page.value = CLM_Page;
	document.ViewXML.DES_Page.value = DES_Page;
	document.ViewXML.DRA_Page.value = DRA_Page;
	document.ViewXML.strTI.value = strTI;
	document.ViewXML.submit()
}
</script>
</head>

<body bgcolor="#ffffff" leftmargin="0" topmargin="0">
<object id=obj1 classid="CLSID:106E49CF-797A-11D2-81A2-00E02C015623" codebase="alttiff.ocx#version=1,8,3,1" height=1 width=1></object>
<center>
<table border="0" width="760" cellpadding="0" cellspacing="0"  style="WORD-BREAK: break-all">
<Script language="JavaScript">
document.title = "大极数电机";
</Script>



<form name="turnpage" action="hyjs-yx.jsp" method="post">
<input type="hidden" name="searchword" value="( ((公开)/cl) and (an=(cn0%)) ) AND ( an=(cn0%) )">
<input type="hidden" name="sortfield" value="RELEVANCE">
<input type="hidden" name="j_encoding" value="GBK">
<input type="hidden" name="channelid" value="14,15,16">
<input type="hidden" name="flzt" value="">
<input type="hidden" name="flztphrase" value="">
<input type="hidden" name="record" value="5">
<input type="hidden" name="downloadcol" value="">
<input type="hidden" name="downtype" value="">
<input type="hidden" name="FTS" value="0">
</form>


<!--iframe id='sHeader' src='Detail-Header.jsp?record=5' width='100%' height='60' frameborder='0' scrolling='no'></iframe-->


  <tr bgcolor="#E1E1FF"> 
      <td height="30" colspan="4" align="center">此次检索共命中记录<B>634</B>条，当前为第<B>5</B>条</td><td width="0%" align="right"><!--input name="button" type="button" onclick="javascript:window.close();" value="关闭窗口"--></td>
  </tr>
  <tr bgcolor="#F4F4FF" height="30"> 
      <td align="center" colspan="4" bgcolor="#F4F4FF">
      <input name="FirstPage" type="button" value="第一条" onClick="javascript:MoveTo('1');">
      &nbsp;
      <input name="PrevPage" type="button" value="上一条" onClick="javascript:PageUp();">
      &nbsp;
      <input name="NextPage" type="button" value="下一条" onClick="javascript:PageDown();">
      &nbsp;
      <input name="LastPage" type="button" value="最末条" onClick="javascript:MoveTo('634');">
      &nbsp;&nbsp;
      快速定位：<input type="text" name="txtJumpPageNumber" size="4" onKeyDown="OnPageMemberkeyDown()" value="5">
      &nbsp;
      <input name="JumpPage" type="button" value="转到" onClick="javascript:JumpPage();">
      &nbsp;

<input type="button" value="打印文摘" onClick="javascript:Print();">

&nbsp;

<input type="button" value="下载文摘" onClick="javascript:Download();">

</td>
</tr>
<form name="ViewPatent" action="ViewPatent.jsp" method="post" target="_blank">
<input type="hidden" name="strUrl" value="">
<input type="hidden" name="strAPO" value="">
<input type="hidden" name="strTI" value="">
<input type="hidden" name="strIPC" value="">
<input type="hidden" name="strANN" value="">
<input type="hidden" name="strPage" value="">
<input type="hidden" name="FTS" value="">
</form>

<form name="ViewAuthPatent" action="ViewPatent.jsp" method="post" target="_blank">
<input type="hidden" name="strUrl" value="">
<input type="hidden" name="strAPO" value="">
<input type="hidden" name="strTI" value="">
<input type="hidden" name="strIPC" value="">
<input type="hidden" name="strANN" value="">
<input type="hidden" name="strPage" value="">
<input type="hidden" name="FTS" value="">
</form>

<tr BGCOLOR="#FFFFFF" height="36">
<td colspan="5">

<table><tr>

<td width="152" nowrap align="center">
［<a href="javascript:openwindow('zlll-yxfl.jsp?recid=00800797','法律状态',400,500);">法律状态</a>］</td>
<!--a href="zlll-yxfl.jsp?recid=00800797" target="_self">［法律状态］</a-->

<form name="SingleDetail" action="Singledetail.jsp" target="_blank" method="post">
<input type="hidden" name="channelid">
<input type="hidden" name="an" value="CN00800797.7">
<input type="hidden" name="gkh">
<input type="hidden" name="sf" value="0">
<input type="hidden" name="st" value="1">
</form>

<form name="ViewXML" action="../xml/XML_Browser.jsp" target="_blank" method="post">
<input type="hidden" name="an">
<input type="hidden" name="channelIDs">
<input type="hidden" name="pd">
<input type="hidden" name="CLM_Page">
<input type="hidden" name="DES_Page">
<input type="hidden" name="DRA_Page">
<input type="hidden" name="strTI">
</form>

<Script>
document.ViewPatent.strUrl.value = "http://60.166.52.171/books/FM/2001/20011017/00800797.7/000001.tif";
document.ViewPatent.strAPO.value = "CN00800797.7";
document.ViewPatent.strTI.value = "大极数电机";
document.ViewPatent.strIPC.value = "H02K3/12";
document.ViewPatent.strANN.value = "深圳市贝来实验室";
document.ViewPatent.strPage.value = "1";
document.ViewPatent.FTS.value = "0";

if(document.ViewPatent.strPage.value != null && document.ViewPatent.strPage.value != "")
	document.write("<td width='200' nowrap>［<a href=\"javascript:ViewPatent();\">专利说明书全文</a>］");
</Script>

[<a onClick="javascript:showXML('CN00800797.7',14,'20011017','1','1','','大极数电机')" style="cursor:hand">代码化</a>]

</td>

<Script>
document.ViewAuthPatent.strUrl.value = "http://60.166.52.171/books/SQ/2005/20050817/00800797.7/000001.tif";
document.ViewAuthPatent.strAPO.value = "CN00800797.7";
document.ViewAuthPatent.strTI.value = "大极数电机";
document.ViewAuthPatent.strIPC.value = "H02K3/12";
document.ViewAuthPatent.strANN.value = "深圳市贝来实验室";
document.ViewAuthPatent.strPage.value = "24";
document.ViewAuthPatent.FTS.value = "0";

if(document.ViewAuthPatent.strPage.value != null && document.ViewAuthPatent.strPage.value != "")
	document.write("<td width='200'>［<a href=\"javascript:ViewAuthPatent();\">审定、授权说明书</a>］");
</Script>


[<a onClick="javascript:showXML('CN00800797.7',17,'20050817','3','10','10','大极数电机')" style="cursor:hand">代码化</a>]

</td>
<td nowrap width="152">
<script>
if(document.ViewAuthPatent.strPage.value != null && document.ViewAuthPatent.strPage.value != "")
	[<a onClick="javascript:document.SingleDetail.channelid.value='17';document.SingleDetail.submit()" style="cursor:hand">→授权信息</a>]
else
	document.write("&nbsp;");
</script>

</td>

</tr>
</table>

</td></tr>


  <tr><td bgcolor="green" height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
  <tr> 
      <td width="27%" align="right" bgcolor="#F4F4FF">名称: 　</td>
      <td colspan="3" bgcolor="#ffffff">&nbsp;大极数电机</td>
  </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr>
       <td width="27%" align="right" bgcolor="#F4F4FF">申请（专利）号: 　</td>
      <td width="24%"  bgcolor="#ffffff">&nbsp;CN00800797.7</td>
      <td width="24%" align="right" bgcolor="#F4F4FF">申请日: 　</td>
      <td width="25%"  bgcolor="#ffffff">&nbsp;2000.03.01</td>
  </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
  <tr> 
      <td width="27%" align="right" bgcolor="#F4F4FF">公开（公告）号: 　</td>
      <td width="24%"  bgcolor="#ffffff">&nbsp;CN1318218</td>
      <td width="24%" align="right" bgcolor="#F4F4FF">公开（公告）日: 　</td>
      <td width="25%"  bgcolor="#ffffff">&nbsp;2001.10.17</td>
  </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr> 
      <td width="27%" align="right" bgcolor="#F4F4FF">主分类号: 　</td>
      <td  width="24%" bgcolor="#ffffff">&nbsp;H02K3/12</td>
      <td width="24%" align="right" bgcolor="#F4F4FF">范畴分类: 　</td>
      <td width="25%" bgcolor="#ffffff">&nbsp;</td>
    </tr>
       <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr> 
      <td width="27%" align="right" bgcolor="#F4F4FF">分类号: 　</td>
      <td colspan="3" bgcolor="#ffffff">&nbsp;H02K3/12;H02K19/10</td>
    </tr>
       <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr>
      <td width="27%" align="right" bgcolor="#F4F4FF">优先权: 　</td>
      <td colspan="3" bgcolor="#ffffff">&nbsp; 1999.03.09 CN 99103828.2</td>
  </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr> 
      <td width="27%" align="right" bgcolor="#F4F4FF">申请（专利权）人: 　</td>
      <td colspan="3"  bgcolor="#ffffff">&nbsp;深圳市贝来实验室</td>
    </tr>
       <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr>
      <td width="27%" align="right" bgcolor="#F4F4FF">地址: 　</td>
      <td colspan="3"  bgcolor="#ffffff">&nbsp;中国广东省深圳市南山区龙井珠光工业区高发小区7号楼一层</td>
  </tr>
   <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr>
      <td width="27%" align="right" bgcolor="#F4F4FF">国省代码: 　</td>
      <td colspan="3"  bgcolor="#ffffff">&nbsp;广东;44</td>
   </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr> 
      <td width="27%" align="right" bgcolor="#F4F4FF">发明（设计）人: 　</td>
      <td colspan="3"  bgcolor="#ffffff">&nbsp;白侠斌;丘雪明;白晶辉</td>
    </tr>
      <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
   <tr>
      <td width="27%" align="right" bgcolor="#F4F4FF">国际申请: 　</td>
      <td colspan="3"  bgcolor="#ffffff">&nbsp;PCT/CN00/00039 2000.03.01</td>
  </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr> 
      <td width="27%" align="right" bgcolor="#F4F4FF">国际公布: 　</td>
      <td colspan="3"  bgcolor="#ffffff">&nbsp;WO00/54391 中 2000.09.14</td>
    </tr>
       <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr>
      <td width="27%" align="right" bgcolor="#F4F4FF">进入国家日期: 　</td>
      <td colspan="3"  bgcolor="#ffffff">&nbsp;2001.01.09</td>
  </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr> 
      <td width="27%" align="right" bgcolor="#F4F4FF">专利代理机构: 　</td>
      <td colspan="3"  bgcolor="#ffffff">&nbsp;中原信达知识产权代理有限责任公司</td>
    </tr>
   <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr>
      <td width="27%" align="right" bgcolor="#F4F4FF">代理人: 　</td>
      <td colspan="3"  bgcolor="#ffffff">&nbsp;方挺;余朦</td>
  </tr>
   <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr>
      <td width="27%" align="right" bgcolor="#F4F4FF">分案申请号: 　</td>
      <td colspan="3"  bgcolor="#ffffff">&nbsp;</td>
  </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr> 
      <td width="27%" align="right" bgcolor="#F4F4FF">颁证日: 　</td>
      <td  width="24%" bgcolor="#ffffff">&nbsp;</td>
      <td width="24%" align="right" bgcolor="#F4F4FF">&nbsp;</td>
      <td width="25%" bgcolor="#ffffff">&nbsp;</td>
    </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr bgcolor="#F4F4FF"> 
      <td colspan="4">摘要: 　</td>
  </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr  bgcolor="#ffffff"> 
      <td colspan="2"> 
        本发明涉及了一种改进的中频电机和低速电机
结构，特别适用于大极数的电机。本发明的大极数电机，转子
是永磁型的或是电励磁型的或是感应式的，极数大于或等于
8；电枢绕组用实芯导线在槽中按分层整齐排列为等节距和不
等节距的波绕组绕制；所说的绕组在槽中，每一匝导线皆与槽
壁铁心相邻。本发明与现有技术相比具有省铜，省铁，效果率，
出力大，绕组加工方便，除了可以替代一般的中频电机之外，
还可以应用于其他场合等优点。
        　</td>
      <td colspan="2">

<OBJECT classid="CLSID:106E49CF-797A-11D2-81A2-00E02C015623" width="400" height="400">
<PARAM NAME="src" VALUE="http://60.166.52.171/XmlData/fm//20011017/00800797.7/00800797.tif">
<PARAM NAME="TARGET" VALUE="right">
<PARAM NAME="TOOLBAR" VALUE="off">
<PARAM NAME="BACKCOLOR" VALUE="#FFFFFF">
<PARAM NAME="MOUSEMODE" VALUE="none">
</OBJECT>

 </td>
    </tr>
  <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr bgcolor="#F4F4FF"> 
      <td colspan="4">主权项: 　</td>
  </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>
    <tr  bgcolor="#ffffff"> 
      <td colspan="4"> 
        PCT国内申请，权利要求书已公开。
       </td>
  </tr>
     <tr><td BGCOLOR=GREEN height=1 COLSPAN=4><img src="images/line.gif" height=1 width=1></td></tr>

<tr bgcolor="#ffffff"> 
<td colspan="4" align="right"> 
<input name="button" type="button" onClick="javascript:CloseWin();" value="关闭窗口">
</td>
</tr>

</table>
</center>
 
</body>
</html>

<Script language="JavaScript">
var cPage = 5;
var tPage = 634;
var tagUrl = "Patent-Detail.jsp";
var tagWindow = "_parent";
var searchType = "0";
</Script>

<Script language="JavaScript">
if(cPage <= 1)
{
	document.all.FirstPage.disabled = true;
	document.all.PrevPage.disabled = true;
}
if(cPage >= tPage)
{
	document.all.NextPage.disabled = true;
	document.all.LastPage.disabled = true;
}
if(tPage==1){
	document.all.txtJumpPageNumber.disabled = true;
	document.all.JumpPage.disabled = true;
}
</Script>



