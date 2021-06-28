<%-- 
    Document   : header
    Created on : Jun 16, 2021, 8:38:11 AM
    Author     : dumyd
--%>

<%@page import="entity.Game"%>
<%@page import="entity.User"%>
<%@page import="sun.net.www.content.text.plain"%>
<%@page import="model.DAOPlatform"%>
<%@page import="entity.Platform"%>
<%@page import="entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DBConnection"%>
<%@page import="model.DAOCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<%
    DBConnection dbCon = new DBConnection();
    DAOCategory daoCate = new DAOCategory(dbCon);
    ArrayList<Category> cateList = daoCate.getAllCategorys();
    DAOPlatform daoPlat = new DAOPlatform(dbCon);
    ArrayList<Platform> platList = daoPlat.getAllPlatforms();
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>WEB GAME</title>
        <!--Css-->
        <style>
            #qty {
                position: absolute;
                right: 0px;
                top: -10px;
                width: 20px;
                height: 20px;
                line-height: 20px;
                text-align: center;
                border-radius: 50%;
                font-size: 10px;
                color: #FFF;
                background-color: #D10024;
            }

        </style>
    </head>
    <body>
        <!--Menu starts here-->
        <%
            User user = (User) session.getAttribute("currUser");
            ArrayList<Game> ShoppingCart = (ArrayList<Game>) session.getAttribute("ShoppingCart");
            
            int size = 0;
            if(ShoppingCart != null){
                size = ShoppingCart.size();
            }
            String logHead = "  Sign in";
            String loginOrChangePassword = "  Login";
            String registerOrCheckout = "  Register";
            String urlLogin = "jsp/login.jsp";
            String urlRegister = "jsp/register.jsp";
            if (user != null) {
                logHead = "  Profile";
                loginOrChangePassword = "  Change Password";
                registerOrCheckout = "  Check out";
                urlLogin = "jsp/changepass.jsp";
                urlRegister = "UserControllerMap?service=logout";
            }

        %>

        <nav class="nav navbar navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar" style="background: #333dcc"></span>
                        <span class="icon-bar" style="background: #333dcc"></span>
                        <span class="icon-bar" style="background: #333dcc"></span>
                    </button>
                </div>
                <div class="navbar navbar-inverse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">HOME</a></li>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
                                                         data-toggle="dropdown">
                                <span class="fa fa-gamepad"></span> GAMES</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#new"><span class="fas fa-shipping-fast"></span> New
                                    Released</a>
                                <a class="dropdown-item" href="#listplat"><span class="fas fa-chart-line"></span> Platform Game</a>
                                <a class="dropdown-item" href="#trailer"><span class="far fa-eye"></span> Trailer Game</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle"
                                                         data-toggle="dropdown"><span class="fas fa-server"></span>
                                CATEGORY</a>
                            <div class="dropdown-menu">
                                <% for (Category x : cateList) {%>
                                <a class="dropdown-item" href="ProductControllerMap?service=searchByCate1&cateID=<%=x.getCaId()%>"> <%= x.getCaName()%></a>
                                <% } %>
                            </div>
                        </li>
                        <li class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle"
                                                         data-toggle="dropdown"><span class="fas fa-dice-d20"></span> PLATFORM</a>
                            <div class="dropdown-menu">
                                <% for (Platform p : platList) {%>
                                <a class="dropdown-item" href="ProductControllerMap?service=searchByPlat&platID=<%=p.getPlId()%>"> <%= p.getPlname()%></a>
                                <% }%>
                            </div>
                        </li>
                    </ul>
                    <form action = "ProductControllerMap" class="navbar-form">
                        <div class="form-group">
                            <input  class="form-control" type="text" id="gameName" placeholder="Product Name... " name="gameName">
                            <button type="submit" class="btn btn-primary glyphicon glyphicon-search"></button>
                            <input type="hidden" name="service" value="searchByName">
                        </div>
                    </form>
                    <ul class="nav navbar-nav">
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
                                                         data-toggle="dropdown">
                                <span class="fas fa-hands-helping"></span> HELP</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#"><span class="fas fa-info-circle"></span> About us</a>
                                <a class="dropdown-item" href="#"><span class="fas fa-envelope"></span> Contact</a>

                            </div>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <%if(user != null){ %>
                            <a style="text-align: center;" class="glyphicon" href="Cart.jsp">
                                <i  class="fa fa-shopping-cart"></i>
                                <div id="qty"> <%=size %> </div>
                            </a>
                            <%} else {%>
                            <a style="text-align: center;" class="glyphicon" onclick="alert('You have to login first');">
                                <i  class="fa fa-shopping-cart"></i>
                                <div id="qty"> <%=size %> </div>
                            </a>
                            <%}%>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-th-list"></span><%= logHead %></a>
                            <div class="dropdown-menu">
                                
                                <a href="<%=urlLogin%>"><span class="glyphicon glyphicon-log-in"></span><%=loginOrChangePassword%></a>
                                <!--                    If role is admin or owner-->
                                <%if (user != null && (user.getSystem_role().equalsIgnoreCase("owner") || user.getSystem_role().equalsIgnoreCase("admin"))) {%>
                                <a href="AdminControllerMap"><span class="glyphicon glyphicon-log-in"></span>   Admin Page</a>
                                <%} if (user != null && user.getSystem_role().equalsIgnoreCase("user")) {%>
                                <a href="UserControllerMap?service=info"><span class="glyphicon glyphicon-log-in"></span>   About Me</a>
                                <%}%>
                                <a href="<%=urlRegister%>"><span class="glyphicon glyphicon-log-in"></span><%=registerOrCheckout%></a>  
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

            </div>
        </nav>
                    <br><br><br><br><br><br>
        <!--Jquery, JS-->

        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/style.js" type="text/javascript"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/slick.min.js"></script>
        
    </body>
</html>

