package com.Tech.Info.entites;

import java.time.LocalDateTime;

public class Posts {
	
	private int pid;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pPic;
	private LocalDateTime pDate;
	private int catId;
	private int UserId;
	public Posts(int pid, String pTitle, String pContent, String pCode, String pPic, LocalDateTime pDate, int catId,
			int userId) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.UserId = userId;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public Posts() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Posts(int pid, String pTitle, String pContent, String pCode, String pPic, LocalDateTime pDate, int catId) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
	}
	public Posts(String pTitle, String pContent, String pCode, String pPic, LocalDateTime pDate, int catId , int userId) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.UserId = userId;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public LocalDateTime getpDate() {
		return pDate;
	}
	public void setpDate(LocalDateTime pDate) {
		this.pDate = pDate;
	}
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	
	
	
	
	
	
}
