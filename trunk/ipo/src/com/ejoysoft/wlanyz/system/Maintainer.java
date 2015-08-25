package com.ejoysoft.wlanyz.system;

import com.ejoysoft.auth.MD5;
import com.ejoysoft.common.*;
import com.ejoysoft.common.exception.UserUnitIdException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.Vector;
import java.util.HashMap;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;


public class Maintainer {
    private Globa globa;
    private DbConnect db;

    //���췽��
    public Maintainer() {
    }

    public Maintainer(Globa globa) {
        this.globa = globa;
        db = globa.db;
    }

    //���췽��
    public Maintainer(Globa globa, boolean b) {
        this.globa = globa;
        db = globa.db;
        if (b) globa.setDynamicProperty(this);
    }

    String strTableName = "wlan_sys_maintainer";
    String strTabelName2="wlan_sys_groups";
  //增加用户
    public boolean add(String strMainName,String strMainSex,String strMainAddr,String strMainMobile,String strMainIdnum,String strMainTel,String strMainPosition,int strgroupsName) {
        String strSql = "";
        strMainId = UID.getID();
        try {
        	//把用户信息写入数据库
            strSql = "INSERT INTO " + strTableName + "  (strMainId,strMainName,strMainSex,strMainAddr,strMainMobile,strMainIdnum,strMainTel,strMainPosition,strCreator,dtCreatDate,strgroupsId)" +
                    " VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            System.out.println("````````````````````````````````");
            db.prepareStatement(strSql);
            db.setString(1, strMainId);
            db.setString(2, strMainName);
            db.setString(3, strMainSex);   
            db.setString(4, strMainAddr);
            db.setString(5, strMainMobile);
            db.setString(6, strMainIdnum);
            db.setString(7, strMainTel);
            db.setString(8, strMainPosition);
            db.setString(9, globa.loginName);               
            db.setString(10, com.ejoysoft.common.Format.getDateTime());
            db.setInt(11, strgroupsName);
         
   
            if (db.executeUpdate() > 0) {
                Globa.logger0("增加代维人员信息", globa.loginName, globa.loginIp, strSql, "代维人员信息管理", globa.userSession.getStrDepart());
                return true;
            } else
                return false;
        } catch (Exception e) {
            System.out.println("增加用户信息时出错！！");
            e.printStackTrace();
            return false;
        }
    }

    public boolean delete(String where) {
        try {
            String sql = "DELETE FROM " + strTableName + "  ".concat(where);
            db.executeUpdate(sql);
            return true;
        } catch (Exception ee) {
            ee.printStackTrace();
            return false;
        }
    }

    //�޸�
    public boolean update(String strMainId,String strMainName,String strMainSex,String strMainAddr,String strMainMobile,String strMainIdnum,String strMainTel,String strMainPosition,int strgroupsName) {
        try {
            String strSql = "UPDATE  " + strTableName + "  SET  strMainName = ?, strMainSex = ?, strMainAddr = ?, strMainMobile = ?, strMainIdnum = ?, strMainTel = ?, strMainPosition = ?, " +
                    "strCreator = ?, dtCreatDate = str_to_date(?,'%Y-%m-%d %T'),strgroupsId=? WHERE strMainId=? ";
            db.prepareStatement(strSql);
            db.setString(1, strMainName);
            db.setString(2, strMainSex);   
            db.setString(3, strMainAddr);
            db.setString(4, strMainMobile);
            db.setString(5, strMainIdnum);
            db.setString(6, strMainTel);
            db.setString(7, strMainPosition);
            db.setString(8, globa.loginName);               
            db.setString(9, Format.getDateTime());
            db.setInt(10, strgroupsName);
            db.setString(11, strMainId);
           
            db.executeUpdate();
            Globa.logger0("修改代维人员信息", globa.loginName, globa.loginIp, strSql, "代维人员管理", globa.userSession.getStrDepart());
            return true;
        } catch (Exception e) {
            System.out.println("修改用户信息时出错：" + e);
            return false;
        }
    }

  //详细显示单条记录
    public Maintainer show(String where) {
        try {
            String strSql = "select * from  " + strTableName + "  ".concat(where);
            ResultSet rs = db.executeQuery(strSql);
            if (rs != null && rs.next())
                return load(rs, true);
            else
                return null;
        } catch (Exception ee) {
            return null;
        }
    }

