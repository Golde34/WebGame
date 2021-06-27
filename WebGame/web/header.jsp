<%-- 
    Document   : header
    Created on : Jun 16, 2021, 8:38:11 AM
    Author     : dumyd
--%>

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
        

    </head>
    <body>
        <!--Menu starts here-->
        <%
            User user = (User) session.getAttribute("currUser");
            String loginOrChangePassword = "  Login";
            String registerOrCheckout = "  Register";
            String urlLogin = "jsp/login.jsp";
            String urlRegister = "jsp/register.jsp";
            if (user != null) {
                loginOrChangePassword = "  Change Password";
                registerOrCheckout = "  Check out";
                urlLogin = "jsp/changepass.jsp";
                urlRegister = "UserControllerMap?service=logout";
            }

        %>

        <nav class="nav navbar" role="navigation">
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
                                <a class="dropdown-item" href="#"><span class="far fa-eye"></span> Reviews</a>
                                <a class="dropdown-item" href="#"><span class="fas fa-shipping-fast"></span> New
                                    Released</a>
                                <a class="dropdown-item" href="#"><span class="fas fa-chart-line"></span> Top Game</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle"
                                                         data-toggle="dropdown"><span class="fas fa-server"></span>
                                CATEGORY</a>
                            <div class="dropdown-menu">
                                <% for (Category x : cateList) {%>
                                <a class="dropdown-item" href="ProductControllerMap?service=searchByCate&cateID=<%=x.getCaId()%>"> <%= x.getCaName()%></a>
                                <% } %>
                            </div>
                        </li>
                        <li class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle"
                                                         data-toggle="dropdown"><span class="fas fa-hands-helping"></span> PLATFORM</a>
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

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<%=urlLogin%>"><span class="glyphicon glyphicon-log-in"></span><%=loginOrChangePassword%></a></li>
                        <li><a href="<%=urlRegister%>"><span class="glyphicon glyphicon-log-in"></span><%=registerOrCheckout%></a></li>
<!--                    If role is admin or owner-->
                        <%if (user != null && (user.getSystem_role().equalsIgnoreCase("owner")||user.getSystem_role().equalsIgnoreCase("admin"))) {%>
                        <li><a href="admin/admin_Index.jsp"><span class="glyphicon glyphicon-log-in"></span>   Admin Page</a></li>
                        <%}%>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

            </div>
        </nav>
        <!--Jquery, JS-->

        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/style.js" type="text/javascript"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/slick.min.js"></script>

    </body>
</html>

