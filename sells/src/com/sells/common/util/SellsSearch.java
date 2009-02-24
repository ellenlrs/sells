package com.sells.common.util;

import com.sells.dao.LoginData;
import com.sells.dao.Sells;

/**
 * @author Davide
 *
 */
public class SellsSearch {
  private int size ;
  private int pageSize ;
  private int pages;
  private String sort ;
  private String asc ;
  private String loginId ;
  private String sellsNo ;
  private String sellsNm ;
  private String storeNm ;
  private String email ;
  private String expiredDt ;
  private String sellsLv ;
  private Sells[] sellsList ;
  private LoginData[] loginDataList ;

  public String getAsc() {
    return asc;
  }
  public void setAsc(String asc) {
    this.asc = asc;
  }
  public String getExpiredDt() {
    return expiredDt;
  }
  public void setExpiredDt(String expiredDt) {
    this.expiredDt = expiredDt;
  }
  public String getLoginId() {
    return loginId;
  }
  public void setLoginId(String loginId) {
    this.loginId = loginId;
  }
  public int getPages() {
    return pages;
  }
  public void setPages(int pages) {
    this.pages = pages;
  }
  public int getPageSize() {
    return pageSize;
  }
  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }
  public String getSellsLv() {
    return sellsLv;
  }
  public void setSellsLv(String sellsLv) {
    this.sellsLv = sellsLv;
  }
  public String getSellsNm() {
    return sellsNm;
  }
  public void setSellsNm(String sellsNm) {
    this.sellsNm = sellsNm;
  }
  public String getSellsNo() {
    return sellsNo;
  }
  public void setSellsNo(String sellsNo) {
    this.sellsNo = sellsNo;
  }
  public int getSize() {
    return size;
  }
  public void setSize(int size) {
    this.size = size;
  }
  public String getSort() {
    return sort;
  }
  public void setSort(String sort) {
    this.sort = sort;
  }
  public String getStoreNm() {
    return storeNm;
  }
  public void setStoreNm(String storeNm) {
    this.storeNm = storeNm;
  }
  public LoginData[] getLoginDataList() {
    return loginDataList;
  }
  public void setLoginDataList(LoginData[] loginDataList) {
    this.loginDataList = loginDataList;
  }
  public Sells[] getSellsList() {
    return sellsList;
  }
  public void setSellsList(Sells[] sellsList) {
    this.sellsList = sellsList;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }

}
