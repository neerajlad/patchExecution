<%-- 
    Document   : ViewProcessSubProcess
    Created on : Dec 14, 2015, 4:42:26 PM
    Author     : neerajkumar.b.lad
--%>

<%@page import="java.util.List"%>
<%@page import="com.pes.dao.MasterSubProcessDao"%>
<%@page import="com.pes.bean.masterSubProcessBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/tableskin.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <form name="frmViewProcess">
                <table border="1" class="gridtable" width="100%">
                    <thead>
                        <tr>
                            <th>Process List</th>                            
                        </tr>
                    </thead>                    
                    <tbody>
                        <%
                            masterSubProcessBean objmasterSubProcessBean = new masterSubProcessBean();
                            MasterSubProcessDao objMasterSubProcessDao = new MasterSubProcessDao();
                            List<masterSubProcessBean> lstAllProcess = objMasterSubProcessDao.getAllOnlyMasterProcess();
                            for(masterSubProcessBean p : lstAllProcess)
                            {
                        %>
                        <tr>
                            <th><%= p.getProcessname() %></th>                            
                        </tr>   
                        <%
                            masterSubProcessBean objmasterSubProcessBean1 = new masterSubProcessBean();
                            MasterSubProcessDao objMasterSubProcessDao1 = new MasterSubProcessDao();
                            List<masterSubProcessBean> lstAllProcess1 = objMasterSubProcessDao.getAllOnlyMasterSubProcess(p.getProcessname());
                            for(masterSubProcessBean p1 : lstAllProcess1)
                            {
                            
                        %>
                         <tr>                            
                            <td><%= p1.getSubprocessname()%></td>
                        </tr>
                        <%
                        }
                            }
                        %>
                    </tbody>
                </table>

            </form>
        </div>
    </body>
</html>
