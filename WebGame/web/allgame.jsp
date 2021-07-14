<%-- 
    Document   : menu
    Created on : Jun 16, 2021, 8:38:24 AM
    Author     : dumyd
--%>

<%@page import="model.DAOPlatform"%>
<%@page import="entity.Platform"%>
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
        <link rel="shortcut icon" type="image/png" href="images/80jslogo.png">
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
                margin-top: 48px;
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
        </style>
    </head>
    <body>
        <%  DBConnection dbCon = new DBConnection();
            DAOGalery daoGalery = new DAOGalery(dbCon);
            DAOCategory daoCate = new DAOCategory(dbCon);
            ArrayList<Category> cateList = daoCate.getAllCategories();
            DAOPlatform daoPlat = new DAOPlatform(dbCon);
            ArrayList<Platform> platList = daoPlat.getAllPlatforms();
        %>
        <jsp:include page="header.jsp"/>   

        <%  ArrayList<Game> listGame = (ArrayList<Game>) request.getAttribute("listGame");  %>
        <div class="container page-content">
            <% if (listGame.isEmpty()) { %>
            <div class="col-md-8">
                <h1 class="neon1" data-text="BUY ZONE">Game Storage</h1>
                <h2 class="neon"> No Game Found</h2>
            </div>
            <div class="col-sm-12 col-md-2">
                <div class="btn-group" style="float:right">
                    <button type="button" class="btn btn-danger dropdown-toggle " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Search By Platform
                    </button>
                    <div class="dropdown-menu" style="background-color: #fff; text-align: center">
                        <% for (Platform p : platList) {%>
                        <a class="dropdown-item" href="ProductControllerMap?service=searchByPlat1&platID=<%=p.getPlId()%>">
                            <%=p.getPlname()%></a>
                            <% }%>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-2">
                <div class="btn-group" style="float:right">
                    <button type="button" class="btn btn-danger dropdown-toggle " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Search By Category
                    </button>
                    <div class="dropdown-menu" style="background-color: #fff; text-align: center">
                        <% for (Category x : cateList) {%>
                        <a class="dropdown-item"  href="ProductControllerMap?service=searchByCate1&cateID=<%=x.getCaId()%>"> <%= x.getCaName()%></a>
                        <% } %>
                    </div>
                </div>
            </div>
            <% } else {  %>
            <!--Popular Game-->
            <div class="container-fluid">
                <!--Slide starts here-->


                <!--Slick all game-->
                <div class="all-game-list" >


                    <div class="row " style="margin-bottom: 15px">
                        <div class="col-md-8">
                            <h1 class="neon1" data-text="BUY ZONE">Game Storage</h1>
                        </div>
                        <div class="col-sm-12 col-md-2">
                            <div class="btn-group" style="float:right">
                                <button type="button" class="btn btn-danger dropdown-toggle " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Search By Platform
                                </button>
                                <div class="dropdown-menu" style="background-color: #fff; text-align: center">
                                    <% for (Platform p : platList) {%>
                                    <a class="dropdown-item" href="ProductControllerMap?service=searchByPlat1&platID=<%=p.getPlId()%>">
                                        <%=p.getPlname()%></a>
                                        <% }%>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-2">
                            <div class="btn-group" style="float:right">
                                <button type="button" class="btn btn-danger dropdown-toggle " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Search By Category
                                </button>
                                <div class="dropdown-menu" style="background-color: #fff; text-align: center">
                                    <% for (Category x : cateList) {%>
                                    <a class="dropdown-item"  href="ProductControllerMap?service=searchByCate1&cateID=<%=x.getCaId()%>"> <%= x.getCaName()%></a>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                        <div class="head col-md-12">
                            <div class = "col-sm-12 col-md-3"><h4>Poster</h4></div>
                            <div class="col-sm-12 col-md-2"><h4>Title</h4></div>
                            <div class="col-sm-12 col-md-1"><h4>Price</h4></div>
                            <div class="col-sm-12 col-md-2"><h4>Version</h4></div>
                            <div class="col-sm-12 col-md-2"><h4>Release Date</h4></div>
                            <div class="col-sm-12 col-md-2"><h4>Details</h4></div></div>
                            <%
                                for (Game game : listGame) { %>
                            <%  ArrayList<Galery> gList2 = daoGalery.getGaleryByTypeId(game.getGid(), "img-bg");%>
                        <div class="col-sm-12 col-md-12" style="background-color: #232930; border: solid #000;">
                            <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                                <div class = "col-sm-12 col-md-3">             
                                    <img style="height: 115px;width: 220px"src="<%= gList2.get(0).getLink().trim()%>" alt=""></div></a>

                            <div class="col-sm-12 col-md-2 cc" id="getde1"><p ><%= game.getTitle()%></p></div>
                            <div class="col-sm-12 col-md-1 cg" id="getde"><p ><%= game.getPrice()%>$</p></div>
                            <div class="col-sm-12 col-md-2 cg" id="getde"><p ><%= game.getVersion()%></p></div>
                            <div class="col-sm-12 col-md-2 cg" id="getde"><p ><%= game.getReleaseDate()%></p></div>
                            <div class="col-sm-12 col-md-2 cg" id="getde"><a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                                    <button " type="button" class="btn btn-success">Details</button></a></div>

                        </div><%}%>


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
