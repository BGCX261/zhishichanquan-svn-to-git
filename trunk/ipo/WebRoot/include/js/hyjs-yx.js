//判断是否为XPSP2的IE
var g_fIsSP2 = false;
function browserVersion()
{
   g_fIsSP2 = (window.navigator.userAgent.indexOf("SV1") != -1);
/*
   if (g_fIsSP2)
   {
   //This browser is Internet Explorer in SP2. 
   }
   else
   {
   //This browser is not Internet Explorer in SP2.
   }
*/
}



function PageDown()
{
	if(cPage+1 > tPage)
	{
		alert('已经是最后一页了');
		return;
	}
	document.turnpage.action=tagUrl;
	document.turnpage.record.value = cPage + 1;
	document.turnpage.target = tagWindow;
	
	setButtonDisabled();
	document.turnpage.submit();
}

function PageUp()
{
	if(cPage-1 <= 0)
	{
		alert('已经是第一页了');
		return;
	}
	document.turnpage.action=tagUrl;
	document.turnpage.record.value = cPage - 1;
	document.turnpage.target = tagWindow;
	
	setButtonDisabled();
	document.turnpage.submit();
}

function MoveTo(str)
{
	//if(isNaN(parseInt(document.turnpage.page.value)) || 
	if(str <= 0 || str > tPage)
	{
		document.turnpage.record.value = 1;
	}
	else
	{
		document.turnpage.record.value = str;
	}
	document.turnpage.action=tagUrl;
	document.turnpage.target = tagWindow;
	
	setButtonDisabled();
	document.turnpage.submit();
}

function JumpPage()
{
	var strJumpPage = document.all.txtJumpPageNumber.value;
	//if(isNaN(parseInt(document.turnpage.page.value)) || 
	if(parseInt(strJumpPage) <= 0 || parseInt(strJumpPage) > parseInt(tPage))
	{
		document.turnpage.record.value = 1;
	}
	else
	{
		document.turnpage.record.value = strJumpPage;
	}
	document.turnpage.action=tagUrl;
	document.turnpage.target = tagWindow;
	
	setButtonDisabled();
	document.turnpage.submit();
}

function setButtonDisabled()
{
	document.all.FirstPage.disabled = true;
	document.all.PrevPage.disabled = true;
	document.all.NextPage.disabled = true;
	document.all.LastPage.disabled = true;
}

function ViewPatent()
{
	document.ViewPatent.submit();
}

function ViewAuthPatent()
{
	document.ViewAuthPatent.submit();
}

function OnPageMemberkeyDown()
{
	if(event.keyCode == 13)
	{
		JumpPage();
	}
}

function Print()
{
	browserVersion();
  	var theDate =new Date();
	var random=theDate.getTime();
	var inargs = new Array("PRINT");

	var strHeight = "295";
	if(g_fIsSP2)
		strHeight = "315";

	var returnval = window.showModalDialog("SelectPDColumn.jsp?rd="+random+"&t="+searchType+"&dt=PRINT",inargs,"dialogHeight:"+strHeight+"px;dialogWidth:320px;center:yes;resizable:no;help:no;status:no;scroll:no");
	if(returnval != null)
	{
		var strReturnValue = returnval[0];
		
		document.turnpage.downloadcol.value = strReturnValue;
		document.turnpage.action="print.jsp";
		document.turnpage.target="_blank";
		document.turnpage.submit();
	}

}


function Download()
{
  	browserVersion();
  	var theDate =new Date();
	var random=theDate.getTime();
	var inargs = new Array("DOWN");

	var strHeight = "340";
	if(g_fIsSP2)
		strHeight = "360";

	var returnval = window.showModalDialog("SelectPDColumn.jsp?rd="+random+"&t="+searchType+"&dt=DOWN",inargs,"dialogHeight:"+strHeight+"px;dialogWidth:320px;center:yes;resizable:no;help:no;status:no;scroll:no");
	if(returnval != null)
	{
		var strReturnValue = returnval[0];
		var strDownFileType = returnval[1];
		
		document.turnpage.downloadcol.value = strReturnValue;
		document.turnpage.downtype.value = strDownFileType;
		document.turnpage.target="_self";
		document.turnpage.action="../download?zipfile=yes";
		document.turnpage.submit();
	}
}


//图片按比例缩放 
var flag=false; 
function DrawImage(ImgD)
{
	 var image=new Image(); 
	 var iwidth = 780;  //定义允许图片宽度 
	 var iheight = 800;  //定义允许图片高度 
	 image.src=ImgD.src;
	 if(image.width > 780)
	 {
		 if(image.width>0 && image.height>0)
		 { 
			 flag=true; 
			 if(image.width/image.height>= iwidth/iheight)
			 { 
				  if(image.width>iwidth)
				  {   
					  ImgD.width=iwidth; 
					  ImgD.height=(image.height*iwidth)/image.width; 
				  }
				  else
				  { 
					  ImgD.width=image.width;   
					  ImgD.height=image.height; 
				  } 
				  ImgD.alt=image.width+"×"+image.height; 
			 } 
			 else
			 { 
				  if(image.height>iheight)
				  {
					  ImgD.height=iheight; 
					  ImgD.width=(image.width*iheight)/image.height;   
				  }
				  else
				  { 
					  ImgD.width=image.width;   
					  ImgD.height=image.height; 
				  } 
				  ImgD.alt=image.width+"×"+image.height; 
		  	} 
		 }
	}
}  
