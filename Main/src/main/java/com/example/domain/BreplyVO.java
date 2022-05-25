package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BreplyVO {
	private int brno;
	private int bno;
	private String brreply;
	private String brreplyer;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")	
	private Date brreplydate;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")	
	private Date brupdatedate;
	public int getBrno() {
		return brno;
	}
	public void setBrno(int brno) {
		this.brno = brno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBrreply() {
		return brreply;
	}
	public void setBrreply(String brreply) {
		this.brreply = brreply;
	}
	public String getBrreplyer() {
		return brreplyer;
	}
	public void setBrreplyer(String brreplyer) {
		this.brreplyer = brreplyer;
	}
	public Date getBrreplydate() {
		return brreplydate;
	}
	public void setBrreplydate(Date brreplyDate) {
		this.brreplydate = brreplyDate;
	}
	public Date getBrupdatedate() {
		return brupdatedate;
	}
	public void setBrupdatedate(Date brupdateDate) {
		this.brupdatedate = brupdateDate;
	}
	
	@Override
	public String toString() {
		return "BreplyVO [brno=" + brno + ", bno=" + bno + ", brreply=" + brreply + ", brreplyer=" + brreplyer
				+ ", brreplydate=" + brreplydate + ", brupdatedate=" + brupdatedate + "]";
	}	
}
