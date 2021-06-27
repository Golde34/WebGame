<%-- 
    Document   : admin_Index
    Created on : Jun 27, 2021, 10:02:24 AM
    Author     : dumyd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="admin.css" rel="stylesheet">
        <script src="admin.js"></script>
    </head>
    <body>
        <div class="header">
            <h2>This part will be the header</h2>
            <p>Test paragraph</p>
        </div>
        
        <div class="forms">
            <div class="tab">
                <p style="padding: 5px">  Game Management</p>
                    <button class="tablinks" onclick="openForm(event, 'London')" id="defaultOpen">London</button>
                    <button class="tablinks" onclick="openForm(event, 'Paris')">Paris</button>
                    <button class="tablinks" onclick="openForm(event, 'Tokyo')">Tokyo</button>
                <p style="padding: 5px">  User Management</p>
                    <button class="tablinks" onclick="openForm(event, 'London')">London</button>
                    <button class="tablinks" onclick="openForm(event, 'Paris')">Paris</button>
                    <button class="tablinks" onclick="openForm(event, 'Tokyo')">Tokyo</button>
            </div>

            <div id="London" class="tabcontent">
                <h3>London</h3>
                <p>London is the capital city of England.</p>
            </div>

            <div id="Paris" class="tabcontent">
                <h3>Paris</h3>
                <p>Paris is the capital of France.</p> 
            </div>

            <div id="Tokyo" class="tabcontent">
                <h3>Tokyo</h3>
                <p>Tokyo is the capital of Japan.</p>
            </div>

            <script>document.getElementById("defaultOpen").click();</script>
        </div>
        
        <div class="orders">
            <p>this is orders</p>
        </div>
    </body>
</html>
