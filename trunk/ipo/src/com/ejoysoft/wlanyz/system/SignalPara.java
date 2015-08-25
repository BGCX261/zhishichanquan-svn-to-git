package com.ejoysoft.wlanyz.system;

import com.ejoysoft.auth.MD5;
import com.ejoysoft.common.*;
import com.ejoysoft.common.exception.UserUnitIdException;
import com.ejoysoft.wlanyz.system.Unit;
import com.ejoysoft.wlanyz.system.User;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.Vector;
import java.util.HashMap;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

public class SignalPara {
	private Globa globa;
    private DbConnect db;


    public SignalPara() {
    }

    public SignalPara(Globa globa) {
        this.globa = globa;
        db = globa.db;
    }

    public SignalPara(Globa globa, boolean b) {
        this.globa = globa;
        db = globa.db;
        if (b) globa.setDynamicProperty(this);
    }

    String strTableName = "SIGNAL_PARA";
  

    //增加用户
    public boolean add() {
        String strSql = "";
        String strTempId = UID.getID();
        try {
        	//把用户信息写入数据库
            strSql = "INSERT INTO " + strTableName + "  (strId, para_name,para_value ) VALUES (?,?,?)";
            System.out.println("++++++="+ParaName+ParaValue);
            db.prepareStatement(strSql);
            db.setString(1, strTempId);
            db.setString(2, ParaName);
            db.setDouble(3, ParaValue);
            if (db.executeUpdate() > 0) {
                Globa.logger0("增加无线信号强度覆盖范围参数信息", globa.loginName, globa.loginIp, strSql, "无线信号强度覆盖范围参数管理", globa.userSession.getStrDepart());
                return true;
            } else
                return false;
        } catch (Exception e) {
            System.out.println("增加无线信号强度覆盖范围参数信息时出错！！");
            e.printStackTrace();
            return false;
        }
    }
    public boolean delete(String where) {
        try {
            String sql = "DELETE FROM " + strTableName + "  ".concat(where);
            db.executeUpdate(sql);
            //ɾ���û�ӳ����?
          //  delUnitUser(where);
            Globa.logger0("删除图纸信息", globa.loginName, globa.loginIp, sql, "图纸管理", globa.unitCode);
            return true;
        } catch (Exception ee) {
            ee.printStackTrace();
            return false;
        }
    }
    public boolean update(String strId) {
        try {
            String strSql = "UPDATE  " + strTableName + "  SET  Para_Name = ?, Para_Value = ?  WHERE strId=? ";
            db.prepareStatement(strSql);
            db.setString(1, ParaName);
            db.setDouble(2, ParaValue);
             db.setString(3, strId);
            System.out.println(strSql);
            db.executeUpdate();
             System.out.println("修改成功！！！");
            Globa.logger0("修改热点信息", globa.loginName, globa.loginIp, strSql, "热点信息", globa.userSession.getStrDepart());
            return true;
        } catch (Exception e) {
            System.out.println("修改用户信息时出错：" + e);
            return false;
        }
    }
//返回单条记录
    public SignalPara show(String where) {
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
    public SignalPara load(ResultSet rs, boolean isView) {
        SignalPara theBean = new SignalPara();
        try {
            theBean.setStrId(rs.getString("strId"));
            theBean.setParaName(rs.getString(2));
            theBean.setParaValue(rs.getDouble(3));
             } catch (Exception e) {
            e.printStackTrace();        
        }
        return theBean;
    }
    
    //记录集转化为对象
    public SignalPara load2(ResultSet rs, boolean isView) {
        SignalPara theBean = new SignalPara();
        try {
        	theBean.setStrId(rs.getString(1));
        	theBean.setParaName(rs.getString(2));
            theBean.setParaValue(rs.getDouble(3));
            if(theBean.getParaName().equals("rays"))theBean.setexplian("请输入180的倍数！");
            if(theBean.getParaName().equals("cells"))theBean.setexplian("请输入某个整数的倍数！");
        } catch (Exception e) {
            e.printStackTrace();        
        }
        return theBean;
    }

  //查询符合条件的记录总数
    public int getCount(String where) {
        int count = 0;
        try {
            String sql = "SELECT count(strId) FROM " + strTableName + " ";
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
            System.out.println(ee);           
            return count;
        }
    }




  //列表记录集
    public Vector<SignalPara> list(String where, int startRow, int rowCount) {
        Vector<SignalPara> beans = new Vector<SignalPara>();
        try {
            String sql = "SELECT * FROM  " + strTableName + "  ";
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
                    SignalPara theBean = new SignalPara();
                    theBean = load2(rs, false);
                    beans.addElement(theBean);
                } while (rs.next());
            }
            rs.close();
            s.close();
        } catch (Exception ee) {
            ee.printStackTrace();
        }finally{
        	db.closeCon();
        }
        return beans;
    }
    
  //列表记录集
    public Vector<SignalPara> list2(String where, int startRow, int rowCount) {
        Vector<SignalPara> beans = new Vector<SignalPara>();
        try {
            String sql = "SELECT *  FROM  " + strTableName + " ";
            if (where.length() > 0)
                sql = String.valueOf(sql) + String.valueOf(where);
            Statement s = db.getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            if (startRow != 0 && rowCount != 0)
                s.setMaxRows((startRow + rowCount) - 1);
//            System.out.println(""+sql);
            ResultSet rs = s.executeQuery(sql);
            if (rs != null && rs.next()) {
                if (startRow != 0 && rowCount != 0)
                    rs.absolute(startRow);
                do {
                    SignalPara theBean = new SignalPara();
                    theBean = load(rs, false);
                    beans.addElement(theBean);
                } while (rs.next());
            }
            rs.close();
            s.close();
        } catch (Exception ee) {
            ee.printStackTrace();
        }finally{
        	db.closeCon();
        }
        return beans;
    }


    private String strId;
    private String  ParaName;// 参数名
    private double ParaValue;//参数值	
    private String explian="";
    


    public String getStrId() {
        return strId;
    }

    public void setStrId(String strId) {
        this.strId = strId;
    }

    public String getParaName() {
        return ParaName;
    }

    public void setParaName(String ParaName) {
        this.ParaName = ParaName;
    }
    
    public double getParaValue() {
		return ParaValue;
	}
    
    public void setParaValue(double ParaValue){
    	 this.ParaValue = ParaValue;
    }
    public String getexplian() {
        return explian;
    }

    public void setexplian(String explian) {
        this.explian = explian;
    }
   
}
   