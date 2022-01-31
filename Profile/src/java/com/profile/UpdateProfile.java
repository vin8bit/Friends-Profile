/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.profile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Vin
 */
@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
@MultipartConfig
public class UpdateProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String newFileName;
    private String saveFileName;
    private static final int THRESHOLD_SIZE     = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
    private String query;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        if (!ServletFileUpload.isMultipartContent(request)) {
	            PrintWriter writer = response.getWriter();
	            writer.println("Request does not contain upload data");
	            writer.flush();
	            return;
	        }
	         
	        // configures upload settings
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        factory.setSizeThreshold(THRESHOLD_SIZE);
	        factory.setRepository(new java.io.File(System.getProperty("java.io.tmpdir")));
	         
	        ServletFileUpload upload = new ServletFileUpload(factory);
	        upload.setFileSizeMax(MAX_FILE_SIZE);
	        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String about = request.getParameter("about");
            int profileId = Integer.parseInt(request.getParameter("profileid"));
            String oldFileName = request.getParameter("oldfilename");
            
            // Get new File
            Part part=request.getPart("photo");
            newFileName  = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            
            
            if(!newFileName.isEmpty()){
                
                String uploadPath = getServletContext().getRealPath("")+"upload"+File.separator;
          
                part.write(uploadPath+newFileName);
                
                saveFileName = newFileName;
                
                
            }else{saveFileName = oldFileName;}
          
        
        try ( PrintWriter out = response.getWriter()) {
            
            query = "UPDATE  profile"
                    + " SET name=?,"
                    + "email=?,"
                    + "mobile=?,"
                    + "about=?,"
                    + "file_name=?"
                    + " WHERE profile_id=?";
            
            try{
                Connection conn = ConnectionManager.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(query);
                
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, mobile);
                pstmt.setString(4, about);
                pstmt.setString(5, saveFileName);
                pstmt.setInt(6, profileId);
                pstmt.executeUpdate();
                conn.close();
                pstmt.close();
                
                response.sendRedirect("profile_table.jsp");
               
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
