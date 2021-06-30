<%-- 
    Document   : admin_Index
    Created on : Jun 27, 2021, 10:02:24 AM
    Author     : dumyd
--%>

<%@page import="java.util.HashMap"%>
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
    HashMap<Game, ArrayList<Galery>> listGameGalery = (HashMap<Game, ArrayList<Galery>>) request.getAttribute("listGameGalery");
    String message = (String) request.getAttribute("message");
    String displayTab = (String) request.getAttribute("tab");
    if (displayTab==null) displayTab="gameAdd";
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
            <%  if (message==null) { %>
                <p>Test paragraph</p>
            <%} else {%>
            <p><%=message%></p>
            <%}%>
        </div>

        <div class="forms">
            <div class="tab">
                <div class="dropdown">
                    <button class="dropbtn" style="width: 250px; background-color: #04AA6D;color: white; padding: 16px; font-size: 16px; margin: 5px; border: 2px solid;">Game Management</button>
                    <div class="dropdown-content">
                        <button class="tablinks" onclick="openForm(event, 'gAdd')" id="gameAdd">Add</button>
                        <button class="tablinks" onclick="openForm(event, 'gUpdate')" id="gameUpdate">Update</button>
                        <button class="tablinks" onclick="openForm(event, 'gDel')" id="gameDel">Delete/Restore</button>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn" style="width: 250px; background-color: #04AA6D;color: white; padding: 16px; font-size: 16px; margin: 5px; border: 2px solid;">User Management</button>
                    <div class="dropdown-content">
                        <button class="tablinks" onclick="openForm(event, 'uAdd')" id="userAdd">Add</button>
                        <button class="tablinks" onclick="openForm(event, 'uUpdate')" id="userUpdate">Update</button>
                        <button class="tablinks" onclick="openForm(event, 'uDel')" id="userDel">Delete/Restore</button>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn" style="width: 250px; background-color: #04AA6D;color: white; padding: 16px; font-size: 16px; margin: 5px; border: 2px solid;">Company Management</button>
                    <div class="dropdown-content">
                        <button class="tablinks" onclick="openForm(event, 'comAdd')" id="companyAdd">Add</button>
                        <button class="tablinks" onclick="openForm(event, 'comUpdate')" id="companyUpdate">Update</button>
                        <button class="tablinks" onclick="openForm(event, 'comDel')" id="companyDel">Delete/Restore</button>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn" style="width: 250px; background-color: #04AA6D;color: white; padding: 16px; font-size: 16px; margin: 5px; border: 2px solid;">Galery Management</button>
                    <div class="dropdown-content">
                        <button class="tablinks" onclick="openForm(event, 'galeryAdd')" id="galeryA">Add</button>
                        <button class="tablinks" onclick="openForm(event, 'galeryUpdate')" id="galeryU">Update</button>
                    </div>
                </div>
            </div>
            <%-- Add game --%>
            <div id="gAdd" class="tabcontent">
                <h3>Game - Add</h3>
                <h2>Defaut status will be 0 , change this after adding all the materials</h2>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Title</td>
                            <td><input type="text" name="title" placeholder="Game Title" style="width:100%" required></td>
                        </tr>
                        <tr>
                            <td>Company</td>
                            <td>
                                <select name="coId" >
                                    <% for (Company com : comList) {%>
                                    <option value="<%=com.getCoId()%>"> <%=com.getCoName()%> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>
                                <textarea name="description" style="height: 120px; width: 100%; border: 1px; overflow-x: hidden; overflow-y: scroll;" required> </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Version</td>
                            <td><input type="text" name="version" placeholder="Game Version" style="width:100%" required></td>
                        </tr>
                        <tr>
                            <td>Release Date</td>
                            <td><input type="date" name="releaseDate" required></td>
                        </tr>
                        <tr>
                            <td>Rating</td>
                            <td><input type="number" name="rating" min="0" max="100" style="width:100%" required></td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td><input type="number" name="price" min="0" step="0.01" style="width:100%" required></td>
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
                            <td><select name="gId">
                                    <% for (Game game : gameList) {%>
                                    <option value="<%=game.getGid()%>"> <%=game.getGid()%> : <%=game.getTitle()%> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Title</td>
                            <td><input type="text" name="title" style="width:100%"></td>
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
                            <td><input type="text" name="version" placeholder="Game Version" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td>Release Date</td>
                            <td><input type="date" name="releaseDate" ></td>
                        </tr>
                        <tr>
                            <td>Rating</td>
                            <td><input type="number" name="rating" min="0" max="100" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td><input type="number" name="price" min="0" step="0.01" style="width:100%"></td>
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
                            <td><select name="gId">
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
                            <td><input type="text" name="username" placeholder="Username" style="width:100%" required></td>
                        </tr>
                        <tr>
                            <td>Display name</td>
                            <td><input type="text" name="uname" placeholder="Display name" style="width:100%" required></td>
                        </tr>
                        <tr>
                            <td>User Mail</td>
                            <td><input type="text" name="mail" style="width:100%" required></td>
                        </tr>
                        <tr>
                            <td>Phone </td>
                            <td><select name="country" ><option value="0"> +84 </option></select>
                                <input type="number" name="phone" min="100000000" max="999999999" style="width:200px" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" name="address" style="width:100%" required></td>
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
                                    <option value="<%=user.getuId()%>"> <%=user.getuId()%> : <%=user.getUsername()%> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Username</td>
                            <td><input type="text" name="username" placeholder="Username" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td>Display Name</td>
                            <td><input type="text" name="uname" placeholder="Display name" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td>Experience</td>
                            <td><input type="number" name="exp" min="0" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td>Mail</td>
                            <td><input type="text" name="version" placeholder="User Mail" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td>Phone </td>
                            <td><select name="country" ><option value="0"> +84 </option></select>
                                <input type="number" name="phone" min="100000000" max="999999999" style="width:200px">
                            </td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" name="address" placeholder="Address" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td>Wallet</td>
                            <td><input type="number" name="wallet" min="0" step="0.01" style="width:100%"></td>
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
                                    <option value="<%=user.getuId()%>"> <%=user.getuId()%> : <%=user.getUsername()%> </option>
                                    <% } %>
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
            <%-- Add Company --%>
            <div id="comAdd" class="tabcontent">
                <h3>Company - Add</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Company Name</td>
                            <td><input type="text" name="coName" placeholder="Company Name" style="width:100%" required></td>
                        </tr>
                        <tr>
                            <td>Found Date</td>
                            <td><input type="date" name="foundDate" ></td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>
                                <textarea name="desciption" style="height: 120px; width: 100%; border: 1px; overflow-x: hidden; overflow-y: scroll;" required> </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Logo</td>
                            <td><input type="text" name="logo" style="width:100%" required></td>
                        </tr>
                        <tr>
                            <td>Company Address</td>
                            <td><input type="text" name="address" style="width:100%" required></td>
                        </tr>
                        <tr>
                            <td>Company Phone </td>
                            <td><select name="country" ><option value="0"> 0</option></select>
                                <input type="number" name="phone" min="100000000" max="999999999"style="width:200px" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Company Mail</td>
                            <td><input type="text" name="mail" style="width:100%" required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Add" name="submit">
                                <input type="hidden" value="addCom" name="service"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%-- Add Company --%>
            <%-- Update Company --%>
            <div id="comUpdate" class="tabcontent">
                <h3>Company - Update</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Company ID</td>
                            <td><select name="coId" >
                                    <% for (Company com : comList) {%>
                                    <option value="<%=com.getCoId()%>"> <%=com.getCoId()%> : <%=com.getCoName()%> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="name" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td>Found Date</td>
                            <td><input type="date" name="foundDate" ></td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>
                                <textarea name="desciption" style="height: 120px; width: 100%; border: 1px; overflow-x: hidden; overflow-y: scroll;"> </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Logo</td>
                            <td><input type="text" name="logo" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td>Company Address</td>
                            <td><input type="text" name="address" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td>Company Phone </td>
                            <td><select name="country" ><option value="0"> 0</option></select>
                                <input type="number" name="phone" min="100000000" max="999999999" style="width:200px">
                            </td>
                        </tr>
                        <tr>
                            <td>Company Mail</td>
                            <td><input type="text" name="mail" style="width:100%"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Update" name="submit">
                                <input type="hidden" value="updateCom" name="service"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%-- Update Company --%>
            <%-- Delete Company --%>
            <div id="comDel" class="tabcontent">
                <h3>Company - Delete/Restore</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Company ID</td>
                            <td><select name="coId" >
                                    <% for (Company com : comList) {%>
                                    <option value="<%=com.getCoId()%>"> <%=com.getCoId()%> : <%=com.getCoName()%> </option>
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
            </div>
            <%-- Delete Company --%>
            <%-- Add Galery --%>
            <div id="galeryAdd" class="tabcontent">
                <h3>Galery - Add</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Game Select</td>
                            <td><select name="gId">
                                    <% for (Game game : gameList) {%>
                                    <option value="<%=game.getGid()%>"> <%=game.getGid()%> : <%=game.getTitle()%> </option>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>File name</td>
                            <td><input type="text" name="link" style="width:100%" required>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Add" name="submit">
                                <input type="hidden" value="addGalery" name="service"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%-- Add Galery --%>
            <%-- Update Galery --%>
            <div id="galeryUpdate" class="tabcontent">
                <h3>Galery - Update</h3>
                <form action="AdminControllerMap" method="POST">
                    <table border="1" style="width: 95%;">
                        <tr>
                            <td>Galery Select</td>
                            <td><select name="galery">
                                    <% for (HashMap.Entry<Game, ArrayList<Galery>> en : listGameGalery.entrySet()) {
                                            Game key = en.getKey();
                                            ArrayList<Galery> val = en.getValue();%>
                                    <optgroup label="<%=key.getGid()%> : <%=key.getTitle()%>">
                                        <% for (Galery gal : val) {%>
                                        <option value="<%=gal.getLink()%>"><%=gal.getType() + "|" + gal.getLink()%></option>
                                        <%}%>
                                    </optgroup>
                                    <% }%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>File link</td>
                            <td><input type="text" name="link" style="width:100%" >
                            </td>
                        </tr>
                        <tr>
                            <td>Status</td>
                            <td><input type="radio" name="status" value="1" checked><label>Keep</label><br>
                                <input type="radio" name="status" value="0"><label>Delete</label><br>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Add" name="submit">
                                <input type="hidden" value="updateGalery" name="service"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <%-- Update Galery --%>
            <%  if (displayTab==null) {%>
            <script>document.getElementById("gameAdd").click();</script>
            <%} else {%>
            <script>document.getElementById("<%=displayTab%>").click();</script>
            <% } %>
        </div>
        
        <div class="orders">
            <p>this is orders</p>
            <p><%=displayTab%></p>
        </div>
    </body>
</html>