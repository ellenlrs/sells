package com.sells.dao;

import java.util.Date;


/**
 * OrdersMsg generated by MyEclipse - Hibernate Tools
 */

public class OrdersMsg  implements java.io.Serializable {


    // Fields    

     private OrdersMsgId id;
     private String message;
     private String messSt;
     private Date messDt;
     private String messName;


    // Constructors

    /** default constructor */
    public OrdersMsg() {
    }

	/** minimal constructor */
    public OrdersMsg(OrdersMsgId id) {
        this.id = id;
    }
    
    /** full constructor */
    public OrdersMsg(OrdersMsgId id, String message, String messSt, Date messDt, String messName) {
        this.id = id;
        this.message = message;
        this.messSt = messSt;
        this.messDt = messDt;
        this.messName = messName;
    }

   
    // Property accessors

    public OrdersMsgId getId() {
        return this.id;
    }
    
    public void setId(OrdersMsgId id) {
        this.id = id;
    }

    public String getMessage() {
        return this.message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessSt() {
        return this.messSt;
    }
    
    public void setMessSt(String messSt) {
        this.messSt = messSt;
    }

    public Date getMessDt() {
        return this.messDt;
    }
    
    public void setMessDt(Date messDt) {
        this.messDt = messDt;
    }

    public String getMessName() {
        return this.messName;
    }
    
    public void setMessName(String messName) {
        this.messName = messName;
    }
   








}