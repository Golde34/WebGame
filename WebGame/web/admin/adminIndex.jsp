<%-- 
    Document   : admin_Index
    Created on : Jun 27, 2021, 10:02:24 AM
    Author     : dumyd
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.*"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  User curAdmin = (User) request.getSession().getAttribute("curUser");
    DBConnection dbCon = new DBConnection();
    DAOGame gameDAO = new DAOGame(dbCon);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="${contextPath}/admin/admin.css" rel="stylesheet">
        <script src="${contextPath}/admin/admin.js"></script>
    </head>
    <body>
        <div class="header">
            <h2>This part will be the header</h2>
            <p>Test paragraph</p>
            <% ArrayList<Game> list =  (ArrayList<Game>)request.getAttribute("listGame"); %>
            <p> <%=list.size() %> </p>
        </div>

        <div class="forms">
            <div class="tab">
                <p style="padding: 5px">  Game Management</p>
                <button class="tablinks" onclick="openForm(event, 'gAdd')" id="defaultOpen">Add</button>
                <button class="tablinks" onclick="openForm(event, 'gUpdate')">Update</button>
                <button class="tablinks" onclick="openForm(event, 'gDel')">Delete/Restore</button>
                <p style="padding: 5px">  Galery Management</p>
                <button class="tablinks" onclick="openForm(event, 'galery')" id="defaultOpen">Galery</button>
                <p style="padding: 5px">  User Management</p>
                <button class="tablinks" onclick="openForm(event, 'uAdd')">Add</button>
                <button class="tablinks" onclick="openForm(event, 'uUpdate')">Update</button>
                <button class="tablinks" onclick="openForm(event, 'uDel')">Delete/Restore</button>
            </div>

            <div id="gAdd" class="tabcontent">
                <h3>Game - Add</h3>
                <form action="create" method="POST">
                    <table border="1">
                        <tr>
                            <td>Title</td>
                            <td><input type="text" name="title" placeholder="IDK what to write"></td>
                        </tr>
                        <tr>
                            <td>Company</td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>Content</td>
                            <td>
                                <textarea name="content" style="height: 120px; width: 200px; border: 1px; overflow-x: hidden; overflow-y: scroll;"> </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Save" name="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>

            <div id="gUpdate" class="tabcontent">
                <h3>Game - Update</h3>
                <p>Paris is the capital of France.</p> 
            </div>

            <div id="gDel" class="tabcontent">
                <h3>Game - Delete/Restore</h3>
                <p>Tokyo is the capital of Japan.</p>
            </div>

            <div id="galery" class="tabcontent">
                <h3>Galery</h3>
                <p>Paris is the capital of France.</p> 
            </div>

            <div id="uAdd" class="tabcontent">
                <h3>User - Add</h3>
                <p>London is the capital city of England.</p>
            </div>

            <div id="uUpdate" class="tabcontent">
                <h3>User - Update</h3>
                <p>Paris is the capital of France.</p> 
            </div>

            <div id="uDel" class="tabcontent">
                <h3>User - Delete/Restore</h3>
                <p>Tokyo is the capital of Japan.</p>
            </div>

            <script>document.getElementById("defaultOpen").click();</script>
        </div>

        <div class="orders">
            <p>this is orders</p>
        </div>
    </body>
</html>
