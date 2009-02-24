package com.sells.dao;

import java.io.Serializable;

public class CarItem implements Serializable{
  private String itemNo ;
  private String itemNm ;
  private String spec1 ;
  private String spec2 ;
  private String price ;
  private String sells ;
  private String qty ;
  private int seqno ;
  
  public String getQty() {
    return qty;
  }
  public void setQty(String qty) {
    this.qty = qty;
  }
  public String getItemNm() {
    return itemNm;
  }
  public void setItemNm(String itemNm) {
    this.itemNm = itemNm;
  }
  public String getItemNo() {
    return itemNo;
  }
  public void setItemNo(String itemNo) {
    this.itemNo = itemNo;
  }
  public String getPrice() {
    return price;
  }
  public void setPrice(String price) {
    this.price = price;
  }
  public String getSells() {
    return sells;
  }
  public void setSells(String sells) {
    this.sells = sells;
  }
  public String getSpec1() {
    return spec1;
  }
  public void setSpec1(String spec1) {
    this.spec1 = spec1;
  }
  public String getSpec2() {
    return spec2;
  }
  public void setSpec2(String spec2) {
    this.spec2 = spec2;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  
}
