/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pes.dao;

import com.pes.dbconnection.ConnectionProvider;
import java.sql.Connection;

/**
 *
 * @author neerajkumar.b.lad
 */
public class slavePatchExecutionStatusDao {

    private Connection conn;

    public slavePatchExecutionStatusDao() {
         conn = ConnectionProvider.getConnection();
    }
    
    
}
