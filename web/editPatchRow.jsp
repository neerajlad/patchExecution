<%-- 
    Document   : editPatchRow
    Created on : Dec 4, 2015, 10:56:22 PM
    Author     : neerajkumar.b.lad
--%>

<%@page import="com.pes.dao.slavePatchExecutionStatusDao"%>
<%@page import="com.pes.bean.slavePatchExecutionStatusBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
    </head>
    <body>
          <%
//            UserBean user = new UserBean();
            slavePatchExecutionStatusBean slavepatchexecutionstatusbean = new slavePatchExecutionStatusBean();
            slavePatchExecutionStatusDao slavepatchexecutionstatusdao = new slavePatchExecutionStatusDao();
        %>
        <%
//            UserDao dao = new UserDao();
        %>
        <form name="frmEditPatchRow" method="POST" action='SlavePatchExecutionStatusController'>
            <input type="hidden" name="action" value="edit" /> 
            <%
                String aPatchVersion = request.getParameter("patchversion");
                String aSubProcessName = request.getParameter("subprocessname");
                
                if (!((aPatchVersion) == null && (aSubProcessName) == null )  ) {                    
                    slavepatchexecutionstatusbean = slavepatchexecutionstatusdao.getProcessByVersionSubprocess(aPatchVersion,aSubProcessName);
            %>
            <table border="0">                
                <tbody>
                    <tr>
                        <td>Patch Version :</td>
                        <td><input type="text" name="txtPatchversion" value="<%=slavepatchexecutionstatusbean.getPatchversion()%>" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td>Process Name :</td>
                        <td><input type="text" name="txtProcessName" value="<%=slavepatchexecutionstatusbean.getProcessname() %>" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td>Sub Process Name :</td>
                        <td><input type="text" name="txtSubProcessName" value="<%=slavepatchexecutionstatusbean.getSubprocessname()%>" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td>Assigned To :</td>
                        <td><select name="drpAssignedTo">
                                
                                <option selected="selected"><%=slavepatchexecutionstatusbean.getAssignedto()%></option>
                                <option>mayank@cgi.com</option>
                                <option>mahesh@cgi.com</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Status :</td>
                        <td><select name="drpStatus">
                                <option selected="selected"><%=slavepatchexecutionstatusbean.getStatus()%></option>
                                <option>Not Started</option>
                                <option>In-Progress</option>
                                <option>Completed</option>
                                <option>On Hold</option>
                                <option>Issue</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Comment :</td>
                        <td><textarea name="txtComments" rows="4" cols="20" >
                                <%=slavepatchexecutionstatusbean.getComment()%>
                            </textarea></td>
                    </tr>
                    <tr>
                        <td>Issue ID :</td>
                        <td><input type="text" name="txtIssueid" value="<%=slavepatchexecutionstatusbean.getIssueid()%>" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Update" name="btnUpdate" /></td>
                    </tr>
                </tbody>
            </table>
            <%
                } else
                    out.println("ID Not Found");
            %>
        </form>
    </body>
</html>