  //记录集转化为对象
    public Maintainer load(ResultSet rs, boolean isView) {
    	Maintainer theBean = new Maintainer();
        try {
            theBean.setStrMainId(rs.getString("strMainId"));
            theBean.setStrMainName(rs.getString("strMainName"));
            theBean.setStrMainSex(rs.getString("strMainSex"));
            theBean.setStrMainAddr(rs.getString("strMainAddr"));
            theBean.setStrMainMobile(rs.getString("strMainMobile"));
            theBean.setStrMainIdnum(rs.getString("strMainIdnum"));
            theBean.setStrMainTel(rs.getString("strMainTel"));
            theBean.setStrMainPosition(rs.getString("strMainPosition"));
            theBean.setStrCreator(rs.getString("strCreator"));
            theBean.setDtCreatDate(rs.getString("dtCreatDate"));
            theBean.setStrGroupsId(rs.getString("strgroupsId"));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return theBean;
    }

  //查询符合条件的记录总数
    public int getCount(String where) {
        int count = 0;
        try {
            String sql = "SELECT count(strMainId) FROM " + strTableName + "  ";
            if (where.length() > 0) {
                where = where.toLowerCase();
                if (where.indexOf("order") > 0)
                    where = where.substring(0, where.lastIndexOf("order"));
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

  //列表记录集
    public Vector<Maintainer> list1(String where) {
        Vector<Maintainer> beans = new Vector<Maintainer>();
        try {
            String sql = "SELECT *  FROM  " + strTableName + " ";
            if (where.length() > 0)
                sql = String.valueOf(sql) + String.valueOf(where);
            Statement s = db.getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            
            ResultSet rs = s.executeQuery(sql);
            if (rs != null && rs.next()) {
                do {
                    Maintainer theBean = new Maintainer();
                    theBean = load(rs, false);
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
    //用于任务管理增加任务时，查找测试人与测试人手机号。
    public Vector<Maintainer> list(String where, int startRow, int rowCount) {
        Vector<Maintainer> beans = new Vector<Maintainer>();
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
                    Maintainer theBean = new Maintainer();
                    theBean = load(rs, false);
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
    
    
    public String  search(String strgroupsId){
    	String groupsName="";
    	String sql="select * from  "+strTabelName2+" where wlan_sys_Id='"+strgroupsId+"'";
    	System.out.print(sql);
    	ResultSet rs=db.executeQuery(sql);
    	try {
			if(rs.next()){
				groupsName=rs.getString("wlan_sys_groups");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return groupsName;
		
    }
  



   
    /**
     * 构造
     *
     */
    public Maintainer( String strMainId,String strMainName,String strMainSex,String strMainAddr,String strMainMobile, String strMainIdnum, String strMainTel,String strMainPosition,String strCreator, String dtCreatDate) 
    {
        this.strMainId = strMainId;
        this.strMainName = strMainName;
        this.strMainSex = strMainSex;
        this.strMainAddr = strMainAddr;
        this.strMainMobile = strMainMobile;
        this.strMainIdnum = strMainIdnum;
        this.strMainTel = strMainTel;
        this.strMainPosition = strMainPosition;
        this.strCreator = strCreator;
        this.dtCreatDate = dtCreatDate;
    }
    
    private String strMainId;
    private String strMainName;
    private String strMainSex;
    private String strMainAddr;
    private String strMainMobile;
    private String strMainIdnum;
    private String strMainTel;
    private String strMainPosition;
    private String strCreator;
    private String dtCreatDate;
    private String strGroupsId;
    
    
    
    public String getStrMainId() {
		return strMainId;
	}

	public void setStrMainId(String strMainId) {
		this.strMainId = strMainId;
	}

	public String getStrMainName() {
		return strMainName;
	}

	public void setStrMainName(String strMainName) {
		this.strMainName = strMainName;
	}

	public String getStrMainSex() {
		return strMainSex;
	}

	public void setStrMainSex(String strMainSex) {
		this.strMainSex = strMainSex;
	}

	public String getStrMainAddr() {
		return strMainAddr;
	}

	public void setStrMainAddr(String strMainAddr) {
		this.strMainAddr = strMainAddr;
	}

	public String getStrMainMobile() {
		return strMainMobile;
	}

	public void setStrMainMobile(String strMainMobile) {
		this.strMainMobile = strMainMobile;
	}

	public String getStrMainIdnum() {
		return strMainIdnum;
	}

	public void setStrMainIdnum(String strMainIdnum) {
		this.strMainIdnum = strMainIdnum;
	}

	public String getStrMainTel() {
		return strMainTel;
	}

	public void setStrMainTel(String strMainTel) {
		this.strMainTel = strMainTel;
	}

	public String getStrMainPosition() {
		return strMainPosition;
	}

	public void setStrMainPosition(String strMainPosition) {
		this.strMainPosition = strMainPosition;
	}

	public String getStrCreator() {
		return strCreator;
	}

	public void setStrCreator(String strCreator) {
		this.strCreator = strCreator;
	}

	public String getDtCreatDate() {
		return dtCreatDate;
	}

	public void setDtCreatDate(String dtCreatDate) {
		this.dtCreatDate = dtCreatDate;
	}

	public String getStrGroupsId() {
		return strGroupsId;
	}

	public void setStrGroupsId(String strGroupsId) {
		this.strGroupsId = strGroupsId;
	}

	
   


   


    
}
