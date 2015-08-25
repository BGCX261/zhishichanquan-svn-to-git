<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<style type="text/css">
<!--
.style1 {
	font-size: 12px
}

body {
	margin-left: 0px;
	margin-top: 0px;
	background-color: menu;
}

INPUT.SmallInput {
	BORDER-RIGHT: black 1px solid;
	BORDER-TOP: black 1px solid;
	FONT-WEIGHT: normal;
	FONT-SIZE: 9pt;
	BACKGROUND: #ffffff;
	BORDER-LEFT: black 1px solid;
	LINE-HEIGHT: normal;
	BORDER-BOTTOM: 1px double;
	FONT-STYLE: normal;
	HEIGHT: 18px;
	FONT-VARIANT: normal
}

INPUT.BigButton {
	BORDER-RIGHT: #7f7f7f 2px solid;
	BORDER-TOP: #7f7f7f 1px solid;
	FONT-SIZE: 10pt;
	BACKGROUND: #f1f0f0;
	BORDER-LEFT: #7f7f7f 1px solid;
	CURSOR: hand;
	COLOR: #000000;
	BORDER-BOTTOM: #7f7f7f 2px solid;
	HEIGHT: 20px;
	TEXT-DECORATION: none
}
-->
</style>


		<title>设定显示字段</title>


		<script type="text/javascript">
function func_find(select_obj, option_text) {
	//pos=option_text.indexOf("] ")+1;
	//option_text=option_text.substr(0,pos);
	//alert(pos);
	//alert(option_text);
	for (j = 0; j < select_obj.options.length; j++) {
		str = select_obj.options(j).text;
		if (str.indexOf(option_text) >= 0)
			return j;
	}//for
	alert(j);
	return j;
}

function func_color(select_obj) {
	font_color = "blue";
	option_text = "";
	for (j = 0; j < select_obj.options.length; j++) {
		str = select_obj.options(j).text;
		if (str.indexOf(option_text) < 0) {
			if (font_color == "red")
				font_color = "blue";
			else
				font_color = "blue";
		}
		select_obj.options(j).style.color = font_color;

		pos = str.indexOf("] ") + 1;
		option_text = str.substr(0, pos);
	}//for
	return j;
}

function func_insert() {
	//var length0=document.form1.WaitSelectItem.options.length;
	//for (i=document.form1.WaitSelectItem.options.length-1; i>=0; i--)
	for (i = 0; i <= document.form1.WaitSelectItem.options.length - 1; i++) {
		//alert("WaitSelectItem.length:"+document.form1.WaitSelectItem.options.length);
		//alert(document.form1.WaitSelectItem.options(i).value);
		if (document.form1.WaitSelectItem.options(i).selected) {
			//alert("ben");
			option_text = document.form1.WaitSelectItem.options(i).text;
			option_value = document.form1.WaitSelectItem.options(i).value;
			option_style_color = document.form1.WaitSelectItem.options(i).style.color;

			var my_option = document.createElement("OPTION");
			my_option.text = option_text;
			my_option.value = option_value;
			my_option.style.color = option_style_color;

			//   pos=func_find(document.form1.SelectedItem,option_text);
			pos = document.form1.SelectedItem.length;
			//alert("SelectedItem.length:"+pos);
			document.form1.SelectedItem.add(my_option, pos);
			document.form1.WaitSelectItem.remove(i);
			i--;
		}
	}//for
	func_init();
}

function func_delete() {
	//for (i=document.form1.SelectedItem.options.length-1; i>=0; i--)
	for (i = 0; i <= document.form1.SelectedItem.options.length - 1; i++) {
		if (document.form1.SelectedItem.options(i).selected) {
			option_text = document.form1.SelectedItem.options(i).text;
			option_value = document.form1.SelectedItem.options(i).value;
			if (option_text == "申请（专利）号" || option_text == "专利号"
					|| option_text == "主分类号" || option_text == "名称") {
				//申请（专利）号|120#主分类号|80#专利名称|260
				alert("不能移除“" + option_text + "”");
			} else {
				var my_option = document.createElement("OPTION");
				my_option.text = option_text;
				my_option.value = option_value;

				//		 pos=func_find(document.form1.WaitSelectItem,option_text);
				pos = document.form1.WaitSelectItem.length;

				document.form1.WaitSelectItem.add(my_option, pos);
				document.form1.SelectedItem.remove(i);
				i--;
			}
		}
	}//for

	func_init();
}

