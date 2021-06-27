<%-- 
    Document   : changepasss
    Created on : Jun 23, 2021, 8:15:49 PM
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
        <title>CHANGE PASSWORD</title>
        <!--CSS-->
        <link href="${contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="${contextPath}/jsp/login.css"type="text/css">
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("currUser");
            Object mess = request.getAttribute("mess");
            if (mess == null) {
                mess = "";
            }
        %>
        <div class="container">
            <form action="/WebGame/UserControllerMap" method="POST">
                <div class="row">
                    <div class="col-md-5">
                        <h2 class="text-center">Change Password</h2>

                        <label class="label control-label">Name</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span></span>
                            <input style="background: #FFF;color:black;"type="text" class="form-control" name="user" 
                                   placeholder="Your Name" readonly value="<%=user.getUsername()%>">
                        </div>

                        <label class="label control-label">Old Password</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span></span>
                            <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
                        </div>

                        <label class="label control-label">New Password</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span></span>
                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>                    </div>

                        <label class="label control-label">Confirm Password</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span></span>
                            <input id="confirm_password" type="Password" class="form-control" name="confirm-password" 
                                   placeholder="Confirm your password" required>
                            <span id='message'></span>
                        </div>

                        <div class="input-group">
                            <button class="btn btn-default" type="submit">Change Password</button>
                            <button class="btn btn-default" type="reset">RESET</button>
                            <input type="hidden" name="service" value="changepass">
                        </div>

                        <div class="input-group">
                            <label class="text-danger"><%= mess.toString()%></label>
                        </div>
                    </div>

                </div>
            </form>
        </div>   

        <!--JS-->                
        <script src="${contextPath}/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>           

        <!--Check password-->
        <script>
            $('#newPassword, #confirm_password').on('keyup', function () {
                if ($('#newPassword').val() == $('#confirm_password').val()) {
                    $('#message').html('Matching').css('color', 'green');
                } else
                    $('#message').html('Not Matching').css('color', 'red');
            });
        </script>
    </body>
</html>
