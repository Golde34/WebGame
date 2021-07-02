<%-- 
    Document   : user
    Created on : Jun 24, 2021, 10:59:07 PM
    Author     : Duong
--%>

<%@page import="entity.Order"%>
<%@page import="entity.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--Css-->
        <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="css/stylehome.css">
        <link href="css/font-awesome.css" rel="stylesheet">
        <link href="${contextPath}/css/font-awesome.min.css" rel="stylesheet">
        <script src="js/Jquery.js"></script>
        <link rel="stylesheet" href="details.css">
        <link rel="stylesheet" href="css/slick.css">
        <style>.neondu{
                color: #fff;
                text-shadow: 0 0 20px #ff005b;
            }
            footer{
                position: relative;
                width: 100%;
                height: auto;
                padding: 50px 20%;
                background: #111;
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                font-family: Roboto;
                color: #fff;
                margin-top: auto;
            }
            footer .container{
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                flex-direction: row;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>  
        <%
            User x = (User) request.getAttribute("currUser");
            ArrayList<Game> listGame = (ArrayList<Game>) request.getAttribute("listGame");
            ArrayList<Order> listOrder = (ArrayList<Order>) request.getAttribute("listOrder");
        %>

        <div class="row" style="font-size: 150%; padding-bottom: 70px;">
            <div class="col-xs-12 col-sm-6 col-md-6" style="  margin-left: 50px; ">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user-edit"></i></button>
                    <ul class="dropdown-menu" style="background-color: white; border-radius: 10px;">
                        <li><div style="padding: 5%">
                                <h2><%=x.getuName()%></h2>
                                <a style="display: inline-block" href="UserControllerMap?service=edit">Edit</a>
                                <hr style="height:3px;color:gray;background-color:gray">
                                <p>Wallet: <%=x.getWallet()%><a href="UserControllerMap?service=topup"> Recharge</a></p>
                                <p>Address: <%=x.getuAddress()%></p> 
                                <p>Mail: <%=x.getuMail()%></p> 
                                <p>Phone: <%=x.getuPhone()%></p>
                            </div></li>
                    </ul>
                </div>

                <div style="background-color: white; border-radius: 10px; padding: 10px 10px 15px 35px;margin-top: 20px;">
                    <%if (listOrder.isEmpty()) {%> <p>No order yet</p> 
                    <%} else {%>
                    <p>History Transaction: </p>
                    <%for (Order o : listOrder) {%>
                    <p>+ <a href="UserControllerMap?service=vieworder&orderId=<%= o.getoId()%>"> Oder <%= o.getoId()%> </a></p>
                    <%}
                        }%>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-1"></div>
            <div class="col-xs-12 col-sm-6 col-md-5">
                <div style="background-color: white; border-radius: 10px; padding: 10px 10px 15px 35px;">
                    <%if (listGame.isEmpty()) {%> <p>No games bought yet </p> 
                    <%} else {%>
                    <p>Owned Game: </p>
                    <%for (Game game : listGame) {%>
                    <p>+ <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>"> <%= game.getTitle()%> </a></p>
                    <%}
                        }%>
                </div>

            </div>
        </div>


        <jsp:include page="footer.jsp"/> 

        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/jquery-2.2.4.min.js"></script>


    </body>
</html>