function func_select_all1() {
	for (i = document.form1.SelectedItem.options.length - 1; i >= 0; i--)
		document.form1.SelectedItem.options(i).selected = true;
}

function func_select_all2() {
	for (i = document.form1.WaitSelectItem.options.length - 1; i >= 0; i--)
		document.form1.WaitSelectItem.options(i).selected = true;
}

function func_init() {
	func_color(document.form1.WaitSelectItem);
	func_color(document.form1.SelectedItem);
}

function mysubmit() {
	fld_str = "";
	for (i = 0; i < document.form1.SelectedItem.options.length; i++) {
		options_value = document.form1.SelectedItem.options(i).value;
		fld_str += options_value + ",";
	}
	document.form1.FLD_STR.value = fld_str;
	document.form1.submit();
}

function set_view_type() {
	location = "set_user.php?DISK_ID=7&VIEW_TYPE=1";
}
</script>
	</head>
	<body class="bodycolor" onload="func_init();">
	
		<table align="center">
			<tbody>
				<tr>
					<td>
						<fieldset>
							<legend></legend>
							<table width="409" align="center" cellpadding="3" cellspacing="0">
								<form action="" method="post" name="form1">

								<tbody>
									<tr>
										<td width="166" align="center">
											<span class="style1"><b>已选显示字段</b>
											</span>
										</td>
										<td width="56" align="center">
											&nbsp;
										</td>
										<td width="161" align="center">
											<span class="style1"><b>备选显示字段</b>
											</span>
										</td>
									</tr>
									<tr>
										<td valign="top" align="center">
											<select class="box2" name="SelectedItem"
												ondblclick="func_delete();" multiple="multiple"
												style="width: 150; height: 200">
												<option value="申请（专利）号">
													申请（专利）号
												</option>
												<option value="主分类号">
													主分类号
												</option>
												<option value="名称">
													名称
												</option>

											</select>
											<input value=" 全 选 " onclick="func_select_all1();"
												class="SmallInput" type="button">
										</td>

										<td align="center">
											<input class="SmallInput" value=" ← "
												onclick="func_insert();" type="button">
											<br>
											<br>
											<input class="SmallInput" value=" → "
												onclick="func_delete();" type="button">
											<br>
											<br>
											<br>
											<br>
											<input id="moveup" class="SmallInput"
												onclick="MoveUp(SelectedItem);" value="上移" type="button">
											<br>
											<br>
											<input id="movedown" class="SmallInput"
												onclick="MoveDown(SelectedItem);" value="下移" type="button">
											<br>
											<br>
										</td>

										<td valign="top" align="center">
											<select name="WaitSelectItem" ondblclick="func_insert();"
												multiple="multiple" style="width: 150; height: 200">
												<option value="分类号">
													分类号
												</option>
												<option value="申请（专利权）人">
													申请（专利权）人
												</option>
												<option value="发明（设计）人">
													发明（设计）人
												</option>
												<option value="公开（公告）日">
													公开（公告）日
												</option>
												<option value="公开（公告）号">
													公开（公告）号
												</option>
												<option value="申请日">
													申请日
												</option>
												<option value="范畴分类">
													范畴分类
												</option>
												<option value="专利代理机构">
													专利代理机构
												</option>
												<option value="代理人">
													代理人
												</option>
												<option value="地址">
													地址
												</option>
												<option value="国省代码">
													国省代码
												</option>

											</select>
											<input value=" 全 选 " onclick="func_select_all2();"
												class="SmallInput" type="button">
										</td>
									</tr>

									<tr>
										<td colspan="3" align="center">
											<span class="style1">在&nbsp; <input name="txtSaveDays"
													size="2" style="height: 18" value="0" type="text">
												&nbsp;天内保存我的设定</span>
										</td>
									</tr>

									<tr>
										<td colspan="3" valign="top" align="center">
											<span class="style1">点击条目时，可以组合CTRL或SHIFT键进行多选</span>
											<br>
											<br>
											<input class="BigButton" value="保 存"
												onclick="javascript:setCookie(SelectedItem)" type="button">
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input class="BigButton" value="放 弃"
												onclick="javascript:window.close()" type="button">
										</td>
									</tr>


								</tbody>
							</form>
							</table>
						</fieldset>
					</td>
				</tr>
			</tbody>
		</table>



		<script>
var pwindow = window.dialogArguments;
var arr = new Array();
var arr_value = new Array();
var SelectItem;

