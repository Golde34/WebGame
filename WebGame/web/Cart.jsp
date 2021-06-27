<%-- 
    Document   : Cart
    Created on : Jun 27, 2021, 4:30:39 PM
    Author     : Admin
--%>

<%@page import="entity.User"%>
<%@page import="entity.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<Game> ShoppingCart = (ArrayList<Game>) session.getAttribute("ShoppingCart");
            User user = (User) session.getAttribute("currUser");
            if (user == null) {%>
        <h1>You need to login first!</h1>
        <%} else {
                if (ShoppingCart.size() != 0) {
                    for (Game elem : ShoppingCart) {%>
        <h1><%= elem.getTitle()%></h1>

        <%
            }
        } else {
        %>
        <h1>You haven't shop yet </h1>
        <%}
            }%>
    </body>
</html>
