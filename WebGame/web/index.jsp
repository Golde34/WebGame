<%-- 
    Document   : home
    Created on : Jun 13, 2021, 4:17:04 PM
    Author     : Admin
--%>

<%@page import="entity.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="shortcut icon" type="image/png" href="images/80jslogo.png">
        <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/stylehome.css">
        <link href="css/font-awesome.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <script src="js/Jquery.js"></script>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/slick.css">
    </head>
    <body>
        <%
            ArrayList<Game> listGame = (ArrayList<Game>) request.getAttribute("listGame");
            if (listGame == null) {
                response.sendRedirect("ProductControllerMap");
            } else {
        %>
        <div class="wrap">
            <jsp:include page="header.jsp"/>
            <div class="main">
                <jsp:include page="menu.jsp"/>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
        <%}%>
    </body>
</html>
