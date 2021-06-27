<%-- 
    Document   : menu
    Created on : Jun 16, 2021, 8:38:24 AM
    Author     : dumyd
--%>

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
        <title>All Game Page</title>
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
            }
            .row #getde2 p{
                color: #fff;
            }
            .accordion{
                background-color: #232930;
                color: #fff;
                cursor: pointer;
                padding: 18px;
                width: 100%;
            }
        </style>
    </head>
    <body>

        <jsp:include page="header.jsp"/>   
        <%  ArrayList<Game> listGame = (ArrayList<Game>) request.getAttribute("listGame");  %>
        <div class="container">
            <% if (listGame.isEmpty()) { %>
            <p> No game found </p>
            <h2> Games </h2>
            <% } else {  %>
            <!--Popular Game-->
            <div class="container-fluid">
                <!--Slide starts here-->
                <%  DBConnection dbCon = new DBConnection();
                    DAOGalery daoGalery = new DAOGalery(dbCon);
                    DAOCategory daoCate = new DAOCategory(dbCon);
                    ArrayList<Category> cateList = daoCate.getAllCategorys();%>

                <!--Slick all game-->
                <div class="all-game-list" >


                    <div class="row " style="margin-bottom: 15px">
                        <div class="col-md-8">
                            <h1 class="neon1" data-text="BUY ZONE">Game Storage</h1>
                        </div>
                        <div class="col-md-1"></div>
                        <div style=""class="col-sm-12 col-md-3">
                            <div class="btn-group">
                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Search By Category
                                </button>
                                <div class="dropdown-menu" style="background-color: #fff">
                                    <% for (Category x : cateList) {%>
                                <a class="dropdown-item" href="ProductControllerMap?service=searchByCate1&cateID=<%=x.getCaId()%>"> <%= x.getCaName()%></a>
                                <% } %>
                                </div>
                            </div>
                        </div>

                        <%
                            for (Game game : listGame) { %>
                        <%  ArrayList<Galery> gList2 = daoGalery.getGaleryByTypeId(game.getGid(), "img-bg");%>
                        <div class="col-sm-12 col-md-8" style="background-color: #232930">
                            <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                                <div class = "col-sm-12 col-md-4">             
                                    <img style="height: 115px;width: 220px"src="<%= gList2.get(0).getLink().trim()%>" alt=""></div></a>
                            <div class="col-sm-12 col-md-3" id="getde1"><p style=" align-items: center;margin-top: 10%"><%= game.getTitle()%></p></div>
                            <div class="col-sm-12 col-md-3" id="getde2"><p style=" text-align: center;margin-top: 30%"><%= game.getPrice()%>$</p></div>
                            <div class="col-sm-12 col-md-2" id="getde"><a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                                    <button style=" align-items: center;margin-top: 50%" type="button" class="btn btn-success">Details</button></a></div>

                        </div><%}%>


                    </div>    
                </div>
            </div><%}%>
        </div>

        <!--Jquery, JS-->
        <jsp:include page="footer.jsp"/> 
        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/jquery-2.2.4.min.js"></script>
    </body>
</html>
