<%-- 
    Document   : order
    Created on : Jun 29, 2021, 9:57:25 PM
    Author     : Duong
--%>

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
            DBConnection dbCon = new DBConnection();
            Order order = (Order) request.getAttribute("order");
            ArrayList<Game> listG = (ArrayList<Game>) request.getAttribute("listG");
            DAOGalery daoGalery = new DAOGalery(dbCon);
        %>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: black;">
                <h1>Order</h1>
                <%Date date = new Date(order.getOrderDate().getTime());%>
                <h3>Order date: <%=date%></h3>
                <hr>
            </div>

            <div class="col-md-2"></div>
        </div>

        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: black;">
                <h1>Details</h1>
                <div style="text-align: center;">
                    <div class = "col-sm-12 col-md-4"><h4>Game</h4></div>
                    <div class="col-sm-12 col-md-3"><h4>Title</h4></div>
                    <div class="col-sm-12 col-md-3"><h4>Price</h4></div>
                    <div class="col-sm-12 col-md-2"><h4>Details</h4></div>
                </div>
                <%
                    for (Game game : listG) { %>
                <%  ArrayList<Galery> gList2 = daoGalery.getGaleryByTypeId(game.getGid(), "img-bg");%>
                <div class="col-sm-12 col-md-12" style="background-color: #232930; border: solid #000;text-align: center;">
                    <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                        <div class = "col-sm-12 col-md-4">             
                            <img style="height: 115px;width: 220px"src="<%= gList2.get(0).getLink().trim()%>" alt=""></div></a>         


                    <div class="col-sm-12 col-md-3" id="getde1"><p ><%= game.getTitle()%></p></div>
                    <div class="col-sm-12 col-md-3" id="getde"><p ><%= game.getPrice()%>$</p></div>
                    <div class="col-sm-12 col-md-2" id="getde"><a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                            <button type="button">Details</button></a></div>

                </div><%}%>
            </div>

            <div class="col-md-2"></div>
        </div>        

        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: black;">
                <div style="text-align: center;">
                    <hr>
                    <div class = "col-sm-12 col-md-4"><h4></h4></div>
                    <div class="col-sm-12 col-md-3"><h4>Total</h4></div>
                    <div class="col-sm-12 col-md-3"><h4><%= order.getTotal()%>$</h4></div>
                    <div class="col-sm-12 col-md-2"><h4></h4></div>
                </div>
            </div>

            <div class="col-md-2"></div>
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
