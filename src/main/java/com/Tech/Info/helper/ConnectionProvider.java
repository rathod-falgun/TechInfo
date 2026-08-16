package com.Tech.Info.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con;

    public static Connection getCon() {
        try {

            if (con == null) {
                // Driver Class Load
                Class.forName("com.mysql.cj.jdbc.Driver");
                String username = System.getenv("DB_USERNAME");
                String password = System.getenv("DB_PASSWORD");
                // create a connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techinfo",username , password);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

}
