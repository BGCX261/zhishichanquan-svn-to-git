<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.ejoysoft.wlanyz.system.User,com.ejoysoft.common.Constants,com.ejoysoft.common.Format,com.ejoysoft.common.exception.IdObjectException,com.ejoysoft.wlanyz.system.SysUserUnit,java.util.Vector,com.ejoysoft.wlanyz.system.Unit,
                 java.util.HashMap" %>
<%@ include file="../include/jsp/head.jsp"%>
<%
try{
	String strId = ParamUtil.getString(request,"strId","");
	 String strUserId=ParamUtil.getString(request,"strUserId","");
	if(strId.equals(""))
    	throw new IdObjectException("请求处理的信息id为空！或者已经不存在");
    String where="where strId='"+strId+"'";
    User obj=new User(globa,false);
    User obj0=obj.show(where);
    if(obj0==null){
        globa.closeCon();
        throw new IdObjectException("请求处理的信息id='"+strId+"'对象为空！","请检查该信息的相关信息");
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
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

 function showAc(){
  frm.submit();
 }
</script>
</head>


<body>
<form name="frm" method="post" action="user_act.jsp" >
<input type="hidden" name="<%=Constants.ACTION_TYPE%>" value="<%=Constants.UPDATE_STR%>">
<input type="hidden" name=strId value="<%=obj0.getStrId()%>">
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">用户管理</font> &gt; 用户修改 </td>
  </tr>
</table>
<br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td width="6%" class="listtit1"  style="border-left:1px solid #32a4ea;">&nbsp;用户修改</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" class="listd" style="border-left:1px solid #dddddd;border-right:1px solid #dddddd;"><table width="702" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="20" colspan="4">&nbsp;</td>
      </tr>
      <tr>
        <td width="230" align="right">&nbsp;</td>
        <td   align="right" class="tdwz">用户名：</td>
        <%  String name="";
               if(obj0.getStrUserId()!=null)name=obj0.getStrUserId();%>
        <td ><input type="text"  class="ipt" name="strUserId"  readonly="readonly"   value="<%=name%>"/>&nbsp;提示：用户名不可修改
        </td>
        <td ></td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">姓       名：</td>
        <td><input name="strName" type="text"  value="<%=obj0.getStrName()%>"class="ipt"/></td>
        <td>&nbsp;</td>
      </tr>
       <tr >
       <td align="right">&nbsp;</td>
        <td  align="right" class="tdwz">性　　别：</td>
         <td >&nbsp; &nbsp; 
                 
         <input type="radio" name="strSex" value="男" <%if(obj0.getStrSex() !=null && obj0.getStrSex().equals("男")) out.print("checked");%> class="input_box">
                  男
        <input type="radio" name="strSex" value="女" <%if(obj0.getStrSex() !=null && obj0.getStrSex().equals("女")) out.print("checked");%> class="input_box">
                  女
        </td>
         <td  class="tdwz">&nbsp;</td> 
              
                
              </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">所属机构：</td>
        <td><select name="arryUnitId" class="forms_color1">
                    <%
                        HashMap unitUsers = obj.unitUser("strUnitId", " WHERE strUserId='"+strUserId+"'");
                        Vector userGroupTree = SysUserUnit.getUserGroupTree();
                        String strSelect="";
                         for (int i = 0; i < userGroupTree.size(); i++) {
                            Unit ugNode = (Unit)userGroupTree.get(i);
                            strSelect=(unitUsers.containsKey(ugNode.getStrId()) ? " selected" : "");
                           // System.out.println(ugNode.getStrUnitName()+"=="+strSelect);
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
        <td><input name="strDuty" type="text" value="<%=Format.forbidNull(obj0.getStrDuty())%>" class="ipt" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">岗       位：</td>
        <td><input name="strStation" type="text"  value="<%=Format.forbidNull(obj0.getStrStation())%>" class="ipt" /></td>
        <td>&nbsp;</td>
      </tr>
       <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">用户类型：</td>
        <td>
        <select name="strCssType" class="input_box">
                 <%
                  //从全局变量中读取用户类型
                  String userType = (String)application.getAttribute("USER_TYPE");
                  userType = userType !=null ? userType:"";
                  String tempString = obj0.getStrCssType()==null?"":obj0.getStrCssType();
                  String  strCssType=ParamUtil.getString(globa.request,"strCssType",tempString);
                  String[] userTypes = userType.split(",");
                  for (int i = 0; i < userTypes.length; i++) {
              %>
                <option value="<%=userTypes[i]%>" <%if(strCssType!=null && strCssType.equals(userTypes[i])) out.print("selected");%>><%=userTypes[i]%></option>
              <%
                  }
              %> 
                 </select>     </td>
        <td>&nbsp;</td>
      </tr>
      <tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">手      机：</td>
        <td><input name="strMobile" type="text"  value="<%=Format.forbidNull(obj0.getStrMobile())%>" class="ipt" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr> 
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">邮      箱：</td>
        <td><input name="strEmail" type="text" value="<%=Format.forbidNull(obj0.getStrEmail())%>" class="ipt" /></td>
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
<%}catch(Exception e){e.printStackTrace();} %>
<%@ include file="../include/jsp/footer.jsp"%>