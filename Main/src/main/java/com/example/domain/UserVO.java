package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class UserVO {
	private String uid;
	private String upass;
	private String pass;
	private String upet;
	private String uname;
	private String unickname;
	private String ubirth;
	private String ugender;
	private String uemail;
	private String uphone;
	private String uaddress1;
	private String uaddress2;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date uadoptdate;
	private String uimage;
	   private int manager;
	   private int status;
	   
	   
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getUpet() {
		return upet;
	}
	public void setUpet(String upet) {
		this.upet = upet;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUnickname() {
		return unickname;
	}
	public void setUnickname(String unickname) {
		this.unickname = unickname;
	}
	public String getUbirth() {
		return ubirth;
	}
	public void setUbirth(String ubirth) {
		this.ubirth = ubirth;
	}
	public String getUgender() {
		return ugender;
	}
	public void setUgender(String ugender) {
		this.ugender = ugender;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getUaddress1() {
		return uaddress1;
	}
	public void setUaddress1(String uaddress1) {
		this.uaddress1 = uaddress1;
	}
	public String getUaddress2() {
		return uaddress2;
	}
	public void setUaddress2(String uaddress2) {
		this.uaddress2 = uaddress2;
	}
	public Date getUadoptdate() {
		return uadoptdate;
	}
	public void setUadoptdate(Date uadoptdate) {
		this.uadoptdate = uadoptdate;
	}
	public String getUimage() {
		return uimage;
	}
	public void setUimage(String uimage) {
		this.uimage = uimage;
	}
	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", upass=" + upass + ", upet=" + upet + ", uname=" + uname + ", unickname="
				+ unickname + ", ubirth=" + ubirth + ", ugender=" + ugender + ", uemail=" + uemail + ", uphone="
				+ uphone + ", uaddress1=" + uaddress1 + ", uaddress2=" + uaddress2 + ", uadoptdate=" + uadoptdate
				+ ", uimage=" + uimage + "]";
	}
	
	
	
}
