<%-- 
    Document   : logout
    Created on : Jan 8, 2022, 8:20:45 PM
    Author     : Vin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    try{
    HttpSession session2 = request.getSession(true);
    session2.setAttribute("currentSessionUser",null);
        response.sendRedirect("login.jsp"); //error page 
    
    }
    catch (Throwable theException){

     System.out.println(theException); 
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
      
    </body>
</html>
