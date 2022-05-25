package com.example.domain;

public class DogVO {
	private int id;
	private String dtitle;
	private String dimage;
	private String dcontent;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDtitle() {
		return dtitle;
	}
	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}
	public String getDimage() {
		return dimage;
	}
	public void setDimage(String dimage) {
		this.dimage = dimage;
	}
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	@Override
	public String toString() {
		return "DogVO [id=" + id + ", dtitle=" + dtitle + ", dimage=" + dimage + ", dcontent=" + dcontent + "]";
	}
	
}
