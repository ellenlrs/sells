package com.sells.dao;

import java.util.Date;


/**
 * LoginRec generated by MyEclipse - Hibernate Tools
 */

public class LoginRec  implements java.io.Serializable {


    // Fields    

     private String seq;
     private String sellsNo;
     private Date loginDt;
     private String loginIp;


    // Constructors

    /** default constructor */
    public LoginRec() {
    }

	/** minimal constructor */
    public LoginRec(String seq) {
        this.seq = seq;
    }
    
    /** full constructor */
    public LoginRec(String seq, String sellsNo, Date loginDt, String loginIp) {
        this.seq = seq;
        this.sellsNo = sellsNo;
        this.loginDt = loginDt;
        this.loginIp = loginIp;
    }

   
    // Property accessors

    public String getSeq() {
        return this.seq;
    }
    
    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getSellsNo() {
        return this.sellsNo;
    }
    
    public void setSellsNo(String sellsNo) {
        this.sellsNo = sellsNo;
    }

    public Date getLoginDt() {
        return this.loginDt;
    }
    
    public void setLoginDt(Date loginDt) {
        this.loginDt = loginDt;
    }

    public String getLoginIp() {
        return this.loginIp;
    }
    
    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }
   








}