<%-- 
    Document   : adminOrder
    Created on : Jul 3, 2021, 5:38:50 PM
    Author     : dumyd
--%>

<%@page import="entity.User"%>
<%@page import="java.util.HashMap"%>
<%@page import="entity.OrderDetail"%>
<%@page import="entity.Galery"%>
<%@page import="java.sql.Date"%>
<%@page import="model.DAOGalery"%>
<%@page import="entity.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Order"%>
<%@page import="model.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String message = (String) request.getAttribute("message");
    Order order = (Order )request.getAttribute("order");
    HashMap<OrderDetail, Game> orderLines = (HashMap<OrderDetail, Game>) request.getAttribute("orderLines");
    User user = (User) request.getAttribute("user");
    DAOGalery daoGalery = new DAOGalery(new DBConnection());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin View-Order</title>
    </head>
    <body>
        <div class="header" style="background: black;">
            <nav class="navbar navbar-light bg-dark">
                <div class="container-fluid" style="display: inline-block;">
                    <a style="background-color: red;padding: 4px 3px 4px 3px;color:white" class="navbar-brand" href="index.jsp">
                        Home
                    </a> 
                </div>  
                <div class="container-fluid" style="display: inline-block;">
                    <a style="background-color: red;padding: 4px 3px 4px 3px;color:white" class="navbar-brand" href="AdminControllerMap?service=HomeAdmin">
                        Admin Page
                    </a> 
                </div>  
            </nav>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: black;">
                <h1>Order ID <%=order.getoId()%></h1>
                <h2>User: <%=user.getUsername()%>; ID: <%=user.getuId()%></h2>
                <h3><%=message%></h3>
                <% if(!order.equals(null)) {%>
                <h3>Order date: <%=order.getOrderDate()%></h3>
                <%}%>
                <hr>
            </div>

            <div class="col-md-2"></div>
        </div>
        <% if(!order.equals(null)) {%>
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
                <%  ArrayList<Galery> galeryList = new ArrayList<Galery>();
                    for (HashMap.Entry<OrderDetail, Game> en : orderLines.entrySet()) {
                        OrderDetail key = en.getKey();
                        Game val = en.getValue();
                        galeryList = daoGalery.getGaleryByTypeId(val.getGid(), "img-bg");
                     %>
                <div class="col-sm-12 col-md-12" style="background-color: #232930; border: solid #000;text-align: center;">
                    <a href="GameControllerMap?service=getGame&gameID=<%=val.getGid()%>">
                        <div class = "col-sm-12 col-md-4">             
                            <img style="height: 115px;width: 220px"src="<%= galeryList.get(0).getLink().trim()%>" alt=""></div></a>         


                    <div class="col-sm-12 col-md-3" id="getde1"><p ><%= val.getTitle()%></p></div>
                    <div class="col-sm-12 col-md-3" id="getde"><p ><%= key.getPrice()%>$</p></div>
                    <div class="col-sm-12 col-md-2" id="getde"><a href="GameControllerMap?service=getGame&gameID=<%=val.getGid()%>">
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
                    <div class="col-sm-12 col-md-3"><h4><%=order.getTotal()%>$</h4></div>
                    <div class="col-sm-12 col-md-2"><h4></h4></div>
                </div>
            </div>

            <div class="col-md-2"></div>
        </div>
        <%}%>

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
