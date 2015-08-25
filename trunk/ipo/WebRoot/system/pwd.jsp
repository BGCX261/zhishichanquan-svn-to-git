<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/jsp/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>密码修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script src="../include/js/chkFrm.js"></script>
<script language="javascript">
    function chkFrm() {
        if(trim(frm.strOldPwd.value)=="") {
            alert("请输入原密码！！！")
            frm.strOldPwd.focus();
            return false;
        } else if(trim(frm.strPwd.value)=="") {
            alert("请输入新密码！！！")
            frm.strPwd.focus();
            return false;
        } else if(frm.strPwd2.value != frm.strPwd.value) {
            alert("请保证两次密码输入一致！！！")
            frm.strPwd2.focus();
            return false;
        } else {
        	frm.submit();
        }
    }
</script>
</head>


<body>
<form name="frm" method="post" action="pwd_act.jsp">
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><img src="../images/ri_list.jpg" width="14" height="14" align="absbottom" />&nbsp;您现在所在的位置：<font color="#0e7cc9">系统配置</font> &gt; 密码修改 </td>
  </tr>
</table>

<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td width="6%" class="listtit"  style="border-left:1px solid #32a4ea;">&nbsp;密码修改</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" class="listd" style="border-left:1px solid #dddddd;border-right:1px solid #dddddd;"><table width="702" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="20" colspan="4">&nbsp;</td>
      </tr>
      <tr>
        <td width="328" align="right">&nbsp;</td>
        <td width="300"  align="right" class="tdwz">原密码：</td>
        <td width="262"><input name="strOldPwd" type="password" class="ipt" /></td>
        <td width="112">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">新密码：</td>
        <td><input name="strPwd" type="password" class="ipt"/></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td align="right" class="tdwz">确认新密码：</td>
        <td><input name="strPwd2" type="password" class="ipt" /></td>
        <td>&nbsp;</td>
      </tr>
     
      <tr>
        <td align="right">&nbsp;</td>
        <td height="50" align="left">&nbsp;&nbsp;</td>
        <td height="50" colspan="2" align="left"><input type="button" name="B1" value="确认" class="ipt1" onclick="chkFrm()" style="cursor:hand"/>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="B12" value="取 消" class="ipt2" style="cursor:hand" />
          </td>
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
