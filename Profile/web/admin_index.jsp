<%-- 
    Document   : admin_index
    Created on : Jan 8, 2022, 7:53:11 AM
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/header.css">
  <title>Profile</title>
</head>
<body>
    <!--====================== top menu =================== -->
    <%@ include file = "header.html" %>

    <div class="image_div">
        <img src="./css/18824957.jpg" alt="code texting">
    </div>


</body>
</html>
