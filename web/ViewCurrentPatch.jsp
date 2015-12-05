<%-- 
    Document   : StartNewPatch
    Created on : Dec 2, 2015, 8:42:25 PM
    Author     : neerajkumar.b.lad
--%>

<%@page import="com.pes.dao.slavePatchExecutionStatusDao"%>
<%@page import="com.pes.bean.slavePatchExecutionStatusBean"%>
<%@page import="java.util.List"%>
<%@page import="com.pes.bean.masterPatchBean"%>
<%@page import="com.pes.dao.MasterPatchDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Start New Patch</title>
         <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
         <link rel="stylesheet" type="text/css" href="css/tableskin.css">
        <script>
            $( "select" )
              .change(function () {
                var str = "";
                $( "select option:selected" ).each(function() {
                  str += $( this ).text() + " ";
                });
                $( "label" ).text( str );
              })
              .change();
        </script>
    </head>
    <body>
         <%
            MasterPatchDao masterpatchdao = new MasterPatchDao();
            List<masterPatchBean> lstpatch = masterpatchdao.getAllNotEndedMasterPatch();
        %>
        
        <div>
            <select name="drpViewOpenPatch" id="iddrpViewOpenPatch">                
                <%
                for (masterPatchBean p : lstpatch)
                {    
                %>
                     <option><%=p.getPatchversion()%></option>                  
                <%  
                    } 
                %>
            </select>
          <br/>
          <br/>
            <table border="1" class="gridtable">                
                <tbody>
<!--            <form name="frmViewCurrentPatch" method="POST">
          -->
                    <tr>
                        <td>Sub Process Name</td>                    
                        <td>Assigned To</td>
                        <td>Status</td>
                        <td>Comment</td>
                        <td>Issue ID</td>                        
                    </tr>
                    <%
                        slavePatchExecutionStatusDao slavepatchexecutionstatusdao = new slavePatchExecutionStatusDao();
                        List<slavePatchExecutionStatusBean> lstSelectedPatchProcess = slavepatchexecutionstatusdao.getAllSelectedPatchProcess("V-13");
                        
                        String cProcess="";
                        for(slavePatchExecutionStatusBean process : lstSelectedPatchProcess)
                        {
                            if(!cProcess.equalsIgnoreCase(process.getProcessname()))
                            {
                                cProcess = process.getProcessname();
                                
                       %>
                                <tr>
                                    <th colspan="5"><label name="txtProcessName"><%= process.getProcessname() %></label></th>                
                                </tr>    
                    <%
                            }
                           
                    %>
    
                    <tr>
                        <td><label name="txtSubProcessName"><%= process.getSubprocessname() %></label>                            
                        </td>                    
                        <td>
                            <label  name="txtAssignedTo"><%= process.getAssignedto()%></label>
                        </td>
                        <td>
                            <label name="txtstatus"><%= process.getStatus()%></label>
                        </td>
                        <td>
                            <label name="txtComment"><%= process.getComment()%></label>                            
                        </td>
                        <td>
                            <label name="txtIssueID"><%= process.getIssueid()%></label>                                                        
                        </td> 
                         <td>
                             <a href="SlavePatchExecutionStatusController?action=editform&patchversion=<%=process.getPatchversion()%>&subprocessname=<%=process.getSubprocessname()%>">Update</a>
                         </td>                        
                    </tr>
                    <%
                        }
                    %>
                   
                <!--</form>-->
                </tbody>
            </table>        
        </div>
    </body>
</html>
