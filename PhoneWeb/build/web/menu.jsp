<%-- 
    Document   : menu
    Created on : Jun 9, 2021, 10:56:21 AM
    Author     : Admin
--%>

<%@page import="entity.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href='//fonts.googleapis.com/css?family=Cabin+Condensed' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <%
            ArrayList<Supplier> listManufacturer = (ArrayList<Supplier>) request.getAttribute("listSupplier");
        %>
        <div class="sidebar">
            <br>
            <div class="s-main">
                <div class="s_hdr">
                    <h2>Manufacturer</h2>
                </div>
                <div class="text1-nav">
                    <ul>
                        <% for (Supplier s : listManufacturer) {
                        %>
                        <li><a href="ProductControllerMap?service=filter&supId=<%=s.getSupId()%>"><%= s.getSupName()%></a></li>
                            <%    }%>
                    </ul>
                </div>
            </div>
            <br><br>
            <form class="form-inline" action = "ProductControllerMap">
                <input type="text" id="pname" placeholder="Product Name... " name="pname">
                <button type="submit">Search</button>
                <input type="hidden" name="service" value="search">
            </form>
        </div>
    </body>
</html>
