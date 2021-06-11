<%-- 
    Document   : register
    Created on : Jun 10, 2021, 7:03:49 PM
    Author     : Admin
--%>

<%@page import="entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>REGISTER</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style>
            .container {
                position: fixed;
                top: 20%;
                left: 4%;
                margin-top: 20px;
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
            String name = "", address = "", username = "", password = "", phone="";
            Customer cu = (Customer) request.getAttribute("customer");
            if (cu != null) {
                name = cu.getcName();
                address = cu.getAddress();
                username = cu.getUsername();
                password = cu.getPassword();
                phone = cu.getPhone();
            }
        %>
        <div class=""logo>
            <center><a href="/PhoneWeb/ProductControlerMap"><img src="/image/logo.png" alt=""></a></center>
        </div>
        <div class="container">
            <h2 class="text-center">REGISTER</h2><br>
            <form class="form-horizontal" method ="POST" action="/PhoneWeb/CustomerControllerMap">
                <div class="form-group">
                    <label class="control-label col-sm-5" for="name">Name</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="name" name="name" required value="<%=name%>">
                    </div>
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-5" for="address">Address</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="address" name="address" required value="<%=address%>">
                    </div>
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-5" for="phone">Phone</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="phone" name="phone" required value="<%=phone%>">
                    </div>
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-5" for="user">User Name</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="user" name="user" required value="<%=username%>">
                    </div>
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-5" for="password">Password</label>
                    <div class="col-sm-3">
                        <input type="password" class="form-control" id="password" name="password" required value="<%=password%>">
                    </div>
                    <span class="glyphicon glyphicon-exclamation-sign"></span>
                </div>

                <div class="form-group">        
                    <div class="col-sm-offset-5 col-sm-4">
                        <button type="submit" class="btn btn-primary active ">Register</button>
                        <button type="reset" class="btn btn-primary active ">Reset</button>
                        <input type="hidden" name="service" value="register">
                    </div>
                </div>

                <div class="form-group">        
                    <label class="col-sm-offset-5 col-sm-4 text-danger" for="mes"><%= mess.toString()%></label>
                </div>
            </form>
        </div>
    </body>
</html>
