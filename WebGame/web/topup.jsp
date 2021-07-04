<%-- 
    Document   : recharge
    Created on : Jun 27, 2021, 9:05:26 PM
    Author     : Duong
--%>

<%@page import="entity.User"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    User x = (User) request.getAttribute("currUser");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recharge page</title>
        <%--js,css--%>   
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/topup.css">
    </head>
    <body>
        <form action="UserControllerMap" method="POST">
            <input type="hidden" name ="service" value="checkwallet2">
            <div class="row">
                <div class="col-md-3">

                    <h2 class="text-center">Games Top Up</h2>

                    <label class="label control-label">Balance</label>
                    <div class="input-group">
                        <%=x.getWallet()%>
                    </div>

                    <label class="label control-label">Amount</label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span></span>
                        <input type="text" class="form-control" name="amount" 
                               placeholder="Amount of Money" >
                    </div>

                    <label class="label control-label">Phone number</label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-envelope"></span></span>
                        <input type="password" class="form-control" name="phone" 
                               placeholder="Your phone number" >
                    </div>


                    <label class="label control-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span></span>
                        <input type="password" class="form-control" name="pass" 
                               placeholder="Your password" >
                    </div>
                    <button type="reset" class="btn btn-info">Reset</button>
                    <button type="submit" class="btn btn-success">Top up</button>
                    <a href="index.jsp" ><button style="float: right" class="btn-danger" >
                      <i class="fas fa-sign-out-alt"></i></button> </a>

                </div>

            </div>
        </form>

        <!--JS-->                
        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/js/bootstrap.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    </body>
</html>
