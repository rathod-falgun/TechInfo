package com.Tech.Info.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.Tech.Info.entites.Category;
import com.Tech.Info.entites.Posts;
import com.Tech.Info.helper.ConnectionProvider;

public class PostDao {

	private Connection con;

	public PostDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	public Posts getPostByPostId(int id) {
		Posts p = null;
		try {
			String query = "select * from posts where pid = ?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString("pTitle");
				String content = rs.getString("pContent");
				String code = rs.getString("pCode");
				String pic = rs.getString("pPic");
				LocalDateTime date = rs.getTimestamp("pDate").toLocalDateTime();
				int catId = rs.getInt("catId");
				int uId = rs.getInt("userId");
				p = new Posts(id, title, content, code, pic, date, catId, uId);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	public List<Posts> getAllPost() {
		List<Posts> list = new ArrayList<Posts>();

		try {
			String q = "select * from posts";
			PreparedStatement stmt = con.prepareStatement(q);

			ResultSet rs = stmt.executeQuery(q);
			while (rs.next()) {
				int id = rs.getInt("pid");
				String title = rs.getString("pTitle");
				String content = rs.getString("pContent");
				String code = rs.getString("pCode");
				String pic = rs.getString("pPic");
				LocalDateTime date = rs.getTimestamp("pDate").toLocalDateTime();
				int catId = rs.getInt("catId");
				int uId = rs.getInt("userId");

				Posts p = new Posts(id, title, content, code, pic, date, catId, uId);

				list.add(p);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public List<Posts> getPostById(int catId) {
		List<Posts> list = new ArrayList<Posts>();
		
		try {
			String q = "select * from posts where catId = ?";
			PreparedStatement stmt = con.prepareStatement(q);

			stmt.setInt(1, catId);
			
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt("pid");
				String title = rs.getString("pTitle");
				String content = rs.getString("pContent");
				String code = rs.getString("pCode");
				String pic = rs.getString("pPic");
				LocalDateTime date = rs.getTimestamp("pDate").toLocalDateTime();
				int uId = rs.getInt("userId");

				Posts p = new Posts(id, title, content, code, pic, date, catId, uId);

				list.add(p);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public boolean AddPost(Posts p) {
		boolean f = false;
		try {
			String q = "insert into posts (pTitle , pContent , pCode , pPic ,catId , userId) values (?,?,?,?,?,?)";

			PreparedStatement st = con.prepareStatement(q);

			st.setString(1, p.getpTitle());
			st.setString(2, p.getpContent());
			st.setString(3, p.getpCode());
			st.setString(4, p.getpPic());
			st.setInt(5, p.getCatId());
			st.setInt(6, p.getUserId());

			int executeUpdate = st.executeUpdate();

			f = true;

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> li = new ArrayList<Category>();

		try {
			String q = "select * from categories";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {

				int id = rs.getInt("cid");
				String name = rs.getString("cname");
				String description = rs.getString("description");

				Category c = new Category(id, name, description);
				li.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return li;
	}

	public boolean AddCategory(String name, String description) throws SQLException {
		con = ConnectionProvider.getCon();

		String q = "insert into categories (cid,cname,description) values (null,?,?)";

		PreparedStatement st = con.prepareStatement(q);

		st.setString(1, name);

		st.setString(2, description);

		return st.execute();
	}

}
