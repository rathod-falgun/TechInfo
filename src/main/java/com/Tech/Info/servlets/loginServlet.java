package com.Tech.Info.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Tech.Info.dao.UserDao;
import com.Tech.Info.entites.Message;
import com.Tech.Info.entites.User;
import com.Tech.Info.helper.ConnectionProvider;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    
	    String email = request.getParameter("email");
	    
	    String password = request.getParameter("password");
	    
	    
	    UserDao userDao = new UserDao(ConnectionProvider.getCon());

	    User user = userDao.getUserByEmailAndPassword(email, password);
	    
	    if(user!=null) {
	        // save user to session
	        
	        HttpSession s = request.getSession();
	        
	        s.setAttribute("currentUser", user);
	        
	        response.sendRedirect("profile.jsp");
	        
	    }else {
	        // error show
	        
	        Message m = new Message( "Invalid Crediantials " , " error" , "alert alert-danger" );
	        response.sendRedirect("login.jsp");
	        
	        HttpSession session = request.getSession();
	        session.setAttribute("msg",m);
	        
            /*
             * out.print("Invalid Crediantials ... "); out.print("<br> Try Again");
             * out.print("    <a href=login.jsp> Back to Login </a>");
             */
	    }
	    
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
