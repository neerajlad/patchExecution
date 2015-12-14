/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pes.Servletcontroller;

import com.pes.bean.PieChartData;
import com.pes.bean.slavePatchExecutionStatusBean;
import com.pes.dao.slavePatchExecutionStatusDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author neerajkumar.b.lad
 */
@WebServlet(name = "SlavePatchExecutionStatusController", urlPatterns = {"/SlavePatchExecutionStatusController"})
public class SlavePatchExecutionStatusController extends HttpServlet {

     private static String Edit = "/editPatchRow.jsp";
     private static String ViewCurrentPatch = "/ViewCurrentPatch.jsp";
    
    private slavePatchExecutionStatusDao slavepatchexecutionstatusdao;
    public SlavePatchExecutionStatusController() {    
     super();
     slavepatchexecutionstatusdao = new slavePatchExecutionStatusDao();
        
    }

     
     
     /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        try {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SlavePatchExecutionStatusController</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SlavePatchExecutionStatusController at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        } finally {
//            out.close();
//        }
//    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String redirect="";
        String uPatchversion = request.getParameter("patchversion");  
        System.out.println("patch version :::>"+uPatchversion);
        String uSubprocessname = request.getParameter("subprocessname");  
        System.out.println("sub Process :::>"+uSubprocessname);
        String action = request.getParameter("action");
        System.out.println("action :>:>:>"+action);
        
//        if(uPatchversion==null)
//        {
//            uPatchversion = request.getParameter("drpViewOpenPatch");
//            uSubprocessname = "";
//            action="";
//            redirect = ViewCurrentPatch;
//        }

        
        if (action.equalsIgnoreCase("edit")){

            slavePatchExecutionStatusBean slavepatchexecutionStatusbean = new slavePatchExecutionStatusBean();

            // taking parameter from editpatchRow.jsp
            slavepatchexecutionStatusbean.setPatchversion(request.getParameter("txtPatchversion"));
            slavepatchexecutionStatusbean.setProcessname(request.getParameter("txtProcessName"));
            slavepatchexecutionStatusbean.setSubprocessname(request.getParameter("txtSubProcessName"));
            slavepatchexecutionStatusbean.setAssignedto(request.getParameter("drpAssignedTo"));
            slavepatchexecutionStatusbean.setStatus(request.getParameter("drpStatus"));
            slavepatchexecutionStatusbean.setComment(request.getParameter("txtComments"));
            slavepatchexecutionStatusbean.setIssueid(request.getParameter("txtIssueid"));
            
           
            slavepatchexecutionstatusdao.editPatchRpw(slavepatchexecutionStatusbean);
            request.setAttribute("editedData", slavepatchexecutionStatusbean);
            
            redirect = ViewCurrentPatch;
            System.out.println("Record updated Successfully");
            }
            else if (action.equalsIgnoreCase("editform")){         
                redirect = Edit;
            }            
        
         RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
    }
    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void PieChartData() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
