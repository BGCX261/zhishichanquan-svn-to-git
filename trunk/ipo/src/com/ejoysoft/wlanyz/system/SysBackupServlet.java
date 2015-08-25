package com.ejoysoft.wlanyz.system;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 2006-4-17
 * Time: 15:29:46
 * To change this template use Options | File Templates.
 */
public class SysBackupServlet extends HttpServlet {
    public void init(ServletConfig servletConfig) throws ServletException {
        super.init(servletConfig);
    }

    public void service(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws ServletException, IOException {
        com.ejoysoft.common.Globa globa = new com.ejoysoft.common.Globa();
        globa.initialize(getServletContext());
        // isAuto �Ƿ������Զ�����
        String isAuto = (String) getServletContext().getAttribute("DB_DEFINED");
        if (isAuto != null && isAuto.equals("true")) {
            System.out.println("[" + new java.util.Date() + "] INFO ϵͳ������");
            String n1 = (String) getServletContext().getAttribute("DATEBASE_BACKUP_MOD");
            //����ϵͳ��ݿ�?
            String path = globa.getPropValue("PATH_DB_BACKUP");
            String commandPath = globa.getPropValue("PATH_DB_EXP");
            String userid = globa.getPropValue("username")+"/"+globa.getPropValue("password");
//            SysBackup.backupOfdb(userid, path,commandPath,n1);
            globa.closeCon();
            String zipFileName = (String) getServletContext().getAttribute("PATH_PROG_BACKUP") + SysBackup.nextFile(n1) + "sxTeamwork.zip";
            String inputFile = (String) getServletContext().getAttribute("PATH_ROOT_PHYSIC");
            //�����?
            SysBackup.wzip(zipFileName, inputFile);
            System.out.println("[" + new java.util.Date() + "] INFO ϵͳִ�����?");
        }
    }
    public void destroy() {
    }


}
