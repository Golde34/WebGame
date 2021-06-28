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
    ArrayList<Game> gameList = (ArrayList<Game>) request.getAttribute("listGame");
    ArrayList<Category> cateList = (ArrayList<Category>) request.getAttribute("listCategory");
    ArrayList<Platform> platList = (ArrayList<Platform>) request.getAttribute("listPlatform");
    ArrayList<Company> comList = (ArrayList<Company>) request.getAttribute("listCompany");
    ArrayList<User> userList = (ArrayList<User>) request.getAttribute("listUser");
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
            <% ArrayList<Game> list = (ArrayList<Game>) request.getAttribute("listGame");%>

        </div>

        <div class="forms">
            <div class="tab">
                <div class="dropdown">
                    <button class="dropbtn" style="width: 250px; background-color: #04AA6D;color: white; padding: 16px; font-size: 16px; margin: 5px; border: 2px solid;">Game Management</button>
                    <div class="dropdown-content">
                        <button class="tablinks" onclick="openForm(event, 'gAdd')" id="defaultOpen">Add</button>
                        <button class="tablinks" onclick="openForm(event, 'gUpdate')">Update</button>
                        <button class="tablinks" onclick="openForm(event, 'gDel')">Delete/Restore</button>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn" style="width: 250px; background-color: #04AA6D;color: white; padding: 16px; font-size: 16px; margin: 5px; border: 2px solid;">User Management</button>
                    <div class="dropdown-content">
                        <button class="tablinks" onclick="openForm(event, 'uAdd')">Add</button>
                        <button class="tablinks" onclick="openForm(event, 'uUpdate')">Update</button>
                        <button class="tablinks" onclick="openForm(event, 'uDel')">Delete/Restore</button>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn" style="width: 250px; background-color: #04AA6D;color: white; padding: 16px; font-size: 16px; margin: 5px; border: 2px solid;">Company Management</button>
                    <div class="dropdown-content">
                        <button class="tablinks" onclick="openForm(event, 'comAdd')">Add</button>
                        <button class="tablinks" onclick="openForm(event, 'comUpdate')">Update</button>
                        <button class="tablinks" onclick="openForm(event, 'comDel')">Delete/Restore</button>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn" style="width: 250px; background-color: #04AA6D;color: white; padding: 16px; font-size: 16px; margin: 5px; border: 2px solid;">Galery Management</button>
                    <div class="dropdown-content">
                        <button class="tablinks" onclick="openForm(event, 'galery')" id="defaultOpen">Galery</button>
                    </div>
                </div>
            </div>
            <%-- Add game --%>
            <div id="gAdd" class="tabcontent">
                <h3>Game - Add</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Title</td>
                            <td><input type="text" name="title" placeholder="Game Title"></td>
                        </tr>
                        <tr>
                            <td>Company</td>
                            <td>
                                <select name="coId" id="ids">
                                    <% for (Company com : comList) {%>
                                    <option value="<%=com.getCoId()%>"> <%=com.getCoName()%> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>
                                <textarea name="desciption" style="height: 120px; width: 100%; border: 1px; overflow-x: hidden; overflow-y: scroll;"> </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Version</td>
                            <td><input type="text" name="version" placeholder="Game Version"></td>
                        </tr>
                        <tr>
                            <td>Release Date</td>
                            <td><input type="date" name="releaseDate" ></td>
                        </tr>
                        <tr>
                            <td>Rating</td>
                            <td><input type="number" name="rating" min="0" max="100"></td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td><input type="number" name="rating" min="0" step="0.01"></td>
                        </tr>
                        <tr>
                            <td>State</td>
                            <td>
                                <select name="state" >
                                    <option value="Coming Soon"> Coming Soon </option>
                                    <option value="Available"> Available </option>
                                    <option value="Stopped"> Stopped </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Add" name="submit">
                                <input type="hidden" value="addGame" name="service"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%-- Add game --%>
            <%-- Update game --%>
            <div id="gUpdate" class="tabcontent">
                <h3>Game - Update (Leave blank if no update)</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Game ID</td>
                            <td><select name="gId" id="ids">
                                    <% for (Game game : gameList) {%>
                                    <option value="<%=game.getGid()%>"> <%=game.getGid()%> : <%=game.getTitle()%> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Title</td>
                            <td><input type="text" name="title"></td>
                        </tr>
                        <tr>
                            <td>Company</td>
                            <td>
                                <select name="coId" id="ids">
                                    <% for (Company com : comList) {%>
                                    <option value="<%=com.getCoId()%>"> <%=com.getCoName()%> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>
                                <textarea name="desciption" style="height: 120px; width: 100%; border: 1px; overflow-x: hidden; overflow-y: scroll;"> </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Version</td>
                            <td><input type="text" name="version" placeholder="Game Version"></td>
                        </tr>
                        <tr>
                            <td>Release Date</td>
                            <td><input type="date" name="releaseDate" ></td>
                        </tr>
                        <tr>
                            <td>Rating</td>
                            <td><input type="number" name="rating" min="0" max="100"></td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td><input type="number" name="price" min="0" step="0.01"></td>
                        </tr>
                        <tr>
                            <td>State</td>
                            <td>
                                <select name="state" >
                                    <option value="Coming Soon"> Coming Soon </option>
                                    <option value="Available"> Available </option>
                                    <option value="Stopped"> Stopped </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Update" name="submit">
                                <input type="hidden" value="updateGame" name="service"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%-- Update game --%>
            <%-- Delete game --%>
            <div id="gDel" class="tabcontent">
                <h3>Game - Delete/Restore</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Game ID</td>
                            <td><select name="gId" id="ids">
                                    <% for (Game game : gameList) {%>
                                    <option value="<%=game.getGid()%>"> <%=game.getGid()%> : <%=game.getTitle()%> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="radio" name="status" value="1" checked><label>Keep</label><br>
                                <input type="radio" name="status" value="0"><label>Delete</label><br>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Update" name="submit">
                                <input type="hidden" value="delGame" name="service"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%-- Delete game --%>
            <%-- Add User --%>
            <div id="uAdd" class="tabcontent">
                <h3>User - Add</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Username</td>
                            <td><input type="text" name="username" placeholder="Username"></td>
                        </tr>
                        <tr>
                            <td>Display name</td>
                            <td><input type="text" name="uname" placeholder="Display name"></td>
                        </tr>
                        <tr>
                            <td>User Mail</td>
                            <td><input type="text" name="mail" ></td>
                        </tr>
                        <tr>
                            <td>Phone </td>
                            <td><select name="country" ><option value="0"> +84 </option></select>
                                <input type="number" name="phone" min="100000000" max="999999999">
                            </td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" name="address" ></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Add" name="submit">
                                <input type="hidden" value="addUser" name="service"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%-- Add User --%>
            <%-- Update User --%>
            <div id="uUpdate" class="tabcontent">
                <h3>User - Update</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>USer ID</td>
                            <td><select name="uId" >
                                    <% for (User user : userList) {%>
                                    <option value="<%=user.getuId() %>"> <%=user.getuId()%> : <%=user.getUsername() %> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Username</td>
                            <td><input type="text" name="username" placeholder="Username"></td>
                        </tr>
                        <tr>
                            <td>Display Name</td>
                            <td><input type="text" name="uname" placeholder="Display name"></td>
                        </tr>
                        <tr>
                            <td>Experience</td>
                            <td><input type="number" name="exp" min="0"></td>
                        </tr>
                        <tr>
                            <td>Mail</td>
                            <td><input type="text" name="version" placeholder="User Mail"></td>
                        </tr>
                        <tr>
                            <td>Phone </td>
                            <td><select name="country" ><option value="0"> +84 </option></select>
                                <input type="number" name="phone" min="100000000" max="999999999">
                            </td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" name="address" placeholder="Address"></td>
                        </tr>
                        <tr>
                            <td>Wallet</td>
                            <td><input type="number" name="wallet" min="0" step="0.01"></td>
                        </tr>
                        <tr>
                            <td>System Role</td>
                            <td><select name="role">
                                    <option value="admin"> Admin </option>
                                    <option value="user"> Peasant </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Update" name="submit">
                                <input type="hidden" value="updateUser" name="service"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%-- Update User --%>
            <%-- Delete User --%>
            <div id="uDel" class="tabcontent">
                <h3>User - Delete/Restore</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Game ID</td>
                            <td><select name="gId" id="ids">
                                    <% for (User user : userList) {%>
                                    <option value="<%=user.getuId() %>"> <%=user.getuId()%> : <%=user.getUsername() %> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="radio" name="status" value="1" checked><label>Keep</label><br>
                                <input type="radio" name="status" value="0"><label>Delete</label><br>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Update" name="submit">
                                <input type="hidden" value="delUser" name="service"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%-- Delete User --%>
            <div id="comAdd" class="tabcontent">
                <h3>Company - Add</h3>
                <p>Tokyo is the capital of Japan.</p>
            </div>

            <div id="comUpdate" class="tabcontent">
                <h3>Company - Update</h3>
                <p>Tokyo is the capital of Japan.</p>
            </div>

            <div id="comDel" class="tabcontent">
                <h3>Company - Delete/Restore</h3>
                <p>Tokyo is the capital of Japan.</p>
            </div>

            <div id="galery" class="tabcontent">
                <h3>Galery</h3>
                <p>Paris is the capital of France.</p> 
            </div>

            <script>document.getElementById("defaultOpen").click();</script>
        </div>

        <div class="orders">
            <p>this is orders</p>
        </div>
    </body>
</html>
