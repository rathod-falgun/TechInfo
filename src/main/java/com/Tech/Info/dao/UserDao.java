package com.Tech.Info.dao;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

import com.Tech.Info.entites.User;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        super();
        this.con = con;
    }
    
    // get user by userId
    public User getUser(int id) {
        User u = null; // Start as null. If no user is found, it stays null.
        try {
            String q = "select * from user where id = ?";
            PreparedStatement st = con.prepareStatement(q);
            st.setInt(1, id);
            
            ResultSet rs = st.executeQuery();
            
            // Use 'if' because ID is unique (returns 1 row max)
            if (rs.next()) {
                u = new User(); // Only create the object if data actually exists
                
                // Extract values directly from the database result set (rs)
                u.setId(rs.getInt("id")); 
                u.setName(rs.getString("name"));
                u.setGender(rs.getString("gender"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setProfile(rs.getString("profile"));
                
                // Handle LocalDate conversion correctly from SQL Date
                if (rs.getDate("rdate") != null) {
                    u.setTime(rs.getDate("rdate").toLocalDate());
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Crucial! Never leave catch blocks completely silent
        }
        
        return u;
    }

    
    // edit
    public boolean EditUser(User u) {
        boolean f = false;
        try {
            String q = "update user set name = ? , email = ? , password = ? , profile = ? where id = ?";
            
            PreparedStatement st  = con.prepareStatement(q);
            
            st.setString(1, u.getName());
            st.setString(2, u.getEmail());
            st.setString(3, u.getPassword());
            st.setInt(5, u.getId());
            st.setString(4, u.getProfile());
            
            int res = st.executeUpdate();
            
            if(res > 0) {
                f= true;
            }       
        }catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // insert
    public boolean save(User user) {
        boolean f = false;

        try {
            // user --> db
            String q = "insert into user(name,email,password,gender,profile) values(? ,? ,?,?,?)";
            PreparedStatement st = con.prepareStatement(q);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setString(4, user.getGender());
            st.setString(5, user.getProfile());
            
            st.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // get user through username and password

    public User getUserByEmailAndPassword(String email, String password) {

        User u = null;

        try {
            String q = "select * from user where email = ? and password = ?";
            PreparedStatement st = con.prepareStatement(q);
            st.setString(1, email);
            st.setString(2, password);

            ResultSet set = st.executeQuery();

            if (set.next()) {
                u = new User();
                u.setName(set.getString("name"));
                u.setEmail(set.getString("email"));
                u.setPassword(set.getString("password"));
                u.setGender(set.getString("gender"));
                u.setId(set.getInt("id"));  

                Timestamp timestamp = set.getTimestamp("rdate");
                u.setTime(timestamp.toLocalDateTime().toLocalDate());
                
                u.setProfile(set.getString("profile"));

                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;

    }
}
