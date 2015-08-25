<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.ejoysoft.jiansuo.Patent,java.util.*"%>
<%@ include file="../include/jsp/head.jsp"%>
<%
	Patent pt=new Patent();
	String[] strdb=request.getParameterValues("strdb");
	String obj=request.getParameter("txtComb");	
	String sort="";
	List<Patent> pts=new ArrayList<Patent>();
	String twhere=pt.tiHuan(obj);
	String strUrl="hyjs_biaoge_jieguo.jsp";
	
	//获取每个输入框的值
	String a=request.getParameter("pn");
	String b=request.getParameter("an");
	String c=request.getParameter("ad");
	String d=request.getParameter("pd");
	String e=request.getParameter("ti");
	String f=request.getParameter("abst");
	String g=request.getParameter("pic");
	String h=request.getParameter("sic");
	String i=request.getParameter("pa");
	String j=request.getParameter("inn");
	String k=request.getParameter("cl");
	String l=request.getParameter("pr");
	String m=request.getParameter("fa");
	
	//替代组合逻辑检索表达式中的字符

	if(twhere.indexOf("$#A@&*") !=-1  ){
	
	twhere =twhere.replace("$#A@&*"," pn like "+"'"+a+"'");
	}
	
	if(twhere.indexOf("$#B@&*") !=-1){
	twhere =twhere.replace("$#B@&*"," an like "+"'"+b+"'");
	}
	if(twhere.indexOf("$#C@&") !=-1){
	twhere =twhere.replace("$#C@&"," ad = "+"'"+c+"'");
	}
	if(twhere.indexOf("$#D@&*") !=-1){
	twhere =twhere.replace("$#D@&*"," pd = "+"'"+d+"'");
	}
	if(twhere.indexOf("$#E@&*") !=-1){
	 twhere =twhere.replace("$#E@&*"," ti like "+"'"+e+"'");		
	}
	if(twhere.indexOf("$#F@&*") !=-1){
	twhere =twhere.replace("$#F@&*"," abst like "+"'"+f+"'");
	}
	if(twhere.indexOf("$#G@&*") !=-1){
	twhere =twhere.replace("$#G@&*"," pic like "+"'"+g+"'");
	}
	if(twhere.indexOf("$#H@&*") !=-1){
	twhere =twhere.replace("$#H@&*"," sic like "+"'"+h+"'");
	}
	if(twhere.indexOf("$#I@&*") !=-1){
	twhere =twhere.replace("$#I@&*"," pa like "+"'"+i+"'");
	}
	if(twhere.indexOf("$#J@&*") !=-1){
	twhere =twhere.replace("$#J@&*"," inn like "+"'"+j+"'");
	}
	if(twhere.indexOf("$#K@&*") !=-1){
	twhere =twhere.replace("$#K@&*"," cl like "+"'"+k+"'");
	}
	if(twhere.indexOf("$#L@&*") !=-1){
	twhere =twhere.replace("$#L@&*"," pr like "+"'"+l+"'");
	}
	if(twhere.indexOf("$#M@&*") !=-1){
	twhere =twhere.replace("$#M@&*"," agc like "+"'"+m+"'");
	}
	
	for(int x=0;x<strdb.length;x++){
		String table=strdb[x];
		
		
		  //获取排序的字段
         	 String ziduan=request.getParameter("sortcolumn");
         	 if(request.getParameter("sortcolumn").equals("RELEVANCE")){

         	 	 pts=pt.showHW(table,twhere,sort);
         	 	
         	 }else{
         		 String so=request.getParameter("R1");
         		sort="order by "+ziduan+" "+so;
         
         	  pts=pt.showHW(table,twhere,sort);
         	
         	 }
         	  if(pts.size()>0){ 
         	 //将检索方法中sql语句的条件绑定到sesion中，方便检索结果页面调用
         	 	globa.session.setAttribute("twhere",twhere);
         	 	globa.session.setAttribute("sort",sort);
         	 	globa.session.setAttribute("strdb",strdb);
         	 	globa.dispatch(true,strUrl);
         	 }else{
         	  
         	 	out.println("<script>alert('没有检索到符合条件的结果，请重新检索！')</script>");
				out.println("<script>window.location.href='hyjs_biaoge.jsp' </script>");
				
  			}
		
	}	
%>


 
