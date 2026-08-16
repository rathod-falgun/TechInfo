package com.Tech.Info.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Tech.Info.dao.UserDao;
import com.Tech.Info.entites.User;
import com.Tech.Info.helper.ConnectionProvider;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
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
	    
	    // fetch data
	    try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	    PrintWriter out = response.getWriter();
	    
	    String uname = request.getParameter("username");
	    
	    String email = request.getParameter("email");
	    
	    String password = request.getParameter("password");
	    
	    String gender = request.getParameter("gender");
	    
	    //get connection
	    Connection con = ConnectionProvider.getCon();
	    
	    // userdao object
	    UserDao userDao = new UserDao(con);
	    String profile_pic = "default.png";
	    // user object
	    User u = new User(uname, email , password , gender , LocalDate.now() , profile_pic);
	    
	    boolean isRegister = userDao.save(u);
	    
	    request.setAttribute("isRegister",String.valueOf(isRegister));
	    
	    response.setContentType("text/html");
	   
if(isRegister) {
   response.getWriter().print("done");
}else {
    response.getWriter().print("error");
}
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	}

}
