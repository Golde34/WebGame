<%-- 
    Document   : game
    Created on : Jun 16, 2021, 11:04:04 PM
    Author     : dumyd
--%>

<%@page import="entity.Library"%>
<%@page import="model.DAOLibrary"%>
<%@page import="entity.User"%>
<%@page import="entity.Galery"%>
<%@page import="model.DAOGalery"%>
<%@page import="model.DBConnection"%>
<%@page import="entity.Category"%>
<%@page import="entity.Platform"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Company"%>
<%@page import="entity.Game"%>
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
        <style>
            .neondu{
                color: #fff;
                text-shadow: 0 0 20px #ff005b;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>     
        <%
            Game game = (Game) request.getAttribute("game");
            Company com = (Company) request.getAttribute("com");
            ArrayList<Platform> listPl = (ArrayList<Platform>) request.getAttribute("listPl");
            ArrayList<Category> listCa = (ArrayList<Category>) request.getAttribute("listCa");
            DBConnection dbCon = new DBConnection();
            DAOGalery daoGalery = new DAOGalery(dbCon);
            ArrayList<Galery> listGa = daoGalery.getGaleryById(game.getGid());
            ArrayList<Game> userLibrary = (ArrayList<Game>) request.getSession().getAttribute("Library");
            ArrayList<Game> userWishlist = (ArrayList<Game>) request.getSession().getAttribute("wishlist");
            String alMess = (String) request.getAttribute("alMess");
            boolean isOwned = false;
            boolean isFollowed = false;
            if (userLibrary != null) {
                for (int i = 0; i < userLibrary.size(); i++) {
                    if (game.getGid() == userLibrary.get(i).getGid()) {
                        isOwned = true;
                        break;
                    }
                }
            }
            if (userWishlist != null) {
                for (int i = 0; i < userWishlist.size(); i++) {
                    if (game.getGid() == userWishlist.get(i).getGid()) {
                        isFollowed = true;
                        break;
                    }
                }
            }
        %>
        <div class="details">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-5">
                        <% ArrayList<Galery> backgroundImage = daoGalery.getOneGaleryByType(listGa, "img-po");
                        %>
                        <img src="<%=backgroundImage.get(0).getLink().trim()%>" style="height:686.25px;width: 457.5px;"alt="">
                        <a  id="gameAdd" onclick="alert('Add to library sucessfull');"></a> 
                        <%if (alMess != null) {%>
                        <%=alMess%>
                        <%}%>
                        <br><br>
                        <%  if (isFollowed == true) { %>
                        <div class="button-platform" style="background-color: gray; border-radius: 15px; height: 50px;">
                            <h3 style="text-align: center; position: relative; top: 50%; transform: translateY(-50%); margin: 0; padding: 0;"  class="nk-feature-title">
                                <a href="GameControllerMap?service=deleteWishlist&gameID=<%=game.getGid()%>"><span class="fa fa-fas fa-plus"></span>   Following</a></h3>
                        </div>
                        <% } else { %>
                        <div class="button-platform" style="background-color: pink; border-radius: 15px; height: 50px;">
                            <h3 style="text-align: center; position: relative; top: 50%; transform: translateY(-50%); margin: 0; padding: 0;"  class="nk-feature-title">
                                <% User user = (User) session.getAttribute("currUser");
                                    if (user != null) {
                                %>
                                <a href="GameControllerMap?service=addWishlist&gameID=<%=game.getGid()%>"><span class="fa fa-fas fa-plus"></span>   Follow</a>
                                <%} else { %>
                                <a onclick="alert('You have to login to follow this product');"><span class="fa fa-fas fa-plus"></span>   Follow</a>           
                                <% } %>
                            </h3>
                        </div>
                        <%}%>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-7">
                        <div class="wrapper">
                            <header><%= game.getTitle()%></header>
                            <input type="radio" name="slider" checked id="des">
                            <input type="radio" name="slider" id="rate">
                            <input type="radio" name="slider" id="buy">
                            <nav>
                                <label for="des" class="des"><i class="fas fa-info-circle"></i>Description</label>
                                <label for="rate" class="rate"><i class="fas fa-star-half-alt"></i>Rate</label>
                                <label for="buy" class="buy"><i class="fas fa-shopping-cart"></i>Buy</label>
                                <div class="slider"></div>
                            </nav>
                            <section>
                                <div class="content content-1">
                                    <div class="title"></div>
                                    <br><br>
                                    <p>Version <%= game.getVersion()%></p>
                                    <p> Release Date <%= game.getReleaseDate()%></p>
                                    <p>Game from:<a href="#"> <%= com.getCoName()%></a></p>
                                    <p>Same company's game: </p>
                                    <% ArrayList<Game> listGaCo = (ArrayList<Game>) request.getAttribute("listGaCo");
                                        if (listGaCo.isEmpty()) {%> 
                                    <p> </p>
                                    <% } else {
                                        for (Game games : listGaCo) {
                                            if (games.getGid() != game.getGid()) {
                                    %>

                                    <p>+ <a href="GameControllerMap?service=getGame&gameID=<%=games.getGid()%>"> <%= games.getTitle()%> </a></p>
                                    <%   }
                                            }
                                        }%>
                                    <p> Status <%= game.getState()%></p>
                                    <p> Platform: <% for (Platform pl : listPl) {%><%= pl.getPlname()%> 
                                        <%}%>
                                    </p>
                                    <p> Category: <% for (Category c : listCa) {%><%= c.getCaName()%> 
                                        <%}%>
                                    </p>
                                    <p> Description: <%= game.getDescription()%></p>
                                </div>

                                <div class="content content-2">
                                    <br><br>
                                    <div class="box">

                                        <div class="chart" data-percent="<%= game.getRating()%>" data-bar-color="#23afe3" ><span class="percent" data-after="%"><%= game.getRating()%></p</span></div>
                                        <div class="comment">Based on 69 members rating</div>
                                    </div>
                                </div>

                                <div class="content content-3">
                                    <br><br>
                                    <div class="title">
                                        <p>Price:  <%= game.getPrice()%>$</p>
                                        <p>Status: Available</p>
                                        <% User user = (User) session.getAttribute("currUser");
                                            if (user != null) {
                                                if (game.getPrice() == 0) {%>
                                        <%if (isOwned) {%>
                                        <a href="#"><button type="button" class="btn btn-success">Owned</button></a>
                                        <%} else {%>
                                        <a href="CartControllerMap?service=AddToLibrary&gameId=<%=game.getGid()%>"><button type="button" class="btn btn-success">Add to library</button></a>
                                        <%} %>

                                        <a href="#" ><button type="button" class="btn btn-success">Topup</button></a>
                                        <%      } else {%>
                                        <a href="CartControllerMap?service=AddToCart&gameId=<%=game.getGid()%>"><button type="button" class="btn btn-success">Add to cart</button></a>
                                        <%}
                                        } else {
                                            if (game.getPrice() == 0) {
                                        %>
                                        <a onclick="alert('You have to login to buy this product');"><button type="button" class="btn btn-success">Add to library</button></a>
                                        <a onclick="alert('You have to login to topup this product');"><button type="button" class="btn btn-success">Topup</button></a>
                                        <%      } else {%>
                                        <a onclick="alert('You have to login to buy this product');"><button type="button" class="btn btn-success">Add to cart</button></a>                                        
                                        <%      }
                                            }%>
                                    </div>
                                </div>

                            </section>
                        </div>
                    </div>
                </div>

                <div class="trailer">
                    <div class="container-fluid">
                        <!--Slide starts here-->
                        <h1 class="neondu" data-text="Gameplay Trailer">Gameplay Trailer</h1>
                        <div class="row youtube">
                            <div class="row">
                                <div class="col-md-12 nopadding">
                                    <div id="carousel-example-generic1" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner" role="listbox">
                                            <div class="item active">
                                                <%  ArrayList<Galery> listGameGalerys = (ArrayList<Galery>) request.getAttribute("listGameGalery");%>
                                                <iframe width="1120" height="630" src="<%= listGameGalerys.get(0).getLink().trim()%>" title="YouTube video player"
                                                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>   
                                                </iframe>
                                                <br>
                                            </div>
                                            <%for (int i = 1; i < listGameGalerys.size(); i++) {%>
                                            <div class="item">
                                                <%if (listGameGalerys.get(i).getType().equalsIgnoreCase("vid-trailer") || listGameGalerys.get(i).getType().equalsIgnoreCase("vid-gp")) {%>
                                                <iframe width="1120" height="630" src="<%= listGameGalerys.get(i).getLink().trim()%>" title="YouTube video player"
                                                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>   
                                                </iframe>
                                                <%} else {%>
                                                <a href="#"><img style="width: 1500px; height: 600px; object-fit:cover" src="<%= listGameGalerys.get(i).getLink().trim()%>" alt="<%= listGameGalerys.get(i).getLink().trim()%>"></a>
                                                    <%}%>
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