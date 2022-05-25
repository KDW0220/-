package com.example.domain;

public class SymptomVO {
	private String stype;
	private String stitle;
	private String scontent;
	private String simg;
	private int sno;
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getScontent() {
		return scontent;
	}
	public void setScontent(String scontent) {
		this.scontent = scontent;
	}
	public String getSimg() {
		return simg;
	}
	public void setSimg(String simg) {
		this.simg = simg;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	@Override
	public String toString() {
		return "SymptomVO [stype=" + stype + ", stitle=" + stitle + ", scontent=" + scontent + ", simg=" + simg
				+ ", sno=" + sno + "]";
	}
	
}
