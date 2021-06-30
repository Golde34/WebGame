<%-- 
    Document   : edit
    Created on : Jun 30, 2021, 1:01:23 PM
    Author     : Duong
--%>

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit profile</h1>
        <%
            User x = (User) request.getAttribute("currUser");
        %>
        <hr>
        <h3>Before </h3>
        <table border="1">
            <tbody>
                <tr>
                    <td>Name</td>
                    <td><%=x.getuName()%></td>
                </tr>
                <tr>
                    <td>Mail</td>
                    <td><%=x.getuMail()%></td>
                </tr>
                <tr>
                    <td>Phone number</td>
                    <td><%=x.getuPhone()%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=x.getuAddress()%></td>
                </tr>
            </tbody>
        </table>
                
        <hr>
        <h3>After </h3>       
        <form action="UserControllerMap" method="POST">
            <input type="hidden" name ="service" value="changeinfo">
            <table border="1">
                <tbody>
                    <tr>
                        <td>Name</td>
                        <td><textarea name="name" rows="2" cols="40"></textarea></td>
                    </tr>
                    <tr>
                        <td>Mail</td>
                        <td><textarea name="mail" rows="2" cols="40"></textarea></td>
                    </tr>
                    <tr>
                        <td>Phone number</td>
                        <td><textarea name="phone" rows="2" cols="40"></textarea></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><textarea name="address" rows="2" cols="40"></textarea></td>
                    </tr>
                    <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="pass"></td>
                </tr>
                    <tr>
                        <td><button type="reset">Reset</button></td>
                        <td><button type="submit">Change</button></td>
                    </tr>
                </tbody>
            </table>
        </form>
        
        

    </body>
</html>
