<%@ page import="java.util.Vector,com.ejoysoft.wlanyz.system.SysUserUnit,com.ejoysoft.wlanyz.system.Unit,com.ejoysoft.common.exception.IdObjectException,com.ejoysoft.common.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.ejoysoft.common.Format"%>
<%@ include file="../include/jsp/head.jsp"%>
<%
        //返回页面的url
    String strUrl="unit_list.jsp";
    String strId=ParamUtil.getString(request,"strUnitId","");
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
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
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
      if(trim(frm.strUnitPhone.value)==""||trim(frm.strUnitPhone.value).match("0[0-9]{2,3}-[0-9]{7,8}$")){	       
       }else{
        	alert("请输入正确的办公电话！");
        	frm.strUnitPhone.focus();
        	return false;
       }
       frm.submit();
    }
-->
</script>
</head>


<body>

<form name="frm" method="post" action="unit_act.jsp">
<input type="hidden" name="<%=Constants.ACTION_TYPE%>" value="<%=Constants.UPDATE_STR%>"></input>
 <input type="hidden" name=strId  value="<%=strId%>"> </input> 
  <input type="hidden" name=strUrl  value="<%=strUrl%>"></input>
  <input type="hidden" name="strOldParentId" value="<%=unit0.getStrParentId()%>"></input>
  <input type="hidden" name="strUnitCode" value="<%=unit0.getStrUnitCode()%>"></input>
  <input type="hidden" name="intLevel" value="<%=unit0.getIntLevel()%>"></input>
    <input type="hidden" name="intOldSort" value="<%=unit0.getIntSort()%>"></input>

<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">部门管理</font> &gt; 部门修改 </td>
  </tr>
</table>
<br>

<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="6%" class="listtit1"  style="border-left:1px solid #32a4ea;">&nbsp;部门管理</td>
  </tr>
  
  <tr>
    <td bgcolor="#FFFFFF" class="listd" style="border-left:1px solid #dddddd;border-right:1px solid #dddddd;"><table width="702" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="20" colspan="4">&nbsp;</td>
      </tr>
      <tr><td align="right">&nbsp;</td>
        <td align="right" class="tdwz">上级部门：</td>
              
        <td ><select name="strParentId" class="input_box">
                     <option value="0">请选择上级部门</option>
                    <%
                    if (globa.userSession.getIntUserType() == 0) {
                    %>
                    <option value="">=无上级部门=</option>
                    <%
                    }
                    String strStyle="style='background-color:red;'";
                    Vector userGroupTree = SysUserUnit.getUserGroupTree();
                    for (int i = 0; i < userGroupTree.size(); i++) {
                        Unit ugNode = (Unit)userGroupTree.get(i);
                       // if (SysUserUnit.isManaged(globa.userSession.getStrUnitId()[0], ugNode.getStrId())) {
	                        strStyle=(ugNode.getStrId().equals(strId)?" style='background-color:red;'":"");
	                        if(!ugNode.getStrId().equals(strId)&&!ugNode.getStrParentId().equals(strId)){
	                        out.print("<option value=" + ugNode.getStrId() + " "+strStyle+">");}//上级部门不显示自己
	                        for (int j = 1; j < ugNode.getIntLevel(); j++) {
	                            out.print("&nbsp;");
	                        }
                        	out.println("├" + ugNode.getStrUnitName() + "</option>");
                        //}
                    }
                %>
                  </select>
                  <script language="javascript">
                  for (var i = 0; i < frm.strParentId.options.length; i++) {
                    if (frm.strParentId.options[i].value == "<%=unit0.getStrParentId()%>") {
                        frm.strParentId.options[i].selected = true;
                        break;
                    }
                  }
              </script>
              </td>
      </tr>
     <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">部门名称：</td>
        <td><input type="text" name="strUnitName" class="ipt" value="<%=Format.forbidNull(unit0.getStrUnitName())%>"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="128" align="right">&nbsp;</td>
        <td width="100"  align="right" class="tdwz">部门简称：</td>
        <td width="262"><input type="text" name="strEasyName" class="ipt" value="<%=Format.forbidNull(unit0.getStrEasyName())%>" /></td>
        <td width="212">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">办公电话：</td>
        <td><input type="text" name="strUnitPhone" class="ipt" value="<%=Format.forbidNull(unit0.getStrUnitPhone())%>" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">办公地址：</td>
        <td><input type="text" name="strUnitAddress" class="ipt"  value="<%=Format.forbidNull(unit0.getStrUnitAddress())%>"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">备　　注：</td>
        <td> <textarea name="strRemark" cols="35"  rows="4" class="input_box"><%=Format.forbidNull(unit0.getStrRemark())%></textarea></td>
        <td>&nbsp;</td>
      </tr>
     <tr>
        <td align="right">&nbsp;</td>
        <td height="50" align="left">&nbsp;&nbsp;</td>
        <td height="50" colspan="2" align="left"> <input name="Submit3" type="button"  value="确  定" onclick="chkFrm()" class="ipt1" style="cursor:hand"/>
          &nbsp;<input name="Submit2" type="reset"  value="取  消" class="ipt2" style="cursor:hand"/>
          &nbsp;<input name="Submit2" type="button"  onclick="window.location.href='unit_list.jsp';" class="ipt2" value="返  回" style="cursor:hand"/></td>
        </tr>
    </table>
      <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</br></form>
</body>
</html>