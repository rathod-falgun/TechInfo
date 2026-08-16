package com.Tech.Info.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Tech.Info.dao.LikeDao;
import com.Tech.Info.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LikeServlet() {
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		LikeDao ld = new LikeDao(ConnectionProvider.getCon());
		String operation = request.getParameter("operation");
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));

		if (operation.equals("Like")) {

			try {
				boolean likedByUser = ld.isLikedByUser(pid, uid);

				if (likedByUser) {
					boolean deleteLike = ld.deleteLike(pid, uid);
					if (deleteLike) {
						int count = ld.countLikeOnPost(pid);
						out.print("unliked|" + count);
					} else {
						out.print("error");
					}
				} else {

					boolean liked = ld.insertLike(pid, uid);
					if (liked) {
	                    int count = ld.countLikeOnPost(pid);
						out.print("liked|"+count);
					} else {
						out.print("error");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
