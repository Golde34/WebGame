<%-- 
    Document   : footer
    Created on : Jun 24, 2021, 11:27:42 PM
    Author     : Admin
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
        <style>
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
        </style>
    </head>
    <body>
        <footer id="contact">

            <!--Bắt Đầu Nội Dung Giới Thiệu-->
            <div class="about">
                <h2>About Us</h2>
                <p>80% JS</p>
                <img src="images/FPT.jpg">
            </div>
            <!--Kết Thúc Nội Dung Giới Thiệu-->
            <!--Bắt Đầu Nội Dung Đường Dẫn-->
            <div class="links">
                <h2>Links</h2>
                <ul class="social-icon">
                    <li><a href="https://uni.fpt.edu.vn"><i class="fas fa-university"></i> WEB</a></li>
                    <li><a href="https://www.facebook.com/uni.fpt.edu.vn"><i class="fa fa-facebook"></i> FB</a></li>
                    <li><a href="https://www.youtube.com/c/FPTUniversityChanel/featured"><i class="fa fa-youtube"></i> YouTube</a></li>
                    <li><a href="https://www.instagram.com/fpt_university/"><i class="fa fa-instagram"></i> Instagram</a></li>

                </ul>
            </div>
            <!--Kết Thúc Nội Dung Đường Dẫn-->
            <!--Bắt Đâu Nội Dung Liên Hệ-->
            <div class="contact">
                <h2>Contact</h2>
                <ul class="info">
                    <li>
                        <span><i class="fa fa-map-marker"></i></span>
                        <span>FPT University<br />
                            Km29, ĐCT08, Thạch Hoà, Thạch Thất, Hà Nội</span>
                    </li>
                    <li>
                        <span><i class="fa fa-phone"></i></span>
                        <p><a href="#">+84 ...</a>
                            <br />
                            <a href="#">+84 ...</a></p>
                    </li>
                    <li>
                        <span><i class="fa fa-envelope"></i></span>
                        <p><a href="#">nani@fpt.edu.vn</a></p>
                    </li>

                </ul>
            </div>
            <!--Kết Thúc Nội Dung Liên Hệ-->

        </footer>


        <!--Jquery, JS-->

        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/style.js" type="text/javascript"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/slick.min.js"></script>

    </body>
</html>

