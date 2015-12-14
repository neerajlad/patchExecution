/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pes.dao;

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
public class slavePatchExecutionStatusDao {

    private Connection conn;

    public slavePatchExecutionStatusDao() {
         conn = ConnectionProvider.getConnection();
    }
    
     public void editPatchRpw(slavePatchExecutionStatusBean slavepatchexecutionstatusBean) {           
        try {
                String sql = "UPDATE s_patchexecution SET assignedto=?, status=?,comment=?,issueid=?" +
            " WHERE patchversion=? and subprocessname=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setString(1, slavepatchexecutionstatusBean.getAssignedto());
            ps.setString(2, slavepatchexecutionstatusBean.getStatus());            
            ps.setString(3, slavepatchexecutionstatusBean.getComment());
            ps.setString(4, slavepatchexecutionstatusBean.getIssueid());
            ps.setString(5, slavepatchexecutionstatusBean.getPatchversion());            
            ps.setString(6, slavepatchexecutionstatusBean.getSubprocessname());
            ps.executeUpdate();            

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
     public List getAllSelectedPatchProcess(String patchversion) {
        List lstselectedPatchProcess = new ArrayList();
        try {
                String sql = "SELECT * FROM s_patchexecution where patchversion=? ORDER BY processname";                
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, patchversion);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                slavePatchExecutionStatusBean slavepatchexecutionstatusbean = new slavePatchExecutionStatusBean();
                slavepatchexecutionstatusbean.setPatchversion(rs.getString("patchversion"));
                slavepatchexecutionstatusbean.setProcessname(rs.getString("processname"));
                slavepatchexecutionstatusbean.setSubprocessname(rs.getString("subprocessname"));                             
                slavepatchexecutionstatusbean.setAssignedto(rs.getString("assignedto"));                             
                slavepatchexecutionstatusbean.setStatus(rs.getString("status"));                             
                slavepatchexecutionstatusbean.setComment(rs.getString("comment"));                             
                slavepatchexecutionstatusbean.setIssueid(rs.getString("issueid"));                             
                                                
                lstselectedPatchProcess.add(slavepatchexecutionstatusbean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lstselectedPatchProcess;
    }
     public slavePatchExecutionStatusBean getProcessByVersionSubprocess(String patchversion,String subprocessname) {
        slavePatchExecutionStatusBean slavepatchexecutionstatusbean = new slavePatchExecutionStatusBean();
        try {
                String sql = "SELECT * FROM s_patchexecution where patchversion=? and subprocessname=?";                
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, patchversion);
            ps.setString(2, subprocessname);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                slavepatchexecutionstatusbean.setPatchversion(rs.getString("patchversion"));
                slavepatchexecutionstatusbean.setProcessname(rs.getString("processname"));
                slavepatchexecutionstatusbean.setSubprocessname(rs.getString("subprocessname"));
                slavepatchexecutionstatusbean.setAssignedto(rs.getString("assignedto"));
                slavepatchexecutionstatusbean.setStatus(rs.getString("status"));
                slavepatchexecutionstatusbean.setComment(rs.getString("comment"));                           
                slavepatchexecutionstatusbean.setIssueid(rs.getString("issueid"));                                           
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return slavepatchexecutionstatusbean;
    }
     
      public int getProcessStatusCount(String patchversion,String status) 
   {
       int rowCount=0;
        try 
            {
            String sql = "SELECT count(status) FROM s_patchexecution where patchversion=? and status =? ORDER BY processname";                
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, patchversion);
            ps.setString(2, status);
            ResultSet rs = ps.executeQuery();
            
            rs.next();
            rowCount = rs.getInt(1);
            System.out.println(rowCount);
    
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowCount;
    }
    
}
