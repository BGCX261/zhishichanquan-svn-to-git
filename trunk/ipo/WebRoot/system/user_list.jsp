<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Vector,com.ejoysoft.wlanyz.system.User,com.ejoysoft.common.Constants,com.ejoysoft.wlanyz.system.SysUserUnit,com.ejoysoft.common.exception.NoRightException" %>
<%@ include file="../include/jsp/head.jsp"%>
<%
if(!globa.userSession.hasRight("70010"))
      throw new NoRightException("用户不具备操作该功能模块的权限，请与系统管理员联系！");
%>

<% 
    //初始化
    User  user0=null;
    User obj=new User(globa);
    //查询条件
    String  strName=ParamUtil.getString(request,"strName","");
	String tWhere=" WHERE 1=1";
	if (!strName.equals("")) {
		tWhere += " and strName LIKE '%" + strName + "%'";
	}
	//tWhere += " ORDER BY dtCreatTime";
	//记录总数
	int intAllCount=obj.getCount(tWhere);
	//当前页
	int intCurPage=globa.getIntCurPage();
	//每页记录数
	int intPageSize=globa.getIntPageSize();
	//共有页数
 	int intPageCount=(intAllCount-1)/intPageSize+1;
	// 循环显示一页内的记录 开始序号
	int intStartNum=(intCurPage-1)*intPageSize+1;
	//结束序号
	int intEndNum=intCurPage*intPageSize;   
	//获取到当前页面的记录集
	Vector<User> vctObj=obj.list(tWhere,intStartNum,intPageSize);
	//获取当前页的记录条数
	int intVct=(vctObj!=null&&vctObj.size()>0?vctObj.size():0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=application.getAttribute("APP_TITLE")%></title> 
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../include/date/popc.js"></script>
<script src="../include/js/list.js"></script>
<script language="javascript">
//增加信息
function add() {
   frm.action="user_add.jsp";
   frm.submit();
}

 function showAc(){
   document.getElementById('<%=Constants.PAGE_SIZE_INDEX%>').value= "1";
  frm.submit();
 }
</script>
<style>
A {text-decoration: NONE} 
</style>
</head>


<body>
<form name=frm method=post action="user_list.jsp"> 
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">系统配置</font> &gt; 用户管理</td>
  </tr>
</table>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr>
    <td height="45" valign="middle" bgcolor="e1eef7">
      <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="89%">姓  名：
          <input type="text" name="strName" value="<%=strName %>"/>
          <img src="../images/search.jpg" width="58" height="28" align="absmiddle" onclick="showAc()" style="cursor:hand"/></td>
          <td width="11%" align="right"><img src="../images/add.jpg" width="64" height="27" onClick="add()" style="cursor:hand"/></td>
        </tr>
      </table></td>
  </tr>
</table>

<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    
    <td width="13%" class="listtit">用户名</td>
    <td width="8%" class="listtit">姓名</td>
    <td width="16%" class="listtit">所在部门</td>
    <td width="16%" class="listtit">用户类型</td>
    <td width="17%" class="listtit">基本操作</td>
  </tr>
    <%
            
              for (int i = 0;i < vctObj.size(); i++) {
              String name = "";
              String name1 = "";
              String bumen = "";
              String Type = "";
            	User obj1 = vctObj.get(i);
            	if(obj1.getStrUserId()!=null)name=obj1.getStrUserId();
            	if(obj1.getStrName()!=null)name1=obj1.getStrName();
            	if(SysUserUnit.getTotalName(obj1.getStrUnitId())!=null)bumen=SysUserUnit.getTotalName(obj1.getStrUnitId());
            	if(obj1.getStrCssType()!=null)Type = obj1.getStrCssType();
            %>

  <tr>
    <td class="listd1" style="border-left:1px solid #dddddd;"> <a href='user_show.jsp?strId=<%=obj1.getStrId()%>'><%=name %></a>&nbsp;</td>
    <td class="listd1"><%=name1 %>&nbsp;</td>
    <td class="listd1"><%=bumen%>&nbsp;</td>
    <td class="listd1"><%=Type%>&nbsp;</td>

    <td class="listdrd" style="border-right:1px solid #dddddd;"> <img src="../images/mid.jpg" width="12" height="12" align="absmiddle" /> <a href="user_update.jsp?strUserId=<%=obj1.getStrUserId()%>&strId=<%=obj1.getStrId()%>" >修改</a> <img src="../images/del.jpg" width="11" height="11" align="absmiddle" /> <a href="#" onclick="if(confirm('确认删除该记录？')){location.href='user_act.jsp?<%=Constants.ACTION_TYPE%>=<%=Constants.DELETE_STR%>&strId=<%=obj1.getStrId()%>';}" >删除</a></td>  </tr>
             <%
            }
            %>
</table>

<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="61%" height="50" valign="bottom"><br />&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td width="39%" align="right" valign="bottom">          
      <!-- 翻页开始 -->  
     	<%@ include file="../include/jsp/cpage.jsp"%>
       	<!-- 翻页结束 --> </td>
  </tr>
</table>




 </form>
</body>
</html>
<%@ include file="../include/jsp/footer.jsp"%>