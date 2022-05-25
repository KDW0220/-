package com.example.domain;

public class HospitalVO {
	private int ano;
	private String atitle;
	private String aaddress;
	private String atel;
	private String atime;
	private String y;
	private String x;
	private String atype;
	
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getAaddress() {
		return aaddress;
	}
	public void setAaddress(String aaddress) {
		this.aaddress = aaddress;
	}
	public String getAtel() {
		return atel;
	}
	public void setAtel(String atel) {
		this.atel = atel;
	}
	public String getAtime() {
		return atime;
	}
	public void setAtime(String atime) {
		this.atime = atime;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getAtype() {
		return atype;
	}
	public void setAtype(String atype) {
		this.atype = atype;
	}
	
	@Override
	public String toString() {
		return "HospitalVO [ano=" + ano + ", atitle=" + atitle + ", aaddress=" + aaddress + ", atel=" + atel
				+ ", atime=" + atime + ", y=" + y + ", x=" + x + ", atype=" + atype + "]";
	}
	
	
}
