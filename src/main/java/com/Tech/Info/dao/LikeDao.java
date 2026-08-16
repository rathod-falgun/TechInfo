package com.Tech.Info.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDao {
	Connection con;
	

	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean deleteLike(int pid, int uid) {
		boolean f = false;
		try {
			PreparedStatement st = con.prepareStatement("delete from liked where pid = ? and uid = ?");
			st.setInt(1, pid);
			st.setInt(2, uid);

			st.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean isLikedByUser(int pid, int uid) throws SQLException {
		boolean f = false;
		PreparedStatement st = con.prepareStatement("select * from liked where pid = ? and uid = ?");
		st.setInt(1, pid);
		st.setInt(2, uid);

		ResultSet rs = st.executeQuery();

		if (rs.next()) {
			f = true;
		}
		return f;
	}

	public boolean insertLike(int pid, int uid) {
		boolean f = false;
		try {
			String q = "insert into liked (pid , uid) values (?,?)";

			PreparedStatement stmt = con.prepareStatement(q);
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);

			stmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public int countLikeOnPost(int pid) throws SQLException {
		int count = 0;
		String q = "select count(*) from liked where pid = ?";

		PreparedStatement stmt = con.prepareStatement(q);

		stmt.setInt(1, pid);

		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			count = rs.getInt("count(*)");
		}

		return count;
	}

}
