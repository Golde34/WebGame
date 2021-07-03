<%-- 
    Document   : menu
    Created on : Jun 16, 2021, 8:38:24 AM
    Author     : dumyd
--%>

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
        <title>Menu Page</title>
        <!--Css-->
        <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/stylehome.css">
        <link href="css/font-awesome.css" rel="stylesheet">
        <link href="${contextPath}/css/font-awesome.min.css" rel="stylesheet">
        <script src="js/Jquery.js"></script>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/slick.css">
    </head>
    <body>
        <%  ArrayList<Game> listGame = (ArrayList<Game>) request.getAttribute("listGame");
            ArrayList<Game> listHotGame = (ArrayList<Game>) request.getAttribute("listHotGame");
            ArrayList<Game> listNewGame = (ArrayList<Game>) request.getAttribute("listNewGame");
            ArrayList<Game> listFreeGame = (ArrayList<Game>) request.getAttribute("listFreeGame");
            String title = (String) request.getAttribute("title");
            if (title == null) {
                title = "ALL GAME";
            }
        %>
        <div class="container">
            <% if (listGame.isEmpty()) { %>
            <p> No game found </p>
            <h2> Games </h2>
            <% } else {  %>
            <!--Popular Game-->
            <div class="container-fluid">
                <!--Slide starts here-->
                <h1 class="neon" data-text="HOT GAMES">THE MOST FAVOURITE</h1>
                <div class="row">
                    <div class="col-md-12 nopadding">

                        <!--Bắt đầu slider-->
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->    
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                    <% for (int i = 1; i < listHotGame.size(); i++) {%>
                                <li data-target="#carousel-example-generic" data-slide-to="<%=i%>"></li> 
                                    <%
                                        }
                                    %>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <%  DBConnection dbCon = new DBConnection();
                                        DAOGalery daoGalery = new DAOGalery(dbCon);
                                        ArrayList<Galery> gList0 = daoGalery.getGaleryByTypeId(listHotGame.get(0).getGid(), "img-bg");%>
                                    <a href="GameControllerMap?service=getGame&gameID=<%=listHotGame.get(0).getGid()%>"><img style="width: 1500px; height: 600px; object-fit:cover" src="<%= gList0.get(0).getLink().trim()%>" alt="<%= gList0.get(0).getLink().trim()%>"></a>
                                    <br>
                                </div>
                                <%   for (int i = 1; i < listHotGame.size(); i++) { %> 
                                <%  ArrayList<Galery> gList = daoGalery.getGaleryByTypeId(listHotGame.get(i).getGid(), "img-bg");
                                %>

                                <div class="item">
                                    <a href="GameControllerMap?service=getGame&gameID=<%=listHotGame.get(i).getGid()%>"><img style="width: 1500px; height: 600px; object-fit:cover" src="<%= gList.get(0).getLink().trim()%>" alt="<%= gList.get(0).getLink().trim()%>"></a>
                                    <br>
                                </div>
                                <% } %>
                            </div>

                            <!-- Controls -->
                            <div class="control">
                                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Slick New game-->
                <div class="roll1" id="new">
                    <h1 class="neon1" data-text="BUY ZONE">NEW RELEASED</h1>
                    <div class="row slick">
                        <%
                            for (Game game : listNewGame) { %>
                        <%  ArrayList<Galery> gList3 = daoGalery.getGaleryByTypeId(game.getGid(), "img-po");
                        %>
                        <div class="col-md-12">
                            <!--1-->
                            <div class="slick-item">

                                <div class="box">
                                    <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                                        <img src="<%= gList3.get(0).getLink().trim()%>" alt=""></a>
                                    <p><%= game.getTitle()%></p>
                                    <div class="overlay">
                                        <div class="content">
                                            <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">Read More
                                                <br>
                                                <p style="font-size: 25px; color: red;"><%= game.getTitle()%></p>
                                            </a>
                                        </div>
                                    </div>
                                </div>   
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <div class="arrow-prev">
                        <i class="fas fa-arrow-circle-left"></i>
                    </div>
                    <div class="arrow-next">
                        <i class="fas fa-arrow-circle-right"></i>
                    </div>
                </div>

                <!--ListPlatForm-->
                <div class="row" id="listplat">
                    <div class="row vertical-gap ">
                        <div class="col-lg-4 box">
                            <div class="button-platform" style="background-color: #232930; border-radius: 15px; height: 80px;">
                                <h3 style="position: relative; top: 50%; transform: translateY(-50%); margin: 0; padding: 0;"  class="nk-feature-title neon1">
                                    <a href="ProductControllerMap?service=searchByPlat&platID=3&id=listplat"><span class="fa fa-fas fa-desktop"></span>   PC</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 box">
                            <div class="button-platform" style="background-color: #232930; border-radius: 15px; height: 80px;">
                                <h3 style="position: relative; top: 50%; transform: translateY(-50%); margin: 0; padding: 0;" class="nk-feature-title neon1">
                                    <a href="ProductControllerMap?service=searchByPlat&platID=1&id=listplat"><span class="fa fa-gamepad"></span>   PS4</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-4 box">
                            <div class="button-platform" style="background-color: #232930; border-radius: 15px; height: 80px;">
                                <h3 style="position: relative; top: 50%; transform: translateY(-50%); margin: 0; padding: 0;" class="nk-feature-title neon1">
                                    <a href="ProductControllerMap?service=searchByPlat&platID=2&id=listplat"><span class="fab fa-xbox"></span>   Xbox</a></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                </div> 
                <div class="roll2">
                    <h1 class="neon1" data-text="BUY ZONE"><%= title %></h1>
                    <div class="row slick2">
                        <%
                            for (Game game : listGame) { %>
                        <%  ArrayList<Galery> gList2 = daoGalery.getGaleryByTypeId(game.getGid(), "img-po");
                        %>
                        <div class="col-md-12">
                            <div class="slick-item">
                                <div class="box">
                                    <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">
                                        <img src="<%= gList2.get(0).getLink().trim()%>" alt=""></a>
                                    <p><%= game.getTitle()%></p>
                                    <div class="overlay">
                                        <div class="content">
                                            <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>">Read More</a>
                                        </div>
                                    </div>
                                </div>   
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <div class="arrow-prev2">
                        <i class="fas fa-arrow-circle-left"></i>
                    </div>
                    <div class="arrow-next2">
                        <i class="fas fa-arrow-circle-right"></i>
                    </div>
                </div>

                <!--Free Game-->
                <div class="roll" id="free">
                    <h1 class="neon1" data-text="BUY ZONE">FREE GAMES</h1>
                    <%   for (int i = 0; i < listFreeGame.size(); i+=6) { %> 
                    <%  ArrayList<Galery> gList5 = daoGalery.getGaleryByTypeId(listFreeGame.get(i).getGid(), "img-bg");
                        ArrayList<Galery> gList5_2 = daoGalery.getGaleryByTypeId(listFreeGame.get(i+1).getGid(), "img-bg");
                        ArrayList<Galery> gList5_3 = daoGalery.getGaleryByTypeId(listFreeGame.get(i+2).getGid(), "img-bg");
                        ArrayList<Galery> gList5_4 = daoGalery.getGaleryByTypeId(listFreeGame.get(i+3).getGid(), "img-bg");
                        ArrayList<Galery> gList5_5 = daoGalery.getGaleryByTypeId(listFreeGame.get(i+4).getGid(), "img-bg");
                        ArrayList<Galery> gList5_6 = daoGalery.getGaleryByTypeId(listFreeGame.get(i+5).getGid(), "img-bg");
                    %>
                    <div class="col-md-4 box">
                        <a href="GameControllerMap?service=getGame&gameID=<%=listFreeGame.get(i).getGid()%>">
                            <img style="width: 95%; height: 30vh; " 
                                 src="<%= gList5.get(0).getLink().trim()%>" alt="<%= gList5.get(0).getLink().trim()%>">
                        </a>

                        <p><%= listFreeGame.get(i).getTitle()%></p>
                    </div>
                    <div class="col-md-4 box">
                        <a href="GameControllerMap?service=getGame&gameID=<%=listFreeGame.get(i+1).getGid()%>">
                            <img style="width: 95%; height: 30vh; " 
                                 src="<%= gList5_2.get(0).getLink().trim()%>" alt="<%= gList5_2.get(0).getLink().trim()%>">
                        </a>

                        <p><%= listFreeGame.get(i+1).getTitle()%></p>
                    </div>
                    <div class="col-md-4 box">
                        <a href="GameControllerMap?service=getGame&gameID=<%=listFreeGame.get(i+2).getGid()%>">
                            <img style="width: 95%; height: 30vh; " 
                                 src="<%= gList5_3.get(0).getLink().trim()%>" alt="<%= gList5_3.get(0).getLink().trim()%>">
                        </a>

                        <p><%= listFreeGame.get(i+2).getTitle()%></p>
                    </div>
                    <div class="col-md-8 box">
                        <a href="GameControllerMap?service=getGame&gameID=<%=listFreeGame.get(i+3).getGid()%>">
                            <img style="width: 98%; height: 70vh; " 
                                 src="<%= gList5_4.get(0).getLink().trim()%>" alt="<%= gList5_4.get(0).getLink().trim()%>">
                        </a>

                        <p><%= listFreeGame.get(i+3).getTitle()%></p>
                    </div>
                    <div class="col-md-4 box">
                        <a href="GameControllerMap?service=getGame&gameID=<%=listFreeGame.get(i+4).getGid()%>">
                            <img style="width: 95%; height: 30vh; " 
                                 src="<%= gList5_5.get(0).getLink().trim()%>" alt="<%= gList5_5.get(0).getLink().trim()%>">
                        </a>

                        <p><%= listFreeGame.get(i+4).getTitle()%></p>
                    </div>
                    <div class="col-md-4 box">
                        <a href="GameControllerMap?service=getGame&gameID=<%=listFreeGame.get(i=5).getGid()%>">
                            <img style="width: 95%; height: 30vh; " 
                                 src="<%= gList5_6.get(0).getLink().trim()%>" alt="<%= gList5_6.get(0).getLink().trim()%>">
                        </a>

                        <p><%= listFreeGame.get(i=5).getTitle()%></p>
                    </div>
                    <% } %>
                    <br>
                </div>
            </div>
            <%}%>
        </div>
        
        <div class="container">
            <div class="container-fluid">
                <!--VIDEOs-->
                <!--Welcome content starts here-->
                <h1 class="neon2" data-text="POPULAR VIDEOS">TRAILER GAMES</h1>
                <div class="row youtube" id="trailer">
                    <div class="row">
                        <div class="col-md-12 nopadding">
                            <div id="carousel-example-generic1" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <div class="item active">
                                        <%
                                            DBConnection dbCon = new DBConnection();
                                            DAOGalery daoGalery = new DAOGalery(dbCon);
                                            ArrayList<Galery> gList4 = daoGalery.getTrailer();%>
                                        <iframe width="1120" height="630" src="<%= gList4.get(0).getLink().trim()%>" title="YouTube video player"
                                                frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>   
                                        </iframe>
                                        <br>
                                    </div>
                                    <%for (int i = 1; i < gList4.size(); i++) {%>
                                    <div class="item">

                                        <iframe width="1120" height="630" src="<%= gList4.get(i).getLink().trim()%>"
                                                title="YouTube video player" frameborder="0"
                                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                allowfullscreen></iframe>
                                    </div>
                                    <%    }%>
                                </div>

                                <div class="control">
                                    <a class="right carousel-control" href="#carousel-example-generic1" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
        <!--Jquery, JS-->
        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/style.js" type="text/javascript"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="${contextPath}/js/slick.min.js"></script>
    </body>
</html>
