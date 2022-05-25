package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QnaVO {
	private int qno;
	private String qtitle; 
	private String qwriter;
	private String qcontent;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date qdate;
	private String qstatus;
	
	public String getQstatus() {
		return qstatus;
	}
	public void setQstatus(String qstatus) {
		this.qstatus = qstatus;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQwriter() {
		return qwriter;
	}
	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	@Override
	public String toString() {
		return "QnaVO [qno=" + qno + ", qtitle=" + qtitle + ", qwriter=" + qwriter + ", qcontent=" + qcontent
				+ ", qdate=" + qdate + "]";
	}
	
	
}
