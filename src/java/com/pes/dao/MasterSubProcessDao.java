/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pes.dao;


import com.pes.bean.masterSubProcessBean;
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
public class MasterSubProcessDao {
    
      private Connection conn;

    public MasterSubProcessDao() {
        conn = ConnectionProvider.getConnection();
    }
    
    public void addMasterSubProcess(masterSubProcessBean mastersubprocessbean)
    {
    
        try {
                String sql = "INSERT INTO m_subprocess(processname,subprocessname)" +
                " VALUES ( ? ,? )";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, mastersubprocessbean.getProcessname());            
            ps.setString(2, mastersubprocessbean.getSubprocessname());            
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List getAllMasterSubProcess()
    {
        List lstmastersubprocess = new ArrayList();
        try {
                String sql = "SELECT * FROM m_subprocess";
            PreparedStatement ps = conn.prepareStatement(sql);
            masterSubProcessBean mastersubprocessbean = new masterSubProcessBean();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                masterProcessBean masterprocessbean = new masterProcessBean();                
                mastersubprocessbean.setProcessname(rs.getString("processname"));                
                mastersubprocessbean.setSubprocessname(rs.getString("subprocessname"));                
                lstmastersubprocess.add(mastersubprocessbean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lstmastersubprocess;    
    }
    
    public List getAllOnlyMasterProcess()
    {
        List lstmastersubprocess = new ArrayList();
        try {
                String sql = "SELECT DISTINCT processname FROM m_subprocess order by processname";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                masterSubProcessBean mastersubprocessbean = new masterSubProcessBean();
                mastersubprocessbean.setProcessname(rs.getString("processname"));                
                lstmastersubprocess.add(mastersubprocessbean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lstmastersubprocess;    
    }
    
    public List getAllOnlyMasterSubProcess(String processname)
    {
        List lstmastersubprocess = new ArrayList();
        try {
                String sql = "SELECT * FROM m_subprocess where processname=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, processname);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                masterSubProcessBean mastersubprocessbean = new masterSubProcessBean();
                mastersubprocessbean.setSubprocessname(rs.getString("subprocessname"));                
                lstmastersubprocess.add(mastersubprocessbean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lstmastersubprocess;    
    }
    public masterSubProcessBean getMasterSubProcessByMasterProcessName(String processname)
    {
        masterSubProcessBean mastersubprocessbean = new masterSubProcessBean(); 
        try {
            String sql = "SELECT * FROM m_subprocess WHERE processname=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, processname);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {                
                mastersubprocessbean.setProcessname(rs.getString("processname"));                           
                mastersubprocessbean.setSubprocessname(rs.getString("subprocessname"));                           
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mastersubprocessbean;    
    }
    public boolean IsSubProcessExists(String subprocessname)
    {
        boolean isSubprocessfound = false;
        try {
            String sql = "SELECT * FROM m_subprocess WHERE subprocessname=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, subprocessname);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {                
                if(subprocessname.equalsIgnoreCase(rs.getString("subprocessname"))); 
                {
                    isSubprocessfound = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSubprocessfound;
    }
}