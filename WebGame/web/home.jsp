<%-- 
    Document   : home
    Created on : Jun 13, 2021, 4:17:04 PM
    Author     : Admin
--%>

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
            ArrayList<Game> listGame = (ArrayList<Game>) request.getAttribute("listGame");
            if (listGame == null) {
                response.sendRedirect("GameControllerMap");
            } else {
            %>
            <div class="wrap">
                <jsp:include page="header.jsp"/>
                <div class="main">
                    <jsp:include page="menu.jsp"/>
                </div>
            </div>
    </body>
</html>
