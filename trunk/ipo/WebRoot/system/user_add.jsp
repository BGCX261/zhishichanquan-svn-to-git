<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Vector,com.ejoysoft.wlanyz.system.SysUserUnit,
com.ejoysoft.wlanyz.system.Unit,com.ejoysoft.common.Constants" %>
<%@ include file="../include/jsp/head.jsp"%>
<%
//获取单位的strId
 String  strUnitId=ParamUtil.getString(request,"strUnitId","");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=application.getAttribute("APP_TITLE")%></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F8F9FA;
}
body,td,th {
	font-size: 9pt;
	color: #111111;
}
-->
</style>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script src="../include/js/chkFrm.js"></script>
<script language="javascript">
    function chkFrm() {
        if(trim(frm.strUserId.value)=="") {
            alert("请输入用户名！！！")
            frm.strUserId.focus();
            return false;
        }
        if(trim(frm.strName.value)=="") {
            alert("请输入姓名！！！")
            frm.strName.focus();
            return false;
        } 
        if(trim(frm.strUserId.value).length>20){
        	alert("用户名长度不应大于20位");
        	frm.strUserId.focus();
        	return false;	
        }
		 if(trim(frm.strName.value).length>20){
        	alert("姓名长度不应大于20位");
        	frm.strName.focus();
        	return false;	
        }
        if(trim(frm.strMobile.value)==""||trim(frm.strMobile.value).match("1[0-9]{10}$")){	
        
        }else{
        	alert("请输入正确的手机号！");
        	frm.strMobile.focus();
        	return false;
        }
        if(trim(frm.strEmail.value)==""||trim(frm.strEmail.value).match("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$")){	
        
        }else{
        	alert("请输入正确的邮箱！");
        	frm.strEmail.focus();
        	return false;
        }
  
       	frm.submit();
    }
    function clearSpecialCharacter(obj) {
obj.value = obj.value.replace(/[,`~!@#$%^&*:;><|. \\/=]/g, "");
}



</script>
</head>

<body>
<form name="frm" method="post" action="user_act.jsp">
<input type="hidden" name="<%=Constants.ACTION_TYPE%>" value="<%=Constants.ADD_STR%>">
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">用户管理</font> &gt;新增用户 </td>
  </tr>
</table>
<br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td width="6%" class="listtit1"  style="border-left:1px solid #32a4ea;">&nbsp;新增用户</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" class="listd" style="border-left:1px solid #dddddd;border-right:1px solid #dddddd;"><table width="702" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="20" colspan="4">&nbsp;</td>
      </tr>
      <tr>
        <td width="128" align="right">&nbsp;</td>
        <td width="100"  align="right" class="tdwz">用户名：</td>
        
        <td width="262"><input type="text"  class="ipt" name="strUserId" onkeyup="clearSpecialCharacter(this)"   /></td>
        <td width="212">&nbsp;&nbsp;&nbsp;注意：用户名不能为特殊字符</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">姓       名：</td>
        <td><input name="strName" type="text"  class="ipt"/></td>
        <td>&nbsp;</td>
      </tr>
       <tr >
       <td align="right">&nbsp;</td>
        <td  align="right" class="tdwz">性　　别：</td>
         <td >&nbsp; &nbsp; 
                 
         <input type="radio" name="strSex" value="男"  class="input_box" checked>
                  男
        <input type="radio" name="strSex" value="女"  class="input_box">
                  女
        </td>
         <td  class="tdwz">&nbsp;</td> 
              
                
              </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">所属机构：</td>
        <td><select name="arryUnitId" class="forms_color1">
                    <%
                        Vector userGroupTree = SysUserUnit.getUserGroupTree();
                        String strSelect="";
                        for (int i = 0; i < userGroupTree.size(); i++) {
                            Unit ugNode = (Unit)userGroupTree.get(i);
                            strSelect=(ugNode.getStrId().equals(strUnitId)?"selected":"");
                            out.print("<option value=" + ugNode.getStrId() + " "+strSelect+">");
                            for (int j = 1; j < ugNode.getIntLevel(); j++) {
                                out.print("&nbsp;");
                            }
                            out.println("├" + ugNode.getStrUnitName() + "</option>");
                        }
                %>
                  </select> </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">职       务：</td>
        <td><input name="strDuty" type="text"  class="ipt" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">岗       位：</td>
        <td><input name="strStation" type="text"  v class="ipt" /></td>
        <td>&nbsp;</td>
      </tr>
       <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">用户类型：</td>
        <td>
         <select name="strCssType" class="input_box">
                    <%
                  //从全局变量中读取参数类型
                  String userType = (String)application.getAttribute("USER_TYPE");
                  String[] userTypes = userType.split(",");
                  for (int i = 0; i < userTypes.length; i++) {
              %>
                <option value="<%=userTypes[i]%>"><%=userTypes[i]%></option>
              <%
                  }
              %>
                 </select>
        <td>&nbsp;</td>
      </tr>
      <tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">手      机：</td>
        <td><input name="strMobile" type="text"   class="ipt" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr> 
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">邮      箱：</td>
        <td><input name="strEmail" type="text"  class="ipt" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>           
      <tr>
        <td align="right">&nbsp;</td>
        <td height="50" align="left">&nbsp;&nbsp;</td>
        <td height="50" colspan="2" align="left"><input name="B1" type="button"   value="确  定" onclick="chkFrm()"  class="ipt1" style="cursor:hand"/>
          &nbsp;<input  name="B12" type="reset"  value="取 消" class="ipt2" style="cursor:hand"/>
          &nbsp;<input name="B12" type="button"  onclick="window.location.href='user_list.jsp';" value="返 回" class="ipt2" style="cursor:hand"/></td>
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