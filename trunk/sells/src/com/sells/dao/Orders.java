package com.sells.dao;

import java.util.Date;

/**
 * Orders entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Orders implements java.io.Serializable {
  // Fields
  private String orderNo;
  private String sellsNo;
  private Date orderDt;
  private String ip;
  private String name;
  private String email;
  private String tel;
  private String mobile;
  private String zip;
  private String address;
  private String memberNo;
  private String descTxt;
  private String payTp;
  private String exportAccount;
  private String orderSt;
  private String logisticDesc;
  private String sslNo;
  private Integer amt;
  private String prc;
  private String src;
  private String approveCode;
  private String bankRc;
  private String batchNumber;
  private Integer process;
  private Integer freightfar;
  private String cardNumber;
  private String issueBank;
  private String engName;
  private String createDt;
  private String modiDt;
  private String tsr;
  private String payno;
  private String expireDate;
  private String expireTime;
  private String procDate;

  public String getProcDate() {
    return procDate;
  }

  public void setProcDate(String procDate) {
    this.procDate = procDate;
  }

  public String getProcTime() {
    return procTime;
  }

  public void setProcTime(String procTime) {
    this.procTime = procTime;
  }

  private String procTime;
  private String payfrom;

  public String getTsr() {
    return tsr;
  }

  public void setTsr(String tsr) {
    this.tsr = tsr;
  }

  public String getPayfrom() {
    return payfrom;
  }

  public void setPayfrom(String payfrom) {
    this.payfrom = payfrom;
  }

  public String getPayno() {
    return payno;
  }

  public void setPayno(String payno) {
    this.payno = payno;
  }

  public String getExpireDate() {
    return expireDate;
  }

  public void setExpireDate(String expireDate) {
    this.expireDate = expireDate;
  }

  public String getExpireTime() {
    return expireTime;
  }

  public void setExpireTime(String expireTime) {
    this.expireTime = expireTime;
  }

  // Constructors
  /** default constructor */
  public Orders() {
  }

  /** minimal constructor */
  public Orders(String orderNo) {
    this.orderNo = orderNo;
  }

  /** full constructor */
  public Orders(String orderNo, String sellsNo, Date orderDt, String ip,
      String name, String email, String tel, String mobile, String zip,
      String address, String memberNo, String descTxt, String payTp,
      String exportAccount, String orderSt, String logisticDesc, String sslNo,
      Integer amt, String prc, String src, String approveCode, String bankRc,
      String batchNumber, Integer process, Integer freightfar,
      String cardNumber, String issueBank, String engName, String createDt,
      String modiDt) {
    this.orderNo = orderNo;
    this.sellsNo = sellsNo;
    this.orderDt = orderDt;
    this.ip = ip;
    this.name = name;
    this.email = email;
    this.tel = tel;
    this.mobile = mobile;
    this.zip = zip;
    this.address = address;
    this.memberNo = memberNo;
    this.descTxt = descTxt;
    this.payTp = payTp;
    this.exportAccount = exportAccount;
    this.orderSt = orderSt;
    this.logisticDesc = logisticDesc;
    this.sslNo = sslNo;
    this.amt = amt;
    this.prc = prc;
    this.src = src;
    this.approveCode = approveCode;
    this.bankRc = bankRc;
    this.batchNumber = batchNumber;
    this.process = process;
    this.freightfar = freightfar;
    this.cardNumber = cardNumber;
    this.issueBank = issueBank;
    this.engName = engName;
    this.createDt = createDt;
    this.modiDt = modiDt;
  }

  // Property accessors
  public String getOrderNo() {
    return this.orderNo;
  }

  public void setOrderNo(String orderNo) {
    this.orderNo = orderNo;
  }

  public String getSellsNo() {
    return this.sellsNo;
  }

  public void setSellsNo(String sellsNo) {
    this.sellsNo = sellsNo;
  }

  public Date getOrderDt() {
    return this.orderDt;
  }

  public void setOrderDt(Date orderDt) {
    this.orderDt = orderDt;
  }

  public String getIp() {
    return this.ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return this.email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getTel() {
    return this.tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getMobile() {
    return this.mobile;
  }

  public void setMobile(String mobile) {
    this.mobile = mobile;
  }

  public String getZip() {
    return this.zip;
  }

  public void setZip(String zip) {
    this.zip = zip;
  }

  public String getAddress() {
    return this.address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getMemberNo() {
    return this.memberNo;
  }

  public void setMemberNo(String memberNo) {
    this.memberNo = memberNo;
  }

  public String getDescTxt() {
    return this.descTxt;
  }

  public void setDescTxt(String descTxt) {
    this.descTxt = descTxt;
  }

  public String getPayTp() {
    return this.payTp;
  }

  public void setPayTp(String payTp) {
    this.payTp = payTp;
  }

  public String getExportAccount() {
    return this.exportAccount;
  }

  public void setExportAccount(String exportAccount) {
    this.exportAccount = exportAccount;
  }

  public String getOrderSt() {
    return this.orderSt;
  }

  public void setOrderSt(String orderSt) {
    this.orderSt = orderSt;
  }

  public String getLogisticDesc() {
    return this.logisticDesc;
  }

  public void setLogisticDesc(String logisticDesc) {
    this.logisticDesc = logisticDesc;
  }

  public String getSslNo() {
    return this.sslNo;
  }

  public void setSslNo(String sslNo) {
    this.sslNo = sslNo;
  }

  public Integer getAmt() {
    return this.amt;
  }

  public void setAmt(Integer amt) {
    this.amt = amt;
  }

  public String getPrc() {
    return this.prc;
  }

  public void setPrc(String prc) {
    this.prc = prc;
  }

  public String getSrc() {
    return this.src;
  }

  public void setSrc(String src) {
    this.src = src;
  }

  public String getApproveCode() {
    return this.approveCode;
  }

  public void setApproveCode(String approveCode) {
    this.approveCode = approveCode;
  }

  public String getBankRc() {
    return this.bankRc;
  }

  public void setBankRc(String bankRc) {
    this.bankRc = bankRc;
  }

  public String getBatchNumber() {
    return this.batchNumber;
  }

  public void setBatchNumber(String batchNumber) {
    this.batchNumber = batchNumber;
  }

  public Integer getProcess() {
    return this.process;
  }

  public void setProcess(Integer process) {
    this.process = process;
  }

  public Integer getFreightfar() {
    return this.freightfar;
  }

  public void setFreightfar(Integer freightfar) {
    this.freightfar = freightfar;
  }

  public String getCardNumber() {
    return this.cardNumber;
  }

  public void setCardNumber(String cardNumber) {
    this.cardNumber = cardNumber;
  }

  public String getIssueBank() {
    return this.issueBank;
  }

  public void setIssueBank(String issueBank) {
    this.issueBank = issueBank;
  }

  public String getEngName() {
    return this.engName;
  }

  public void setEngName(String engName) {
    this.engName = engName;
  }

  public String getCreateDt() {
    return this.createDt;
  }

  public void setCreateDt(String createDt) {
    this.createDt = createDt;
  }

  public String getModiDt() {
    return this.modiDt;
  }

  public void setModiDt(String modiDt) {
    this.modiDt = modiDt;
  }
}