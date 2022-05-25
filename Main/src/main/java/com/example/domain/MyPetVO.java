package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MyPetVO {
	private int mpno;
	private String mptitle;
	private String mpcontent;
	private String mpwriter;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone="Asia/Seoul")	
	private Date mpregdate;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone="Asia/Seoul")	
	private Date mpupdatedate;
	private String mpimage;
	private String uimage;
	private int mpcount;
	private String likeImg;
	
	public String getLikeImg() {
		return likeImg;
	}
	public void setLikeImg(String likeImg) {
		this.likeImg = likeImg;
	}
	public int getMpcount() {
		return mpcount;
	}
	public void setMpcount(int mpcount) {
		this.mpcount = mpcount;
	}
	public String getUimage() {
		return uimage;
	}
	public void setUimage(String uimage) {
		this.uimage = uimage;
	}
	public int getMpno() {
		return mpno;
	}
	public void setMpno(int mpno) {
		this.mpno = mpno;
	}
	public String getMptitle() {
		return mptitle;
	}
	public void setMptitle(String mptitle) {
		this.mptitle = mptitle;
	}
	public String getMpcontent() {
		return mpcontent;
	}
	public void setMpcontent(String mpcontent) {
		this.mpcontent = mpcontent;
	}
	public String getMpwriter() {
		return mpwriter;
	}
	public void setMpwriter(String mpwriter) {
		this.mpwriter = mpwriter;
	}
	public Date getMpregdate() {
		return mpregdate;
	}
	public void setMpregdate(Date mpregdate) {
		this.mpregdate = mpregdate;
	}
	public Date getMpupdatedate() {
		return mpupdatedate;
	}
	public void setMpupdatedate(Date mpupdatedate) {
		this.mpupdatedate = mpupdatedate;
	}
	public String getMpimage() {
		return mpimage;
	}
	public void setMpimage(String mpimage) {
		this.mpimage = mpimage;
	}
	
	@Override
	public String toString() {
		return "MyPetVO [mpno=" + mpno + ", mptitle=" + mptitle + ", mpcontent=" + mpcontent + ", mpwriter=" + mpwriter
				+ ", mpregdate=" + mpregdate + ", mpupdatedate=" + mpupdatedate + ", mpimage=" + mpimage + "]";
	}
	
	
}
