package com.ejoysoft.jiansuo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ejoysoft.common.DbConnect;
import com.ejoysoft.common.Globa;

public class LawState {
	private Globa globa;
	//private DbConnect db;
	private DbConnect db=new DbConnect();
	
	public LawState(){
		
	}
    public LawState(Globa globa) {
        this.globa = globa;
        db = globa.db;
    }
    public LawState(Globa globa, boolean b) {
        this.globa = globa;
        db = globa.db;
        if (b) globa.setDynamicProperty(this);
    }
	/*
	 * 法律状态检索
	 */
	public List<LawState> searchLs(String tb,String twhere)throws Exception{
		List<LawState> lawStates=new ArrayList<LawState>();
		String sql="";
		try {
			sql="select * from "+tb+" where "+twhere+"";
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			
			while(rs.next()){
				LawState l=new LawState();
				l.setAah(rs.getString(1));			
				l.setAn(rs.getString(2));		
				l.setAcd(rs.getString(3));	
				l.setSlad(rs.getString(4));		
				l.setLs(rs.getString(5));		
				l.setAan(rs.getString(6));
				l.setLsi(rs.getString(7));
				lawStates.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.closeCon();
		}
		System.out.println(tb);
		System.out.println(lawStates.size());
		return lawStates;
	}
	
	/*
	 * 分页查询  
	 * 结果为每页的10条记录集合
	 */
	public List<LawState> showFY(String table,String where,int pageNum)throws Exception{
		List<LawState> lawStates=new ArrayList<LawState>();
		String sql="";
		try{	
		
			System.out.println("sqlsqlsqlsqslqslqssql");
			sql="select top 10 *  from (select *,row_number() over(order by an) as rownum from falv where "+ where+")as t where t.rownum >"+pageNum+"";
				
			ResultSet rs=db.executeQuery(sql);
			while(rs.next()){
				LawState l=new LawState();
				l.setAah(rs.getString(1));			
				l.setAn(rs.getString(2));		
				l.setAcd(rs.getString(3));	
				l.setSlad(rs.getString(4));		
				l.setLs(rs.getString(5));		
				l.setAan(rs.getString(6));
				l.setLsi(rs.getString(7));
				
				lawStates.add(l);	
			}
			
		}catch (Exception e) {
		e.printStackTrace();
		}finally{
			db.closeCon();
		}
		return lawStates;
	}
//	//-----------------------------------------------------------------------------------
//	//多表查询分页问题
//	public List<LawState> find(String table,String where){
//		List<LawState> lawStates=new ArrayList<LawState>();
//		String sql="";
//		
//		try {
//			
//			sql="select * from "+table+" where an like '"+where+"' order by acd"+"";
//			System.out.println(sql);
//			ResultSet rs=db.executeQuery(sql);
//			while(rs.next()){
//				LawState l=new LawState();
//				l.setAah(rs.getString(1));			
//				l.setAn(rs.getString(2));		
//				l.setAcd(rs.getString(3));	
//				l.setSlad(rs.getString(4));		
//				l.setLs(rs.getString(5));		
//				l.setAan(rs.getString(6));
//				l.setLsi(rs.getString(7));
//				lawStates.add(l);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally{
//			db.closeCon();
//		}
//		
//		return lawStates;
//	}
//	public static void main(String [] args){
//		LawState lawState=new LawState();
//		String table="flzt";
//		String where="an like %9%";
//		System.out.println("][][]");
////		LawState lawState=new LawState();
////		String[] tables=new String[]{"flzt","flzt_1"};
////		String where="an like '%2011304%'";
////		for(int i=0;i<tables.length;i++){
////			String table=tables[i];
////		List<LawState> lawStates=lawState.searchLs(table,where);
////		for(LawState ls:lawStates){
////			System.out.println(ls.getAah()+"_-----------------------");
////			System.out.println(ls.getAan());
////			System.out.println(ls.getAcd());
////			System.out.println(ls.getAn());
////			System.out.println(ls.getLs());
////			System.out.println(ls.getSlad());
////			
////		}
////		}
//	}
	private String aah;//授权公告号
	private String an;//申请号
	private String acd;//颁证日
	private String slad;//法律状态公告日
	private String ls;//法律状态
	private String aan;//审定公告号
	private String lsi;//法律状态信息
	public String getAah() {
		return aah;
	}
	public void setAah(String aah) {
		this.aah = aah;
	}
	public String getAn() {
		return an;
	}
	public void setAn(String an) {
		this.an = an;
	}
	public String getAcd() {
		return acd;
	}
	public void setAcd(String acd) {
		this.acd = acd;
	}
	public String getSlad() {
		return slad;
	}
	public void setSlad(String slad) {
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
