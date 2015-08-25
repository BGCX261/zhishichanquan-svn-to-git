
function insertItem(obj,str){
	var sr=document.getElementById("txt"+str).value.replace(/\s/gi,'');
	var reg=/^[A-R]{1}$/;
	var len=obj.length;
	var sb=obj.substring(len-1,len);
 	if(sr==""){
      alert("请先输入检索词！");
    
    }else if(obj== ""){
    	document.getElementById('txtComb').value =str;
   
    }else if(reg.test(sb)){
    	alert("请输入逻辑符号，如“and”、“or”等！");
    }else{
    
    	document.getElementById('txtComb').value +=str;
 	}
 }
function insertItem1(obj,str){
	var len=obj.length;
	var sb2=obj.substring(len-3,len);
 	if(obj== ""){    	
    	document.getElementById('txtComb').value =str;
  
    }else if(sb2=="and"||sb2=="or"){
   		
    }else{	
    	
    	document.getElementById('txtComb').value +=str;	
    }
 }


function formsubmit(SearchForm,act)
{
	var strSearchWord = "";
    var strdb="";
    var obj=document.getElementById('txtComb').value.replace(/\s/gi,'');
  
    for(var e=0;e<document.loginform.strdb.length;e++)
    {
		if(document.loginform.strdb[e].checked)
		{
			strdb=strdb+document.loginform.strdb[e].value+",";
		}
	} 
	strdb=strdb.substring(0,strdb.length-1);

	if(strdb=="")
	{
		alert("请选择频道");
		return false;
	}
	if(obj==""||obj==null){
		alert("表达式为空或输入有错误！！");
		return false;
	}
		
	
 }


function AnalyseChar(s)
{
	var str1 = s;
	while (str1.indexOf("？")!= -1)
	{
		str1=str1.replace("？","?");
	}
	while (str1.indexOf("％")!= -1)
	{
		str1=str1.replace("％","%");
	}
	while (str1.indexOf("（")!= -1)
	{
		str1=str1.replace("（","(");
	}
	while (str1.indexOf("）")!= -1)
	{
		str1=str1.replace("）",")");
	}
	while (str1.indexOf("＜")!= -1)
	{
		str1=str1.replace("＜","<");
	}
	while (str1.indexOf("＞")!= -1)
	{
		str1=str1.replace("＞",">");
	}
	while (str1.indexOf("＝")!= -1)
	{
		str1=str1.replace("＝","=");
	}
	while (str1.indexOf("′")!= -1)
	{
		str1=str1.replace("′","'");
	}
	return str1;
}

function CheckInputFormat(s)
{
	var iLcount = 0;
	var iRcount = 0;
	var iCount = 0;
	var tmp = s;
	while(tmp.indexOf("(") != -1)
	{
		if(tmp.substring(0,1) == "(")
			iLcount++;
		tmp = tmp.substring(1);
	}
	tmp = s;
	while(tmp.indexOf(")") != -1)
	{
		if(tmp.substring(0,1) == ")")
			iRcount++;
		tmp = tmp.substring(1);
	}
	if(iLcount != iRcount)
	{
		//alert(iLcount + ' ' + iRcount);
		return false;
	}

	tmp = s;
	
var count00=0;
var strtemp="";

if(tmp.indexOf("'") != -1)
{
	for(iCount=0;iCount<=s.length;iCount++)	
	{	
		strtemp=tmp.substr(iCount,1);
		if(strtemp=="'")
		{
			count00++
		}
	}
}

	if(count00 % 2 != 0)
	{
		//alert('2');
		return false;
	}
	return true;

}

var Flag = false;
function Select(obj, item) 
{
    for (var i=0;i<obj.elements.length;i++)
    {
        var e = obj.elements[i];
        if (e.name == item)
    	   e.checked=Flag;
    }
    Flag=!Flag;
    if(!Flag)
    	obj.btnSelect.value = "取消";
    else
    	obj.btnSelect.value = "全选";
}

