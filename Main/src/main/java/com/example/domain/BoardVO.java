package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardVO {//ÀÚ¹Ùºó(Bean)
	private int bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")	
	private Date bregdate;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")	
	private Date bupdatedate;
	private String bcount;
	private String bcategory;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public Date getBregdate() {
		return bregdate;
	}
	public void setBregdate(Date bregdate) {
		this.bregdate = bregdate;
	}
	public Date getBupdatedate() {
		return bupdatedate;
	}
	public void setBupdatedate(Date bupdatedate) {
		this.bupdatedate = bupdatedate;
	}
	public String getBcount() {
		return bcount;
	}
	public void setBcount(String bcount) {
		this.bcount = bcount;
	}
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bwriter=" + bwriter
				+ ", bregdate=" + bregdate + ", bupdatedate=" + bupdatedate + ", bcount=" + bcount + ", bcategory="
				+ bcategory + "]";
	}
	
	
}