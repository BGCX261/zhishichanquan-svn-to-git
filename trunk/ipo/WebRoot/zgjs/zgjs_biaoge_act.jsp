<%@ page import="com.ejoysoft.jiansuo.Patent,com.ejoysoft.wlanyz.* ,java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/jsp/head.jsp"%>
<%
	InitClass initClass=new InitClass();
	
	Patent pt=new Patent();
	String[] strdb=request.getParameterValues("strdb");
	String obj=request.getParameter("txtComb");	
	String twhere=pt.tiHuan(obj);
	String sort="";
	List<Patent> pts=new ArrayList<Patent>();
  	String strUrl="zgjs_biaoge_jieguo.jsp";
   
	//获取每个输入框的值
	String a=request.getParameter("an");
	String b=request.getParameter("ad");
	String c=request.getParameter("pnm");
	String d=request.getParameter("pd");
	String e=request.getParameter("ti");
	String f=request.getParameter("abst");
	String g=request.getParameter("pic");
	String h=request.getParameter("sic");
	String i=request.getParameter("pa");
	String j=request.getParameter("inn");
	String k=request.getParameter("cl");
	String l=request.getParameter("ar");
	String m=request.getParameter("agc");
	String n=request.getParameter("agt");
	String p=request.getParameter("pr");
	String q=request.getParameter("co");
	String r=request.getParameter("txtR");
	
	
	//替代组合逻辑检索表达式中的字符
	if(twhere.indexOf("$#A@&*") !=-1  ){
	
	twhere =twhere.replace("$#A@&*"," an like "+"'"+a+"'");
	}
	
	if(twhere.indexOf("$#B@&*") !=-1){
	twhere =twhere.replace("$#B@&*"," ad= "+"'"+b+"'");
	}
	if(twhere.indexOf("$#C@&") !=-1){
	twhere =twhere.replace("$#C@&"," pnm like "+"'"+c+"'");
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
	twhere =twhere.replace("$#L@&*"," ar like "+"'"+l+"'");
	}
	if(twhere.indexOf("$#M@&*") !=-1){
	twhere =twhere.replace("$#M@&*"," agc like "+"'"+m+"'");
	}
	if(twhere.indexOf("$#N@&*") !=-1){
	twhere +=twhere.replace("$#N@&*"," agt like "+"'"+n+"'");
	}
	if(twhere.indexOf("$#P@&*") !=-1){
	twhere =twhere.replace("$#P@&*"," pr like "+"'"+p+"'");
	}
	if(twhere.indexOf("$#Q@&*") !=-1){
	twhere =twhere.replace("$#Q@&*"," co like "+"'"+q+"'");
	}
	if(twhere.indexOf("$#R@&*") !=-1){
	twhere =twhere.replace("$#R@&*","txtR="+"'"+r+"'");
	}


	for(int x=0;x<strdb.length;x++){
		String table=strdb[x];
		System.out.println(table+"     数据库");
		int count=pt.count(table,twhere);
		System.out.println(table+"表有:"+count+"条数据符合要求");
		  //获取排序的字段
         	 String ziduan=request.getParameter("sortcolumn");
         	 if(request.getParameter("sortcolumn").equals("RELEVANCE")){
         	 	 pts=pt.showP(table,twhere,sort);
         	 
         	 	
         	 }else{
         	 String so=request.getParameter("R1");
         	  sort="order by "+ziduan+" "+so;
         	  System.out.println(sort+"sort");
         	  pts=pt.showP(table,twhere,sort);
         	  
         	 }
         	 
         	 if(pts.size()>0){ 
         	 //将检索方法中sql语句的条件绑定到sesion中，方便检索结果页面调用
         	 	globa.session.setAttribute("twhere",twhere);
         	 	globa.session.setAttribute("sort",sort);
         	 	globa.session.setAttribute("strdb",strdb);
         	 	globa.dispatch(true,strUrl);
         	 }else{
         	  
         	 	out.println("<script>alert('没有检索到符合条件的结果，请重新检索！')</script>");
				out.println("<script>window.location.href='zgjs_biaoge.jsp' </script>");
				
  	}
		
	}	
	
%> 