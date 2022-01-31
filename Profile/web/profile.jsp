<%-- 
    Document   : profile
    Created on : Jan 8, 2022, 8:10:58 AM
    Author     : Vin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if(session.getAttribute("currentSessionUser")== null){
        response.sendRedirect("login.jsp"); //error page 
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="./css/profile.css">
    <link rel="stylesheet" href="./css/header.css">
</head>
<body>
    <%@ include file = "header.html" %>
    <div class="container">
        <h1>New Profile</h1>
        <form action="NewProfile" method="post" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="text" name="mobile" placeholder="Mobile Number" required>
            <input type="text" name="email" placeholder="Email" required>
            <input type="text" name="about" placeholder="About" required>
            <input type="file" name="photo" required>
            <label for="photo">Profile Image</label>
            <input type="submit" class="save_button" value="Save">
        </form>
    </div>
</body>
</html>