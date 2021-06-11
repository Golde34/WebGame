
<%@page import="entity.Cart"%>
<%@page import="entity.Customer"%>
<%@page import="model.DAOProduct"%>
<%@page import="entity.Product"%>
<%@page import="model.DAOSupplier"%>
<%@page import="entity.Supplier"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Home Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href='//fonts.googleapis.com/css?family=Cabin+Condensed' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <%
            List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
            if (listProduct == null) {
                response.sendRedirect("ProductControllerMap");
            } else {
        %>
        <div class="wrap">
            <jsp:include page="header.jsp"/>
            <div class="main"> 
                <jsp:include page="menu.jsp"/> 
                <jsp:include page="content.jsp"/>
            </div>
        </div>
        <%}%>
    </body>
</html>