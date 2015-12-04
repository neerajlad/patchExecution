/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pes.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author neerajkumar.b.lad
 */
public class ConnectionProvider {
     private static Connection con = null;

    public static Connection getConnection() {
        
        if (con != null)
            return con;
        else {
            try {                

                String driverClassName = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/itt";
                String username = "root";
                String password = "root";
                
                Class.forName(driverClassName);
                con = DriverManager.getConnection(url, username, password);
            } catch (ClassNotFoundException cnfe) {
                System.out.println(cnfe);
            } catch (SQLException sqe) {
                System.out.println(sqe);
            } 
            return con;
        }

    }
}