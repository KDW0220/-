package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BuyVO {
   private String bno;
   private String uid;
   private String btitle;
   private String bname;
   private String bnickname;
   private String bphone;
   private String bemail;
   private String baddress;
   private String bsum;
   private String bimage;
   private String blink;
   @JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
   private Date bdate;
   public String getBno() {
      return bno;
   }
   public void setBno(String bno) {
      this.bno = bno;
   }
   public String getUid() {
      return uid;
   }
   public void setUid(String uid) {
      this.uid = uid;
   }
   public String getBtitle() {
      return btitle;
   }
   public void setBtitle(String btitle) {
      this.btitle = btitle;
   }
   public String getBname() {
      return bname;
   }
   public void setBname(String bname) {
      this.bname = bname;
   }
   public String getBnickname() {
      return bnickname;
   }
   public void setBnickname(String bnickname) {
      this.bnickname = bnickname;
   }
   public String getBphone() {
      return bphone;
   }
   public void setBphone(String bphone) {
      this.bphone = bphone;
   }
   public String getBemail() {
      return bemail;
   }
   public void setBemail(String bemail) {
      this.bemail = bemail;
   }
   public String getBaddress() {
      return baddress;
   }
   public void setBaddress(String baddress) {
      this.baddress = baddress;
   }
   public String getBsum() {
      return bsum;
   }
   public void setBsum(String bsum) {
      this.bsum = bsum;
   }
   public String getBimage() {
      return bimage;
   }
   public void setBimage(String bimage) {
      this.bimage = bimage;
   }
   public String getBlink() {
      return blink;
   }
   public void setBlink(String blink) {
      this.blink = blink;
   }
   public Date getBdate() {
      return bdate;
   }
   public void setBdate(Date bdate) {
      this.bdate = bdate;
   }
   @Override
   public String toString() {
      return "BuyVO [bno=" + bno + ", uid=" + uid + ", btitle=" + btitle + ", bname=" + bname + ", bnickname="
            + bnickname + ", bphone=" + bphone + ", bemail=" + bemail + ", baddress=" + baddress + ", bsum=" + bsum
            + ", bimage=" + bimage + ", blink=" + blink + ", bdate=" + bdate + "]";
   }
   
      
   
}