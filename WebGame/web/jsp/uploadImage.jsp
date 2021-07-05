<%-- 
    Document   : uploadImage
    Created on : Jul 5, 2021, 4:15:24 PM
    Author     : Admin
--%>

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            User x = (User) request.getAttribute("currUser");
        %>
        <h1>Hello UploadImage!</h1>
        <p><%=x.getuId()%> and <%=x.getUsername()%></p>
        <form method="post" action="/WebGame/UserControllerMap?service=updateImage" enctype="multipart/form-data">
            <div class="form-group">
                <label>Photo</label> <br/>
                <input type="file" 
                       class="form-control" name="photo" placeholder="Enter photo">
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
            <button type="reset" class="btn btn-primary">Reset</button>   
        </form>
        <a href="index.jsp">Go to home</a>
    </body>
</html>
