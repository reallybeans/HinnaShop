/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author leean
 */
public class DBUtils implements Serializable{
        public static Connection getConnection() throws ClassNotFoundException, SQLException, NamingException{
        //1.get current context
        Context context = new InitialContext();       
        //2.get server context
        Context tomcatContext = (Context)context.lookup("java:comp/env");
        //3. get Data Source
        javax.sql.DataSource ds = (javax.sql.DataSource)tomcatContext.lookup("SE140802");
        //4.make connection
        Connection conn = ds.getConnection();
        return conn;
    }
//    public static Connection getConnection2() throws NamingException, SQLException {
//        Connection conn = null;
//        Context context = (Context) new InitialContext();
//        Context end = (Context)context.lookup("java:comp/env");
//        DataSource ds =(DataSource)end.lookup("DBCon");
//        conn = ds.getConnection();
//        return conn; 
//    }
}
