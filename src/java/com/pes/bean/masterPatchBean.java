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
public class masterPatchBean {
    private int patchno;
    private String patchversion;
    private String servername;
    private String startdate;
    private String enddate;

    public int getPatchno() {
        return patchno;
    }

    public void setPatchno(int patchno) {
        this.patchno = patchno;
    }

    public String getPatchversion() {
        return patchversion;
    }

    public void setPatchversion(String patchversion) {
        this.patchversion = patchversion;
    }

    public String getServername() {
        return servername;
    }

    public void setServername(String servername) {
        this.servername = servername;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }
    
    
}
