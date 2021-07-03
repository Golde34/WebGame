<%-- 
    Document   : menu
    Created on : Jun 16, 2021, 8:38:24 AM
    Author     : dumyd
--%>

<%@page import="entity.User"%>
<%@page import="entity.Category"%>
<%@page import="model.DAOCategory"%>
<%@page import="entity.Galery"%>
<%@page import="model.DBConnection"%>
<%@page import="model.DAOGalery"%>
<%@page import="entity.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <!--Css-->
        <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <link href="css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/stylehome.css">
        <link href="${contextPath}/css/font-awesome.min.css" rel="stylesheet">
        <script src="js/Jquery.js"></script>
        <link rel="stylesheet" href="style.css">
        <style>
            @media only screen and (max-width: 988px){
                #getde2{
                    display: none;
                }
            }
            .row #getde p{
                color: #fff;
            }
            .row #getde1 p{
                color: #fff;
                font-size: 2vh;
            }.col-md-3{
                text-align: center;
            }
            .col-md-2{
                text-align: center;
            }
            .col-md-1{
                text-align: center;
            }
            h4{
                color: black;
                font-style: oblique;
            }
            .head{
                border: solid black;
                background-image: linear-gradient(to right, red,orange,violet); 
            }
            .cg{
                margin-top: 32px;
            }
            .cc{
                margin-top:20px;
            }
            .dropdown-item:hover{
                background-color:#f0f2f5;
            }
            html,body{
                height: 100%;margin:0;
            }
            .page-content{
                min-height: 100%;
                margin-bottom: -120px;
            }
            .page-content::after{
                content: "";
                display: block;
            }
            footer, .page-content::after{
                height: 120px;
            }
            .summary-cart{
                margin-top: 10px;
                background-color: white;
                border-radius: 20px;
                padding-top: 20px;
                font-weight: bold;
                padding-bottom: 30px;
            }
            .right{
                text-align: right;
                font-size: 20px;
                /*border: 1px solid green;*/
                padding: 10px 0px;
            }
            .left{
                text-align: left;
                font-size: 20px;
                /*                border: 1px solid green;*/
                padding: 10px 0px;
            }
            .checkout{
                height: 50px;
                width: 100%;
                border: 1px solid green;
                text-align: center;
                border-radius: 10px;
                font-size: 20px;
                background-color: lightgreen;
            }

        </style>
    </head>
    <body>

        <jsp:include page="header.jsp"/>   

        <%  ArrayList<Game> ShoppingCart = (ArrayList<Game>) session.getAttribute("ShoppingCart");
            String mess = (String) request.getAttribute("mess");
            String alMess = (String ) request.getAttribute("alMess");
            String messCheckOut = (String) request.getAttribute("messCheckOut");
            User x = (User) request.getSession().getAttribute("currUser");
        %>
        <div class="container page-content">
            <% if (alMess != null) { %> 
                <h4 class="neon" data-text="BUY ZONE"><%= alMess %></h4>
            <%}%>
            <% if (ShoppingCart.isEmpty()) { %>
            <%if (messCheckOut != null) {%>
            <h4 class="neon" data-text="BUY ZONE"><%= messCheckOut%></h4>
            <h4 class="neon" data-text="BUY ZONE"><a href="index.jsp" >Back to HomePage</a></h4>
            <%} else {%> 
            <h1 class="neon"> Your cart is empty</h1>
            <%}%>
            <% } else {  %>
            <!--Popular Game-->
            <div class="container-fluid">
                <!--Slide starts here-->
                <%  DBConnection dbCon = new DBConnection();
                    DAOGalery daoGalery = new DAOGalery(dbCon);
                    DAOCategory daoCate = new DAOCategory(dbCon);
                    Double SubTotal = 0.0;
                    for (Game elem : ShoppingCart) {
                        SubTotal += elem.getPrice();
                    }

                %>

                <!--Slick all game-->
                <div class="all-game-list" >

                    <div class="col-md-8">
                        <div class="row " style="margin-bottom: 15px">
                            <div class="col-md-12">
                                <h1 class="neon1" data-text="BUY ZONE">Shopping Cart</h1>
                                <%if (mess != null) {%>
                                <h4 class="neon1" data-text="BUY ZONE"><%= mess%></h4>
                                <%}%>
                            </div>

                            <div class="head col-md-12">
                                <div class = "col-sm-12 col-md-3"><h4>Poster</h4></div>
                                <div class="col-sm-12 col-md-2"><h4>Title</h4></div>
                                <div class="col-sm-12 col-md-1"><h4>Price</h4></div>
                                <div class="col-sm-12 col-md-2"><h4>Version</h4></div>
                                <div class="col-sm-12 col-md-2"><h4>Details</h4></div>
                                <div class="col-sm-12 col-md-2"><h4>Option</h4></div></div>
                                <%
                                    for (Game game : ShoppingCart) { %>
                                <%  ArrayList<Galery> gList2 = daoGalery.getGaleryByTypeId(game.getGid(), "img-bg");%>
                            <div class="col-sm-12 col-md-12" style="background-color: #232930; border: solid #000;">
                                <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                                    <div class = "col-sm-12 col-md-3">             
                                        <img style="height: 77px;width: 147px"src="<%= gList2.get(0).getLink().trim()%>" alt=""></div></a>

                                <div class="col-sm-12 col-md-2 cc" id="getde1"><p ><%= game.getTitle()%></p></div>
                                <div class="col-sm-12 col-md-1 cg" id="getde"><p ><%= game.getPrice()%>$</p></div>
                                <div class="col-sm-12 col-md-2 cg" id="getde"><p ><%= game.getVersion()%></p></div>

                                <div class="col-sm-12 col-md-2 cg" id="getde"><a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                                        <button  type="button" class="btn btn-success">Details</button></a></div>
                                <div class="col-sm-12 col-md-2 cg" id="getde"><a href="CartControllerMap?service=RemoveFromCart&gameId=<%=game.getGid()%>">
                                        <button style="background-color: red; color: white;" type="button" class="btn btn-success">Remove</button></a></div>

                            </div><%}%>


                        </div>    
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-sm-12 col-md-3 summary-cart" style="">
                        <p class="col-sm-12 left" >Summary</p>
                        <p class="col-sm-8 left" >Your Balance</p>     <p class="col-sm-4 right" >$<%=String.format("%.2f", x.getWallet())%></p>
                        <p class="col-sm-7 left" >Not enough?</p>     <p class="col-sm-5 right" ><a href="UserControllerMap?service=recharge">Recharge</a></p>
                        <p class="col-sm-12 left" ></p>
                        <p class="col-sm-12 left" ></p>
                        <p class="col-sm-12 " >______________________________</p>
                        <p class="col-sm-8 left" >Subtotal</p>     <p class="col-sm-4 right" >$<%=String.format("%.2f", SubTotal)%></p>
                        <p class="col-sm-8 left" >Estimated Tax</p><p class="col-sm-4 right" >$<%=String.format("%.2f", SubTotal * 0.1)%></p>
                        <p class="col-sm-12 " >_____________________________</p>
                        <p class="col-sm-8 left" >Total</p>        <p class="col-sm-4 right" >$<%=String.format("%.2f", SubTotal * 1.1)%></p>
                        <button class="col-sm-12 checkout"><a href="CartControllerMap?service=CheckOut">Check out</a></button>
                    </div>
                </div>
            </div><%}%>
        </div>

        <jsp:include page="footer.jsp"/>   
        <!--Jquery, JS-->

        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/jquery-2.2.4.min.js"></script>
    </body>
</html>
