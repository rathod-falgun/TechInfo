package com.Tech.Info.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.Tech.Info.dao.PostDao;
import com.Tech.Info.entites.Posts;
import com.Tech.Info.entites.User;
import com.Tech.Info.helper.ConnectionProvider;
import com.Tech.Info.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPostServlet() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();

		String title = request.getParameter("pTitle");

		String content = request.getParameter("pContent");

		String code = request.getParameter("pCode");

		Part part = request.getPart("pic");
		
		HttpSession s = request.getSession();
		
		User user = (User) s.getAttribute("currentUser");
		
		int userId = user.getId();

		int categoryId = Integer.parseInt(request.getParameter("catId"));
		
		Posts p = new Posts(title,content,code,part.getSubmittedFileName(),null,categoryId,userId);
		
		PostDao pd = new PostDao(ConnectionProvider.getCon());
		
		boolean addPost = pd.AddPost(p);
		
		if(addPost) {
			
		
			
			String path = "E:/EclipseWorkSpace/TechInfo/src/main/webapp/profiles" + File.separator + "postPic" + File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			out.print("success");
			
		}else {
			out.print("error");
		}
		
		

		

	}

}
