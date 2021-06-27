<%-- 
    Document   : topup
    Created on : Jun 27, 2021, 9:05:26 PM
    Author     : Duong
--%>

<%@page import="entity.User"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%
        User x = (User) request.getAttribute("currUser");
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UserControllerMap" method="POST">
            <input type="hidden" name ="service" value="checkwallet">
            <table border="1">
                <tbody>
                    <tr>
                        <td>Balance</td>
                        <td><%=x.getWallet()%></td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td><input type="text" name="amount"></td>
                    </tr>
                    <tr>
                        <td>Phone number</td>
                        <td><input type="password" name="phone"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass"></td>
                    </tr>
                    <tr>
                        <td><button type="reset">Reset</button></td>
                        <td><button type="submit">Top up</button></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
