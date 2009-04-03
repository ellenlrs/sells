package com.sells.dao;

import java.util.Date;

/**
 * Sells entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Sells implements java.io.Serializable {
  // Fields
  private String sellsNo;
  private String sellsNm;
  private String email;
  private String storeNm;
  private String homepage;
  private String payType1;
  private String payType2;
  private String payType3;
  private String payType4;
  private String joinDt;
  private String expiredDt;
  private String logo;
  private String sellsLv;
  private String payDesc;
  private Integer freightFare;
  private String freightTp;
  private Integer nofreightFare;
  private Integer nofreightQty;
  private Integer lowAccount;
  private Date updateDt;
  private String color1;
  private String color2;
  private String colorTp;
  private Integer process;
  private String payType5;
  private String feedbackCode;
  private String sendCode;
  private String storeId;
  private String payTypeNobook;
  private String payType711;
  private String payTypeHilife;
  private String payTypeFamily;

  // Constructors
  /** default constructor */
  public Sells() {
  }

  /** minimal constructor */
  public Sells(String sellsNo) {
    this.sellsNo = sellsNo;
  }

  /** full constructor */
  public Sells(String sellsNo, String sellsNm, String email, String storeNm,
      String homepage, String payType1, String payType2, String payType3,
      String payType4, String joinDt, String expiredDt, String logo,
      String sellsLv, String payDesc, Integer freightFare, String freightTp,
      Integer nofreightFare, Integer nofreightQty, Integer lowAccount,
      Date updateDt, String color1, String color2, String colorTp,
      Integer process, String payType5, String feedbackCode, String sendCode,
      String storeId, String payTypeNobook, String payType711,
      String payTypeHilife, String payTypeFamily) {
    this.sellsNo = sellsNo;
    this.sellsNm = sellsNm;
    this.email = email;
    this.storeNm = storeNm;
    this.homepage = homepage;
    this.payType1 = payType1;
    this.payType2 = payType2;
    this.payType3 = payType3;
    this.payType4 = payType4;
    this.joinDt = joinDt;
    this.expiredDt = expiredDt;
    this.logo = logo;
    this.sellsLv = sellsLv;
    this.payDesc = payDesc;
    this.freightFare = freightFare;
    this.freightTp = freightTp;
    this.nofreightFare = nofreightFare;
    this.nofreightQty = nofreightQty;
    this.lowAccount = lowAccount;
    this.updateDt = updateDt;
    this.color1 = color1;
    this.color2 = color2;
    this.colorTp = colorTp;
    this.process = process;
    this.payType5 = payType5;
    this.feedbackCode = feedbackCode;
    this.sendCode = sendCode;
    this.storeId = storeId;
    this.payTypeNobook = payTypeNobook;
    this.payType711 = payType711;
    this.payTypeHilife = payTypeHilife;
    this.payTypeFamily = payTypeFamily;
  }

  // Property accessors
  public String getSellsNo() {
    return this.sellsNo;
  }

  public void setSellsNo(String sellsNo) {
    this.sellsNo = sellsNo;
  }

  public String getSellsNm() {
    return this.sellsNm;
  }

  public void setSellsNm(String sellsNm) {
    this.sellsNm = sellsNm;
  }

  public String getEmail() {
    return this.email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getStoreNm() {
    return this.storeNm;
  }

  public void setStoreNm(String storeNm) {
    this.storeNm = storeNm;
  }

  public String getHomepage() {
    return this.homepage;
  }

  public void setHomepage(String homepage) {
    this.homepage = homepage;
  }

  public String getPayType1() {
    return this.payType1;
  }

  public void setPayType1(String payType1) {
    this.payType1 = payType1;
  }

  public String getPayType2() {
    return this.payType2;
  }

  public void setPayType2(String payType2) {
    this.payType2 = payType2;
  }

  public String getPayType3() {
    return this.payType3;
  }

  public void setPayType3(String payType3) {
    this.payType3 = payType3;
  }

  public String getPayType4() {
    return this.payType4;
  }

  public void setPayType4(String payType4) {
    this.payType4 = payType4;
  }

  public String getJoinDt() {
    return this.joinDt;
  }

  public void setJoinDt(String joinDt) {
    this.joinDt = joinDt;
  }

  public String getExpiredDt() {
    return this.expiredDt;
  }

  public void setExpiredDt(String expiredDt) {
    this.expiredDt = expiredDt;
  }

  public String getLogo() {
    return this.logo;
  }

  public void setLogo(String logo) {
    this.logo = logo;
  }

  public String getSellsLv() {
    return this.sellsLv;
  }

  public void setSellsLv(String sellsLv) {
    this.sellsLv = sellsLv;
  }

  public String getPayDesc() {
    return this.payDesc;
  }

  public void setPayDesc(String payDesc) {
    this.payDesc = payDesc;
  }

  public Integer getFreightFare() {
    return this.freightFare;
  }

  public void setFreightFare(Integer freightFare) {
    this.freightFare = freightFare;
  }

  public String getFreightTp() {
    return this.freightTp;
  }

  public void setFreightTp(String freightTp) {
    this.freightTp = freightTp;
  }

  public Integer getNofreightFare() {
    return this.nofreightFare;
  }

  public void setNofreightFare(Integer nofreightFare) {
    this.nofreightFare = nofreightFare;
  }

  public Integer getNofreightQty() {
    return this.nofreightQty;
  }

  public void setNofreightQty(Integer nofreightQty) {
    this.nofreightQty = nofreightQty;
  }

  public Integer getLowAccount() {
    return this.lowAccount;
  }

  public void setLowAccount(Integer lowAccount) {
    this.lowAccount = lowAccount;
  }

  public Date getUpdateDt() {
    return this.updateDt;
  }

  public void setUpdateDt(Date updateDt) {
    this.updateDt = updateDt;
  }

  public String getColor1() {
    return this.color1;
  }

  public void setColor1(String color1) {
    this.color1 = color1;
  }

  public String getColor2() {
    return this.color2;
  }

  public void setColor2(String color2) {
    this.color2 = color2;
  }

  public String getColorTp() {
    return this.colorTp;
  }

  public void setColorTp(String colorTp) {
    this.colorTp = colorTp;
  }

  public Integer getProcess() {
    return this.process;
  }

  public void setProcess(Integer process) {
    this.process = process;
  }

  public String getPayType5() {
    return this.payType5;
  }

  public void setPayType5(String payType5) {
    this.payType5 = payType5;
  }

  public String getFeedbackCode() {
    return this.feedbackCode;
  }

  public void setFeedbackCode(String feedbackCode) {
    this.feedbackCode = feedbackCode;
  }

  public String getSendCode() {
    return this.sendCode;
  }

  public void setSendCode(String sendCode) {
    this.sendCode = sendCode;
  }

  public String getStoreId() {
    return this.storeId;
  }

  public void setStoreId(String storeId) {
    this.storeId = storeId;
  }

  public String getPayTypeNobook() {
    return this.payTypeNobook;
  }

  public void setPayTypeNobook(String payTypeNobook) {
    this.payTypeNobook = payTypeNobook;
  }

  public String getPayType711() {
    return this.payType711;
  }

  public void setPayType711(String payType711) {
    this.payType711 = payType711;
  }

  public String getPayTypeHilife() {
    return this.payTypeHilife;
  }

  public void setPayTypeHilife(String payTypeHilife) {
    this.payTypeHilife = payTypeHilife;
  }

  public String getPayTypeFamily() {
    return this.payTypeFamily;
  }

  public void setPayTypeFamily(String payTypeFamily) {
    this.payTypeFamily = payTypeFamily;
  }
}