<%@ page import="com.ejoysoft.jiansuo.Patent,com.ejoysoft.common.Globa,javax.servlet.http.HttpServletRequest,java.util.List,java.util.ArrayList;"%>
<%@ page contentType="text/html;charset=UTF-8"%>


<%

	Patent pt = new Patent();
	String where=request.getParameter("txtSearchWord");
  	System.out.print(where);
	String[] strdb=request.getParameterValues("strdb");
	for(int i=0;i<strdb.length;i++){
		String a=strdb[i];
		System.out.print(a+"-");
	
		//if(a.equals("fmsq_ab")){
			//List<Patent> list = pt.search(a,where);
			//System.out.println(list.size());
		
		//}
		//if(a.equals("wgzl_ab")){
		//	List<Patent> list = pt.search(a,where);
			//System.out.println(list.size());
		//}
		//if(a.equals("syxx_ab")){
		//	List<Patent> list = pt.search(a,where);
		//	System.out.println(list.size());
		//}
		//if(a.equals("fmzl_ab")){
		//	List<Patent> list = pt.search(a,where);
		//	System.out.println(list.size());
		//}
	
	}	
	
%>