<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ejoysoft.jiansuo.LawState,java.util.*"%>
<%@ include file="../include/jsp/head.jsp"%>
<%
	LawState lawstate=new LawState(globa,true);
	String strUrl="zgjs_flzt_jieguo.jsp";
 	String ls=request.getParameter("ls");
 	System.out.println(ls+"-------ls-----------------");
 	String table=null;
	String[] tables=new String[]{"flzt","flzt_1"};
 	
 	 	
 	 for(int i=0;i<tables.length;i++){
 	 	table=tables[i];
 	 	String twhere=request.getParameter("searchword");
 		System.out.println(twhere+"-------twhere------121321321323-----------");
 		List<LawState> lawStates=lawstate.searchLs(table,twhere);
		if(lawStates.size()>0){ 
         	 //将检索方法中sql语句的条件绑定到sesion中，方便检索结果页面调用
         	 	globa.session.setAttribute("twhere",twhere);
         	 	globa.session.setAttribute("strdb",table);
         	 	globa.dispatch(true,strUrl);
         	 }else{
         	  
         	 	out.println("<script>alert('没有检索到符合条件的结果，请重新检索！')</script>");
				out.println("<script>window.location.href='zgjs_biaoge.jsp' </script>");
				
  			}
 	 }
 		
 %>
