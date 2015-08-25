package com.ejoysoft.jiansuo;


/**
 * 
 * @author Administrator
 *
 */
public class FiledStr {
	/**
	 * 获得对应patent对象对应的String字段的值
	 */
	public String getFiledValue(String str,Patent patent){
		if(str.equals("申请（专利）号")){
			str = patent.getAn();
		}else if(str.equals("主分类号")){
			str = patent.getPic();
		}else if(str.equals("名称")){
			str = patent.getTi();
		}else if(str.equals("分类号")){
			str = patent.getSic();
		}else if(str.equals("申请（专利权）人")){
			str = patent.getPa();
		}else if(str.equals("发明（设计）人")){
			str = patent.getInn();
		}else if(str.equals("公开（公告）日")){
			str = patent.getPd();
		}else if(str.equals("公开（公告）号")){
			str = patent.getPnm();
		}else if(str.equals("申请日")){
			str = patent.getAd();
		}else if(str.equals("范畴分类")){
			str = patent.getSsr();
		}else if(str.equals("专利代理机构")){
			str = patent.getAgc();
		}else if(str.equals("代理人")){
			str = patent.getAgt();
		}else if(str.equals("地址")){
			str = patent.getAr();
		}else if(str.equals("国省代码")){
			str = patent.getCo();
		}
		
		
		return str;
		
	}

}
