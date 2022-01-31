<%-- 
    Document   : index.jsp
    Created on : Jan 8, 2022, 8:20:01 AM
    Author     : Vin
--%>

<%@page import="com.profile.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! Statement stmt;
    ResultSet rs;
     Connection conn;
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/index.css">
  
  <title>Profile</title>
</head>
<body>
    
    <% 
        try{
                conn = ConnectionManager.getConnection();
                stmt= conn.createStatement(); 
		rs= stmt.executeQuery("SELECT *  FROM profile ");	
			
            

    %>
    <!--====================== top menu =================== -->
    <nav class="navbar">
        <div class="logonav">
        <a href=""><img class="logo"  src="./css/logo.png" alt=""></a>
        <div class="hh1">
        <h1>Profile of Vineet's friends</h1>
        </div> </div>
    </nav>

<div class="container">
    
     <% while(rs.next())
        {
            %>
    
    <div class="card">
        <img src="./upload/<%=rs.getString("file_name") %>" alt="<%=rs.getString("file_name") %>">
        <h1><%=rs.getString("name") %></h1>
        <p class="title"><%=rs.getString("email") %></p>
        <p><%=rs.getString("about") %></p>
        <p><button>Contact</button></p>
    </div>
      
     <%}%>
     
      
</div>   
     <%}
    catch(Exception e){
        out.print(e.getMessage());%> <%
    }
    finally{
            stmt.close();
            conn.close();
    }
    %>


</body>
</html>
