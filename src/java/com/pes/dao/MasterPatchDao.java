/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pes.dao;


import com.pes.bean.masterPatchBean;
import com.pes.bean.masterProcessBean;
import com.pes.bean.slavePatchExecutionStatusBean;
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
public class MasterPatchDao {
 
     private Connection conn;

    public MasterPatchDao() {
        conn = ConnectionProvider.getConnection();
    }
    
    public void addMasterPatch(masterPatchBean masterpatchbean)
    {    
        try {
                String sql = "INSERT INTO m_patch(patchversion,servername,startdate)" +
                " VALUES ( ? ,? ,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            
          //  ps.setInt(1, masterpatchbean.getPatchno());            
            ps.setString(1, masterpatchbean.getPatchversion());
            ps.setString(2, masterpatchbean.getServername());
            ps.setString(3, masterpatchbean.getStartdate());
            //ps.setString(5, masterpatchbean.getEnddate());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    public void updateEndDateByPatchName(masterPatchBean masterpatchbean)
    {
     try {
                String sql = "UPDATE m_patch SET enddate=? " + " WHERE patchversion=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, masterpatchbean.getEnddate());            
            ps.setString(2, masterpatchbean.getPatchversion());                        
            ps.executeUpdate();            

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     public List getAllNotEndedMasterPatch()
    {
        List lstmasterpatch = new ArrayList();
        try {
            String sql = "SELECT * FROM m_patch where enddate is null";
            PreparedStatement ps = conn.prepareStatement(sql);
            //masterPatchBean masterpatchbean = new masterPatchBean();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                masterPatchBean masterpatchbean = new masterPatchBean();
                masterpatchbean.setPatchversion(rs.getString("patchversion"));                
                masterpatchbean.setServername(rs.getString("servername"));                
                masterpatchbean.setStartdate(rs.getString("startdate"));                
                masterpatchbean.setEnddate(rs.getString("enddate"));                
                lstmasterpatch.add(masterpatchbean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lstmasterpatch;    
    }
     
     public List getAllMasterPatch()
    {
        List lstmasterpatch = new ArrayList();
        try {
            String sql = "SELECT * FROM m_patch";
            PreparedStatement ps = conn.prepareStatement(sql);
            //masterPatchBean masterpatchbean = new masterPatchBean();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                masterPatchBean masterpatchbean = new masterPatchBean();
                masterpatchbean.setPatchno(rs.getInt("patchid"));                
                masterpatchbean.setPatchversion(rs.getString("patchversion"));                
                masterpatchbean.setServername(rs.getString("servername"));                
                masterpatchbean.setStartdate(rs.getString("startdate"));                
                masterpatchbean.setEnddate(rs.getString("enddate"));                
                lstmasterpatch.add(masterpatchbean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lstmasterpatch;    
    }
     public boolean IsPatchExists(String patchversion)
    {
        boolean ispatchfound = false;
        try {
            String sql = "SELECT * FROM m_patch WHERE patchversion=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, patchversion);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {                
                if(patchversion.equalsIgnoreCase(rs.getString("patchversion"))); 
                {
                    ispatchfound = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ispatchfound;
    }
     
     public void addCreatePatch(slavePatchExecutionStatusBean slavepatchexecutionstatusbean)
    {
    
        try {
                String sql = "insert into s_patchexecution(patchversion,processname,subprocessname) "
                        + "select mp.patchversion,ms.processname,ms.subprocessname "
                        + "from m_patch mp, m_subprocess ms where mp.patchversion=?";
                
            PreparedStatement ps = conn.prepareStatement(sql);
            
          //  ps.setInt(1, masterpatchbean.getPatchno());            
            ps.setString(1, slavepatchexecutionstatusbean.getPatchversion());            
            //ps.setString(5, masterpatchbean.getEnddate());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
