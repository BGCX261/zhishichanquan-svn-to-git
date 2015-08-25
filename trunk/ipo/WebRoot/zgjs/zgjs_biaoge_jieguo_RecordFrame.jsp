<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ejoysoft.jiansuo.Patent,java.util.*"%>
<%@ include file="../include/jsp/head.jsp"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<style type="text/css"></style>
<script type="text/javascript">



</script>


</head>
<%
	
	//获取检索方法中sql语句条件
	String twhere=(String)globa.session.getAttribute("twhere");
	String[] strdb=(String[])globa.session.getAttribute("strdb");
	String sort=(String)globa.session.getAttribute("sort");

	
 %>
<body leftmargin="0" topmargin="0" onload="hidespan()" onmouseup="getWord()" marginheight="0" marginwidth="0" bgcolor="#F0F7FF">
<span id="span11" style="position: absolute; left: 156px; top: 156px; width: 150px; height: 118px; visibility: hidden;">
<img src="../images/search-a.gif" alt="" height="60" width="388">

</span>

<table width="800" align="center" border="0" cellpadding="0" cellspacing="2">
  <tbody>
      <tr> 
          <td height="28" nowrap="nowrap" width="28" align="center" background="../images/index_06.gif"><font size="2" color="#000000"><b>&nbsp;</b></font></td>

	      <td height="28" nowrap="nowrap" width="120" align="center" background="../images/index_06.gif"><font size="2" color="#000000"><b>申请（专利）号</b></font></td>
	
	      <td height="28" nowrap="nowrap" width="120" align="center" background="../images/index_06.gif"><font size="2" color="#000000"><b>主分类号</b></font></td>
	
		  <td height="28" nowrap="nowrap" width="500" align="center" background="../images/index_06.gif"><font size="2" color="#000000"><b>名称</b></font></td>
	

</tr>
<!--<form name="ViewDetail" action="zgjs_biaoge_jieguo.jsp" method="post"> 
<input name="sqh" value="" type="hidden">
<input name="downloadcol" value="" type="hidden">
<input name="searchword" value="an=(cn00100079.9)" type="hidden">
<input name="channelid" value="14,15,16" type="hidden">
<input name="extension" value="" type="hidden">
<input name="sortfield" value="RELEVANCE" type="hidden">
<input name="searchChannel" value="14,15,16" type="hidden">
<input name="page" value="" type="hidden">
<input name="j_encoding" value="GBK" type="hidden">
<input name="record" value="" type="hidden">
<input name="channel" value="" type="hidden">

<input name="intPage" type="hidden" value="1"> 
</form> 

