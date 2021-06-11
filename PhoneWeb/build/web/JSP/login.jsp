<%-- 
    Document   : login
    Created on : Jun 9, 2021, 5:43:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .container {
                position: fixed;
                top: 20%;
                left: 4%;
                margin-top: 30px;
            }
            .logo {
                margin-top: 30px;
                margin-right: 50px;
            }
        </style>
    </head>
    <body>
        <%
            Object mess = request.getAttribute("mess");
            if (mess == null) {
                mess = "";
            }
        %>
        <div class="logo">
            <center><a href="ProductControllerMap"><img src="images/logo.png" alt=""/> </a></center>
        </div>
        <div class="container">
            <h2 class="text-center">LOGIN</h2><br>
            <form class="form-horizontal" method = "post" action="/PhoneWeb/CustomerControllerMap">
                <div class="form-group">
                    <label class="control-label col-sm-5" for="user">User Name</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="user" name="user" required>
                    </div>
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-5" for="password">Password</label>
                    <div class="col-sm-3">
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                </div>

                <div class="form-group">        
                    <div class="col-sm-offset-5 col-sm-4">
                        <button type="submit" class="btn btn-primary active ">Login</button>
                        <button type="reset" class="btn btn-primary active ">Reset</button>
                        <input type="hidden" name="service" value="login">
                    </div>
                </div>
                <div class="form-group">        
                    <label class="col-sm-offset-5 col-sm-4 text-danger" for="mes"><%= mess.toString() %></label>
                </div>
            </form>
        </div>

    </body>
</html>