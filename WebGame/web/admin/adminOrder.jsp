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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<%  String message = (String) request.getAttribute("message");
    Order order = (Order) request.getAttribute("order");
    HashMap<OrderDetail, Game> orderLines = (HashMap<OrderDetail, Game>) request.getAttribute("orderLines");
    User user = (User) request.getAttribute("user");
    DAOGalery daoGalery = new DAOGalery(new DBConnection());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin View-Order</title>
        <link rel="shortcut icon" type="image/png" href="../images/80jslogo.png">
        <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <link href="css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/stylehome.css">
        <link href="${contextPath}/css/font-awesome.min.css" rel="stylesheet">
        <script src="js/Jquery.js"></script>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="header">
                    <a href="index.jsp" style="text-align:center; color:white;border-radius: 15px;height: 4em; width: 10em;" class="btn-danger">
                        <button class="btn btn-danger"><i class="fab fa-phoenix-squadron">Home</i></button> 
                    </a>
                    <a href="AdminControllerMap?service=HomeAdmin" style="text-align:center; color:white;border-radius: 15px;height: 4em; width: 10em;" class="btn-danger">
                        <button class="btn btn-danger"><i class="fab fa-phoenix-framework">Admin</i></button> 
                    </a>
  
        </div>  


        <%--Header--%>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: black;">
                <% if (!order.equals(null)) {%>
                <h1>Order ID <%=order.getoId()%></h1>
                <h2>User: <%=user.getUsername()%>; ID: <%=user.getuId()%></h2>
                 <h3>Order type: <%=order.getType()%></h3>
                <h3><%=message%></h3>
                <h3>Order date: <%=order.getOrderDate()%></h3>
                <%} else {%>
                    <h3><%=message%></h3>
                <%}%>
                <hr>
            </div>

            <div class="col-md-2"></div>
        </div>
        <%--Changes depends on the order type--%>
        <% if (!order.equals(null)) {
            if (order.getType().equalsIgnoreCase("buygame")) {
        %>
        <%--buygame --%>
        
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
                            <button type="button" class="btn btn-success">Details</button></a></div>
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
        <%} else if (order.getType().equalsIgnoreCase("recharge")) { %>
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
                            <button type="button" class="btn btn-success">Details</button></a></div>
                </div><%}%>
            </div>

            <div class="col-md-2"></div>
        </div>
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: black;">
                <div style="text-align: center;">
                    <hr>
                    <div class = "col-sm-12 col-md-4"><h4>Recharge into Account</h4></div>
                    <div class="col-sm-12 col-md-3"><h4>Total</h4></div>
                    <div class="col-sm-12 col-md-3"><h4><%=order.getTotal()%>$</h4></div>
                    <div class="col-sm-12 col-md-2"><h4></h4></div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
        <%}else if (order.getType().equalsIgnoreCase("topupwallet")) { %>
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
                            <button type="button" class="btn btn-success">Details</button></a></div>
                </div><%}%>
            </div>

            <div class="col-md-2"></div>
        </div>
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: black;">
                <div style="text-align: center;">
                    <hr>
                    <div class = "col-sm-12 col-md-4"><h4>Topup from wallet </h4></div>
                    <div class="col-sm-12 col-md-3"><h4>Total</h4></div>
                    <div class="col-sm-12 col-md-3"><h4><%=order.getTotal()%>$</h4></div>
                    <div class="col-sm-12 col-md-2"><h4></h4></div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
        <%} else if (order.getType().equalsIgnoreCase("topupother")) { %>
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
                            <button type="button" class="btn btn-success">Details</button></a></div>
                </div><%}%>
            </div>

            <div class="col-md-2"></div>
        </div>
            <div class="col-md-2"></div>
            <div class="col-md-8" style="color:white; background-color: black;">
                <div style="text-align: center;">
                    <hr>
                    <div class = "col-sm-12 col-md-4"><h4>Topup from other src</h4></div>
                    <div class="col-sm-12 col-md-3"><h4>Total</h4></div>
                    <div class="col-sm-12 col-md-3"><h4><%=order.getTotal()%>$</h4></div>
                    <div class="col-sm-12 col-md-2"><h4></h4></div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
        <%}}%>

        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/jquery-2.2.4.min.js"></script>
    </body>
</html>
