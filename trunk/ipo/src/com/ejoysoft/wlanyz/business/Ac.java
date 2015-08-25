package com.ejoysoft.wlanyz.business; 

import com.ejoysoft.common.DbConnect;
import com.ejoysoft.common.Globa;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;


public class Ac {

    private Globa globa;
    private DbConnect db;

    //构造方法
    public Ac() {
    }

    public Ac(Globa globa) {
        this.globa = globa;
        db = globa.db;
    }

    //构造方法 
    public Ac(Globa globa, boolean b) {
        this.globa = globa;
        db = globa.db;
        if (b) globa.setDynamicProperty(this);
    }
   
    //详细显示单条记录
    public Ac show(String where) throws SQLException{
        try {
            String strSql = "select * from  " + strTableName + "  ".concat(String.valueOf (where ));
            System.out.println("---------------:"+strSql);
            ResultSet rs = db.executeQuery(strSql);
            if (rs != null && rs.next())
                return load(rs);
            else
                return null;
        } catch (Exception ee) {
            return null;
        }
    }

    //记录集转化为对象
    public Ac load(ResultSet rs) throws SQLException{
    	Ac theBean = new Ac();
        try {
        	theBean.setStrId(rs.getString("strId"));
            theBean.setStrClassOneHP(rs.getString("strClassOneHP"));
            theBean.setStrHotPotName(rs.getString("strHotpotName"));
            theBean.setDtCreatDate(rs.getString("dtCreatDate"));
            theBean.setStrCity(rs.getString("strCity"));
            theBean.setStrTown(rs.getString("strTown"));
            theBean.setStrHotPotType(rs.getString("strHotpotType"));
            theBean.setStrCreator(rs.getString("strCreator"));
            theBean.setStrHotPotAddr(rs.getString("strHotpotAddr"));
            theBean.setStrLongitude(rs.getString("strLongitude"));
            theBean.setStrLatitude(rs.getString("strLatitude"));
            theBean.setStrArea(rs.getString("strArea"));
            theBean.setStrTechonlog(rs.getString("strTechonlog"));
            theBean.setStrAc(rs.getString("strAc"));
            theBean.setStrHotPotGrade(rs.getString("strHotpotGrade"));
            theBean.setStrWhPersonId(rs.getString("strWhpersonid"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return theBean;
    }

    //查询符合条件的记录�?�数
    public int getCount(String where) throws SQLException{
        int count = 0;
        try {
            String sql = "SELECT count(*) FROM " + strTableName + "  ";
            if (where.length() > 0) {
                where = where.toLowerCase();
                if (where.indexOf("order") > 0)
                    where = where.substring(0, where.indexOf("order"));
                sql = String.valueOf(sql) + String.valueOf(where);
            }
            ResultSet rs = db.executeQuery(sql);
            if (rs.next())
                count = rs.getInt(1);
            rs.close();
            return count;
        } catch (Exception ee) {
            ee.printStackTrace();
            return count;
        }
    }
   

    //列表记录
    public Vector<Ac> list(String where, int startRow, int rowCount) throws SQLException{
        Vector<Ac> beans = new Vector<Ac>();
        try {
            String sql = "SELECT *  FROM  " + strTableName + " ";
            if (where.length() > 0)
                sql = String.valueOf(sql) + String.valueOf(where);
            Statement s = db.getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            if (startRow != 0 && rowCount != 0)
                s.setMaxRows((startRow + rowCount) - 1);
            ResultSet rs = s.executeQuery(sql);
            if (rs != null && rs.next()) {
                if (startRow != 0 && rowCount != 0)
                    rs.absolute(startRow);
                do {
                    Ac theBean = new Ac();
                    theBean = load(rs);
                    beans.addElement(theBean);
                } while (rs.next());
            }
            rs.close();
            s.close();
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        return beans;
    } 

    //列表记录
    public Vector<Ac> listClassTwoAcs(String where){
    	db = new DbConnect();
        Vector<Ac> beans = new Vector<Ac>();
        try {
            String sql = "SELECT * FROM  " + strTableName + " ";
            if (where.length() > 0)
                sql = String.valueOf(sql) + String.valueOf(where);
             ResultSet rs = db.executeQuery(sql);
            if (rs != null && rs.next()) {
                do {
                    Ac theBean = new Ac();
                    theBean.setStrHotPotName(rs.getString("strHotpotName"));
                    theBean.setStrId(rs.getString("strId"));
                    beans.addElement(theBean);
                } while (rs.next());
            }
            rs.close();
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        db.closeCon();
        return beans;
    } 
    
    //获取所有城市 
    public ArrayList<String> listAllCitys(String where)
    {
    	db = new DbConnect();
    	ArrayList<String> beans = new ArrayList<String>();
        try {
            String sql = "SELECT distinct(strCity) FROM  " + strTableName + " ";
            if (where.length() > 0)
                sql = String.valueOf(sql) + String.valueOf(where);
             ResultSet rs = db.executeQuery(sql);
            if (rs != null && rs.next()) {
                do {
                    beans.add(rs.getString("strCity")); 
                } while (rs.next());
            }
            rs.close();
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        db.closeCon();
    	return beans;
    }
  //获取某城市的所有区县
    public ArrayList<String> listCountriesOfCity(String where)
    {
    	db = new DbConnect();
    	ArrayList<String> beans = new ArrayList<String>();
        try {
            String sql = "SELECT distinct(strTown) FROM  " + strTableName + " ";
            if (where.length() > 0)
                sql = String.valueOf(sql) + String.valueOf(where);
             ResultSet rs = db.executeQuery(sql);
            if (rs != null && rs.next()) {
                do {
                    beans.add(rs.getString("strTown")); 
                } while (rs.next());
            }
            rs.close();
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        db.closeCon();
    	return beans;
    }
    
    
    public ArrayList<String> listClassOneAcs(String where)
    {
    	db = new DbConnect();
    	ArrayList<String> beans = new ArrayList<String>();
        try {
            String sql = "SELECT distinct(strClassOneHP) FROM  " + strTableName + " ";
            if (where.length() > 0)
                sql = String.valueOf(sql) + String.valueOf(where);
             ResultSet rs = db.executeQuery(sql);
            if (rs != null && rs.next()) {
                do {
                    beans.add(rs.getString("strClassOneHP"));
                } while (rs.next());
            }
            rs.close();
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        db.closeCon();
    	return beans;
    }
    //列表记录
    public Vector<Ac> listClassOneAcs1(String where){
    	db = new DbConnect();
        Vector<Ac> beans = new Vector<Ac>();
        try {
            String sql = "SELECT * FROM  " + strTableName + " ";
            if (where.length() > 0)
                sql = String.valueOf(sql) + String.valueOf(where);
             ResultSet rs = db.executeQuery(sql);
            if (rs != null && rs.next()) {
                do {
                    Ac theBean = new Ac();
                    theBean.setStrClassOneHP(rs.getString("strClassOneHP"));
                    theBean.setStrId(rs.getString("strId"));
                    beans.addElement(theBean);
                } while (rs.next());
            }
            rs.close();
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        db.closeCon();
        return beans;
    } 
  
    public ArrayList<Object[]> getAllclassoneByName( String where )
    {
    	DbConnect dbConnect = new DbConnect();
    	ArrayList<Object[]>  beans = new ArrayList<Object[]>();
    	String sql = "select distinct(strClassonehp) from "+strTableName+" ";
    	if(where!=null && where.length()>0)
    		sql = sql +" "+where;
    	ResultSet re = dbConnect.executeQuery(sql);
    	try {
			if(re != null && re.next())
			{
				do{
					Object[] theBean = new Object[2];
					String strClassonehp = re.getString("strClassonehp");
					theBean[0] = strClassonehp;
					theBean[1] = this.getAllstrclasstwoByName(strClassonehp);
					beans.add(theBean);
				}while(re.next());
			}
			re.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbConnect.closeCon();
    	return beans;
    }
    public ArrayList<Ac> getAllstrclasstwoByName( String strClassonehp)
    {   DbConnect dbConnect = new DbConnect();
    	ArrayList<Ac>  beans = new ArrayList<Ac>();
    	String sql = "select distinct(strHotpotName),strid from "+strTableName+" ";
    	String where = " where strClassonehp='"+strClassonehp+"'";
    	sql = sql+where;
    	ResultSet re = dbConnect.executeQuery(sql);
    	try { 
			if(re != null && re.next())
			{   //String strcountry = re.getString("");
				do{
					String strHotpotName = re.getString("strHotpotName");
					Ac obj = new Ac();
					obj.setStrId(re.getString("strId"));
					obj.setStrHotPotName(strHotpotName);
					beans.add(obj);
				}while(re.next());
			}
			re.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbConnect.closeCon();
    	return beans;
    }
    public ArrayList<String> getAllclassTwoAcByName(String classoneac)
    {
    	DbConnect dbConnect = new DbConnect();
    	ArrayList<String>  beans = new ArrayList<String>();
    	String sql = "select distinct(STRHOTPOTNAME) from "+strTableName+" ";
    	String where = " where STRCLASSONEHP = '"+classoneac+"' ";
    	sql = sql+where;
    	ResultSet re = dbConnect.executeQuery(sql);
    	try { 
			if(re != null && re.next())
			{   //String strcountry = re.getString("");
				do{
					String classtwoac = re.getString("STRHOTPOTNAME");
					beans.add(classtwoac);
				}while(re.next());
			}
			re.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbConnect.closeCon();
    	return beans;
    }
    
    public String listhotpotname(String hotpot)
    {
    	db = new DbConnect();
    	String beans = "";
        try {
        	String sql = "SELECT strHotPotName FROM  " + strTableName + " where STRID= '"+hotpot+"'";
          
            ResultSet rs = db.executeQuery(sql);
            if (rs != null && rs.next()) {
                do {
                    beans=rs.getString("STRHOTPOTNAME"); 
                } while (rs.next());
            }
            rs.close();
        } catch (Exception ee) {
            ee.printStackTrace();
        }
        db.closeCon();
    	return beans;
    	
    }
    public String getAcId(String where) {
        try {
            String strSql = "select * from  " + strTableName + "  ".concat(where);
            ResultSet rs = db.executeQuery(strSql);
            if (rs != null && rs.next())
            {
            	String ACID = rs.getString("strid");
            	rs.close();
                return ACID;
            }
            else
                return null;
        } catch (Exception ee) {
            return null;
        }
    }
    private String strTableName = "WLAN_RESC_HOTPOT";
    private String strId;  //记录ID
    private String strClassOneHP;  //一级热点名称
    private String strHotPotName;  //二级热点名称
   
	
	private String strCity;//热点城市
    private String strTown;//热点区县
    private String strCreator;//创建人
    private String strHotPotType;
    private String strHotPotAddr;
    private String strLongitude;
    private String strLatitude;
    private String strArea;
    private String strTechonlog;
    private String strAc;
    private String strHotPotGrade;
    private String strWhPersonId;
    private String dtCreatDate;  //创建时间
    public String getStrHotPotName() {
		return strHotPotName;
	}

	public void setStrHotPotName(String strHotPotName) {
		this.strHotPotName = strHotPotName;
	}

	public String getStrHotPotType() {
		return strHotPotType;
	}

	public void setStrHotPotType(String strHotPotType) {
		this.strHotPotType = strHotPotType;
	}

	public String getStrHotPotAddr() {
		return strHotPotAddr;
	}

	public void setStrHotPotAddr(String strHotPotAddr) {
		this.strHotPotAddr = strHotPotAddr;
	}

	public String getStrHotPotGrade() {
		return strHotPotGrade;
	}

	public void setStrHotPotGrade(String strHotPotGrade) {
		this.strHotPotGrade = strHotPotGrade;
	}

	public String getStrWhPersonId() {
		return strWhPersonId;
	}

	public void setStrWhPersonId(String strWhPersonId) {
		this.strWhPersonId = strWhPersonId;
	}
    public String getDtCreatDate() {
		return dtCreatDate;
	}

	public void setDtCreatDate(String dtCreatDate) {
		this.dtCreatDate = dtCreatDate;
	}
    
	public String getStrTableName() {
		return strTableName;
	}

	public void setStrTableName(String strTableName) {
		this.strTableName = strTableName;
	}

	

	public String getStrLongitude() {
		return strLongitude;
	}

	public void setStrLongitude(String strLongitude) {
		this.strLongitude = strLongitude;
	}

	public String getStrLatitude() {
		return strLatitude;
	}

	public void setStrLatitude(String strLatitude) {
		this.strLatitude = strLatitude;
	}

	public String getStrArea() {
		return strArea;
	}

	public void setStrArea(String strArea) {
		this.strArea = strArea;
	}

	public String getStrTechonlog() {
		return strTechonlog;
	}

	public void setStrTechonlog(String strTechonlog) {
		this.strTechonlog = strTechonlog;
	}

	public String getStrAc() {
		return strAc;
	}

	public void setStrAc(String strAc) {
		this.strAc = strAc;
	}


	public Globa getGloba() {
		return globa;
	}

	public void setGloba(Globa globa) {
		this.globa = globa;
	}

	public DbConnect getDb() {
		return db;
	}

	public void setDb(DbConnect db) {
		this.db = db;
	}

	public String getStrId() {
		return strId;
	}

	public void setStrId(String strId) {
		this.strId = strId;
	}
 

	public String getStrClassOneHP() {
		return strClassOneHP;
	}

	public void setStrClassOneHP(String strClassOneHP) {
		this.strClassOneHP = strClassOneHP;
	}


	public String getStrCity() {
		return strCity;
	}

	public void setStrCity(String strCity) {
		this.strCity = strCity;
	}

	
	public String getStrTown() {
		return strTown;
	}

	public void setStrTown(String strTown) {
		this.strTown = strTown;
	}

	public String getStrCreator() {
		return strCreator;
	}

	public void setStrCreator(String strCreator) {
		this.strCreator = strCreator;
	}
    
}