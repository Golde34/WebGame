<%-- 
    Document   : content
    Created on : Jun 9, 2021, 11:08:14 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Product"%>
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
            List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");
            int sizeListProduct = listProduct.size();
            if (sizeListProduct == 0) {
        %> 
        <div class="content">
            <center><h1 style="margin-top: 100px; font-size: 300%; color: #777;">Not Found</h1></center>
        </div>
        <% } else { %>

        <%
            int numOfPage = (sizeListProduct % 6 == 0) ? sizeListProduct / 6 : (sizeListProduct / 6) + 1;
            for (int i = 1; i <= numOfPage; i++) {
        %>

        <div class="content tabcontent" id="Page<%=i%>">
            <div  class="cnt-main btm ">
                <%
                    int count = 0;
                    for (Product sp : listProduct) {
                        count++;
                        if (count > (i * 6)) {
                            break;
                        } else if (count > ((i - 1) * 6)) {
                %>
                <div class="grid_1_of_3 images_1_of_3">
                    <a href="#"><img src="images/<%=sp.getPicture()%>" alt=""/></a>
                    <a href="#"><h3><%=sp.getProName()%></h3></a>
                    <div class="cart-b">
                        <span class="price left"><sup>$<%=sp.getPrice()%></sup><sub></sub></span>
                        <div class="btn top-right right">
                            <%
                                if (user != null) {
                            %>
                            <a href="ProductControllerMap?service=addToCart&pid=<%=sp.getProId()%>" style="color: white">Add to Cart</a>
                            <% } else { %>
                            <a onclick="alert('You have to login to buy this product');" >Add to Cart</a>
                            <% } %>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <%}
                    }%>
            </div>
        </div>
        <%}%>

        <div class="page" >
            <a href="#" class="tablinks" onclick="openPage(event, 'Page1')" id="defaultOpen">1</a> 
            <%
                for (int i = 2; i <= numOfPage; i++) {
            %>
            <a href="#" class="tablinks" onclick="openPage(event, 'Page<%=i%>')"><%=i%></a>
            <%}%>
        </div>

        <script>
            function openPage(evt, page) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(page).style.display = "block";
                evt.currentTarget.className += " active";
            }

            document.getElementById("defaultOpen").click();
        </script>

        <div class="clear"></div>
        <%}%>
    </body>
</html>

