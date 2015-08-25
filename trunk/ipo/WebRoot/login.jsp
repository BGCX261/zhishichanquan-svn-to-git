<%@ page contentType="text/html;charset=UTF-8"%> 
<%@page import="com.ejoysoft.common.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>知识产权局系统登录界面</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />
<style type="text/css">

</style>
<script language="JavaScript">
  
        function LoginClick(){
            if(document.getElementById('username').value == ""||document.getElementById('username').value == "请输入用户名")
            {
                alert("用户名不能为空！");
                document.getElementById('username').focus();
                return false;
            }else  if(document.getElementById('password').value == ""){
            
                alert("密码不能为空！");
                document.getElementById('password').focus();
                return false;
            }else{
            	document.getElementById("frm").submit();
            }
        }
        
     //   function useer(){ 
	//	  frm.action="main4.jsp------系统首页";
	//	  frm.submit();
	//	}
     
</script>
</head>

<body>
<form name="frm" id="frm" method="post"  action="<%=application.getContextPath()%>/Auth" >
	<input type="hidden" name="actiontype" value="<%=Constants.LOGON%>" />
	<input type="hidden" name="screensize" value=""/>
	<input type="hidden" name="authType" value="password"/>
<div class="login">
  <div class="table">
    <table width="200" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="40">
        <input type="text" id="username" name="username" value="请输入用户名"   onblur="if(this.value.length&lt;1)this.value=this.defaultValue;" onfocus="if(this.value==this.defaultValue)this.value=''"  />
</td>
      </tr>
      <tr>
        <td height="50">
		<input name="" type="text"  id="tx"  value="密码" />
		<input name="password" type="password"  id="password" style="display:none;" />
	<script type="text/javascript">
	var tx = document.getElementById("tx"), pwd = document.getElementById("password");
	tx.onfocus = function(){
	if(this.value != "密码") return;
	this.style.display = "none";
	pwd.style.display = "";
	pwd.value = "";
	pwd.focus();
	}
	pwd.onblur = function(){
	if(this.value != "") return;
	this.style.display = "none";
	tx.style.display = "";
	tx.value = "密码";
	}
</script>	
	</td>
      </tr>
      <tr>
        <td height="40" valign="bottom">      
        <img src="images/login_dl.jpg" width="116" height="31" border="0" onclick="LoginClick();"/>&nbsp;
        <img src="images/login_qx.jpg" width="101" height="31" onclick="reset();"/></td>

      </tr>
    </table>
	
  </div>
  <div class="bottom">合肥**有限责任公司&nbsp;&copy;版权所有&nbsp;2012-2016</div>

</div>
</form>
</body>
</html>