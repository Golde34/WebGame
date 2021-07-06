<%-- 
    Document   : register
    Created on : Jun 22, 2021, 9:53:47 PM
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
        <title>REGISTER</title>
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
            String displayname = "", address = "", username = "", password = "", phone = "", mail = "";
            User user = (User) request.getAttribute("user");
            if (user != null) {
                displayname = user.getuName();
                username = user.getUsername();
                address = user.getuAddress();
                password = user.getPass();
                phone = user.getuPhone();
                mail = user.getuMail();
            }
        %>
        <div class="container">
            <form action="/WebGame/UserControllerMap" method="POST">
                <div class="row">
                    <div class="col-md-5">

                        <h2 class="text-center">Sign up</h2>

                        <label class="label control-label">Display Name</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control" name="displayName" 
                                   placeholder="Your Name" required value="<%=displayname%>">
                        </div>

                        <label class="label control-label">Username</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control" name="username" 
                                   placeholder="Your username" required value="<%=username%>">
                        </div>

                        <label class="label control-label">E-mail</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-envelope"></span></span>
                            <input type="email" class="form-control" name="regMail" 
                                   placeholder="Your E-mail" required value="<%=mail%>">
                        </div>

                        <label class="label control-label">Phone</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-phone"></span></span>
                            <input id="mobile" type="text" class="form-control" name="regPhone" 
                                   placeholder="Your Phone" required value="<%=phone%>">
                            <span id='message1'></span>
                        </div>

                        <label class="label control-label">Address</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control" name="address" 
                                   placeholder="Your address" required value="<%=address%>">
                        </div>

                        <label class="label control-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span></span>
                            <input id="password" type="password" class="form-control" name="regPass" 
                                   placeholder="Password" required value="<%=password%>">
                        </div>

                        <label class="label control-label">Confirm Password</label>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span></span>
                            <input id="confirm_password" type="Password" class="form-control" name="confirm-password" 
                                   placeholder="Confirm your password" required value="<%=password%>">
                            <span id='message'></span>
                        </div>

                        <div class="input-group">
                            <button class="btn btn-default" type="submit">SIGN UP</button>
                            <button class="btn btn-default" type="reset">RESET</button>
                            <input type="hidden" name="service" value="register">
                        </div>

                        <div class="input-group">
                            <label class="text-danger" style="color: red;"><%= mess.toString()%></label>
                        </div>
                    </div>

                </div>
            </form>
        </div>   

        <!--JS-->                
        <script src="${contextPath}/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <!--Check phone number-->                
        <script type="text/javascript">
            $(document).ready(function () {
                $('body').on('keyup', function () {
                    var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
                    var mobile = $('#mobile').val();
                    if (mobile !== '') {
                        if (vnf_regex.test(mobile) == false || mobile.length != 10) {
                            $('#message1').html('The phone number is not valid.').css('color', 'red');
                        } else {
                            $('#message1').html('The phone number is valid.').css('color', 'green');
                        }
                    }
                });
            });
        </script>  

        <!--Check password-->
        <script>
            $('#password, #confirm_password').on('keyup', function () {
                if ($('#password').val() == $('#confirm_password').val()) {
                    $('#message').html('Matching').css('color', 'green');
                } else
                    $('#message').html('Not Matching').css('color', 'red');
            });
        </script>
    </body>
</html>
