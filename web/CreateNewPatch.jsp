<%-- 
    Document   : CreateNewPatch
    Created on : Dec 3, 2015, 6:49:33 AM
    Author     : neerajkumar.b.lad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Patch</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
         <script>
            $(function () {
                $("#startdate").datepicker({dateFormat: 'yy-mm-dd'});
            });
        </script>        
    </head>
    <body>
    <div>
        <form action="MasterPatchController" name="frmNewPatch" method="POST">
        
        <table border="0">           
            <tbody>
                <tr>
                    <td>Patch Version:</td>
                    <td><input type="text" name="txtPatchVersion" value="" /></td>
                </tr>
                <tr>
                    <td>Server Name :</td>
                    <td><select name="drpServerName">
                            <option>Auto ENKD</option>
                            <option>Prod ENKD</option>                            
                        </select></td>
                </tr>
                <tr>
                    <td>Start Date :</td>
                    <td><input type="text" name="txtStartDate" value="" id="startdate" /></td>
                </tr>
                
                <tr>
                    <td><input type="submit" value="Create New Patch" name="btnCreatePatch" /></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
</form>
    </div>
    </body>
</html>
