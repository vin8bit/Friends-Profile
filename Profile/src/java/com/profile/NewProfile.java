/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.profile;

import java.io.IOException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Vin
 */
@WebServlet(name = "NewProfile", urlPatterns = {"/NewProfile"})
@MultipartConfig
public class NewProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
      private static final long serialVersionUID = 1L;
	 
	    private static final int THRESHOLD_SIZE     = 1024 * 1024 * 3;  // 3MB
	    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
            private String fileName;
            
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
       
        
        
        try{
          if (!ServletFileUpload.isMultipartContent(request)) {
	            PrintWriter writer = response.getWriter();
	            writer.println("Request does not contain upload data");
	            writer.flush();
	            return;
	        }
	         
	        // configures upload settings
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        factory.setSizeThreshold(THRESHOLD_SIZE);
	        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	         
	        ServletFileUpload upload = new ServletFileUpload(factory);
	        upload.setFileSizeMax(MAX_FILE_SIZE);
	        upload.setSizeMax(MAX_REQUEST_SIZE);
          
                
                
                  Part part=request.getPart("photo");
                 fileName  = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                
           // constructs the directory path to store upload file
	        String uploadPath = getServletContext().getRealPath("")+"upload"+File.separator;
                  // creates the directory if it does not exist
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }
              
                part.write(uploadPath+fileName);
                
	     
        
        }catch(Exception e){
        response.getWriter().println(e);
        }
        
        try (PrintWriter out = response.getWriter()) {
          
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String about = request.getParameter("about");
            String query = "insert into profile(name,email,mobile,about,file_name)" +"values(?,?,?,?,?)";
            
            try{
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, mobile);
                pstmt.setString(4, about);
                pstmt.setString(5, fileName);
                pstmt.executeUpdate();
                conn.close();
                pstmt.close();
                
                response.getWriter().println("Saved");
          
               
            }catch(SQLException e){
                out.println(e.getMessage());
            }
            
            
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
