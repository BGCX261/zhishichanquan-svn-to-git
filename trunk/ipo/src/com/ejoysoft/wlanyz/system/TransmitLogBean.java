package com.ejoysoft.wlanyz.system;

import com.ejoysoft.common.Globa;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 2007-4-5
 * Time: 16:56:20
 * To change this template use Options | File Templates.
 */
public class TransmitLogBean {

    public void TransmitLogBean() {
    }


    public void service(ServletRequest servletRequest, ServletResponse servletResponse)
            throws IOException, ServletException {
        Globa globa = new Globa();

        try {
            //transmit log
            String sql = "INSERT into  sys_logHistory " +
                    "SELECT * FROM sys_log WHERE sysdate-dOccurDate>=30 ";    //For Oracle
            System.out.println("sql in TransmitLogBean is =="+sql);
//            globa.db.setAutoCommit(false);
            globa.db.executeUpdate(sql);
            //delete log transmitted
            sql = "DELETE sys_log WHERE sysdate-dOccurDate>=30";//FOR Oracle
            globa.db.executeUpdate(sql);
            globa.db.commit();
            globa.closeCon();
            System.out.println("ת����־�ɹ�����");
        } catch (SQLException e) {
            if (globa.db != null) {
                try {
                    globa.db.rollback();
                    globa.db.closeCon();
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            }
            System.out.println("ת����־ʱ�������?");
            e.printStackTrace();
        }
    }
}
