package com.Tech.Info.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.Tech.Info.dao.UserDao;
import com.Tech.Info.entites.Message;
import com.Tech.Info.entites.User;
import com.Tech.Info.helper.ConnectionProvider;
import com.Tech.Info.helper.Helper;

/**
 * Servlet implementation class editServlet
 */
@WebServlet("/editServlet")
@MultipartConfig
public class editServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public editServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	
        PrintWriter out = response.getWriter();

        response.setContentType("text/html");

       HttpSession s = request.getSession();
       User u = (User)s.getAttribute("currentUser");
       
       if(u == null) {
           Message m = new Message("please login First ", "error" , "alert alert-danger");
           s.setAttribute("msg", m);
           response.sendRedirect("login.jsp");
           return;
       }
       
       String name = request.getParameter("user_name");
       String email = request.getParameter("user_email");
       String pass = request.getParameter("user_password");
       
       Part part = request.getPart("profile_img");
       String uploaded_image = (part != null) ? part.getSubmittedFileName() : "";
       
       String old_image = u.getProfile();
       
       u.setName(name);
       u.setEmail(email);
       u.setPassword(pass);
       
       
       
       if(uploaded_image != null && !uploaded_image.isEmpty()) {
           String uploadDir = "E:/EclipseWorkSpace/TechInfo/src/main/webapp/profiles";
           String newImagePath = uploadDir + File.separator + uploaded_image;
           String oldImagePath = uploadDir + File.separator + old_image;
           
           if(!old_image.equals("default.png")) {
               Helper.deleteFile(oldImagePath);
           }
       
           System.out.println(newImagePath);
           
           boolean success = Helper.saveFile(part.getInputStream(), newImagePath);
           if(success) {
               u.setProfile(uploaded_image);
           }
           
       }
       
       Connection con = ConnectionProvider.getCon();
       UserDao userDao = new UserDao(con);
       
       boolean editUser = userDao.EditUser(u);
       if(editUser) {
           s.setAttribute("currentUser", u);
           
           Message m = new Message("Details Updated Successfully!", "success", "alert alert-success");
           s.setAttribute("msg", m);
           
           // 🔥 FIX: Only ONE redirect, NO out.print() before it, and a return statement
           response.sendRedirect("profile.jsp"); 
       } else {
           Message m = new Message("Something went wrong while updating!", "error", "alert alert-danger");
           s.setAttribute("msg", m);
           
           // 🔥 FIX: Redirect back to profile or an edit page with the error message
           response.sendRedirect("profile.jsp");
       }

    }

}
