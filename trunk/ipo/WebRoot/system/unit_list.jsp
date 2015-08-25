<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.Vector,com.ejoysoft.common.Constants,
com.ejoysoft.common.exception.NoRightException"%>
<%@page import="com.ejoysoft.wlanyz.system.SysUserUnit"%>
<%@page import="com.ejoysoft.wlanyz.system.Unit"%>
<%@ include file="../include/jsp/head.jsp"%>

<%
try{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
if(!globa.userSession.hasRight("70005"))
      throw new NoRightException("用户不具备操作该功能模块的权限，请与系统管理员联系！");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>部门管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
a{ font-size:13px; color:#214263; text-decoration:none; }
a:hover{ font-size:13px; color:#ffffff; background-color:#ff9900; text-decoration:none;display:block;} 
-->
</style>
<script src="../include/js/list.js"></script>
<script src="../js/jquery-1.4.1.min.js"></script>
<script language="javascript">
//增加信息
function add() {
   frm.action="unit_add.jsp";
   frm.submit();
}
//修改信息
function update() {
if (iCheckedNumber(document.all.strUnitId) == 0) {
		alert("请先选择要修改的部门！");
		return;
	}
   frm.action="unit_update.jsp";
   frm.submit();
}
//删除信息
function del(){
	if (iCheckedNumber(document.all.strUnitId) == 0) {
		alert("请先选择要删除的部门！");
		return;
	}
    if(!confirm('您是否确认要删除所选中的组织机构？'))
        return
     frm.action="unit_act.jsp?<%=Constants.ACTION_TYPE%>=<%=Constants.DELETE_STR%>";
     frm.submit();
}
function expand(obj, gid) {
    var oGid = eval("document.all." + gid);
    if (obj.value == "+") {
    	document.getElementById("fileOC"+gid).innerHTML="<img src='../images/folderopen.gif' width='16'/>";
    	$("#img"+gid).attr("src","../images/_plus2.gif");
        obj.value = "-";
        if (oGid.length == undefined)
            oGid.style.display = "";
        else
            for (var i = 0; i < oGid.length; i++)
                oGid[i].style.display = "";
    } else {
    	$("#img"+gid).attr("src","../images/_minus2.gif");
    	document.getElementById("fileOC"+gid).innerHTML= "<img src='../images/folderclose.gif' width='16'/>";
        obj.value = "+";
        if (oGid.length == undefined)
            oGid.style.display = "none";
        else
            for (var i = 0; i < oGid.length; i++)
                oGid[i].style.display = "none";
    }
}

function expand2(obj, gid,value) {
    var oGid = eval("document.all." + gid);
    if (obj.value == "+") {
    	if(gid != "g0000000000")
        	document.getElementById("fileOC"+gid).innerHTML="<img src='../images/folderopen.gif' width='16'/>";
        $("#img"+gid).attr("src","../images/_minus"+value+".gif");
        obj.value = "-";
        if (oGid.length == undefined)
            oGid.style.display = "";
        else
            for (var i = 0; i < oGid.length; i++)
                oGid[i].style.display = "";
    } else {
        $("#img"+gid).attr("src","../images/_plus"+value+".gif");
    	if(gid != "g0000000000")
    		document.getElementById("fileOC"+gid).innerHTML= "<img src='../images/folderclose.gif' width='16'/>";
        obj.value = "+";
        if (oGid.length == undefined)
            oGid.style.display = "none";
        else
            for (var i = 0; i < oGid.length; i++)
                oGid[i].style.display = "none";
    }
}
//单位用户信息管理
function viewUser() {
   frm.action="user_list.jsp";
   document.getElementById('<%=Constants.PAGE_SIZE_INDEX%>').value= "1";
   frm.submit();
}
</script>
</head>


<body>
<form id=frm name=frm method="post" action="">

<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">系统配置</font> &gt; 部门管理 </td>
  </tr>
</table>
<br/>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td width="6%" class="listtit1"  style="border-left:1px solid #32a4ea;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td  width="87%">&nbsp;</td>
        <td width="%"align="right"onclick="add()" class="tdbm"style="cursor:hand"><img src="../images/add.gif" border="0" align="middle"  width="12" height="13"/>添加</td><td width="%"onclick="update()" style="cursor:hand"> &nbsp;<img src="../images/mid.gif" width="12" height="13" border="0" align="middle"   />修改&nbsp;</td><td width="%"onclick="del()"style="cursor:hand"><img src="../images/del.gif" width="12" height="13" border="0" align="middle"   />删除&nbsp;</td>
      </tr>
    </table></td>
    </tr>
    
      <tr>
      <td bgcolor="#FFFFFF" class="listd1" style="border-left:1px solid #dddddd;border-right:1px solid #dddddd;"> &nbsp;
    <table width="100%" border="0" cellspacing="0" cellpadding="0"> 
   <tr> <td > 
   	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
           <td align="center" style="width:23px" valign="bottom">  <input style="height: 23px" type="hidden" name="b_0000000000" id="b_0000000000" value="-" />
          <img id="imgg0000000000" src="../images/_minus0.gif" width="23" onclick="expand2(document.getElementById('b_0000000000'),'g0000000000','0');" /></td>
           <td  align="left" style="height: 23px;font-size: 13px;font-weight: bold;" class="a0" valign="bottom"><span id="fileOCg0000000000" >
           <img style="margin-bottom: 0px;padding-bottom: 0px" src="../images/folder2.gif" width="16"/>
           </span>&nbsp;&nbsp;&nbsp;&nbsp;部门列表</td>
        </tr>
      </table>
    </td>
   </tr>
     <tr>
      <td> 
       <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="g0000000000" style="display:block">
           <tr> 
           		<td align="center" style="width:23px">&nbsp;</td>
                <td  valign="top" >
                  <%
                  
                  	String unitId = "";
                  	if(globa.userSession.getStrUnitId()!= null && globa.userSession.getStrUnitId().length >0)
                  		unitId = globa.userSession.getStrUnitId()[0];
                    Vector userGroupTree = SysUserUnit.getUserGroupTree();  //树形目录的所有用户组向量
                    int curLevel = 1;
                    for (int i = 0; i < userGroupTree.size(); i++) {
                        Unit ug = (Unit)userGroupTree.get(i);
                        if (ug.getIntLevel() < curLevel) {   //上级用户�?
                             for (int j = ug.getIntLevel(); j < curLevel; j++) {  //输出收口标签
                %>
                    </td>
                  </tr>
                </table>
        <%
                     }
                }
        %>
        <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" id="g<%=ug.getStrParentId()%>" style="display:<%=ug.getStrParentId().equals("") ? "":"block"%>" class="td_color_1">
          <tr > 
          <% if(ug.isLastNode()){
           %>
            <td valign="top" style="width:23px">
            <%}else{ %>
              <td valign="top" background="../images/_line4.gif" style="width:23px">
            <%} %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                <tr>
                  <td align="left" valign="bottom">
        <%
                if (ug.haveChild()) {   //有下级用户组
        %>
       			   <input class="input3" type="hidden"  name="b_<%=ug.getStrId()%>" id="b_<%=ug.getStrId()%>" value="-" ></input>
       		       <img id="imgg<%=ug.getStrId()%>" src="../images/_minus2.gif" width="23" onclick="expand2(document.getElementById('b_<%=ug.getStrId()%>'),'g<%=ug.getStrId()%>','2');" />
        <%   
                }  
                else{ 
	         %>  
	         	 <img id="imgg<%=ug.getStrId()%>" src="../images/_line2.gif" width="23" />
	           <%     
                }
        %>        </td>
                </tr>
              </table>
            </td>
            
           <td align="left" style="padding-top: 0px;margin-top: 0px">
            <table border="0" cellspacing="0" cellpadding="0"><tr>
              <%
                if (ug.haveChild()) {   //有下级用户组
       		  %>
       		      <td valign="top" style="height: 23px"><span id="fileOCg<%=ug.getStrId()%>"><img alt="" src="../images/folderopen.gif" width="16"/></span></td>
       		  <%
       		  }else{
       		   %>
       		   <td valign="bottom" style="height: 23px"><img id="img0000000000" alt="" src="../images/file.gif" width="16" /></td>
       		   <%} %>
              <td valign="bottom" style="height: 23px"> <input style="border:0px ;height: 16px" name='strUnitId' type='radio' value='<%=ug.getStrId()%>'<%=SysUserUnit.isManaged(unitId, ug.getStrId()) && !unitId.equals(ug.getStrId()) || globa.userSession.getIntUserType() == 0 ? "" : " disabled"%>></input></td>
              <td valign="bottom" style="height: 23px"><a  href='unit_show.jsp?strId=<%=ug.getStrId()%>'><%=ug.getStrUnitName()%>/<%=ug.getStrUnitCode()%></a></td>
      		  </tr>
      		 </table>
        <% 
                if (!ug.haveChild()) {  //没有下级用户组，直接收口
        %>
            </td>
          </tr>
        </table>
        <%
                }
                curLevel = ug.getIntLevel();
            }
            //最后收首尾
            for (int j = 1; j < curLevel; j++) {
        %>
        	</td>
           </tr>
</table></td></tr></table>
  <%
            }}catch(Exception e){e.printStackTrace();}
        %>
               <!-- end -->  
 </form>
</body>
</html>
<%@ include file="../include/jsp/footer.jsp"%>