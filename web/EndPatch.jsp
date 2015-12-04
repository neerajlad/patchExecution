<%-- 
    Document   : ClosePatch
    Created on : Dec 2, 2015, 8:51:17 PM
    Author     : neerajkumar.b.lad
--%>

<%@page import="java.util.List"%>
<%@page import="com.pes.bean.masterPatchBean"%>
<%@page import="com.pes.dao.MasterPatchDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        C:\Users\neerajkumar.b.lad\Documents\NetBeansProjects\PatchExectionStatus\web\WEB-INF\lib\jquery-ui-1.11.4-->
              
        <title>End Current Patch</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>         
        <script>
            $(function () {
                $("#enddate").datepicker({dateFormat: 'yy-mm-dd'}).datepicker("setDate", new Date());;
            });
        </script>
    </head>
    <body>
        <div>
            <form action="UpdateEndCurrentPatchController" name="frmEndPatch" method="POST">
           
            <table border="0">               
                <tbody>
                    <tr>
                        <td>Select Patch Version :</td>
                        <td>
                            <%
                                MasterPatchDao masterpatchdao = new MasterPatchDao();
                                List<masterPatchBean> lstpatch = masterpatchdao.getAllNotEndedMasterPatch();
                            %>
                            <select name="drpPatchVersion">
                            <%
                            for (masterPatchBean p : lstpatch)
                            {    
                            %>
                                 <option><%=p.getPatchversion()%></option>                  
                            <%  
                                } 
                            %>
                            </select>
                        </td>
                        <td><input type="hidden" name="txtEnddate" id="enddate" /></td>
                    </tr>
                    <tr>
                        <td><br/><input type="submit" value="End Patch" name="btnEndPatch" /></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            </form>                 
                            <br/><br/>  
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Patch Version</th>
                            <th>Server Name</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                         List<masterPatchBean> lstpatch1 = masterpatchdao.getAllMasterPatch();
                        %>
                            <%
                            for (masterPatchBean p : lstpatch1)
                            {    
                            %>                                          
                                <tr>
                                    <td><%=p.getPatchno()%></td>
                                    <td><%=p.getPatchversion()%></td>
                                    <td><%=p.getServername()%></td>
                                    <td><%=p.getStartdate()%></td>
                                    <td><%=p.getEnddate()%></td>                                    
                                </tr>                      
                            <%  
                                } 
                            %>
                        
                    </tbody>
                </table>
<!--===========-->
                    

        </div>
    </body>
</html>
