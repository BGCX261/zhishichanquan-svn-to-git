package com.ejoysoft.wlanyz.system;
/*
 * 代维人员管理---代维人员分组
 */
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.sql.SQLException;

import com.ejoysoft.common.DbConnect;
import com.ejoysoft.common.Globa;


public class Groups {
  public Groups(){}
	
  private Globa globa;
  private DbConnect db;

  

  public Groups(Globa globa) {
      this.globa = globa;
      db = globa.db;
  }


  public Groups(Globa globa, boolean b) {
      this.globa = globa;
      db = globa.db;
      if (b) globa.setDynamicProperty(this);
  }
	    
	    
  String tableName="wlan_sys_groups";
  
  public List<Groups>search() throws SQLException{
	  List<Groups>list=new ArrayList<Groups>();
	 String strSql="select * from "+tableName;
	 ResultSet rs=db.executeQuery(strSql);
	 if(rs!=null&&rs.next()){
		 do{
			 Groups g=new Groups();
			 g.setWlan_sys_Id(rs.getInt(1));
			 
			 g.setWlan_sys_groups(rs.getString(2));
			list.add(g);
			
		}while(rs.next());
		 rs.close();
		 db.closeCon();
	 }
	 return list;
  }
	    
	
  
  public Vector<Groups> list(String where, int startRow, int rowCount) {
	  Vector<Groups> beans = new Vector<Groups>();
	  String sql="select * from  "+tableName+"";
	  try {
		  if(where.length()>0){
			  sql=String.valueOf(sql)+String.valueOf(where);
		Statement	s= db.getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    ResultSet rs1=s.executeQuery(sql);
	    if(rs1.next()){
	    	System.out.println(rs1.getString(1)+"-------------------------------------");
	    }
		
		 if (startRow != 0 && rowCount != 0)
	         s.setMaxRows((startRow + rowCount) - 1);
		 ResultSet rs= s.executeQuery(sql);
		 if(rs.next()){
			 System.out.println(rs.getString(1)+"--------------------------------");
		 }
		 if (rs != null && rs.next()) {
	         if (startRow != 0 && rowCount != 0)
	             rs.absolute(startRow);
	         do {
	        	 Groups theBean = new Groups();
	             theBean = load(rs, false);
	             beans.addElement(theBean);
	         } while (rs.next());
		  }
		rs.close();
	  }
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
  return beans;
  }
  
  /*
   * 返回共多少条数据
   * 
   */
 public int   getCount() throws SQLException{
	int count=0;
	try {
		 
		 String sql="select count(*) from "+tableName+"";
		ResultSet s =db.executeQuery(sql);
		if(s.next()){
			count=s.getInt(1);
			s.close();
		}
	} catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	 return count;
 }
  
  
 
 
 /*
  * 增加
  */
 public boolean add(int strgroupsid,String strgroupsName){
	 String sql="insert into "+tableName+"(wlan_sys_Id,wlan_sys_groups)values(?,?)";
	 System.out.println(sql+"-------------------------");
	 try {
		db.prepareStatement(sql);
		db.setInt(1, strgroupsid);
		db.setString(2, strgroupsName);
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
    try {
		if(db.executeUpdate()>0){
			try {
				globa.response.getWriter().print("<script>alert('增加"+strgroupsName+"成功！')</script>");
			} catch (IOException e) {
			
				e.printStackTrace();
			}
			return true;
		}else{
			try {
				globa.response.getWriter().print("<script>alert('增加"+strgroupsName+"失败！')</script>");
			} catch (IOException e) {
			 
				e.printStackTrace();
			}
			return false;
		}
	} catch (SQLException e) {
	    
		e.printStackTrace();
	}

	 return true;
 }
  private Groups load(ResultSet rs, boolean b) {
	  Groups theBean = new Groups();
	  try {
		theBean.setWlan_sys_Id(rs.getInt(1));
		theBean.setWlan_sys_groups(rs.getString(2));
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally{
		 
	}
	  
	 return theBean;
}

  
  /*
   * 删除成功！
   */
  
public boolean  delete(String swhere) throws SQLException{
	String sql="delete from "+tableName+"".concat(swhere);
	System.out.println(sql+"-------------------");
	if(db.executeUpdate(sql)>0){
		try {
			globa.response.getWriter().print("<script>alert('删除成功！')</script>");
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		return true;
	}else{
		try {
			globa.response.getWriter().print("<script>alert('删除成功！')</script>");
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		return false;
	}
	
}
  
  
  
  /*
   * update
   */
  public boolean update(int strgroupsId,String strgroupsName){
	  String sql="update "+tableName+" set wlan_sys_groups='"+strgroupsName+"' where wlan_sys_Id='"+strgroupsId+"'";
	  System.out.println(sql+"-------------------------------------------");
	  try {
		  
	if(db.executeUpdate(sql)>0){
		try {
			globa.response.getWriter().print("<script>alert('修改成功！')</script>");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	return true;
	}else{
		try {
			globa.response.getWriter().print("<script>alert('修改失败！')</script>");
			return false;
		} catch (IOException e) {
		
			e.printStackTrace();
		}
	}
	} catch (SQLException e) {
      
		e.printStackTrace();
	}
	return true;
	  
  }
  
  
  
  public Groups un(int id){
	  Groups gs=null;
	  String sql="select * from "+tableName+" where wlan_sys_Id='"+id+"'";
	  ResultSet rs=db.executeQuery(sql);
	  try {
		if(rs.next()){
			   gs=new Groups();
			  gs.setWlan_sys_Id(rs.getInt(1));
			  gs.setWlan_sys_groups(rs.getString(2));
		  }
	} catch (SQLException e) {
  
		e.printStackTrace();
	}
	return gs; 
  }
public int wlan_sys_Id;
  public int getWlan_sys_Id() {
	return wlan_sys_Id;
}

public void setWlan_sys_Id(int wlanSysId) {
	wlan_sys_Id = wlanSysId;
}

public String getWlan_sys_groups() {
	return wlan_sys_groups;
}

public void setWlan_sys_groups(String wlanSysGroups) {
	wlan_sys_groups = wlanSysGroups;
}

public String wlan_sys_groups;
}
