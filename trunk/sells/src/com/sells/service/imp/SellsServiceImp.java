package com.sells.service.imp;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sells.common.mail.Mail;
import com.sells.common.mail.MailBean;
import com.sells.common.util.DateUtils;
import com.sells.common.util.EcServer;
import com.sells.common.util.PageControl;
import com.sells.common.util.SellsSearch;
import com.sells.dao.LoginData;
import com.sells.dao.LoginDataDAO;
import com.sells.dao.LoginRec;
import com.sells.dao.LoginRecDAO;
import com.sells.dao.Orders;
import com.sells.dao.OrdersDAO;
import com.sells.dao.OrdersItem;
import com.sells.dao.OrdersItemDAO;
import com.sells.dao.OrdersItemId;
import com.sells.dao.OrdersMsg;
import com.sells.dao.OrdersMsgDAO;
import com.sells.dao.OrdersMsgId;
import com.sells.dao.Sells;
import com.sells.dao.SellsDAO;
import com.sells.dao.SellsRecDAO;
import com.sells.search.OrdersSearch;

public class SellsServiceImp implements SellsService {
  private final Log log = LogFactory.getLog(SellsServiceImp.class);
  private LoginDataDAO loginDataDAO;
  private LoginRecDAO loginRecDAO;
  private SellsDAO sellsDAO;
  private SellsRecDAO sellsRecDAO;
  private OrdersDAO ordersDAO;
  private OrdersItemDAO ordersItemDAO;
  private OrdersMsgDAO ordersMsgDAO;

  public OrdersItemDAO getOrdersItemDAO() {
    return ordersItemDAO;
  }

  public void setOrdersItemDAO(OrdersItemDAO ordersItemDAO) {
    this.ordersItemDAO = ordersItemDAO;
  }

  public OrdersDAO getOrdersDAO() {
    return ordersDAO;
  }

  public void setOrdersDAO(OrdersDAO ordersDAO) {
    this.ordersDAO = ordersDAO;
  }

  public LoginData findLoginDataBySellsNo(String sellsNo) throws Exception {
    LoginData vo = loginDataDAO.findById(sellsNo);
    return vo;
  }

  public LoginData findLoginDataByLoginId(String loginId, String loginTp,
      String passwd, String remoteIp) throws Exception {
    LoginData vo = loginDataDAO.findLoginDataById(loginId, loginTp);
    if (vo == null) {
      throw new Exception("帳號密碼錯誤-1！");
    } else if (vo.getPasswd().equals(passwd)) {
      // 寫登入記錄
      LoginRec logRec = new LoginRec();
      logRec.setLoginDt(new java.util.Date());
      logRec.setLoginIp(remoteIp);
      logRec.setSellsNo(vo.getSellsNo());
      loginRecDAO.save(logRec);
      return vo;
    } else {
      throw new Exception("帳號密碼錯誤-2！");
    }
  }

  public Sells findSellsById(String sellsNo) throws Exception {
    Sells vo = sellsDAO.findById(sellsNo);
    if (vo == null) {
      throw new Exception("找無此商家資料！");
    } else {
      return vo;
    }
  }

  public Orders saveOrders(Orders vo) throws Exception {
    ordersDAO.save(vo);
    return vo;
  }

  public Orders saveOrders(Orders vo, ArrayList<OrdersItem> items)
      throws Exception {
    try {
      vo = ordersDAO.save(vo);
      int i = 0;
      for (OrdersItem obj : items) {
        i++;
        OrdersItemId id = new OrdersItemId();
        id.setOrderNo(vo.getOrderNo());
        id.setSeqno(i);
        obj.setId(id);
        ordersItemDAO.save(obj);
      }
      return vo;
    } catch (Exception e) {
      throw new Exception("訂單寫入失敗！" + e.getMessage());
    }
  }

  public Sells saveSells(Sells sellsvo, LoginData loginvo) throws Exception {
    LoginData loginTmp = new LoginData();
    loginTmp.setLoginId(loginvo.getLoginId());
    loginTmp.setLoginTp(loginvo.getLoginTp());
    List list = loginDataDAO.findByExample(loginTmp);
    if (list.size() > 0) {
      throw new Exception("帳號重覆！");
    } else {
      sellsDAO.save(sellsvo);
      loginvo.setSellsNo(sellsvo.getSellsNo());
      loginDataDAO.save(loginvo);
      return sellsvo;
    }
  }

  public Collection findSellsByVo(SellsSearch search) throws Exception {
    try {
      return sellsDAO.findSells(search);
    } catch (Exception e) {
      throw new Exception("查詢錯誤！");
    }
  }

