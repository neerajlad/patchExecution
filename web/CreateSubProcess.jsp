<%-- 
    Document   : CreateSubProcess
    Created on : Dec 2, 2015, 8:28:41 PM
    Author     : neerajkumar.b.lad
--%>

<%@page import="com.pes.bean.masterProcessBean"%>
<%@page import="java.util.List"%>
<%@page import="com.pes.dao.MasterProcessDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Sub Process</title>
    </head>
    <body>
        <div>
            <%
                MasterProcessDao masterprocessdao = new MasterProcessDao();
                List<masterProcessBean> lstProcess = masterprocessdao.getAllMasterProcess();
            %>
            <form action="MasterSubProcessController" name="frmCreateSubProcess" method="POST">
                Select Process Name :
                <select name="drpProcessName">
                    <%
                        for (masterProcessBean p : lstProcess)
                        {    
                    %>
                         <option><%=p.getProcessname()%></option>                  
                    <%  
                        } 
                    %>
                </select>
                <br/><br/>                
                Sub Process Name :<input type="text" name="txtSubProcessName" value="" placeholder="Enter Sub process Name" />
                <br/><br/>
                <input type="submit" value="Save" name="btnSave" />
            </form>
        </div>
    </body>
</html>
