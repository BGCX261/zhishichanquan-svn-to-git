<%@ page import="com.ejoysoft.wlanyz.system.Unit,com.ejoysoft.wlanyz.system.SysUserUnit,com.ejoysoft.common.Constants"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="com.ejoysoft.common.exception.UserUnitIdException"%>
<%@ include file="../include/jsp/head.jsp"%>
<%
    Unit obj=new Unit(globa,true);
    if (request.getParameter("strAFlag") == null)
    	obj.setStrAFlag("");
    String strUrl=ParamUtil.getString(request,"strUrl","unit_list.jsp");
        if(action.equals(Constants.ADD_STR))  {
           strUrl="unit_list.jsp?strUnitId="+obj.getStrParentId() ;
           globa.dispatch(obj.add(),strUrl);
       }else  if(action.equals(Constants.DELETE_STR)){
            //验证是否符合删除条件
            //必须是没有下级部门组和用户的组才能删除
           String strUserId=ParamUtil.getString(request,"strUnitId","");
           try{
           		SysUserUnit.validateDelId(strUserId);        
           		globa.dispatch(obj.delete("where strId ='"+strUserId+"'"),strUrl);
           }catch(UserUnitIdException e){
           	//	e.printStackTrace();
           	 globa.dispatch(false,strUrl,e.getMessage()+","+e.getAdvice()+ "！操作");
           }
        }else if(action.equals(Constants.UPDATE_STR)){
            String  strUnitId=ParamUtil.getString(request,"strId","");
            //验证是否出现死循环
            SysUserUnit.validateId(strUnitId, obj.getStrParentId());
            globa.dispatch(obj.update(strUnitId),strUrl);
      }
    //重新加载单位信息
   SysUserUnit.reLoad("");
    //关闭数据库连接对象
    globa.closeCon();

%>