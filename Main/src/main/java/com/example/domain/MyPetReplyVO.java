package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MyPetReplyVO {
	private int mprno;
	private int mpno;
	private String mpreply;
	private String mpreplyer;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")	
	private Date mpreplydate;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")	
	private Date mpupdatedate;
	private String uimage;
	
	public String getUimage() {
		return uimage;
	}
	public void setUimage(String uimage) {
		this.uimage = uimage;
	}
	public int getMprno() {
		return mprno;
	}
	public void setMprno(int mprno) {
		this.mprno = mprno;
	}
	public int getMpno() {
		return mpno;
	}
	public void setMpno(int mpno) {
		this.mpno = mpno;
	}
	public String getMpreply() {
		return mpreply;
	}
	public void setMpreply(String mpreply) {
		this.mpreply = mpreply;
	}
	public String getMpreplyer() {
		return mpreplyer;
	}
	public void setMpreplyer(String mpreplyer) {
		this.mpreplyer = mpreplyer;
	}
	public Date getMpreplydate() {
		return mpreplydate;
	}
	public void setMpreplydate(Date mpreplydate) {
		this.mpreplydate = mpreplydate;
	}
	public Date getMpupdatedate() {
		return mpupdatedate;
	}
	public void setMpupdatedate(Date mpupdatedate) {
		this.mpupdatedate = mpupdatedate;
	}
	
	@Override
	public String toString() {
		return "MyPetReplyVO [mprno=" + mprno + ", mpno=" + mpno + ", mpreply=" + mpreply + ", mpreplyer=" + mpreplyer
				+ ", mpreplydate=" + mpreplydate + ", mpupdatedate=" + mpupdatedate + "]";
	}
	
	
}
