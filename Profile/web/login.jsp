<%-- 
    Document   : Login
    Created on : Jan 8, 2022, 6:18:52 AM
    Author     : Vin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if(session.getAttribute("currentSessionUser")== null){
         //error page 
    }else{response.sendRedirect("admin_index.jsp");}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="./css/login.css">
    
    <title>Profile</title>

</head>
<body>
   

       
            <div class="login-div">
                <h2>Admin Login</h2>
                <form action="LoginServlet" method="POST" enctype="multipart/form-data">
                    <input type="text" name="username" placeholder="Username" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <input type="submit" class="button" name="login"value="Login">
                </form>

            </div>
           



      
</body>
</html>