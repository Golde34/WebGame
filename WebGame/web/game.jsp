<%-- 
    Document   : game
    Created on : Jun 16, 2021, 11:04:04 PM
    Author     : dumyd
--%>

<%@page import="model.DAOComment"%>
<%@page import="model.DAOUser"%>
<%@page import="entity.Comment"%>
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
        <title>Game Information</title>
        <link rel="shortcut icon" type="image/png" href="images/80jslogo.png">
        <!--Css-->
        <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/stylehome.css">
        <link href="css/font-awesome.css" rel="stylesheet">
        <link href="${contextPath}/css/font-awesome.min.css" rel="stylesheet">
        <script src="js/Jquery.js"></script>
        <link rel="stylesheet" href="details.css">
        <link rel="stylesheet" href="css/slick.css">
        <style>
            .display {
                height: 40px;
            }

            .comment_box{
                border: 1px white solid;
                border-radius: 20px;
                margin: 10px;
                padding: 10px;
                color: white;
                font-size: 18px;
                height: 120px;
                background-color: white;
            }

            .comment_content{
                border: 1px white;
                border-radius: 5px;
                background-color: white;
                color: black;
            }

            .container-level {
                background-color: #ddd;
                border-radius: 15px;
            }
            .skills {
                background-color: #04AA6D; 
                color: black; 
                height: 5px;
                border-radius: 15px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>     
        <%
            Game game = (Game) request.getAttribute("game");
            Company com = (Company) request.getAttribute("com");
            DBConnection dbCon = new DBConnection();
            DAOGalery daoGalery = new DAOGalery(dbCon);
            DAOLibrary daoLibrary = new DAOLibrary(dbCon);
            DAOUser daoUser = new DAOUser(dbCon);
            DAOComment dAOComment = new DAOComment(dbCon);
            ArrayList<Platform> listPl = (ArrayList<Platform>) request.getAttribute("listPl");
            ArrayList<Category> listCa = (ArrayList<Category>) request.getAttribute("listCa");
            ArrayList<Game> userLibrary = (ArrayList<Game>) request.getSession().getAttribute("Library");
            ArrayList<Game> userWishlist = (ArrayList<Game>) request.getSession().getAttribute("wishlist");
            ArrayList<Galery> listGa = daoGalery.getGaleryById(game.getGid());
            ArrayList<User> userOwned = daoLibrary.getOwnedByGame(game.getGid());
            ArrayList<User> userWantGame = daoLibrary.getWishlistByGame(game.getGid());
            ArrayList<Game> listGaCa = (ArrayList<Game>) request.getAttribute("listGaCa");
            ArrayList<Game> listGaPl = (ArrayList<Game>) request.getAttribute("listGaPl");

            ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comment");
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
                        <%  if (isFollowed == true && isOwned == false) {%>
                        <div class="button-platform" style="background-color: pink; border-radius: 15px; height: 50px;">
                            <h3 style="text-align: center; position: relative; top: 50%; transform: translateY(-50%); margin: 0; padding: 0;"  class="nk-feature-title">
                                <a href="GameControllerMap?service=deleteWishlist&gameID=<%=game.getGid()%>"><span class="fa fa-fas fa-plus"></span>   Following</a></h3>
                        </div>
                        <br>
                        <p class="col-md-7 " style="font-size: 20px; color: #23527c;"><span class="far fa-clock"></span>  Want: <%=userWantGame.size()%></p>
                        <p class="col-md-5 " style="font-size: 20px; color: #23527c;"><span class="fas fa-gamepad"></span>  Played: <%=userOwned.size()%></p>
                        <% } else if (isFollowed == false && isOwned == false) { %>
                        <div class="button-platform" style="background-color: #aace60; border-radius: 15px; height: 50px;">
                            <h3 style="text-align: center; position: relative; top: 50%; transform: translateY(-50%); margin: 0; padding: 0;"  class="nk-feature-title">
                                <% User user = (User) session.getAttribute("currUser");
                                    if (user != null) {
                                %>
                                <a style="color: white;" href="GameControllerMap?service=addWishlist&gameID=<%=game.getGid()%>"><span class="fa fa-fas fa-plus"></span>   Follow</a>
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
                                    <p>Release Date <%= game.getReleaseDate()%></p>
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
                                        <div class="container-level">
                                            <div class="skills" style="width: <%=game.getRating()%>%; "></div>
                                        </div>
                                        <br>
                                        <div class="comment">Based on <%=comments.size() + 1%> members rating</div>
                                    </div>
                                </div>

                                <div class="content content-3">
                                    <br><br>
                                    <div class="title">
                                        <p>Price:  <%= game.getPrice()%>$</p>
                                        <p>Status: Available</p>
                                        <% User user = (User) session.getAttribute("currUser");
                                            if (user != null) {
                                                if (isOwned) {%>
                                        <a href="#"><button type="button" class="btn btn-success">Owned</button></a>
                                        <a href="UserControllerMap?service=topup&gameId=<%=game.getGid()%>" ><button type="button" class="btn btn-success">Top up</button></a>
                                        <%} else {%>
                                        <%if (game.getPrice() == 0) {%>
                                        <a href="CartControllerMap?service=AddToLibrary&gameId=<%=game.getGid()%>"><button type="button" class="btn btn-success">Add to library</button></a>                 
                                        <%} else {%>
                                        <a href="CartControllerMap?service=AddToCart&gameId=<%=game.getGid()%>"><button type="button" class="btn btn-success">Add to cart</button></a>
                                        <%}%>
                                        <%}
                                        } else {
                                            if (game.getPrice() == 0) {
                                        %>
                                        <a onclick="alert('You have to login to buy this product');"><button type="button" class="btn btn-success">Add to library</button></a>
                                        <a onclick="alert('You have to login to top up this product');"><button type="button" class="btn btn-success">Top up</button></a>
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
                <!--Comments-->

                <h1 class="neondu col-lg-10">Comment</h1>
                <%   if (comments != null && !comments.isEmpty()) { %>

                <div class="col-md-12" style="background-color: pink ;height: 400px;border-radius: 20px;overflow: auto auto ">

                    <div class="col-md-1"></div>

                    <div class="col-md-10">
                        <%
                            for (Comment elem : comments) {
                        %>                   
                        <div class="comment_box">
                            <div class="col-md-6"><p class="comment_content">From: <%=daoUser.getUserById(elem.getuId()).getuName()%></p> </div>
                            <div class="col-md-1"> </div>
                            <div class="col-md-5"><p class="comment_content">Rating:<%=elem.getRating()%>/100</p> </div>
                            <div class="col-md-12"> 
                                <div style="border: 1px solid black; border-radius: 5px;padding: 10px;">
                                    <p class="comment_content " > <%=elem.getContent()%></p> 
                                </div> 
                            </div>
                        </div>
                        <% } %>
                    </div>

                    <div class="col-md-1"></div>

                </div>     
                <% } %>
                <!--Comment-->

                <%  
                        if (user!= null && !dAOComment.checkExistComment(game.getGid(), user.getuId())) {%>
                <div class="col-md-12" style="background-color: #aace60 ;height: 270px;border-radius: 20px;overflow: auto auto ">

                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <form action="GameControllerMap" >
                            <br>
                            <p style="color: black; font-size: 18px;">Your rating:
                                <input name="rating" type="number" min="0" max="100">  /100
                            </p>
                            <textarea name="content" style="overflow-y:scroll; width: 850px; height: 150px;
                                      border-radius: 10px;" placeholder="Enter your comment"></textarea>
                            <input type="hidden" name ="service" value="comment" >
                            <input type="hidden" name ="gameID" value="<%=game.getGid()%>" >
                            <input type="submit" value="Post">
                            <br>
                        </form>
                    </div>
                    <div class="col-md-1"></div>
                </div> 
                <%}
                    %>            
                <!--other comment-->
                <div>
                    <div class="col-lg-12" >
                        <h1 class="neondu col-lg-10">Recommend</h1>     
                        <a href="GameControllerMap?service=displayGaCa&gameID=<%=game.getGid()%>"
                           style="font-family: serif; font-size: 20px;">
                            <br><button class="col-lg-2 button-platform display" 
                                        style="background-color: pink; border-radius: 15px;">Display all</button>
                        </a>
                    </div>
                    <div class="roll2 col-lg-12">
                        <div class="row slick2">
                            <%
                                for (Game game1 : listGaPl) { %>
                            <%  ArrayList<Galery> gList2 = daoGalery.getGaleryByTypeId(game1.getGid(), "img-po");
                            %>
                            <div class="col-md-12">
                                <div class="slick-item">
                                    <div class="box">
                                        <a href="GameControllerMap?service=getGame&gameID=<%=game1.getGid()%>">
                                            <img src="<%= gList2.get(0).getLink().trim()%>" alt=""></a>
                                    </div>   
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <div class="arrow-prev2">
                        <i class="fas fa-arrow-circle-left"></i>
                    </div>
                    <div class="arrow-next2">
                        <i class="fas fa-arrow-circle-right"></i>
                    </div>
                </div>
                <div>
                    <div class="col-lg-12" >
                        <h1 class="neondu col-lg-10">Same Platform</h1>     
                        <a href="GameControllerMap?service=displayGaPl&gameID=<%=game.getGid()%>"
                           style="font-family: serif; font-size: 20px;">
                            <br><button class="col-lg-2 button-platform display" 
                                        style="background-color: pink; border-radius: 15px;">Display all</button>
                        </a>
                    </div>
                    <div class="roll col-lg-12">
                        <div class="row slick">
                            <%
                                for (Game game1 : listGaCa) { %>
                            <%  ArrayList<Galery> gList2 = daoGalery.getGaleryByTypeId(game1.getGid(), "img-po");
                            %>
                            <div class="col-md-12">
                                <div class="slick-item">
                                    <div class="box">
                                        <a href="GameControllerMap?service=getGame&gameID=<%=game1.getGid()%>">
                                            <img src="<%= gList2.get(0).getLink().trim()%>" alt=""></a>
                                    </div>   
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <div class="arrow-prev">
                        <i class="fas fa-arrow-circle-left"></i>
                    </div>
                    <div class="arrow-next">
                        <i class="fas fa-arrow-circle-right"></i>
                    </div>
                </div>
            </div>
        </div>



        <jsp:include page="footer.jsp"/> 
        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/jquery-2.2.4.min.js"></script>
        <script src="js/jquery.appear.min.js"></script>
        <script src="js/jquery.easypiechart.min.js"></script>
        <script src="js/style.js" type="text/javascript"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="${contextPath}/js/slick.min.js"></script>
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
                                                    lineCap: 'round'

                                                });
                                            });

        </script>
        <style>
            .neondu{
                color: #fff;
                text-shadow: 0 0 20px #ff005b;
            }
            .navbar-right{
                margin-right: 10px;
            }
            .navbar-inverse{
                background-color: black;
                padding: 20px;
                margin-top: 0 !important;
            }
            .navbar-right li{
                border-radius: 5%;
                background-color: indigo;
                margin: 5px;
            }
            .form-control{
                padding-right: 100px;
            }
            .slick-dots li{
                display: none;
            }
            .slick-item img{
                height: 345px;
                width: 255px;
                object-fit: cover;
                border-radius: 15px;
            }
            .arrow-prev{
                position: absolute;
                top: 238%;
                left: 14%;
            }
            .arrow-next{
                position: absolute;
                top: 238%;
                left: 83%;
            }
            .arrow-prev i{
                font-size: 50px;
                color: grey;
                display: block;
                width: 50px;
                height: 50px;
                text-align: center;
                line-height: 50px;
                cursor: pointer;

            }
            .arrow-next i{
                font-size: 50px;
                color: grey;
                display: block;
                width: 50px;
                height: 50px;
                text-align: center;
                line-height: 50px;
                cursor: pointer;

            }

            .arrow-prev2{
                position: absolute;
                top: 185%;
                left: 14%;
            }
            .arrow-next2{
                position: absolute;
                top: 185%;
                left: 83%;
            }
            .arrow-prev2 i{
                font-size: 50px;
                color: grey;
                display: block;
                width: 50px;
                height: 50px;
                text-align: center;
                line-height: 50px;
                cursor: pointer;

            }
            .arrow-next2 i{
                font-size: 50px;
                color: grey;
                display: block;
                width: 50px;
                height: 50px;
                text-align: center;
                line-height: 50px;
                cursor: pointer;

            }

            .slick-slider{
                padding-bottom: 50px;
            }

            @media only screen and (max-width: 1200px){
                .arrow-prev{
                    visibility: hidden;
                }
                .arrow-next{
                    visibility: hidden;
                }
            }

            .about img{
                height: 69px;
            }
            .arrow-next i:hover{
                color: #fff;
            }
            .arrow-prev i:hover{
                color: #fff;
            }
            .box p{
                font-family: 'Forum', cursive;
                text-align: center;
                color: #fff;
                font-size: 2em;
                font-weight: bold;
                font-variant: small-caps;
            }
            .slick-item .box {
                text-align: center;
            }
            .box a{
                font-size: 30px;
                display: block;
                text-align: center;
                padding: 10px;
                text-decoration: none;
                text-transform: uppercase;
                color: white;
                border:none;
            }
            .overlay{
                opacity: 0;

            }
            .box:hover img{
                opacity: 0.2;
            }
            .box:hover .overlay{
                opacity: 1;
            }


        </style>
    </body>
</html>