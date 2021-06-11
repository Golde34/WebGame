<%-- 
    Document   : header.jsp
    Created on : Jun 9, 2021, 10:54:20 AM
    Author     : Admin
--%>

<%@page import="entity.Cart"%>
<%@page import="entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href='//fonts.googleapis.com/css?family=Cabin+Condensed' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <%
            Customer user = (Customer) session.getAttribute("user");
            String loginOrChangePassword = "Login";
            String registerOrCheckout = "Register";
            String urlLogin = "JSP/login.jsp";
            String urlRegister = "JSP/register.jsp";
            if (user != null) {
                loginOrChangePassword = "Change Password";
                registerOrCheckout = "Check out";
                urlLogin = "JSP/changePassword.jsp";
                urlRegister = "CustomerControllerMap?service=checkout";
            }
            
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            %>
    <div class="header">
            <div class="logo">
                <a href="ProductControllerMap"><img src="images/logo.png" alt=""/> </a>

            </div>
            <div class="header-right">
                <div class="contact-info">
                    <ul>
                        <li>About me</li>
                        <li>Đồng Việt - HE150938</li>
                    </ul>
                </div>
                <div class="menu">
                    <ul class="nav">
                        <li class="active"><a href="ProductControllerMap" title="Home">Home</a></li>
                        <li>
                            <%
                                if (user != null) {
                            %>
                            <a href="JSP/cartList.jsp">Cart(<%=cart.countItem()%>)</a>
                            <% } else {%>
                            <a style="cursor: pointer" onclick="alert('You have to login !!');">Cart(<%=cart.countItem()%>)</a>
                            <% }%>
                        </li>
                        <%
                            if (user != null) {
                        %>
                                <li><a href="#">Welcome, <%=user.getUsername()%> !!</a></li>
                            <%}%>
                        <li><a href="<%=urlLogin%>"><%=loginOrChangePassword%></a></li>
                        <li><a href="<%=urlRegister%>"><%=registerOrCheckout%></a></li>
                        <div class="clear"></div>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </body>
</html>
