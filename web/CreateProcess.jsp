<%-- 
    Document   : CreateProcess
    Created on : Dec 2, 2015, 8:28:17 PM
    Author     : neerajkumar.b.lad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Process</title>
    </head>
    <body>
        <div>
            <form action="MasterProcessController" name="frmCreateProcess" method="POST">
                Process Name : <input type="text" name="txtProcessName" value="" placeholder="Enter Process Name" />
                <br/><br/>
                <input type="submit" value="Save" name="btnSave" />
            </form>
        </div>
    </body>
</html>
