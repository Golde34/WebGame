<%-- 
    Document   : cart
    Created on : Jun 10, 2021, 7:35:15 PM
    Author     : Admin
--%>

<%@page import="entity.Supplier"%>
<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
<%@page import="entity.Cart"%>
<%@page import="entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>CART</title>
        <script>
            $(function () {
                $('#products').slides({
                    preload: true,
                    preloadImage: 'img/loading.gif',
                    effect: 'slide, fade',
                    crossfade: true,
                    slideSpeed: 350,
                    fadeSpeed: 500,
                    generateNextPrev: true,
                    generatePagination: false
                });
            });
        </script>
    </head>
    <body>
        <%
            Customer user = (Customer) session.getAttribute("user");
            String username = user.getUsername();

            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>

        <div class="wrap">
            <div class="header">
                <div class="logo">
                    <a href="/PhoneWeb/ProductControllerMap"><img src="images/logo.png" alt=""/> </a>
                </div>
                <div class="header-right">
                    <div class="contact-info">
                        <ul>
                            <li>About me</li>
                            <li>Nguyễn Đồng Đức Việt - HE150938 </li>
                        </ul>
                    </div>
                    <div class="menu">
                        <ul class="nav">
                            <li class="active"><a href="/WebExample/ProductControllerMap" title="Home">Home</a></li>
                            <li><a href="/WebExample/JSP/cartList.jsp">Cart(<%= cart.countItem()%>)</a></li>
                            <li><a href="#">Welcome, <%=username%> !!</a></li>
                            <li><a href="/WebExample/CustomerControllerMap?service=checkout">Checkout</a></li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>

            <%
                Product sp = (Product) request.getAttribute("product");
            %>

            <div class="main">
                <div class="details">
                    <div class="product-detail">
                        <form action="/PhoneWeb/CartServletMap">
                            <div class="images_3_of_2">
                                <div id="container">
                                    <div id="products_example">
                                        <div id="products">
                                            <div class="slides_container">
                                                <ul style="display:inline-block; ">
                                                    <li><a href="#" target="_blank"><img src="/WebExample/images/<%=sp.getPicture()%>" alt=" " /></a> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="desc span_3_of_2" >
                                <div class="price">
                                    <h2><%= sp.getProName()%></h2> <br>
                                    <p>Price: <span>$<%=sp.getPrice()%></span></p>
                                </div>
                                <div class="available">
                                    <p>Available Options :</p>
                                    <ul>
                                        <li>Amount:
                                            <select id="amount" name="amount">
                                                <%
                                                    int quantity = Integer.parseInt(request.getAttribute("maxQuantity").toString());
                                                    for (int i = 1; i <= quantity; i++) {
                                                %>
                                                <option value="<%=i%>"><%=i%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </li>
                                    </ul>
                                </div>
                                <br>
                                <button type="submit" class="btnAdd" style="">Add to Cart</button>
                                <input type="hidden" name="command" value="plus">
                                <input type="hidden" name="sid" value="<%=sp.getProId()%>">
                            </div>     
                            <div class="clear"></div>
                        </form>
                    </div>
                            
                    <div class="product_desc">	
                        <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                            <ul class="resp-tabs-list">
                                <li class="resp-tab-item resp-tab-active" aria-controls="tab_item-0" role="tab">Product Description</li>
                                <div class="clear"></div>
                            </ul>
                            <div class="resp-tabs-container">
                                <h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span>Product Description</h2>
                                <div class="product-desc resp-tab-content resp-tab-content-active" style="display:block" aria-labelledby="tab_item-0">
                                    <p><%=sp.getDescription()%></p>					
                                </div>
                            </div>
                        </div>
                    </div>   
                                
                    <div class="content_bottom">
                        <div class="text-h1 top1 btm">
                            <h2>Lorem ipsum quis nostrud exercitation</h2>
                        </div>
                        <div class="div2">
                            <div id="mcts1">
                                <div class="w3l-img">
                                    <img src="/PhoneWeb/images/pic2.png" alt=""/>
                                </div>
                                <div class="w3l-img">
                                    <img src="/PhoneWeb/images/pic3.png" alt="" />
                                </div>	
                                <div class="w3l-img">
                                    <img src="/PhoneWeb/images/pic1.png" alt="" />
                                </div>
                                <div class="w3l-img">
                                    <img src="/PhoneWeb/images/pic2.png" alt=""/>
                                </div>
                                <div class="clear"></div>	
                            </div>
                        </div>
                    </div>       
                </div>
                                
                <div class="sidebar">
                    <div class="s-main">
                        <div class="s_hdr">
                            <h2>Manufacturer</h2>
                        </div>
                        <div class="text1-nav">
                            <ul>
                                <%
                                    List<Supplier> listManufacturer = (List<Supplier>) request.getAttribute("listHangSanXuat");
                                    for (Supplier h : listManufacturer) {
                                %>
                                <li><a href="/WebExample/ProductControllerMap?service=filter&hid=<%=h.getSupId()%>"><%= h.getSupName()%></a></li>
                                    <% }%>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>                
            </div>
    </body>
</html>
