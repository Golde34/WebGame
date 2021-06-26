<%-- 
    Document   : changepasss
    Created on : Jun 23, 2021, 8:15:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="WebGame/UserControllerMap" method="POST">
            <input type="hidden" name = "service" value="changepass">
            <table border="1">
                <tr>
                    <td>
                        Username
                    </td>
                    <td>
                        <input type="text" name="username">
                    </td>
                </tr>
                
                <tr>
                    <td>
                        New Password
                    </td>
                    <td>
                        <input type="password" name="newuserpassword" >
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Re-enter new Password
                    </td>
                    <td>
                        <input type="password" name="renewuserpassword" >
                    </td>
                </tr>

                <tr>
                    <td>

                    </td>
                    <td>
                        <input type="submit" value="Login">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
