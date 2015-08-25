<%@ page import="com.ejoysoft.jiansuo.Patent,java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>


<%

	Patent pt = new Patent();
	String where=request.getParameter("txtSearchWord");
  	System.out.println(where+"===============where");
	String[] strdb=request.getParameterValues("strdb");
	for(int i=0;i<strdb.length;i++){
		String a=strdb[i];
		System.out.println(a);
		 //获取排序的字段
       	 String rel=request.getParameter("sortcolumn");
       	 if(rel.equals("RELEVANCE")){
       	 	String sort=null;
       	 	System.out.println(sort+"=====sort");
       	 	List<Patent> pts=pt.searchCh(a,where,sort);
       	 	System.out.println("list长度===="+pts.size());
       	 }else{
       	  String seq=request.getParameter("R1");
       	  String sort="order by "+rel+" "+seq;
       	  System.out.println(sort+"==========sort");
       	  List<Patent> pts=pt.searchCh(a,where,sort);
     	  System.out.println("list长度===="+pts.size());
       	 }
	
	}	
	
%>