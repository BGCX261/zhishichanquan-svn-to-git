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

var Flag=true;
function Select() 
{
    for (var i=0;i<sOutline.document.Outline.elements.length;i++)
    {
        var e = sOutline.document.Outline.elements[i];
        if (e.name == 'record')
    	   e.checked=Flag;
    }
    Flag=!Flag;
}

function nochecked()
{
   var checkednum = 0;
    for (var i=0;i<sOutline.document.Outline.elements.length;i++)
    {
        var e = sOutline.document.Outline.elements[i];
        if (e.name == 'record' && e.checked)
    	   checkednum++;
    }
	return checkednum;
}

function Print()
{
  var checkednum = 0;
  
  checkednum = nochecked(); 
  if(checkednum == 0)
  {
    alert("请先选择要打印的记录！");
    return;
  }  
  else
  {
  	var theDate =new Date();
	var random=theDate.getTime();
	var inargs = new Array("PRINT");
	
	var strHeight = "295";
	if(g_fIsSP2)
		strHeight = "315";
	var returnval = window.showModalDialog(sRoot+"SelectPDColumn.jsp?rd="+random+"&t="+searchType+"&dt=PRINT",inargs,"dialogHeight:" + strHeight + "px;dialogWidth:320px;center:yes;resizable:no;help:no;status:no;scroll:no");
	if(returnval != null)
	{
		var strReturnValue = returnval[0];
		
		sOutline.document.Outline.downloadcol.value = strReturnValue;
		sOutline.document.Outline.printType.value = "print";
		sOutline.document.Outline.action="print.jsp";
		sOutline.document.Outline.target="_blank";
		sOutline.document.Outline.submit();
	}
  }
}


function Download()
{
  var checkednum = 0;
  
  checkednum = nochecked(); 
  if(checkednum == 0)
  {
    alert("请先选择要下载文摘的记录。");
    return;
  }
  else
  {
  	var theDate =new Date();
	var random=theDate.getTime();
	var inargs = new Array("DOWN");

	var strHeight = "380";
	if(g_fIsSP2)
		strHeight = "360";
	var returnval = window.showModalDialog(sRoot+"SelectPDColumn.jsp?rd="+random+"&t="+searchType+"&dt=DOWN",inargs,"dialogHeight:" + strHeight + "px;dialogWidth:320px;center:yes;resizable:no;help:no;status:no;scroll:no");
	if(returnval != null)
	{
		var strReturnValue = returnval[0];
		var strDownFileType = returnval[1];
		var strDownloadAmount = returnval[2];
		
		sOutline.document.Outline.downloadcol.value = strReturnValue;
		sOutline.document.Outline.downtype.value = strDownFileType;
		sOutline.document.Outline.target="_self";
		sOutline.document.Outline.action=sRoot+"../download?zipfile=yes&downloadAmount="+strDownloadAmount;
//		sOutline.document.Outline.action=sRoot+"../download?zipfile=no&downloadAmount="+strDownloadAmount;
		sOutline.document.Outline.submit();
	}
  }	
}


//保存检索历史记录
function savehistory()
{
  var checkednum = nochecked(); 
  if(checkednum == 0)
  {
    alert("请先选择要放入收藏夹的记录！");
  }
  else
  {
	sOutline.document.Outline.target="_blank";
	//sOutline.document.Outline.action=sRoot+"savehistory.jsp";
	sOutline.document.Outline.act.value="Add";
	sOutline.document.Outline.action=sRoot+"favorite.jsp";
	sOutline.document.Outline.submit();
  }
}

function formsubmit(searchmethod)
 {
 if(searchmethod=='1') 
 {  
 	document.form1.secondsearch.value="ON";
 }
  
if(searchmethod=='2') 
 {
 	document.form1.filtersearch.value="ON";
 }
  document.form1.submit();
}

function go()
{
      if (isNaN(parseInt(document.goform.page.value)) || document.goform.page.value == "")
      	{
      		alert("提示：请正确填写页号(只能是数字).");
      		document.goform.page.value="";
      		document.goform.page.focus();
      		return false;
      	}
      	else
      	{
        	if (parseInt(document.goform.page.value)<=0 || parseInt(document.goform.page.value) > parseInt(intTotalPage))
        	{
           		document.goform.page.value="1";
         	}
       		document.goform.page.value=parseInt(document.goform.page.value);
       		return true
        }
}




function ShowChannelRecord(channelid)
{
	var arrChannel = channelid.split("|");
	if(arrChannel[1] != 0)
	{
		//alert("arrChannel[0]:"+arrChannel[0]);
		document.test1.channelid.value=arrChannel[0];
		document.test1.submit();
	}
	else
		return false;
}


//alert(screen.height);
//alert(screen.availHeight);

//弹出窗口
function openModalwin()
{ 
  	var theDate =new Date();
	var random=theDate.getTime();
	var value = window.showModalDialog("../zgjs/setDisplayColumn.jsp?rd="+random, window.sOutline, "dialogHeight:410px;dialogWidth:435px;center:yes;resizable:no;help:no;status:no;scroll:no");
	if(value==1){
		window.location.reload();
	}
} 



