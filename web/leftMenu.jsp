<%-- 
    Document   : leftMenu
    Created on : Dec 2, 2015, 8:26:44 PM
    Author     : neerajkumar.b.lad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/style.css" type="text/css" />
          
        <title>Left Menu</title>
    </head>
    <body>
        <div id="menu">
            <ul type="disc">
                <li><a href="containsPage.jsp" target="containsPage" class="active" >Home</a></li>
                <li><a href="CreateProcess.jsp" target="containsPage">Create Process</a></li>
                <li><a href="CreateSubProcess.jsp" target="containsPage">Create Sub Process</a></li>
                <li><a href="ViewProcess.jsp" target="containsPage">View Process</a></li>
                <li><a href="CreateNewPatch.jsp" target="containsPage">Create New Patch</a></li>
                <li><a href="ViewCurrentPatch.jsp" target="containsPage">View Patch Execution Status</a></li>
                <li><a href="EndPatch.jsp" target="containsPage">Close Patch</a></li>
            </ul>
        </div>
       
    </body>
</html>
