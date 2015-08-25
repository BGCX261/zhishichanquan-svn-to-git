<%@ page import="java.util.Vector,com.ejoysoft.wlanyz.system.SysUserUnit,com.ejoysoft.wlanyz.system.Unit,com.ejoysoft.common.exception.IdObjectException,com.ejoysoft.common.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.ejoysoft.common.Format"%>
<%@ include file="../include/jsp/head.jsp"%>
<%
        //返回页面的url
    String strUrl="unit_list.jsp";
    String strId=ParamUtil.getString(request,"strId","");
       if(strId.equals(""))
       throw new IdObjectException("请求处理的信息id为空！或者已经不存在");
       String where="where strId='"+strId+"'";
        Unit unit=new Unit(globa,false);
       Unit  unit0=unit.show(where);
    if(unit0==null){
        globa.closeCon();
        throw new IdObjectException("请求处理的信息id='"+strId+"'对象为空！","请检查该信息的相关信息");
    }
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /><style type="text/css">
<!--
body {
	background-color: #f2f8ff;
}
.sel1{ width:160px;}
.STYLE1 {color: #FF0000}
.s6 a:link{ line-height:25px;height:25px; color:#333333}
.s6 a:hover{ line-height:25px;height:25px; color:#333333}

-->
</style>
<script src="../include/js/chkFrm.js"></script>
<script type="text/javascript">
<!--
    function chkFrm(){
        if(frm.strParentId.value=="0")
        {
            alert("\请选择上级部门！！！")
            frm.strParentId.focus();
            return false;
        }
        else if(frm.strUnitName.value=="")
        {
            alert("\请输入部门名称！！！")
            frm.strUnitName.focus();
            return false;
        }
       else  frm.submit();
    }
-->
</script>
</head>


<body>
<form name="frm" method="post" action="unit_act.jsp">
<input type="hidden" name="<%=Constants.ACTION_TYPE%>" value="<%=Constants.UPDATE_STR%>">
  <input type="hidden" name=strId  value="<%=strId%>">
  <input type="hidden" name=strUrl  value="<%=strUrl%>">
  <input type="hidden" name="strOldParentId" value="<%=unit0.getStrParentId()%>">
  <input type="hidden" name="strUnitCode" value="<%=unit0.getStrUnitCode()%>">
  <input type="hidden" name="intLevel" value="<%=unit0.getIntLevel()%>">
    <input type="hidden" name="intOldSort" value="<%=unit0.getIntSort()%>">
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">部门管理</font> &gt; 部门信息 </td>
  </tr>
</table>
<br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td width="6%" class="listtit1"  style="border-left:1px solid #32a4ea;">&nbsp;部门信息</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" class="listd" style="border-left:1px solid #dddddd;border-right:1px solid #dddddd;"><table width="702" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="20" colspan="4">&nbsp;</td>
      </tr>
      <tr>
        <td width="128" align="right">&nbsp;</td>
        <td width="100"  align="right" class="tdwz">上级部门：</td>
        <td width="262"><input type="text" name="textfield" value="<%=(SysUserUnit.getTotalName(unit0.getStrParentId()).equals(""))?"顶级部门":SysUserUnit.getTotalName(unit0.getStrParentId())%>" readonly="readonly" class="ipt" /></td>
        <td width="212">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">部门名称：</td>
        <td><input type="text" name="textfield2" value="<%=Format.forbidNull(unit0.getStrUnitName())%>" class="ipt" readonly="readonly"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">部门简称：</td>
        <td><input type="text" name="textfield3"  class="ipt" value="<%=Format.forbidNull(unit0.getStrEasyName())%>" readonly="readonly"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">办公电话：</td>
        <td><input type="text" name="textfield4" class="ipt" value="<%=Format.forbidNull(unit0.getStrUnitPhone())%>" readonly="readonly"/></td>
        <td>&nbsp;</td>
      </tr>
       <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">办公地址：</td>
        <td><input type="text" name="textfield4" class="ipt" value="<%=Format.forbidNull(unit0.getStrUnitAddress())%>" readonly="readonly"/></td>
        <td>&nbsp;</td>
      </tr>
       <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">备   注：</td>
        <td><input type="text" name="textfield4" class="ipt" value="<%=Format.forbidNull(unit0.getStrRemark())%>" readonly="readonly"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td height="50" align="left">&nbsp;&nbsp;</td>
        <td height="50" colspan="2" align="left">
          &nbsp;<input name="B12" type="button"  onclick="window.location.href='unit_list.jsp';"  value="返  回" class="ipt2" style="cursor:hand"/></td>
        </tr>
    </table>
      <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
 </form>
</body>
</html>
<%@ include file="../include/jsp/footer.jsp"%>