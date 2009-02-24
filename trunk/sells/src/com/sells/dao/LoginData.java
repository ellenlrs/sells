package com.sells.dao;



/**
 * LoginData generated by MyEclipse - Hibernate Tools
 */

public class LoginData  implements java.io.Serializable {


    // Fields    

     private String sellsNo;
     private String loginId;
     private String passwd;
     private String loginTp;


    // Constructors

    /** default constructor */
    public LoginData() {
    }

	/** minimal constructor */
    public LoginData(String sellsNo) {
        this.sellsNo = sellsNo;
    }
    
    /** full constructor */
    public LoginData(String sellsNo, String loginId, String passwd, String loginTp) {
        this.sellsNo = sellsNo;
        this.loginId = loginId;
        this.passwd = passwd;
        this.loginTp = loginTp;
    }

   
    // Property accessors

    public String getSellsNo() {
        return this.sellsNo;
    }
    
    public void setSellsNo(String sellsNo) {
        this.sellsNo = sellsNo;
    }

    public String getLoginId() {
        return this.loginId;
    }
    
    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public String getPasswd() {
        return this.passwd;
    }
    
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getLoginTp() {
        return this.loginTp;
    }
    
    public void setLoginTp(String loginTp) {
        this.loginTp = loginTp;
    }
   








}