function GetArray(oSel) {
	//将select中的所有option的value值将保存在Array中
	for ( var i = 0; i < SelectItem.length; i++) {
		arr[i] = oSel.options[i].text;
		arr_value[i] = oSel.options[i].value;
	}
}
//向上移动
function MoveUp(oSel) {
	//选中项的ID号
	var selectIndex = oSel.selectedIndex;
	SelectItem = oSel;

	if (selectIndex == -1) {
		alert('只有已选显示字段可以移动，请先选择要移动的项');
		return false;
	}

	GetArray(oSel);
	if (ChangOrder(selectIndex, 'UP') == true) {
		DisabledButton(true);
		UpdateSelect();
		//设定原来选定的项  
		SelectItem.selectedIndex = selectIndex - 1;
		DisabledButton(false);
	} else
		SelectItem.selectedIndex = selectIndex;
}

function DisabledButton(flag) {
	document.form1.moveup.disabled = flag;
	document.form1.movedown.disabled = flag;
}

//向下移动
function MoveDown(oSel) {
	//选中项的ID号
	var selectIndex = oSel.selectedIndex;
	SelectItem = oSel;

	if (selectIndex == -1) {
		alert('只有已选显示字段可以移动，请先选择要移动的项');
		return false;
	}

	GetArray(oSel);
	if (ChangOrder(selectIndex, 'DOWN') == true) {
		DisabledButton(true);
		UpdateSelect();

		//设定原来选定的项  
		SelectItem.selectedIndex = selectIndex + 1;
		DisabledButton(false);
	} else
		SelectItem.selectedIndex = selectIndex;

}

function ChangOrder(i, t) {
	var s1;
	var s2;
	var s3;
	var s4
	var m;

	if (t == "UP" && i == 0) {
		alert('已经是第一项了');
		return false;
	}
	if (t == "DOWN" && i == SelectItem.length - 1) {
		alert('已经是最末项了');
		return false;
	}

	if (t == 'UP' && i > 0)
		m = i - 1;
	if (t == "DOWN" && i < SelectItem.length - 1)
		m = i + 1;

	for (j = 0; j < arr.length; j++) {
		if (j == m) {
			s1 = arr[j];
			s3 = arr_value[j];
		}
		if (j == i) {
			s2 = arr[j];
			s4 = arr_value[j];
		}
	}
	arr[m] = s2;
	arr[i] = s1;

	arr_value[m] = s4;
	arr_value[i] = s3;
	return true;
}

function UpdateSelect() {
	//清空Select中全部Option
	var ln = SelectItem.length;
	while (ln--) {
		SelectItem.options[ln] = null;
	}

	//将排序后的数组重新添加到Select中
	for (i = 0; i < arr.length; i++) {
		SelectItem.add(new Option(arr[i], arr_value[i]));
	}
}
function getSelectedFields(sel_dest) {
	var sel_dest_len = sel_dest.length;
	var sel_dests = "";
	for ( var j = 0; j < sel_dest_len; j++) {
		var SelectedText = sel_dest.options[j].value;
		//alert(SelectedText);
		//     sel_dest.options.add(new Option(SelectedText));
		sel_dests = sel_dests + "#" + SelectedText;
	}
	sel_dests = sel_dests.substring(1);
	//alert(sel_dests);
	return sel_dests;
}
function setCookie(sel_dest) {
	
	var strSelectedFields = getSelectedFields(sel_dest);
	
	var strCookie = "0";
	var strCookieName = "CNDisplayCookies=";
	if (strCookie == "0")
		strCookieName = "CNDisplayCookies=";
	else
		strCookieName = "FRDisplayCookies=";
	
	var str = strCookieName + escape(strSelectedFields);
	if (document.all.txtSaveDays.value != null
			&& document.all.txtSaveDays.value != ""
			&& document.all.txtSaveDays.value != 0) {
		var tmpSaveDays = document.all.txtSaveDays.value;
		if (isNaN(parseInt(tmpSaveDays))){
			tmpSaveDays = 1;
		}
		var dtToday = new Date();
		var strSaveDays = dtToday.getTime()+ ((parseInt(tmpSaveDays)) * 24 * 60 * 60 * 1000);
		dtToday.setTime(strSaveDays);
		
		str = str + " ; expires=" + dtToday.toGMTString();
		alert("aaaa"+dtToday.toGMTString());
	}
	document.cookie = str + " ; path=/";
	
	window.returnValue = "1";
	window.close();
}
</script>
	</body>
</html>
