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
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <title>Create Process</title>
    </head>
    <body>
        <div>
            <form action="MasterProcessController" name="frmCreateProcess" method="POST">
                <table border="0">                   
                    <tbody>
                        <tr>
                            <td>Process Name : </td>
                            <td><input type="text" name="txtProcessName" value="" placeholder="Enter Process Name" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><br/><input type="reset" value="Clear" name="btnClear" />
                                <input type="submit" value="Save" name="btnSave" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                
                <br/><br/>
                
            </form>
        </div>
    </body>
</html>
