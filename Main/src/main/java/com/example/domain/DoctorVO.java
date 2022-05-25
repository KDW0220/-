package com.example.domain;



public class DoctorVO {
	private String did;
	private String dpass;
	private String dname;
	private String dnickname;
	private String dhospital;
	private String demail;
	private String dphone;
	private String dtel;
	private String daddress1;
	private String daddress2;
	private String dimage;
	
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getDpass() {
		return dpass;
	}
	public void setDpass(String dpass) {
		this.dpass = dpass;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDnickname() {
		return dnickname;
	}
	public void setDnickname(String dnickname) {
		this.dnickname = dnickname;
	}
	public String getDhospital() {
		return dhospital;
	}
	public void setDhospital(String dhospital) {
		this.dhospital = dhospital;
	}
	public String getDemail() {
		return demail;
	}
	public void setDemail(String demail) {
		this.demail = demail;
	}
	public String getDphone() {
		return dphone;
	}
	public void setDphone(String dphone) {
		this.dphone = dphone;
	}
	public String getDtel() {
		return dtel;
	}
	public void setDtel(String dtel) {
		this.dtel = dtel;
	}
	public String getDaddress1() {
		return daddress1;
	}
	public void setDaddress1(String daddress1) {
		this.daddress1 = daddress1;
	}
	public String getDaddress2() {
		return daddress2;
	}
	public void setDaddress2(String daddress2) {
		this.daddress2 = daddress2;
	}
	public String getDimage() {
		return dimage;
	}
	public void setDimage(String dimage) {
		this.dimage = dimage;
	}
	@Override
	public String toString() {
		return "HUserVO [did=" + did + ", dpass=" + dpass + ", dname=" + dname + ", dnickname=" + dnickname
				+ ", dhospital=" + dhospital + ", demail=" + demail + ", dphone=" + dphone + ", dtel=" + dtel
				+ ", daddress1=" + daddress1 + ", daddress2=" + daddress2 + ", dimage=" + dimage + "]";
	}
	
}