-->
<!--<form name="Outline" action="hyjs-jieguo-ys.jsp" method="post">
<input name="act" value="" type="hidden">
<input name="sqh" value="" type="hidden">
<input name="downloadcol" value="" type="hidden">
<input name="searchword" value="an=(cn00100079.9)" type="hidden">
<input name="channelid" value="14,15,16" type="hidden">
<input name="extension" value="" type="hidden">
<input name="sortfield" value="RELEVANCE" type="hidden">
<input name="searchChannel" value="14,15,16" type="hidden">
<input name="page" value="" type="hidden">
<input name="downtype" value="" type="hidden">
<input name="j_encoding" value="GBK" type="hidden">
<input name="FTS" value="0" type="hidden">
<input name="searchType" value="0" type="hidden">
<input name="printType" value="" type="hidden">
</form>

 -->
 <%
 	Patent pt=new Patent();
 	List<Patent> pts=new ArrayList<Patent>();
 	String table="";
 	
 	int pageNum=0;//前一页的rownum最大值
 	int countPage=1;
 	int countNumber=0;
 	int intPage=1;
 	String intPage1=(String)globa.session.getAttribute("intPage");
 	
 	if(intPage1.indexOf("+1") !=-1){
 		for(int i=0;i<strdb.length;i++){
 			int count=0;
			table=strdb[i];
	    	count=pt.count(table,twhere);
			countNumber +=count;	
			System.out.println(countNumber+"??????????????");
		}
		if(countNumber % 10!=0){
		countPage=countNumber%10 +1;
		}else{
		countPage=countNumber/10;
		}
		intPage=pt.fanYe(intPage1);
		if(intPage>countPage){
		out.println("<script>alert('这已经是尾页！')</script>");
 		intPage=countPage;
 		System.out.println(intPage+"[[[[[[[[[[[[[[]]]]]]]]]]]]]]");
		}
 	}else{
 		intPage=pt.fanYe(intPage1);
 	}
 	if(intPage==0||intPage<0){
 		out.println("<script>alert('这已经是首页！')</script>");
 		intPage=1;
 	}
	System.out.println(intPage+"qwqwqwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
 	if(intPage-1==0||intPage-1<0){
 		System.out.println("这已经是首页");
 		pageNum=0;
 	}else{
 		pageNum=(intPage -1)*10;
 	}
 	
 	System.out.println(pageNum+"-----------------===================111111111111111111111");
 	for(int i=0;i<strdb.length;i++){
 		table=strdb[i];
 	 pts=pt.showFY(table,twhere,pageNum);
 	//pts.addAll(pts1);
 	
 
 	for(Patent patent:pts){
 	
 	%>                       

<tr id="box0" bgcolor="#F0F5FF"> 

<td height="25" nowrap="nowrap" align="center">

<input name="APO0" value=<%=patent.getAn() %> type="hidden">

 <input name="TI_0" value=<%=patent.getTi() %> type="hidden">
 <input name="TI0" value="%E9%A3%9E%E6%9C%BA%E7%B4%A7%E6%80%A5%E6%95%91%E7%94%9F%E7%B3%BB%E7%BB%9F" type="hidden">
 <input name="IPC0" value=<%=patent.getPic() %> type="hidden">
 <input name="ANN0" value=<%=patent.getPa() %> type="hidden">
<input name="URL0" value="http://60.166.52.171/books/FM/2000/20000607/00100079.9/000001.tif" type="hidden">
<input name="Page0" value="8" type="hidden">
<input name="TRSTable0" value="fmzl_ft" type="hidden">
 <input name="record" value="1" onclick="javascript:hLight(this,box0)" type="checkbox"></td>

<td height="25" nowrap="nowrap" align="center">
<a href="javascript:ViewDetail('1');"><font size="2" color="navy"><%=patent.getAn() %></font></a></td>

<td height="25" nowrap="nowrap"><font face="宋体" size="2">&nbsp;<%=patent.getPic() %></font></td>

<td height="25" nowrap="nowrap"><font face="宋体" size="2">&nbsp;<%=patent.getTi() %></font></td>

</tr>
<%
	}}
 %>
 
    </tbody>
    <span>
    <input name="pp" type="hidden" value="${parem.page}"/>
    </span>
    
   
</table>

<!--<script language="javascript">
function hidespan()
{
	document.all.span11.style.visibility = "hidden";
}
</script>
<script language="javascript">

//选中后表格变色
function hLight(obj,box)
{
	var c="#BBD7FF"
	  if (obj.checked) 
	  box.style.backgroundColor=c 
	  else box.style.backgroundColor="";
}

//弹出窗口
function openwin(urlstr) 
{ 
	var s = "0";
	targetUrl = "hyjs-yx.jsp";
  	window.open(targetUrl+"?"+urlstr,"","toolbar=no,titlebar=no,location=no,status=no,menubar=no,resizable=yes,scrollbars=yes,left=0,top=0,width="+(screen.width-20)+",height="+(screen.height-60));
} 


function getWord()//获取鼠标选中的文本
{
	var str = document.selection.createRange().text;
	if(typeof(str)!="undefined")
	{
		if(str!="")
	        {
            	parent.document.all.keyword.value=str;
			}
	}
}

</script>



--></body></html>