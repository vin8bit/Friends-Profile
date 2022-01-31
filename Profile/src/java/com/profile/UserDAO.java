/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.profile;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Vin
 */
public class UserDAO {
      static Connection conn = null;
      static ResultSet rs = null;  
	
	
	
      public static UserBean login(UserBean bean) {
	
         //preparing some objects for connection 
         Statement stmt = null;    
	
         String username = bean.getUsername();    
         String password = bean.getPassword();   
	    
         String searchQuery =
               "select * from users where username='"
                        + username
                        + "' AND password='"
                        + password
                        + "'";
	       
       
      try 
      {
         //connect to DB 
         conn = ConnectionManager.getConnection();
         stmt=conn.createStatement();
         rs = stmt.executeQuery(searchQuery);	        
         boolean more = rs.next();
	       
         // if user does not exist set the isValid variable to false
         if (!more) 
         {
            System.out.println("Sorry, you are not a registered user! Please sign up first");
            bean.setValid(false);
         } 
	        
         //if user exists set the isValid variable to true
         else if (more) 
         {
            String firstName = rs.getString("FirstName");
            String lastName = rs.getString("LastName");
            bean.setFirstName(firstName);
            bean.setLastName(lastName);
            bean.setValid(true);
         }
      } 

      catch (Exception ex) 
      {
         System.out.println("Log In failed: An Exception has occurred! " + ex);
      } 
	    
      //some exception handling
      finally 
      {
         if (rs != null)	{
            try {
               rs.close();
            } catch (Exception e) {}
               rs = null;
            }
	
         if (stmt != null) {
            try {
               stmt.close();
            } catch (Exception e) {}
               stmt = null;
            }
	
         if (conn != null) {
            try {
               conn.close();
            } catch (Exception e) {
            }

            conn = null;
         }
      }

return bean;
	
      }	

}
