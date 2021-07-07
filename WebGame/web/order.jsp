<%-- 
    Document   : order
    Created on : Jun 29, 2021, 9:57:25 PM
    Author     : Duong
--%>

<%@page import="model.DAOGame"%>
<%@page import="entity.OrderDetail"%>
<%@page import="java.sql.Date"%>
<%@page import="model.DBConnection"%>
<%@page import="entity.Galery"%>
<%@page import="entity.Order"%>
<%@page import="entity.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAOGalery"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Information</title>
        <!--Css-->
        <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <link href="css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/stylehome.css">
        <link href="${contextPath}/css/font-awesome.min.css" rel="stylesheet">
        <script src="js/Jquery.js"></script>
        <link rel="stylesheet" href="style.css">
        <style>
            .neon1{color: #fff;text-shadow: 0 0 20px #ff005b;}
            .neon2{color: #fff;text-shadow: 0 0 20px blue;}
            .head{
                border: solid black;
                background-image: linear-gradient(to right, #f80c12,#ee1100,#ff3311,#ff4422,#ff6644,#ff9933,#feae2d,#ccbb33,#d0c310,#aacc22,#69d025,#22ccaa,#12bdb9,#11aabb,#4444dd,#3311bb,#3b0cbd,#442299); 
            }
            h4{
                color: black;
                font-style: oblique;
            }
            p {
                color: black;
                font-size: 20px;
            }
            
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>   
        <%
            DBConnection dbCon = new DBConnection();
            Order order = (Order) request.getAttribute("order");
            ArrayList<Game> listG = (ArrayList<Game>) request.getAttribute("listG");
            DAOGalery daoGalery = new DAOGalery(dbCon);
            DAOGame daoGame = new DAOGame(dbCon);
        %>
        <br><br><br><br><br>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: #3c3f41;">
                <h1 class="neon1">Order</h1>
                <%Date date = new Date(order.getOrderDate().getTime());%>
                <h3>Order date: <%=date%></h3>
                <hr>
            </div>

            <div class="col-md-2"></div>
        </div>

        <%if (order.getType().equals("buygame")) {%> 

        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: #3c3f41;">
                <h1 class="neon2">Details</h1>
                <div style="text-align: center;" class="head col-md-12">
                    <div class = "col-sm-12 col-md-4"><h4>Game</h4></div>
                    <div class="col-sm-12 col-md-3"><h4>Title</h4></div>
                    <div class="col-sm-12 col-md-3"><h4>Price</h4></div>
                    <div class="col-sm-12 col-md-2"><h4>Details</h4></div>
                </div>
                <%
                    for (Game game : listG) {
                        ArrayList<Galery> gList2 = daoGalery.getGaleryByTypeId(game.getGid(), "img-bg");%>
                <div class="col-sm-12 col-md-12" style="background-color: #ded9d9; border: solid #000;text-align: center;">
                    <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                        <div class = "col-sm-12 col-md-4">             
                            <img style="height: 115px;width: 220px"src="<%= gList2.get(0).getLink().trim()%>" alt=""></div></a>         
                    <div class="col-sm-12 col-md-3 cc" id="getde1"><p ><%= game.getTitle()%></p></div>
                    <div class="col-sm-12 col-md-3 cg" id="getde"><p ><%= game.getPrice()%>$</p></div>
                    <div class="col-sm-12 col-md-2 cg" id="getde">
                        <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                            <button type="button" class="btn btn-success">Details</button>
                        </a>
                    </div>

                </div><%}%>
            </div>

            <div class="col-md-2"></div>
        </div>        
        <%} else if (order.getType().equals("recharge")) {%>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: #3c3f41;">
                <h2>Recharge Wallet</h2>
            </div>
            <div class="col-md-2"></div>
        </div>

        <%} else {%>
        <%
            OrderDetail od = (OrderDetail) request.getAttribute("od");
            Game game = daoGame.getGameById(od.getgId());
        %>
        <div>
            <h2>Top Up From <% if (order.getType().equals("topupwallet")) {%> Wallet  <%} else {%> Other<%}%>
            </h2>
            <p>Game: <%=game.getTitle()%></p>
        </div>

        <%}%>

        <div class="row total">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color: white;background-color: #3c3f41;">
                <div style="text-align: center;">
                    <hr>
                    <div class = "col-sm-12 col-md-4"><h4></h4></div>
                    <div class="col-sm-12 col-md-3"><h3>Total</h3>(included tax)</div>
                    <div class="col-sm-12 col-md-3"><h3><%= order.getTotal()%>$</h3></div>
                    <div class="col-sm-12 col-md-2"><h4></h4></div>
                </div>
            </div>

            <div class="col-md-2"></div>
        </div>
        <br><br><br><br><br><br>


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
