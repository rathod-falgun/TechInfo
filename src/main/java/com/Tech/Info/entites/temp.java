package com.Tech.Info.entites;

public class temp {
	public static void main(String[]args) {
		System.out.println("HOST = " + System.getenv("AVIAN_DB_HOST"));
		System.out.println("PORT = " + System.getenv("AVIAN_DB_PORT"));
		System.out.println("DB = " + System.getenv("AVIAN_DB_NAME"));
		System.out.println("USER = " + System.getenv("AVIAN_DB_USER"));
	}
}
