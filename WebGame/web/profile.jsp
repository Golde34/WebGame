<%-- 
    Document   : user
    Created on : Jun 24, 2021, 10:59:07 PM
    Author     : Duong
--%>

<%@page import="entity.Order"%>
<%@page import="entity.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            User x = (User) request.getAttribute("currUser");
            ArrayList<Game> listGame = (ArrayList<Game>) request.getAttribute("listGame");
            ArrayList<Order> listOrder = (ArrayList<Order>) request.getAttribute("listOrder");
        %>
        <h1>Hello User <%=x.getuName()%></h1>
        <hr>
        <p><%=x.getuName()%> </p>
        <p>Role: <%=x.getSystem_role()%></p>
        
        <p>Wallet: <%=x.getWallet()%><a href="UserControllerMap?service=topup"> Nap tien</a></p>
        
        <p>Information:<br>
            Experience: <%=x.getExperience()%><br>
            Address: <%=x.getuAddress()%> <br>
            Mail: <%=x.getuMail()%> <br>
            Phone: <%=x.getuPhone()%>
        </p>

        <%if (listGame.isEmpty()){%> <p>No games bought yet </p> 
        <%} else {%>
        <p>Owned Game: </p>
        <%for (Game game : listGame) {%>
        <p>+ <a href="GameControllerMap?service=getGame&gameID=<%=game.getGid()%>"> <%= game.getTitle()%> </a></p>
        <%}}%>
        
        <%if (listOrder.isEmpty()){%> <p>No order</p> 
        <%} else {%>
        <p>Oder: </p>
        <%for (Order o : listOrder) {%>
        <p>+ <a href=""> Oder <%= o.getoId()%> </a></p>
        <%}}%>
        
    </body>
</html>
