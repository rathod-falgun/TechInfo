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
                
                String host = System.getenv("AVIAN_DB_HOST");
                String port = System.getenv("AVIAN_DB_PORT");
                String database = System.getenv("AVIAN_DB_NAME");
                String username = System.getenv("AVIAN_DB_USER");
                String password = System.getenv("AVIAN_DB_PASSWORD");
                
                String url = "jdbc:mysql://" + host + ":" + port + "/" + database
                        + "?sslMode=REQUIRED";
                
                // create a connection
                con = DriverManager.getConnection(url,username , password);
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