function DownloadTIF()
{

	var strArgs = "";
	var sqhstr = "";
	var strUrl = "";
	var strPage = "";
	var strTI = "";

	var checkednum = 0;
  
	checkednum = nochecked(); 
	if(checkednum == 0)
	{
		alert("请先选择要下载的记录！");
		return;
  	}
  	else
  	{
		var rep = "10";
		var checkboxnum = checkednum;	
		
			if (checkboxnum>0) 
			{
				var recordno=0;
				for(var e=0;e<sOutline.document.Outline.elements.length;e++)
				{
					var tmp;				
					//if(typeof(sOutline.document.Outline.record[e])!="undefined"&&sOutline.document.Outline.record[e].checked==true)
			    var obj = sOutline.document.Outline.elements[e];
			    
//alert(obj.name);			    
					if (obj.name == 'record')
					{
						if(obj.checked){
							tmp = sOutline.document.Outline.elements[e].value;
							tmp = tmp-(curpage-1)*rep;
							if(sqhstr=="")
								sqhstr = eval("sOutline.document.Outline.APO"+recordno+".value") + ",";
							else
								sqhstr += eval("sOutline.document.Outline.APO"+recordno+".value") + ",";
	
							if(strUrl == "")
								strUrl = eval("sOutline.document.Outline.URL"+recordno+".value") + ",";
							else
								strUrl += eval("sOutline.document.Outline.URL"+recordno+".value") + ",";
	
							if(strPage == "")
								if(eval("sOutline.document.Outline.Page"+recordno+".value") == "")
									strPage = "0,";
								else
									strPage = eval("sOutline.document.Outline.Page"+recordno+".value") + ",";
							else
								if(eval("sOutline.document.Outline.Page"+recordno+".value") == "")
									strPage += "0,";
								else
									strPage += eval("sOutline.document.Outline.Page"+recordno+".value") + ",";
	
							if(strTI == "")
								strTI = eval("sOutline.document.Outline.TI_"+recordno+".value") + ",";
							else
								strTI += eval("sOutline.document.Outline.TI_"+recordno+".value") + ",";
						}
						recordno++;
					}
					
				}
				  sqhstr = sqhstr.substring(0,sqhstr.length-1);
				  strUrl = strUrl.substring(0,strUrl.length-1);
				  strPage = strPage.substring(0,strPage.length-1);
				  strTI = strTI.substring(0,strTI.length-1);
//				  alert("!!..."+strTI);
			   }
			   else
			   {
			   	var checkrecord;
			        for (var i=0;i<sOutline.document.Outline.elements.length;i++)
				{
					var e = sOutline.document.Outline.elements[i];
				        if (e.name == 'record' && e.checked)
				    		checkrecord = e.value;
				}
				checkrecord = checkrecord-(curpage-1)*rep - 1;
				
			   	sqhstr = eval("sOutline.document.Outline.APO"+checkrecord+".value");
			   	strUrl = eval("sOutline.document.Outline.URL"+checkrecord+".value");
			   	strPage = eval("sOutline.document.Outline.Page"+checkrecord+".value");
			   	strTI = eval("sOutline.document.Outline.TI_"+checkrecord+".value");
//				alert("**..."+strTI);
			   }
			
		
			strArgs = sqhstr + "|" + strUrl + "|" + strPage;
//			alert(strArgs);
//			return false;
			var arrArgs = strArgs.split("|");
			arrAPO = arrArgs[0].split(",");
			arrUrl = arrArgs[1].split(",");
			arrPage = arrArgs[2].split(",");
			var inargs = new Array(sqhstr, strUrl, strPage, strTI);
		
			var strHeight = "270";
			if(g_fIsSP2)
				strHeight = "295";
			var returnval = window.showModalDialog(sRoot+"MultiDownload.jsp",inargs,"dialogHeight:" + strHeight + "px;dialogWidth:360px;center:yes;resizable:no;help:no;status:no;scroll:no");
			if(returnval != null)
			{
				var r_strAPO = returnval[0];
				var r_strUrl = returnval[1];
				var r_strPage = returnval[2];
				var r_strSavePath = returnval[3];
				document.PatentInfo.strAPO.value = r_strAPO;
				document.PatentInfo.strUrl.value = r_strUrl;
				document.PatentInfo.strPage.value = r_strPage;
				document.PatentInfo.strSavePath.value = r_strSavePath;
		
					//生成一个随机数的窗口名称
				var theDate =new Date();
				var random=theDate.getTime();
				
				rwin = window.open("MultiDownloadForm.jsp",random,"toolbar=no,titlebar=no,location=no,status=no,menubar=no,resizable=no,scrollbars=no,left=0,width=500,height=330");
				if(rwin == null)
					rwin = window.open("MultiDownloadForm.jsp",random,"toolbar=no,titlebar=no,location=no,status=no,menubar=no,resizable=no,scrollbars=no,left=0,width=500,height=330");
			}
		
		}
}

