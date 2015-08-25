<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.ejoysoft.wlanyz.system.SysLog,
                 java.util.Vector,com.ejoysoft.common.Format,com.ejoysoft.common.Constants,com.ejoysoft.common.exception.NoRightException"%>

<%@ include file="../include/jsp/head.jsp"%>

<%
if(!globa.userSession.hasRight("70030"))
      throw new NoRightException("用户不具备操作该功能模块的权限，请与系统管理员联系！");
%>
<%

    //初始化
    SysLog  log0=null;
    SysLog obj=new SysLog(globa);
%>
<%
    //查询条件
    String operator=ParamUtil.getString(request,"operator","");  //操作人
    String startdate=ParamUtil.getString(request,"startdate","");  //起始时间
    String enddate=ParamUtil.getString(request,"enddate","");    //截至时间
    String tWhere=" WHERE 1=1";
    if(!operator.equals(""))
        tWhere+=" and strOperator like '%"+operator+"%'";
%>
<%
       //记录总数
      int intAllCount=obj.getCount(tWhere,startdate,enddate);
      //当前页
      int  intCurPage=globa.getIntCurPage();
      //每页记录数
       int intPageSize=globa.getIntPageSize();
      //共有页数
       int intPageCount=(intAllCount-1)/intPageSize+1;
        // 循环显示一页内的记录 开始序号
      int intStartNum=(intCurPage-1)*intPageSize+1;
      //结束序号
      int intEndNum=intCurPage*intPageSize;
     //获取到当前页面的记录集
       Vector vctObj=obj.list(tWhere,startdate,enddate,intStartNum,intPageSize);
      //获取当前页的记录条数
      int intVct=(vctObj!=null&&vctObj.size()>0?vctObj.size():0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<title>日志管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="JavaScript" src="../include/date/popc.js"></script>
<script src="../include/js/list.js"></script>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function logSch(frmObj,actPage)
{
    var frmName=eval(frmObj);
    if (frmName.keyName.value=="")
    {
        alert("请选择查询类别！！！");
        return;
    }
     frmName.action=actPage;
     frmName.submit();
}

function del(){
	if (iCheckedNumber(document.all.strId) == 0) {
		alert("请先选择要删除的记录！");
		return;
	}
    if(!confirm('您是否确认要删除所选中的所有记录？'))
        return;
     frm.action="loginfo_act.jsp?<%=Constants.ACTION_TYPE%>=<%=Constants.DELETE_STR%>";
     frm.submit();
}

 function showAc(){
 document.getElementById('<%=Constants.PAGE_SIZE_INDEX%>').value= "1";
  frm.submit();
 }
</script>
</head>


<body>
<form name=frm method=post action="loginfo_list.jsp">
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">系统配置</font> &gt;日志管理</td>
  </tr>
</table>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr>
    <td height="45" valign="middle" bgcolor="e1eef7">
      <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="89%">操作员：
          <input type="text" name="operator" value="<%=operator %>" />
          <img src="../images/search.jpg" width="58" height="28" align="absmiddle" onclick="showAc()" style="cursor:hand"/></td>
          <td width="11%" align="right"> </td>
        </tr>
      </table></td>
  </tr>
</table>
<br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td width="6%" class="listtit"  style="border-left:1px solid #32a4ea;"><input type="checkbox" name="checkbox62" value="checkbox" onclick="selAll(document.all.strId)" style="height:12px;" />
    全选</td>
    <td width="8%" class="listtit">序号</td>
    <td width="8%" class="listtit">操作人</td>
    <td width="16%" class="listtit">操作模块</td>
    <td width="16%" class="listtit">操作信息</td>
    <td width="10%" class="listtit">操作日期</td>
    <td width="16%" class="listtit">机器(IP)</td>
  </tr>
  <%        String IP = "";
             for(int i=0;i<intVct;i++){ 
             log0=(SysLog)vctObj.get(i);
             IP= Format.forbidNull(log0.getStrOperatorIp());
            %>
  <tr>
    <td class="listd1" style="border-left:1px solid #dddddd;">
    <input type="checkbox"  name=strId value="<%=log0.getStrId() %>" style="height:12px;" /></td>
    <td class="listd1"><%=intStartNum+i%></td>
    <td class="listd1"><%=log0.getStrOperator()%></td>
    <td class="listd1"><%=log0.getStrOther()%></td>
    <td class="listd1"><%=log0.getStrCode()%></td>
    <td class="listd1"><%=log0.getdOccurDate()%></td>
    <td class="listd1"><%=(log0.getStrOperatorIp() == null?"手机端操作":log0.getStrOperatorIp())%></td>
  </tr>
   <%} %>
</table>

<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="61%" height="50" valign="bottom"><img src="../images/pldel.jpg" width="83" height="27" align="absmiddle" onclick="del();"/> &nbsp;&nbsp;
      
     </td>
    <td width="39%" align="right" valign="bottom">
    <!--翻页结束  -->
		<%@ include file="../include/jsp/cpage.jsp"%>
	<!--翻页结束  -->
   </td>
  </tr>
</table>
</form>
</body>
</html>

<%@ include file="../include/jsp/footer.jsp"%>
