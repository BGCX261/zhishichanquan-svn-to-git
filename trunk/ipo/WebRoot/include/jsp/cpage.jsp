<%@ page contentType="text/html;charset=UTF-8"%> 
<%
String path3 = request.getContextPath();
String basePath3 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path3+"/";
	int intStartPage;//页面显示起始页
	int intEndPage;//页面显示最后页
	int intPage = intCurPage - 3;
    //页面数小于7则全部输出
	if(intPageCount <= 7){
	 intStartPage = 1;
	 intEndPage = intPageCount;
	}
	//页面数大于9
	else {
	// 请求当前页面小于4则先输出前7个
	 if(intPage <=0 ){
	  intStartPage = 1;
	  intEndPage = 5; 
	  }
	  //。。。
	  else{
	   intStartPage = intPage;
	   intEndPage = intStartPage + 4;
	   if(intEndPage >= intPageCount - 2){
	    intEndPage = intPageCount;
	    intStartPage = intEndPage - 6;
	    }
	  }
	 
	}
%>
 <table width="auto" border="0" cellspacing="0" cellpadding="0">
      <tr><% 
         if(intCurPage > 0){
        %> 
        <td width="40"><img src="../images/up.jpg" width="39" height="30" border="0" onclick="javascript:goto1(<%=intCurPage - 1%>)" style="cursor:hand" alt="上一页" /></td>
         <%
         }
         %>
        <td width="auto" align="center" background="../images/page_bg.jpg" class="page">
          <% 
         	for (int i = intStartPage; i <= intEndPage; i++){
             if(i == intCurPage){
          %>
               <a href="#" onclick= "javascript:goto(<%=i %>)">&nbsp;<span class="sel" ><%=i%></span>&nbsp;</a>
           <%
            }
             else {
           %>
              <a href="#" onclick= "javascript:goto(<%=i %>)">&nbsp;<%=i %>&nbsp;</a>
             <%
              }
              %>
        <%
        }
         %>
         <%
          if(intEndPage < intPageCount - 2){
          %>
         
          <a href="#" onclick="javascript:goto(<%=intPageCount-1 %>)"><%=intPageCount-1 %></a> 
          <a href="#" onclick="javascript:goto(<%=intPageCount %>)"><%=intPageCount %></a>            
          <%
          }
           %>
 		</td>
 		<% 
        if(intCurPage <= intPageCount){
        %> 
        <td width="39"><img src="../images/down.jpg" width="39" height="30"  border="0" onclick="javascript:goto1(<%=intCurPage +1 %>)" style="cursor:hand" alt="下一页"/></td>  
         <%
           } 
          %>
         <td valign="middle">&nbsp;&nbsp;</td>
         <td valign="middle"><img src="../images/gopage1.jpg"/></td>
        <td valign="middle">&nbsp;<input type="text" id="gotoPage" name="gotoPage" style="width: 29px;height: 19px;" value=""; />
        	&nbsp;<input id="<%=com.ejoysoft.common.Constants.PAGE_SIZE_INDEX%>" name="<%=com.ejoysoft.common.Constants.PAGE_SIZE_INDEX%>" type="hidden" value="<%=intCurPage %>"/></td>
        <td><img src="../images/gopage.jpg" onclick="javascript:goto(document.getElementById('gotoPage').value)" style="cursor:hand" alt="跳转页"/></td>
      </tr>
    </table> 	
<script language="JavaScript">
//验证翻页的有效性
function goto(inputVlaue)
{
	var TelPhoneParn =/^-?\d+$/; 
	var reParn = new RegExp(TelPhoneParn);
	if(<%=intPageCount%>==1 && inputVlaue > <%=intPageCount%>){
		alert("这里只有一页数据！");
    	document.getElementById('gotoPage').focus();
    	return false;
	}
	else if(inputVlaue==null || inputVlaue<=0 || !reParn.test(inputVlaue+"") || inputVlaue > <%=intPageCount%>)
    {
    	
    	alert("输入非有效，请输入1-<%=intPageCount%>数字！");
    	document.getElementById('gotoPage').focus();
    	return false;
    	
    }
	
	frm.<%=com.ejoysoft.common.Constants.PAGE_SIZE_INDEX%>.value=inputVlaue;	
	frm.action ="<%=basePath3%>/<%=application.getServletContextName()%>/<%=request.getServletPath()%>";
	frm.submit();
	
}
function goto1(inputVlaue)
{
	
	if(inputVlaue==0){
	    alert("已经是第一页！");
	    return;
	}
	if(inputVlaue==<%=(intPageCount + 1)%>){
	    alert("已经是最后一页！");
	    return;
	}
	frm.<%=com.ejoysoft.common.Constants.PAGE_SIZE_INDEX%>.value=inputVlaue;	
	frm.action ="<%=basePath3%>/<%=application.getServletContextName()%>/<%=request.getServletPath()%>";
	frm.submit();
	
}
</script>