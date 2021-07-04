<%-- 
    Document   : login
    Created on : Jun 22, 2021, 2:51:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <!--CSS-->
        <link href="${contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="${contextPath}/jsp/login.css"type="text/css">
    </head>
    <body>    
        <%
            Object mess = request.getAttribute("mess");
            if (mess == null) {
                mess = "";
            }
        %>
        <div class="container">
            <form action="/WebGame/UserControllerMap" method="POST">
                <div class="row">
                    <div class="col-md-5">
                        <h1 class="text-center" style="color: white;">Login</h1>
                        <label class="label control-label">Username</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control" name="username" placeholder="">
                        </div>
                        <label class="label control-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span></span>
                            <input type="password" class="form-control" name="userpassword" placeholder="">
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <a href="${contextPath}/jsp/forgot.jsp"><p class="text-left">Forgot Password</p></a> 
                            </div>
                            <div class="col-md-6"><p class="text-right"><%= mess.toString()%></p></div>
                        </div>
                        <div class="input-group">
                            <button type="submit" class="btn btn-default">SIGN IN</button>
                            <input type="hidden" name="service" value="login">
                            <p class="text-center">Not register yet? <a href="${contextPath}/jsp/register.jsp">SIGN UP</a></p>
                        </div>
                    </div>
                </div>
            </form>
        </div>   
        <!--JS-->
        <script src="${contextPath}/js/bootstrap.js"></script>
    </body>
</html>
