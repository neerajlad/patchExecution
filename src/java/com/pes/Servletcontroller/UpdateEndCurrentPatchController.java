/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pes.Servletcontroller;

import com.pes.bean.masterPatchBean;
import com.pes.dao.MasterPatchDao;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UpdateEndCurrentPatchController", urlPatterns = {"/UpdateEndCurrentPatchController"})
public class UpdateEndCurrentPatchController extends HttpServlet {

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
//            out.println("<title>Servlet UpdateEndCurrentPatchController</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet UpdateEndCurrentPatchController at " + request.getContextPath() + "</h1>");
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
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
         String drpPatchVersion = request.getParameter("drpPatchVersion");
        String txtEnddate = request.getParameter("txtEnddate");
        
        MasterPatchDao masterpatchdao = new MasterPatchDao();
        masterPatchBean masterpatchbean = new masterPatchBean();
       
        if(masterpatchdao.IsPatchExists(drpPatchVersion))
        {
            masterpatchbean.setPatchversion(drpPatchVersion);
            masterpatchbean.setEnddate(txtEnddate);            
            
            //masterpatchdao.addMasterPatch(masterpatchbean);
            masterpatchdao.updateEndDateByPatchName(masterpatchbean);
            RequestDispatcher rd = request.getRequestDispatcher("EndPatch.jsp");
            rd.forward(request, response);
        }   
        else
        {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Entered Patch Version is already exists.');");
            out.println("</script>");
            out.close();                        
        }
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

}
