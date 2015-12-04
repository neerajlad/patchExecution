/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pes.dao;

import com.pes.bean.masterProcessBean;
import com.pes.dbconnection.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author neerajkumar.b.lad
 */
public class MasterProcessDao {
    
    private Connection conn;

    public MasterProcessDao() {
        conn = ConnectionProvider.getConnection();
    }
    
    public void addMasterProcess(masterProcessBean masterprocessbean)
    {    
        try {

            String sql = "INSERT INTO m_process(processname)" +
                " VALUES ( ? )";
            PreparedStatement ps = conn.prepareStatement(sql);
//            if(!IsProcessExists(masterprocessbean.getProcessname()))
//            {
                ps.setString(1, masterprocessbean.getProcessname());            
                ps.executeUpdate();
//            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List getAllMasterProcess()
    {
        List lstmasterprocess = new ArrayList();
        try {
                String sql = "SELECT * FROM m_process";
            PreparedStatement ps = conn.prepareStatement(sql);
            masterProcessBean masterprocessbean = new masterProcessBean();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                masterProcessBean masterprocessbean = new masterProcessBean();                
                masterprocessbean.setProcessname(rs.getString("processname"));                
                lstmasterprocess.add(masterprocessbean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lstmasterprocess;    
    }
    
    public masterProcessBean getMasterProcessByName(String processname)
    {
        masterProcessBean masterprocessbean = new masterProcessBean(); 
        try {
            String sql = "SELECT * FROM m_process WHERE processname=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, processname);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {                
                masterprocessbean.setProcessname(rs.getString("processname"));                           
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return masterprocessbean;    
    }
    
    public boolean IsProcessExists(String processname)
    {
        boolean isprocessfound = false;
        try {
            String sql = "SELECT * FROM m_process WHERE processname=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, processname);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {                
                if(processname.equalsIgnoreCase(rs.getString("processname"))); 
                {
                    isprocessfound = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isprocessfound;
    }
}
