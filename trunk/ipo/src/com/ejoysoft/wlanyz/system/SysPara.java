package com.ejoysoft.wlanyz.system;

import com.ejoysoft.common.DbConnect;
import com.ejoysoft.common.Format;
import com.ejoysoft.common.Globa;
import com.ejoysoft.common.UID;



import java.util.HashMap;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;
import java.util.Date;


public class SysPara {

    private Globa globa;
    private DbConnect db;

    //构�?�方�?
    public SysPara() {
    }

    public SysPara(Globa globa) {
        this.globa = globa;
        db = globa.db;
    }

    //构�?�方�?
    public SysPara(Globa globa, boolean b) {
        this.globa = globa;
        db = globa.db;
        if (b) globa.setDynamicProperty(this);
    }
      /**
     * 根据�?个已有的Parameter对象构�??
     * @param param 已有的Parameter对象
     */
    public SysPara(SysPara param) {
        this.strId = param.strId;
        this.paraName = param.paraName;
        this.paraValue = param.paraValue;

    }
    static String  strTableName = "sys_config";
    public static Vector<SysPara> vctSysPara;	//�?有参�?
    public static HashMap<String, SysPara> hmSysPara;	//�?有参数哈希表
    
    public static void init() {
    	 hmSysPara = new HashMap<String, SysPara>();
    	 vctSysPara = new Vector<SysPara>();
    	String sql = "SELECT * FROM " + strTableName + " ORDER BY intsort";
    	/*
    	try {
    		Connection con = DbConnect.getStaticCon();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
            	SysPara theBean = new SysPara();
            	theBean.setStrId(rs.getString("strId"));
                theBean.setStrName(rs.getString("strName"));
                theBean.setStrValue(rs.getString("strValue"));
                theBean.setStrType(rs.getString("strType"));
                theBean.setStrState(rs.getString("strState"));
                theBean.setdCreatDate(rs.getString("dCreatDate"));
                theBean.setStrCreator(rs.getString("strCreator"));
               
                hmSysPara.put(theBean.getStrId(), theBean);
                vctSysPara.add(theBean);
            }
            System.out.println("[INFO]:SysPara Initialized Successful");
            rs.close();
            stmt.close();
            con.close();
    	} catch (Exception e) {
    		e.printStackTrace();
    		System.out.println("[ERROR]:An error occured in SysPara.init()");
    	}*/
    }
    
    
    //增加�?个栏�?
    public boolean add() throws SQLException {
        try {
            strId = UID.getID();
            String strSql = "INSERT INTO " + strTableName + "(strId, paraName, paraValue,strCreator, dtCreatTime,paraDesc) VALUES (?,?,?,?,to_date(?,'yyyy-mm-dd hh24:mi:ss'),?)";
            db.prepareStatement(strSql);
            db.setString(1, strId);
            db.setString(2, paraName);
            db.setString(3, paraValue);
            db.setString(4, strCreator);
            db.setString(5, com.ejoysoft.common.Format.getDateTime());
            db.setString(6, paraDesc);
            db.executeUpdate();
            Globa.logger0("增加系统参数strId=" + strId, globa.loginName, globa.loginIp, strSql, "系统参数", globa.userSession.getStrDepart());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 获取�?大序列号
     *
     */

    public boolean update(String tStrtId) throws SQLException {
        try { 
            //更新内容
            String strSql = "UPDATE " + strTableName + " SET paraName=?,paraValue=?,strCreator=?,dtCreatTime=to_date(?,'yyyy-mm-dd hh24:mi:ss') , paraDesc=? WHERE strId=?";
            db.prepareStatement(strSql);
            db.setString(1, paraName);
            db.setString(2, paraValue);
            db.setString(3, globa.loginName);
            db.setString(4,Format.getDateTime());
            db.setString(5, paraDesc);
            db.setString(6, tStrtId);
            db.executeUpdate();
            Globa.logger0("修改系统参数strId=" + strId, globa.loginName, globa.loginIp, strSql, "系统参数", globa.userSession.getStrDepart());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //删除 
    public boolean delete(String where)throws SQLException {
        try {
            SysPara var0 = show(where);       
            String sql = "DELETE FROM " + strTableName + "  ".concat(where);
            Globa.logger0("删除系统参数where=" + where, globa.loginName, globa.loginIp, sql, "系统参数", globa.userSession.getStrDepart());
            db.executeUpdate(sql);
            return true;
        } catch (Exception ee) {
            ee.printStackTrace();
            return false;
        }
    }

    public static String getIdByName(String paraName) {
		for (int i = 0; i < vctSysPara.size(); i++) {
			if (vctSysPara.get(i).getParaName().equals(paraName))
				return vctSysPara.get(i).getParaValue();
		}
		return null;
	}
    public static String getIdByName2(String paraName) {
		for (int i = 0; i < vctSysPara.size(); i++) {
			if (vctSysPara.get(i).getParaName().equals(paraName))
				return vctSysPara.get(i).getStrId();
		}
		return null;
	}
    public static String getNameById(String strId) {
		for (int i = 0; i < vctSysPara.size(); i++) {
			if (vctSysPara.get(i).getStrId().equals(strId))
				return vctSysPara.get(i).getParaName();
		}
		return null;
	}

    public static String getIdByName(String paraName, String strType) {
		for (int i = 0; i < vctSysPara.size(); i++) {
			SysPara bean = vctSysPara.get(i);
			if (bean.getParaName().equals(paraName))
				return bean.getStrId();
		}
		return null;
	}
    
    
	public static SysPara getParaByName(String paraName) {
		for (int i = 0; i < vctSysPara.size(); i++) {
			if (vctSysPara.get(i).getParaName().equals(paraName))
				return vctSysPara.get(i);
		}
		return null;
	}
	
   
    //详细显示单条记录
    public SysPara show(String where) throws SQLException{
        try {
            String strSql = "select * from  " + strTableName + "  ".concat(String.valueOf(String.valueOf(where)));
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
    public SysPara load(ResultSet rs) throws SQLException{
        SysPara theBean = new SysPara();
        try {
            theBean.setStrId(rs.getString("strId"));
            theBean.setParaName(rs.getString("paraName"));
            theBean.setParaValue(rs.getString("paraValue"));
            theBean.setParaDesc(rs.getString("paraDesc"));
            theBean.setStrCreator(rs.getString("strCreator"));
            theBean.setdtCreatTime(rs.getString("dtCreatTime"));
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
   

    //列表记录�?
    public Vector<SysPara> list(String where, int startRow, int rowCount) throws SQLException{
        Vector<SysPara> beans = new Vector<SysPara>();
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
                    SysPara theBean = new SysPara();
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
    
    private String strId;  //	参数id�?
    private String paraName;  //	选项名称
    private String paraValue;  //选项内容
    private String strCreator;  //		创建�?
    private String dtCreatTime;  //		创建时间
    private String paraDesc;//参数说明
    
    
    
    
    public String getParaDesc() {
		return paraDesc;
	}

	public void setParaDesc(String paraDesc) {
		this.paraDesc = paraDesc;
	}

	public String getStrId() {
        return strId;
    }

    public void setStrId(String strId) {
        this.strId = strId;
    }


    public String getParaName() {
        return paraName;
    }

    public void setParaName(String paraName) {
        this.paraName = paraName;
    }

    public String getParaValue() {
        return paraValue;
    }

    public void setParaValue(String paraValue) {
        this.paraValue = paraValue;
    }

    public String getStrCreator() {
        return strCreator;
    }

    public void setStrCreator(String strCreator) {
        this.strCreator = strCreator;
    }

    public String getdtCreatTime() {
        return dtCreatTime;
    }

    public void setdtCreatTime(String dtCreatTime) {
        this.dtCreatTime = dtCreatTime;
    }

 
    public final static String _REMIND_TYPE = "备忘类型";

    public final static String[] ARRAY_TYPE =
            new String[]{
                _REMIND_TYPE,
            };
}