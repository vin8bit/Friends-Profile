<%-- 
    Document   : update_profile
    Created on : Jan 7, 2022, 3:27:10 AM
    Author     : Vin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.profile.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if(session.getAttribute("currentSessionUser")== null){
        response.sendRedirect("login.jsp"); //error page 
    }
%>

<%! Statement stmt;
    ResultSet rs;
    int profileId;
    String name;
    String mobile;
    String email;
    String about;
    String fileName;
%>
<% 
   profileId = Integer.parseInt(request.getParameter("profile_id"));
   
   try{
                Connection conn = ConnectionManager.getConnection();
                stmt= conn.createStatement(); 
			rs= stmt.executeQuery("SELECT *  FROM profile where profile_id = "+profileId+" ");	
			
                        while(rs.next())
			{  
                            name =rs.getString("name");;
                            email =rs.getString("email");; 
                            mobile =rs.getString("mobile");; 
                            about =rs.getString("about");; 
                            fileName =rs.getString("file_name");; 
                          
                        }      
			conn.close();
            
            }catch(SQLException e){
                out.println(e.getMessage());
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
        <h1>Update Profile</h1>
        <form action="UpdateProfile" method="post" enctype="multipart/form-data">
            <input type="hidden" name="profileid" value="<%= profileId%>" required>
            <input type="text" name="name" placeholder="Full Name" value="<%= name%>" required>
            <input type="text" name="mobile" placeholder="Mobile Number" value="<%= mobile%>" required>
            <input type="text" name="email" placeholder="Email" value="<%= email%>" required>
            <input type="text" name="about" placeholder="About" value="<%= about%>" required>
             <input type="hidden" name="oldfilename" value="<%= fileName%>" required>
            <input type="file" name="photo" >
            <label for="photo">Profile Image</label>
            <input type="submit" class="save_button" value="Update">
        </form>
    </div>
</body>
</html>
