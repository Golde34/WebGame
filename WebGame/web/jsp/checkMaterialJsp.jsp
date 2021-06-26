<%-- 
    Document   : checkMaterialJsp
    Created on : Jun 23, 2021, 9:13:44 AM
    Author     : dumyd
--%>

<%@page import="entity.Galery"%>
<%@page import="entity.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAOGalery"%>
<%@page import="model.DBConnection"%>
<%@page import="model.DAOGame"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  DBConnection dbconn = new DBConnection();
            DAOGame daoGame = new DAOGame(dbconn);
            DAOGalery daoGalery = new DAOGalery(dbconn);
            ArrayList<Game> gameList = daoGame.getAllGame();
            for (Game game : gameList) {
                    ArrayList<Galery> galeryList = daoGalery.getGaleryById(game.getGid());
                    for (Galery galery : galeryList) {
                        if (galery.getType().equalsIgnoreCase("vid-gp") || galery.getType().equalsIgnoreCase("vid-trailer")) {%> 
                            <a href="<%=galery.getLink() %>"> <%=galery.getgId() %></a>
                            <% }else{ %>
                            <img src="<%=galery.getLink() %>" alt="<%= galery.getLink().trim()%>"><br> %<%
                        }
                }
            }
        %>
    </body>
</html>
