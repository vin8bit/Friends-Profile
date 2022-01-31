<%-- 
    Document   : profile_table
    Created on : Jan 7, 2022, 11:23:08 PM
    Author     : Vin
--%>

<%@page import="com.profile.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if(session.getAttribute("currentSessionUser")== null){
        response.sendRedirect("login.jsp"); //error page 
    }
%>

<%! Statement stmt;
    ResultSet rs;
     Connection conn;
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="./css/profile_table.css">
    <link rel="stylesheet" href="./css/header.css">
</head>
<body>
    <%@ include file = "header.html" %>
    
    <% 
        try{
                conn = ConnectionManager.getConnection();
                stmt= conn.createStatement(); 
		rs= stmt.executeQuery("SELECT *  FROM profile ");	
			
            

    %>
    
    <div class="container">
        <table id="profile_table">
        <tr>
            <th>Profile ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Mobile No</th>
            <th>About</th>
            <th>Edit</th>
        </tr> 
        <% while(rs.next())
        {
            %>
            <tr>
            <td id='name'><%=rs.getInt("profile_id") %></td>    
            <td id='name'><%=rs.getString("name") %></td>
            <td id='email'><%=rs.getString("email") %></td>
            <td id='mobile'><%=rs.getString("mobile") %></td>
            <td id='about'><%=rs.getString("about") %></td>
           
            <td><a  href="update_profile.jsp?profile_id=<%=rs.getInt("profile_id") %>"><div class='edit'>Edit</div></a> 
                <a  href="DeleteProfile?profile_id=<%=rs.getInt("profile_id") %>"><div class='delete'>Delete</div></a> </td>
                                                                                                                        
        </tr>
        <%}%>
    </table>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%> <%
    }
    finally{
            stmt.close();
            conn.close();
    }
    %>
        </div>
</body>
</html>
