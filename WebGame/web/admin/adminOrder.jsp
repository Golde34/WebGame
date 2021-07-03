<%-- 
    Document   : adminOrder
    Created on : Jul 3, 2021, 5:38:50 PM
    Author     : dumyd
--%>

<%@page import="entity.Galery"%>
<%@page import="java.sql.Date"%>
<%@page import="model.DAOGalery"%>
<%@page import="entity.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Order"%>
<%@page import="model.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin View-Order</title>
    </head>
    <body>  
        <%
            DBConnection dbCon = new DBConnection();
            Order order = (Order) request.getAttribute("order");
            ArrayList<Game> listGame = (ArrayList<Game>) request.getAttribute("listGame");
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
