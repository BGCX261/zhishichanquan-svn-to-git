<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.ejoysoft.wlanyz.system.User,com.ejoysoft.common.Constants,com.ejoysoft.util.ParamUtil,com.ejoysoft.wlanyz.system.SysUserUnit"%>
<%@ include file="../include/jsp/head.jsp"%>
<%
    User obj=new User(globa,true);
    String strUrl="user_list.jsp";
    String  strUnitId=ParamUtil.getString(request,"strUnitId","");
    if(action.equals(Constants.DELETE_STR)){
    	String[] aryStrId = ParamUtil.getStrArray(request, "strId");
    	
    	    	for (int i = 0; i < aryStrId.length; i++) {
    	    	if(aryStrId[i]!=null && aryStrId[i].equals(globa.userSession.getStrId())){
	    	
	    	System.out.println(aryStrId[i]+"+++++"+globa.userSession.getStrUserId()+globa.userSession.getStrId());
	    	out.print("<script>alert('不能删除用户自身');window.location.href = 'user_list.jsp';</script>");
	    	}else{
	    	obj.delete("where strId ='"+aryStrId[i]+"'",aryStrId[i]);
	    	globa.dispatch(true, strUrl);
	    	}
    	}
    	
    	

	} else {
	    if(action.equals(Constants.ADD_STR)) {
	    String strUserId=ParamUtil.getString(request,"strUserId","");
		     String[] arryUnitId=ParamUtil.getStrArray(request,"arryUnitId");
             if(obj.getCount(" where strUserId='" + strUserId.replaceAll(" ","") + "'")>0){
                globa.closeCon();
                out.print("<script>alert('已经存在"+strUserId.replaceAll(" ","")+"用户, 请输入其他用户名');window.location.href = 'user_add.jsp';</script>"
);
             }else{
            obj.setStrDepart(SysUserUnit.UnitNames(arryUnitId));     //用户所属组织名称
            obj.setStrUnitId(arryUnitId[0]);
            globa.dispatch(obj.add(strUserId)&&obj.addUnitUser(strUserId,arryUnitId),strUrl);
             }	    
		}
		else if(action.equals(Constants.UPDATE_STR)){
            String  strUserId=ParamUtil.getString(request,"strUserId","");
            String[] arryUnitId=ParamUtil.getStrArray(request,"arryUnitId");
             if(strUrl.indexOf(".jsp")>=0)
                 strUrl=strUrl+"?strUnitId="+strUnitId;
                 obj.setStrDepart(SysUserUnit.UnitNames(arryUnitId));     //用户所属组织名称
                 obj.setStrUnitId(arryUnitId[0]);
                 globa.dispatch(obj.update(strUserId)&&obj.delUnitUser(" WHERE strUserId='"+strUserId+"'")&&obj.addUnitUser(strUserId,arryUnitId),strUrl);
      }
	}
    //关闭数据库连接对象
    globa.closeCon();
%>