<%-- 
    Document   : StartNewPatch
    Created on : Dec 2, 2015, 8:42:25 PM
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
        <title>Start New Patch</title>
    </head>
    <body>
         <%
            MasterPatchDao masterpatchdao = new MasterPatchDao();
            List<masterPatchBean> lstpatch = masterpatchdao.getAllNotEndedMasterPatch();
        %>
        <div>
            <select name="drpViewOpenPatch">                
                <%
                for (masterPatchBean p : lstpatch)
                {    
                %>
                     <option><%=p.getPatchversion()%></option>                  
                <%  
                    } 
                %>
            </select>
            <table border="1">                
                <tbody>
                <form>
                    <tr>
                        <td>Sub Process Name</td>                    
                        <td>Assigned To</td>
                        <td>Status</td>
                        <td>Comment</td>
                        <td>Issue ID</td>                        
                    </tr>
                    <tr>
                        <th colspan="5"><label name="txtProcessName">Process Name:</label></th>                
                    </tr>                    
                    <tr>
                        <td><label name="txtSubProcessName">Sub Process Name</label>                            
                        </td>                    
                        <td>
                            <select name="drpAssignedTo">
                                <option>neerajkumar</option>
                                <option>mahesh</option>
                                <option>Prasad</option>
                                
                            </select>
                        </td>
                        <td>
                            <select name="drpStatus">
                                <option>NA</option>
                                <option>Not Started</option>
                                <option>In-Progress</option>
                                <option>Completed</option>
                                <option>On Hold</option>
                                <option>Issue</option>
                            </select>
                        </td>
                        <td>
                            <textarea name="txtComment" rows="4" cols="20">
                            </textarea>
                        </td>
                        <td><input type="text" name="txtIssueID" value="" /></td>                        
                    </tr>
                    <td> <input type="submit" name="" value=""></td>
                </form>
                </tbody>
            </table>

        </div>
    </body>
</html>
