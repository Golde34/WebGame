<%-- 
    Document   : user
    Created on : Jun 24, 2021, 10:59:07 PM
    Author     : Duong
--%>

<%@page import="model.DAOGalery"%>
<%@page import="entity.Galery"%>
<%@page import="model.DBConnection"%>
<%@page import="model.DAOUser"%>
<%@page import="java.sql.Date"%>
<%@page import="entity.Order"%>
<%@page import="entity.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="shortcut icon" type="image/png" href="images/80jslogo.png">
        <!--Css-->
        <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="css/profile.css">
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
            footer{
                position: relative;
                width: 100%;
                height: auto;
                padding: 50px 20%;
                background: #111;
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                font-family: Roboto;
                color: #fff;
                margin-top: auto;
            }
            footer .container{
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                flex-direction: row;
            }
            .tabs {
                display: flex;
                position: relative;
            }
            .tabs .line {
                position: absolute;
                left: 0;
                bottom: 0;
                width: 0;
                height: 6px;
                border-radius: 15px;
                background-color: #31b0d5;
                transition: all 0.2s ease;
            }
            .tab-item {
                min-width: 80px;
                padding: 16px 20px 11px 20px;
                font-size: 20px;
                text-align: center;
                color: black;
                background-color: #fff;
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;
                border-bottom: 5px solid transparent;
                opacity: 0.6;
                cursor: pointer;
                transition: all 0.5s ease;
            }
            .tab-icon {
                font-size: 24px;
                width: 32px;
                position: relative;
                top: 2px;
            }
            .tab-item:hover {
                opacity: 1;
                background-color: rgba(194, 53, 100, 0.05);
                border-color: rgba(194, 53, 100, 0.1);
            }
            .tab-item.active {
                opacity: 1;
            }
            .tab-content {
                padding: 28px 0;
            }
            .tab-pane {
                color: #333;
                display: none;
            }
            .tab-pane.active {
                display: block;
            }
            .tab-pane h2 {
                font-size: 24px;
                margin-bottom: 8px;
            }
            .container{
                height:150vh;
                background-color: #f0f2f5;
            }
            .skills {
                text-align: right;
                padding-top: 10px;
                padding-bottom: 10px;
                color: white;
            }
            .container-level {
                width: 100%;
                background-color: #ddd;
                border-radius: 15px;
            }
            .skills {
                background-color: #04AA6D; 
                color: black; height: 1px;
                border-radius: 15px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>  
        <%
            User x = (User) request.getSession().getAttribute("currUser");
            ArrayList<Game> listGame = (ArrayList<Game>) request.getAttribute("listGame");
            ArrayList<Order> listOrder = (ArrayList<Order>) request.getAttribute("listOrder");
            ArrayList<Game> whislist = (ArrayList<Game>) request.getAttribute("wishlistGame");
            ArrayList<Game> recentGame = (ArrayList<Game>) request.getAttribute("recentgames");

            DBConnection dbCon = new DBConnection();
            DAOUser daoUser = new DAOUser(dbCon);
            DAOGalery daoGalery = new DAOGalery(dbCon);

        %>
        <div class="main">
            <div class="background">
                <img style="height:350px;width: 3000px;object-fit: cover;"src="images/profileback.jpg">
            </div>
            <div class="container">
                <br>
                <div class="row" style="font-size: 150%; padding-bottom: 70px;">
                    <div class="col-xs-12 col-sm-6 col-md-2">
                        <div class="user-avatar avatar_large" style="background-color: #e2c147;width: 190px;height: 190px;">
                            <object style="border: solid #f0f2f5 white; border-radius: 15px; " class="avatar_lagre"
                                    data="upload/<%= x.getProfilePicture()%>" 
                                    alt="" width="190" height="190"></object>
                        </div>
                        <h2 style="font-family: Serif;">Lv <%= daoUser.getExp(x) / 1000%> </h2>
                        <div class="container-level">
                            <div class="skills" style="width: <%=(daoUser.getExp(x) % 1000) / 10%>%; ">
                            </div>
                        </div>
                            <br>
                            <a href="UserControllerMap?service=uploadImage"><button><i class="fas fa-camera"></i>Upload image</button></a>
                    </div>    
                    <div class="col-xs-12 col-sm-6 col-md-1"></div>       
                    <div class="col-xs-12 col-sm-6 col-md-9">
                        <!-- Tab items -->
                        <div class="tabs">
                            <div class="tab-item active">
                                <i class="fas fa-user-edit"></i>
                                Infor
                            </div>
                            <div class="tab-item">
                                <i class="fas fa-receipt"></i>
                                Orders
                            </div>
                            <div class="tab-item">
                                <i class="tab-icon fas fa-plus-circle"></i>
                                Lists
                            </div>
                            <div class="tab-item">
                                <i class="fas fa-bookmark"></i>
                                Wishlist
                            </div>
                            <div class="line"></div>
                        </div>

                        <!-- Tab content -->
                        <div class="tab-content">
                            <div class="tab-pane active">
                                <div>
                                    <h1 style="font-family: Time New Roman; display: inline-block"><%=x.getuName()%></h1>
                                    <a  href="UserControllerMap?service=edit"><button type="button" class="btn btn-danger " >Edit</button>
                                    </a>
                                    <hr style="height:3px;color:gray;background-color:gray">
                                    <p>Wallet: <%=x.getWallet()%> <a href="UserControllerMap?service=recharge"><button type="button" class="btn btn-info " >Recharge</button></a></p>
                                    <p>Address: <%=x.getuAddress()%></p> 
                                    <p>Mail: <%=x.getuMail()%></p> 
                                    <p>Phone: <%=x.getuPhone()%></p>
                                </div>
                                <hr>
                                <h1>Recent Games</h1>
                                <%if (recentGame != null) {
                                        for (Game g : recentGame) {%>
                                <%  ArrayList<Galery> gList2 = daoGalery.getGaleryByTypeId(g.getGid(), "img-bg");%>
                                <div class="cc col-md-12 " style="color:black;background: #ded9d9;padding: 15px; border-radius: 15px;margin-top: 15px;">                        
                                    <a href="GameControllerMap?service=getGame&gameID=<%=g.getGid()%>">
                                        <div class = "col-sm-12 col-md-4">             
                                            <img style="height: 115px;width: 220px"src="<%= gList2.get(0).getLink().trim()%>" alt=""></div></a>
                                    <div class="col-sm-12 col-md-8" ><p ><%= g.getTitle()%></p></div>
                                </div><%}
                                    }%>
                            </div>
                            <div class="tab-pane">
                                <div style="background-color: white; border-radius: 10px; padding: 10px 10px 15px 35px;margin-top: 20px;">
                                    <%if (listOrder.isEmpty()) {%> <p>No order yet</p> 
                                    <%} else {%>
                                    <p>History Transaction: </p>
                                    <%for (Order o : listOrder) {
                                            Date date = new Date(o.getOrderDate().getTime());
                                    %>
                                    <p>+ <a href="UserControllerMap?service=vieworder&orderId=<%= o.getoId()%>"><%=date%> (<%= o.getType() %>)</a></p>
                                    <%}
                                        }%>
                                </div>
                            </div>
                            <div class="tab-pane" id="library">
                                <div style="background-color: white; border-radius: 10px; padding: 10px 10px 15px 35px;">
                                    <%if (listGame.isEmpty()) {%> <p>No games bought yet </p> 
                                    <%} else {%>
                                    <p>Owned Game: </p>
                                    <%for (Game game : listGame) {%>
                                    <p>+ <a style="background-color: none" href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>"> <%= game.getTitle()%> </a></p>
                                    <%}
                                        }%>
                                </div>

                            </div>
                            <div class="tab-pane">
                                <div style="background-color: white; border-radius: 10px; padding: 10px 10px 15px 35px;">
                                    <%if (whislist.isEmpty()) {%> <p>No games in wishlist yet </p> 
                                    <%} else {%>
                                    <p>Wish List: </p>
                                    <%for (Game game : whislist) {%>
                                    <p>+ <a style="background-color: none" href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>"> <%= game.getTitle()%> </a></p>
                                    <%}
                                        }%>
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
            const $ = document.querySelector.bind(document);
            const $$ = document.querySelectorAll.bind(document);

            const tabs = $$(".tab-item");
            const panes = $$(".tab-pane");

            const tabActive = $(".tab-item.active");
            const line = $(".tabs .line");

            line.style.left = tabActive.offsetLeft + "px";
            line.style.width = tabActive.offsetWidth + "px";

            tabs.forEach((tab, index) => {
                const pane = panes[index];

                tab.onclick = function () {
                    $(".tab-item.active").classList.remove("active");
                    $(".tab-pane.active").classList.remove("active");

                    line.style.left = this.offsetLeft + "px";
                    line.style.width = this.offsetWidth + "px";

                    this.classList.add("active");
                    pane.classList.add("active");
                };
            });

        </script>
    </body>
</html>
