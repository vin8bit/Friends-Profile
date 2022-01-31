/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.profile;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Vin
 */
public class ConnectionManager {
    
    static Connection conn;
    static String url;
    static String username;
    static String password;
    
    public ConnectionManager(){
        
    }
    public static Connection getConnection(){
        
        url ="jdbc:mysql://localhost:3306/"+"profiledb?useSSL= true";
        username="root";
        password="1234";
       
          try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url,username,password);
                
            }catch(ClassNotFoundException|SQLException e){
                System.out.println(e);
            
            }
          
          return conn;
    }
    
    
}