  public LoginData updateLoginData(LoginData vo) throws Exception {
    loginDataDAO.update(vo);
    return vo;
  }

  public boolean updateSells(Sells vo) throws Exception {
    sellsDAO.update(vo);
    return true;
  }

  public LoginDataDAO getLoginDataDAO() {
    return loginDataDAO;
  }

  public void setLoginDataDAO(LoginDataDAO loginDataDAO) {
    this.loginDataDAO = loginDataDAO;
  }

  public LoginRecDAO getLoginRecDAO() {
    return loginRecDAO;
  }

  public void setLoginRecDAO(LoginRecDAO loginRecDAO) {
    this.loginRecDAO = loginRecDAO;
  }

  public SellsDAO getSellsDAO() {
    return sellsDAO;
  }

  public void setSellsDAO(SellsDAO sellsDAO) {
    this.sellsDAO = sellsDAO;
  }

  public SellsRecDAO getSellsRecDAO() {
    return sellsRecDAO;
  }

  public void setSellsRecDAO(SellsRecDAO sellsRecDAO) {
    this.sellsRecDAO = sellsRecDAO;
  }

  public SellsSearch findSellsSearch(SellsSearch search) throws Exception {
    // 排序的設定
    if (StringUtils.defaultString(search.getSort()).equals("sellsNo")
        || StringUtils.defaultString(search.getSort()).equals("sells_no")) {
      search.setSort("Sells.sells_no");
    } else if (StringUtils.defaultString(search.getSort()).equals("expiredDt")
        || StringUtils.defaultString(search.getSort()).toLowerCase()
            .equals("expired_dt")) {
      search.setSort("Sells.expired_dt");
    } else {
      search.setSort("Sells.sells_no");
    }
    // 排序的方式
    if (!(StringUtils.defaultString(search.getAsc()).toUpperCase()
        .equals("ASC") || StringUtils.defaultString(search.getAsc())
        .toUpperCase().equals("DESC"))) {
      search.setAsc("asc");
    }
    search.setSize(sellsDAO.findSellsSearchSize(search));
    /*
     * if ( search.getSize() > 30 && search.getPageSize() < 1 ){
     * search.setPageSize(30) ; if (search.getPages()> 0) { search.setPages(0)
     * ;//預設第一頁 } }
     */
    if (search.getSize() > 0) {
      List list = sellsDAO.findSellsSearch(search);
      Sells[] sells = new Sells[list.size()];
      LoginData[] loginData = new LoginData[list.size()];
      for (int i = 0; i < list.size(); i++) {
        sells[i] = new Sells();
        loginData[i] = new LoginData();
        Object[] obj = (Object[]) list.get(i);
        sells[i] = (Sells) obj[1];
        loginData[i] = (LoginData) obj[0];
      }
      search.setSellsList(sells);
      search.setLoginDataList(loginData);
    }
    return search;
  }

