/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pes.bean;

/**
 *
 * @author neerajkumar.b.lad
 */
public class slavePatchExecutionStatusBean {
    
    private String patchversion;
    private String processname;
    private String subprocessname;
    private String executor;
    private String assignedto;
    private String status;
    private String comment;
    private String issueid;

    public String getPatchversion() {
        return patchversion;
    }

    public void setPatchversion(String patchversion) {
        this.patchversion = patchversion;
    }

    public String getProcessname() {
        return processname;
    }

    public void setProcessname(String processname) {
        this.processname = processname;
    }

    public String getSubprocessname() {
        return subprocessname;
    }

    public void setSubprocessname(String subprocessname) {
        this.subprocessname = subprocessname;
    }

    public String getExecutor() {
        return executor;
    }

    public void setExecutor(String executor) {
        this.executor = executor;
    }

    public String getAssignedto() {
        return assignedto;
    }

    public void setAssignedto(String assignedto) {
        this.assignedto = assignedto;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getIssueid() {
        return issueid;
    }

    public void setIssueid(String issueid) {
        this.issueid = issueid;
    }
    
    
}
