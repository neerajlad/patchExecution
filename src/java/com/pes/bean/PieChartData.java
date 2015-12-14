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
import java.util.ArrayList;
import java.util.List;
 
public class PieChartData {
 
   private int intNA;
   private int intNotstarted;
   private int intInprogress;
   private int intCompleted;
   private int intOnHold;
   private int intIssue;

    public int getIntNA() {
        return intNA;
    }

    public void setIntNA(int intNA) {
        this.intNA = intNA;
    }

    public int getIntNotstarted() {
        return intNotstarted;
    }

    public void setIntNotstarted(int intNotstarted) {
        this.intNotstarted = intNotstarted;
    }

    public int getIntInprogress() {
        return intInprogress;
    }

    public void setIntInprogress(int intInprogress) {
        this.intInprogress = intInprogress;
    }

    public int getIntCompleted() {
        return intCompleted;
    }

    public void setIntCompleted(int intCompleted) {
        this.intCompleted = intCompleted;
    }

    public int getIntOnHold() {
        return intOnHold;
    }

    public void setIntOnHold(int intOnHold) {
        this.intOnHold = intOnHold;
    }

    public int getIntIssue() {
        return intIssue;
    }

    public void setIntIssue(int intIssue) {
        this.intIssue = intIssue;
    }
 
}