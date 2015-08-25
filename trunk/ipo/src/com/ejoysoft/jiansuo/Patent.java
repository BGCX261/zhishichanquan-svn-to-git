package com.ejoysoft.jiansuo;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ejoysoft.wlanyz.InitClass;
import com.ejoysoft.common.DbConnect;
import com.ejoysoft.common.Globa;
//Patent  专利
public class Patent {
  	private Globa globa;
	 
  	private DbConnect db=new DbConnect();
	private InitClass initClass=new InitClass();
//	private String namberMax=initClass.getServletConfig().getInitParameter("CHA_XUN_LIANG");

	public Patent(){

	}

	public Patent load(ResultSet rs) {
		Patent theBean = new Patent();
		try {

			theBean.setAn(rs.getString("an"));
			theBean.setPic(rs.getString("pic"));
			theBean.setTi(rs.getString("ti"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return theBean;
	}
	
	public List<Patent> search(String strTableName,String where) {
		List<Patent> list = new ArrayList<Patent>();
		String sql = "select * from "+strTableName+" where " + where;
		System.out.println(sql);
		ResultSet rs = db.executeQuery(sql);
		try {
			if (rs.next()) {
					Patent theBean = new Patent();
					theBean = theBean.load(rs);
					list.add(theBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			db.closeCon();
		}
		return list;
	}
	

     
	

	/*
	 * 中国表格专利检索方法
	 */

	public List<Patent> showP(String strdb,String obj,String sort)throws Exception{
		
		List<Patent> patents=new ArrayList<Patent>();
		String sql="";
		try{
			if(sort!=""){
				sql="SELECT * FROM " + strdb +" where "+ obj +" "+sort+"";
		
			}else{
				sql="SELECT * FROM " + strdb +" where "+ obj +"";
				
			}
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				Patent p=new Patent();
				p.setPnm(rs.getString(1));
				p.setPd(rs.getString(2));
				p.setAn(rs.getString(3));
				p.setAd(rs.getString(4));
				p.setPn(rs.getString(5));
				p.setTi(rs.getString(6));
				p.setPic(rs.getString(7));
				p.setSic(rs.getString(8));
				p.setPa(rs.getString(9));
				p.setInn(rs.getString(10));
				p.setAbst(rs.getString(11));
				p.setCl(rs.getString(12));
				p.setPr(rs.getString(13));
				p.setFa(rs.getString(14));
				p.setCo(rs.getString(15));
				p.setDan(rs.getString(16));
				p.setAr(rs.getString(17));
				p.setAgc(rs.getString(18));
				p.setAgt(rs.getString(19));
				p.setErt(rs.getString(20));
				p.setAcd(rs.getDate(21));
				p.setIan(rs.getString(22));
				p.setIpn(rs.getString(23));
				p.setDen(rs.getDate(24));
				p.setAdsp(rs.getString(25));
				p.setPec(rs.getString(26));
				p.setSec(rs.getString(27));
				p.setPnc(rs.getString(28));
				p.setSnc(rs.getString(29));
				p.setDdp(rs.getString(30));
				p.setNp(rs.getString(31));
				p.setAc(rs.getString(32));
				p.setPat(rs.getString(33));
				p.setApf(rs.getString(34));
				p.setRl(rs.getString(35));
				p.setSsr(rs.getString(36));
				p.setCb(rs.getString(37));
				p.setIb(rs.getString(38));
				p.setIbp(rs.getString(39));
				p.setCbn(rs.getString(40));
				p.setIbn(rs.getString(41));
				p.setIbpn(rs.getString(42));
				patents.add(p);
	
			}
			
		}catch (Exception e) {
			 e.printStackTrace();

		}	
		finally{
			db.closeCon();
		}
		 
		return patents;
	}
	
	/*
	 * 国外及港澳台表格专利检索
	 */
	public List<Patent> showHW(String strdb,String obj,String sort)throws Exception{
		List<Patent> patents=new ArrayList<Patent>();
		String sql="";
		try{
			if(sort!=null){
				sql="SELECT * FROM " + strdb +" where "+ obj +" "+sort+"";	
			}else{
				sql="SELECT * FROM " + strdb +" where "+ obj +"";
			}
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				Patent p=new Patent();
				p.setPnm(rs.getString(1));
				p.setPd(rs.getString(2));
				p.setAn(rs.getString(3));
				p.setAd(rs.getString(4));
				p.setPn(rs.getString(5));
				p.setTi(rs.getString(6));
				p.setPic(rs.getString(7));
				p.setSic(rs.getString(8));
				p.setPa(rs.getString(9));
				p.setInn(rs.getString(10));
				p.setAbst(rs.getString(11));
				p.setCl(rs.getString(12));
				p.setPr(rs.getString(13));
				p.setFa(rs.getString(14));
				p.setCo(rs.getString(15));
				p.setDan(rs.getString(16));
				p.setAr(rs.getString(17));
				p.setAgc(rs.getString(18));
				p.setAgt(rs.getString(19));
				p.setErt(rs.getString(20));
				p.setAcd(rs.getDate(21));
				p.setIan(rs.getString(22));
				p.setIpn(rs.getString(23));
				p.setDen(rs.getDate(24));
				p.setAdsp(rs.getString(25));
				p.setPec(rs.getString(26));
				p.setSec(rs.getString(27));
				p.setPnc(rs.getString(28));
				p.setSnc(rs.getString(29));
				p.setDdp(rs.getString(30));
				p.setNp(rs.getString(31));
				p.setAc(rs.getString(32));
				p.setPat(rs.getString(33));
				p.setApf(rs.getString(34));
				p.setRl(rs.getString(35));
				p.setSsr(rs.getString(36));
				patents.add(p);
			}
		}catch (SQLException e) {
			 e.printStackTrace();
		}finally{
			db.closeCon();
		}	
		 
		return patents;
	}
	/**
	 * 分页显示
	 * pageNum 前一页的最大记录号，也是每一页的最大rownum
	 * @return
	 */
	public List<Patent> showFY(String table,String where,int pageNum)throws Exception{
		List<Patent> patents=new ArrayList<Patent>();
		
		String sql="";
		try{				
		sql="select top 10 * from (select *,row_number() over(order by an) as rownum from "+ table +" where "+ where+")as t where t.rownum >"+pageNum+"";
			System.out.println(sql);
			
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				Patent p=new Patent();
				p.setPnm(rs.getString(1));
				p.setPd(rs.getString(2));
				p.setAn(rs.getString(3));
				p.setAd(rs.getString(4));
				p.setPn(rs.getString(5));
				p.setTi(rs.getString(6));
				p.setPic(rs.getString(7));
				p.setSic(rs.getString(8));
				p.setPa(rs.getString(9));
				p.setInn(rs.getString(10));
				p.setAbst(rs.getString(11));
				p.setCl(rs.getString(12));
				p.setPr(rs.getString(13));
				p.setFa(rs.getString(14));
				p.setCo(rs.getString(15));
				p.setDan(rs.getString(16));
				p.setAr(rs.getString(17));
				p.setAgc(rs.getString(18));
				p.setAgt(rs.getString(19));
				p.setErt(rs.getString(20));
				p.setAcd(rs.getDate(21));
				p.setIan(rs.getString(22));
				p.setIpn(rs.getString(23));
				p.setDen(rs.getDate(24));
				p.setAdsp(rs.getString(25));
				p.setPec(rs.getString(26));
				p.setSec(rs.getString(27));
				p.setPnc(rs.getString(28));
				p.setSnc(rs.getString(29));
				p.setDdp(rs.getString(30));
				p.setNp(rs.getString(31));
				p.setAc(rs.getString(32));
				p.setPat(rs.getString(33));
				p.setApf(rs.getString(34));
				p.setRl(rs.getString(35));
				p.setSsr(rs.getString(36));
				patents.add(p);
			}
		}catch (SQLException e) {
			 e.printStackTrace();
		}finally{
			db.closeCon();
		}	
		
		return patents;
	}
	/**
	 * 统计表中有多少条数据
	 * @param table
	 * @return
	 * @throws Exception
	 */
	public int count(String table,String where)throws Exception{
		int countNumber=0;
		String sql="";
		try {
			sql="select count(*) from "+table +" where "+where;
			System.out.println(sql);
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				countNumber = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			db.closeCon();
		}
		return countNumber;
	}
	
	/*
	 * 中国专利逻辑检索
	 */
	
	public List<Patent> searchCh(String strTableName,String where,String sort) {
		List<Patent> list = new ArrayList<Patent>();
		String sql = "";
		
		if(sort!=null){
			sql="SELECT * FROM " + strTableName +" where "+ where +" "+sort+"";
			System.out.println(sql);
		}else{
			sql="SELECT * FROM " + strTableName +" where "+ where +"";
			System.out.println(sql);
		}
		ResultSet rs = db.executeQuery(sql);
		try {
			while(rs.next()){
				Patent p=new Patent();
				p.setPnm(rs.getString(1));
				p.setPd(rs.getString(2));
				p.setAn(rs.getString(3));
				p.setAd(rs.getString(4));
				p.setPn(rs.getString(5));
				p.setTi(rs.getString(6));
				p.setPic(rs.getString(7));
				p.setSic(rs.getString(8));
				p.setPa(rs.getString(9));
				p.setInn(rs.getString(10));
				p.setAbst(rs.getString(11));
				p.setCl(rs.getString(12));
				p.setPr(rs.getString(13));
				p.setFa(rs.getString(14));
				p.setCo(rs.getString(15));
				p.setDan(rs.getString(16));
				p.setAr(rs.getString(17));
				p.setAgc(rs.getString(18));
				p.setAgt(rs.getString(19));
				p.setErt(rs.getString(20));
				p.setAcd(rs.getDate(21));
				p.setIan(rs.getString(22));
				p.setIpn(rs.getString(23));
				p.setDen(rs.getDate(24));
				p.setAdsp(rs.getString(25));
				p.setPec(rs.getString(26));
				p.setSec(rs.getString(27));
				p.setPnc(rs.getString(28));
				p.setSnc(rs.getString(29));
				p.setDdp(rs.getString(30));
				p.setNp(rs.getString(31));
				p.setAc(rs.getString(32));
				p.setPat(rs.getString(33));
				p.setApf(rs.getString(34));
				p.setRl(rs.getString(35));
				p.setSsr(rs.getString(36));
				p.setCb(rs.getString(37));
				p.setIb(rs.getString(38));
				p.setIbp(rs.getString(39));
				p.setCbn(rs.getString(40));
				p.setIbn(rs.getString(41));
				p.setIbpn(rs.getString(42));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.closeCon();
		}
		return list;
	}
/*
 * 根据an查询专利
 */
	public Patent findP(String table,String str)throws SQLException{
		
		Patent pt=new Patent();
		String sql="";
		try{
			sql="select * from "+table+" where an like '"+str+"'";
			System.out.println(sql+"----======--34567890-");
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				pt.setPnm(rs.getString(1));
				pt.setPd(rs.getString(2));
				pt.setAn(rs.getString(3));
				pt.setAd(rs.getString(4));
				pt.setPn(rs.getString(5));
				pt.setTi(rs.getString(6));
				pt.setPic(rs.getString(7));
				pt.setSic(rs.getString(8));
				pt.setPa(rs.getString(9));
				pt.setInn(rs.getString(10));
				pt.setAbst(rs.getString(11));
				pt.setCl(rs.getString(12));
				pt.setPr(rs.getString(13));
				pt.setFa(rs.getString(14));
				pt.setCo(rs.getString(15));
				pt.setDan(rs.getString(16));
				pt.setAr(rs.getString(17));
				pt.setAgc(rs.getString(18));
				pt.setAgt(rs.getString(19));
				pt.setErt(rs.getString(20));
				pt.setAcd(rs.getDate(21));
				pt.setIan(rs.getString(22));
				pt.setIpn(rs.getString(23));
				pt.setDen(rs.getDate(24));
				pt.setAdsp(rs.getString(25));
				pt.setPec(rs.getString(26));
				pt.setSec(rs.getString(27));
				pt.setPnc(rs.getString(28));
				pt.setSnc(rs.getString(29));
				pt.setDdp(rs.getString(30));
				pt.setNp(rs.getString(31));
				pt.setAc(rs.getString(32));
				pt.setPat(rs.getString(33));
				pt.setApf(rs.getString(34));
				pt.setRl(rs.getString(35));
				pt.setSsr(rs.getString(36));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			db.closeCon();
		}
		return pt;
	}
	
	/*
	 * 替代组合逻辑检索表达式中的字符
	 */
	public String tiHuan(String obj){
		
		if(obj.indexOf("A") !=-1){
			obj=obj.replace("A","$#A@&*");
		}
		if(obj.indexOf("B") !=-1){
			obj=obj.replace("B","$#B@&*");
		}
		if(obj.indexOf("C") !=-1){
			obj=obj.replace("C","$#C@&*");
		}
		if(obj.indexOf("D") !=-1){
			obj=obj.replace("D","$#D@&*");
		}
		if(obj.indexOf("E") !=-1){
			obj=obj.replace("E","$#E@&*");
		}
		if(obj.indexOf("F") !=-1){
			obj=obj.replace("F","$#F@&*");
		}
		if(obj.indexOf("G") !=-1){
			obj=obj.replace("G","$#G@&*");
		}	
		if(obj.indexOf("H") !=-1){
			obj=obj.replace("H","$#H@&*");
		}
		if(obj.indexOf("I") !=-1){
			obj=obj.replace("I","$#I@&*");
		}
		if(obj.indexOf("J") !=-1){
			obj=obj.replace("J","$#J@&*");
		}
		if(obj.indexOf("K") !=-1){
			obj=obj.replace("K","$#K@&*");
		}
		if(obj.indexOf("L") !=-1){
			obj=obj.replace("L","$#L@&*");
		}
		if(obj.indexOf("M") !=-1){
			obj=obj.replace("M","$#M@&*");
		}
		if(obj.indexOf("N") !=-1){
			obj=obj.replace("N","$#N@&*");
		}
		if(obj.indexOf("P") !=-1){
			obj=obj.replace("P","$#P@&*");
		}
		if(obj.indexOf("Q") !=-1){
			obj=obj.replace("Q","$#Q@&*");
		}
		if(obj.indexOf("R") !=-1){
			obj=obj.replace("R","$#R@&*");
		}
	
		return obj;
	}
	
	/*
	 * 如何解决翻页 +1 -1转换成int类型的问题
	 */
	public int fanYe(String str){
		int page=0;
		if(str.indexOf("-1") !=-1){
	 		str=str.replace("-1","");
	 		page=Integer.parseInt(str)-1;
	 	}
		else if(str.indexOf("+1") !=-1){
	 		str=str.replace("-1","");
	 		page=Integer.parseInt(str)+1;
	 	}else{
	 		page=Integer.parseInt(str);
	 	}
		
		return page;
	}
	
	
	
	
	
	private String pnm;  //公开号
	private String pd;    //公开日
	private String an;  //申请号
	private String ad;    //申请日
	private	String pn;  //专利号
	private String ti;  //名称
	private String pic; //主分类号
	private String sic;  //分类号
	private String pa;  //申请（专利权）人
	private String inn;  //发明（设计）人
	private String abst;  //摘要
	private String cl;   //主权项
	private String pr;   //优先权
	private String fa;   //同族专利项
	private String co;   //国省代码
	private String dan;   //分案原申请号
	private String ar;    //地址
	private String agc;   //专利代理机构
	private String agt;    //代理人
	private String ert;    //审查员
	private Date acd;      //颁证日
	private String ian;    //国际申请
	private String ipn;    //国际公布
	private Date den;      //进入国家日
	private String adsp;   //摘要附图存储路径
	private String pec;    //欧洲主分类号
	private String sec;   //欧洲分类号
	private String pnc;    //本国主分类号
	private String snc;    //本国分类号
	private String ddp;    //发布路径
	private String np;     //页数
	private String ac;     //申请国代码
	private String pat;    //专利类型
	private String apf;    //申请来源
	private String rl;     //参考文献
	private String ssr;    //范畴分类
	private String cb;     //权利要求书
	private String ib;     //说明书 
	private String ibp;    //说明书附图
	private String cbn;    //权利要求书页数
	private String ibn;    //说明书页数
	private String ibpn;   //说明书附图页数
	private String dm;     //文献标记
	private Date slad;     //法律状态公告日
	private String ls;     //法律状态
	private String aan;    //审定公告日
	private String lsi;    //法律状态信息
	
	 String strTableName1 = "fmsq_ab";//发明授权表
	 String strTableName2 = "wgzl_ab";//外观设计表
	 String strTableName3 = "syxx_ab";//实用新型表
	 String strTableName4 = "fmzl_ab";//发明专利表
	
	public String getPnm() {
		return pnm;
	}
	public void setPnm(String pnm) {
		this.pnm = pnm;
	}
	public String getPd() {
		return pd;
	}
	public void setPd(String date) {
		this.pd = date;
	}
	public String getAn() {
		return an;
	}
	public void setAn(String an) {
		this.an = an;
	}
	public String getAd() {
		return ad;
	}
	public void setAd(String string) {
		this.ad = string;
	}
	public String getPn() {
		return pn;
	}
	public void setPn(String pn) {
		this.pn = pn;
	}
	public String getTi() {
		return ti;
	}
	public void setTi(String ti) {
		this.ti = ti;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getSic() {
		return sic;
	}
	public void setSic(String sic) {
		this.sic = sic;
	}
	public String getPa() {
		return pa;
	}
	public void setPa(String pa) {
		this.pa = pa;
	}
	public String getInn() {
		return inn;
	}
	public void setInn(String inn) {
		this.inn = inn;
	}
	public String getAbst() {
		return abst;
	}
	public void setAbst(String abst) {
		this.abst = abst;
	}
	public String getCl() {
		return cl;
	}
	public void setCl(String cl) {
		this.cl = cl;
	}
	public String getPr() {
		return pr;
	}
	public void setPr(String pr) {
		this.pr = pr;
	}
	public String getFa() {
		return fa;
	}
	public void setFa(String fa) {
		this.fa = fa;
	}
	public String getCo() {
		return co;
	}
	public void setCo(String co) {
		this.co = co;
	}
	public String getDan() {
		return dan;
	}
	public void setDan(String dan) {
		this.dan = dan;
	}
	public String getAr() {
		return ar;
	}
	public void setAr(String ar) {
		this.ar = ar;
	}
	public String getAgc() {
		return agc;
	}
	public void setAgc(String agc) {
		this.agc = agc;
	}
	public String getAgt() {
		return agt;
	}
	public void setAgt(String agt) {
		this.agt = agt;
	}
	public String getErt() {
		return ert;
	}
	public void setErt(String ert) {
		this.ert = ert;
	}
	public Date getAcd() {
		return acd;
	}
	public void setAcd(Date acd) {
		this.acd = acd;
	}
	public String getIan() {
		return ian;
	}
	public void setIan(String ian) {
		this.ian = ian;
	}
	public String getIpn() {
		return ipn;
	}
	public void setIpn(String ipn) {
		this.ipn = ipn;
	}
	public Date getDen() {
		return den;
	}
	public void setDen(Date den) {
		this.den = den;
	}
	public String getAdsp() {
		return adsp;
	}
	public void setAdsp(String adsp) {
		this.adsp = adsp;
	}
	public String getPec() {
		return pec;
	}
	public void setPec(String pec) {
		this.pec = pec;
	}
	public String getSec() {
		return sec;
	}
	public void setSec(String sec) {
		this.sec = sec;
	}
	public String getPnc() {
		return pnc;
	}
	public void setPnc(String pnc) {
		this.pnc = pnc;
	}
	public String getSnc() {
		return snc;
	}
	public void setSnc(String snc) {
		this.snc = snc;
	}
	public String getDdp() {
		return ddp;
	}
	public void setDdp(String ddp) {
		this.ddp = ddp;
	}
	public String getNp() {
		return np;
	}
	public void setNp(String np) {
		this.np = np;
	}
	public String getAc() {
		return ac;
	}
	public void setAc(String ac) {
		this.ac = ac;
	}
	public String getPat() {
		return pat;
	}
	public void setPat(String pat) {
		this.pat = pat;
	}
	public String getApf() {
		return apf;
	}
	public void setApf(String apf) {
		this.apf = apf;
	}
	public String getRl() {
		return rl;
	}
	public void setRl(String rl) {
		this.rl = rl;
	}
	public String getSsr() {
		return ssr;
	}
	public void setSsr(String ssr) {
		this.ssr = ssr;
	}
	public String getCb() {
		return cb;
	}
	public void setCb(String cb) {
		this.cb = cb;
	}
	public String getIb() {
		return ib;
	}
	public void setIb(String ib) {
		this.ib = ib;
	}
	public String getIbp() {
		return ibp;
	}
	public void setIbp(String ibp) {
		this.ibp = ibp;
	}
	public String getCbn() {
		return cbn;
	}
	public void setCbn(String cbn) {
		this.cbn = cbn;
	}
	public String getIbn() {
		return ibn;
	}
	public void setIbn(String ibn) {
		this.ibn = ibn;
	}
	public String getIbpn() {
		return ibpn;
	}
	public void setIbpn(String ibpn) {
		this.ibpn = ibpn;
	}
	public String getDm() {
		return dm;
	}
	public void setDm(String dm) {
		this.dm = dm;
	}
	public Date getSlad() {
		return slad;
	}
	public void setSlad(Date slad) {
		this.slad = slad;
	}
	public String getLs() {
		return ls;
	}
	public void setLs(String ls) {
		this.ls = ls;
	}
	public String getAan() {
		return aan;
	}
	public void setAan(String aan) {
		this.aan = aan;
	}
	public String getLsi() {
		return lsi;
	}
	public void setLsi(String lsi) {
		this.lsi = lsi;
	}
	
	
}
