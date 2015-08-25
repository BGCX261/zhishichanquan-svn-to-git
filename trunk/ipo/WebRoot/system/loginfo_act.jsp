<%@ page import="com.ejoysoft.wlanyz.system.SysLog,com.ejoysoft.common.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/jsp/head.jsp"%>
<%
     SysLog   obj=new SysLog(globa,true);
    String strUrl="loginfo_list.jsp";
    obj.setStrTableName("sys_log_copy");
     if(action.equals(Constants.REMOVE_STR)){
        globa.dispatch(obj.delete(""),strUrl);
    } else if(action.equals(Constants.DELETE_STR)){
      String strArrId[]=ParamUtil.getStrArray(request,"strId");
          //删除所选择的系统参数
       globa.dispatch(obj.delete(" where strId in ("+Constants.ArrayToStr(strArrId)+")"),strUrl);
    }
    //关闭数据库连接对象
    globa.closeCon();
%>