  public void expiryNotice() throws Exception {
    SellsSearch seSearch = new SellsSearch();
    seSearch.setExpiredDt(DateUtils.getTodayAddDays(5, "yyyy/MM") + "/%");
    List list = sellsDAO.findSellsSearch(seSearch);
    Sells admin = findSellsById(EcServer.getAdminNo());
    for (int i = 0; i < list.size(); i++) {
      Object[] obj = (Object[]) list.get(i);
      Sells sellsvo = (Sells) obj[1];
      StringBuffer sb = new StringBuffer();
      sb.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
      sb.append("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
      sb.append("<head>");
      sb.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
      sb.append("<title> ").append(sellsvo.getSellsNm())
          .append(" 即將到期通知信</title>");
      sb.append("</head>");
      sb.append("");
      sb.append("<body>");
      sb.append("<p><br />");
      sb.append("  親愛的 ").append(sellsvo.getSellsNm()).append(" 您好：");
      sb.append("  <br />");
      sb.append("</p>");
      sb.append("您的帳號將於：").append(sellsvo.getExpiredDt()).append("到期，");
      sb.append("您的帳號等級：<font color='#FF3300'>");
      if (sellsvo.getSellsLv().equals("T")) {
        sb.append("試用會員");
      } else if (sellsvo.getSellsLv().equals("R")) {
        sb.append("正式會員");
      }
      // sb.append(sellsvo.getSellsLv()).append(" <br />");
      sb.append("</font>，若您確定繼續使用，請登入系統後，點選<font color='#FF3300'>購買延長</font>服務。<br />");
      sb.append("</p><p>感謝您使用本服務。<br />");
      sb.append("  <br />");
      sb.append("若有任何問題請到<a href=\"").append(admin.getHomepage())
          .append("/Sells/help.jsp\">問題反應區</a>與站長聯絡。<br />");
      sb.append("<br />");
      sb.append("站長敬上。</p>");
      sb.append("<p><a href=\"").append(admin.getHomepage()).append("\">")
          .append(admin.getStoreNm()).append("</a></p>");
      sb.append("</body>");
      sb.append("</html>");
      MailBean mailBean = new MailBean();
      mailBean.setFrom(admin.getEmail());
      mailBean.setFromName(admin.getSellsNm());
      mailBean.setTo(sellsvo.getEmail());
      // mailBean.setTo("jinwei.lin@gmail.com");
      mailBean.setToName(sellsvo.getSellsNm());
      mailBean.setBcc(admin.getEmail());
      if ("S0000000136".equals(sellsvo.getSellsNo())) {
        mailBean.setMailServer("msa.hinet.net");
      } else {
        mailBean.setMailServer(EcServer.getMailServer());
      }
      mailBean.setSubject(admin.getStoreNm() + " - 即將到期通知信");
      mailBean.setBody(sb.toString());
      mailBean.setCharset("UTF-8");
      try {
        Mail mail = new Mail(mailBean);
      } catch (Exception e) {
        log.info("GetPasswdAction mail e:" + e.getMessage());
      }
    }
  }

  // 查詢訂單基本資料
  public Orders getOrdersById(String ordersNo, String sellsNo, String memberNo) {
    return ordersDAO.getOrdersById(ordersNo, sellsNo, memberNo);
  }

  /**
   * 訂單查詢
   * 
   * @param search
   * @param control
   * @return
   */
  public Collection<Orders> findOrdersSearch(OrdersSearch search,
      PageControl control) {
    return ordersDAO.findOrdersSearch(search, control);
  }

  /**
   * 訂單查詢筆數
   * 
   * @param search
   * @return
   */
  public int findOrdersSearchSize(OrdersSearch search) {
    return ordersDAO.findOrdersSearchSize(search);
  }

  /**
   * 取得訂單明細
   * 
   * @param orderNo
   * @return
   */
  public Collection findOrdersItemById(String orderNo) {
    return ordersItemDAO.findByProperty("id.orderNo", orderNo);
  }

  public OrdersMsgDAO getOrdersMsgDAO() {
    return ordersMsgDAO;
  }

  public void setOrdersMsgDAO(OrdersMsgDAO ordersMsgDAO) {
    this.ordersMsgDAO = ordersMsgDAO;
  }

  /**
   * 修改訂單
   * 
   * @param vo
   */
  public boolean updateOrders(Orders vo) throws Exception {
    try {
      ordersDAO.update(vo);
      return true;
    } catch (Exception e) {
      throw new Exception("訂單寫入失敗:" + e.getMessage());
    }
  }

  /**
   * 新增
   * 
   * @param vo
   */
  public void saveOrdersMsg(OrdersMsg vo, String orderNo) throws Exception {
    try {
      OrdersMsgId id = new OrdersMsgId();
      id.setOrderNo(orderNo);
      id.setSeq(ordersMsgDAO.findMaxSeq(orderNo));
      vo.setId(id);
      ordersMsgDAO.save(vo);
    } catch (Exception e) {
      throw new Exception("留言失敗:" + e.getMessage());
    }
  }

  /**
   * 新增
   * 
   * @param vo
   */
  public void saveOrdersMsg(OrdersMsg vo, String orderNo, Orders ovo)
      throws Exception {
    try {
      OrdersMsgId id = new OrdersMsgId();
      id.setOrderNo(orderNo);
      id.setSeq(ordersMsgDAO.findMaxSeq(orderNo));
      vo.setId(id);
      ordersDAO.update(ovo);
      ordersMsgDAO.save(vo);
    } catch (Exception e) {
      throw new Exception("留言失敗:" + e.getMessage());
    }
  }

  /**
   * 修改留言狀態
   * 
   * @param id
   * @param st
   * @return
   */
  public boolean saveOrdersMsg(OrdersMsgId id, String st) throws Exception {
    try {
      OrdersMsg vo = ordersMsgDAO.findById(id);
      vo.setMessSt(st);
      ordersMsgDAO.update(vo);
      return true;
    } catch (Exception e) {
      throw new Exception("修改失敗:" + e.getMessage());
    }
  }

  /**
   * 查詢留言內容
   * 
   * @param orderNo
   * @param st
   * @return
   */
  public Collection findOrdersMsg(String orderNo, String st) {
    return ordersMsgDAO.findBySt(orderNo, st);
  }

  public Orders getOrdersById(String ordersNo) {
    return ordersDAO.findById(ordersNo);
  }
}
