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
                <div style="background-color: white; border-radius: 10px; padding: 10px 10px 15px 35px;">
                    <h1>Hello User <%=x.getuName()%></h1>
                    <a href="UserControllerMap?service=edit">Edit information</a>
                    <hr style="height:3px;color:gray;background-color:gray">
                    <p><%=x.getuName()%> </p>
                    <p>Role: <%=x.getSystem_role()%></p>

                    <p>Wallet: <%=x.getWallet()%><a href="UserControllerMap?service=topup"> Nap tien</a></p>

                    <p>Information:<br>
                        Experience: <%=x.getExperience()%><br>
                        Address: <%=x.getuAddress()%> <br>
                        Mail: <%=x.getuMail()%> <br>
                        Phone: <%=x.getuPhone()%>
                    </p>
                </div>
                <div style="background-color: white; border-radius: 10px; padding: 10px 10px 15px 35px;margin-top: 20px;">
                    <%if (listOrder.isEmpty()) {%> <p>No order yet</p> 
                    <%} else {%>
                    <p>History Transaction: </p>
                    <%for (Order o : listOrder) {%>
                    <p>+ <a href="UserControllerMap?service=vieworder&orderId=<%= o.getoId()%>"> Order <%= o.getoId()%> </a></p>
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
        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/jquery-2.2.4.min.js"></script>
        <script src="js/jquery.appear.min.js"></script>
        <script src="js/jquery.easypiechart.min.js"></script>
        <script>
            $(function () {
                $('.chart').easyPieChart({
                    easing: 'easeOutElastic',
                    delay: 3000,
                    barColor: '#369670',
                    trackColor: '#fff',
                    scaleColor: false,
                    lineWidth: 10,
                    trackWidth: 21,
                    size: 110,
                    lineCap: 'round',

                });
            });

        </script>
    </body>
</html>
