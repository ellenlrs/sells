package com.sells.service.imp;

import java.util.ArrayList;
import java.util.Collection;

import com.sells.common.util.PageControl;
import com.sells.common.util.SellsSearch;
import com.sells.dao.LoginData;
import com.sells.dao.Orders;
import com.sells.dao.OrdersItem;
import com.sells.dao.OrdersMsg;
import com.sells.dao.OrdersMsgId;
import com.sells.dao.Sells;
import com.sells.search.OrdersSearch;

public interface SellsService {
  /**
   * 修改帳號
   * 
   * @param vo
   * @return
   * @throws Exception
   */
  public LoginData updateLoginData(LoginData vo) throws Exception;

  /**
   * 登入
   * 
   * @param loginId
   * @return
   * @throws Exception
   */
  public LoginData findLoginDataByLoginId(String loginId, String loginTp,
      String passwd, String remoteIp) throws Exception;

  public Orders saveOrders(Orders vo) throws Exception;

  public LoginData findLoginDataBySellsNo(String sellsNo) throws Exception;

  public Orders saveOrders(Orders vo, ArrayList<OrdersItem> items)
      throws Exception;

  // public void findLoginDataSearch(String loginId) throws Exception ;
  /**
   * 新增賣場
   * 
   * @param vo
   * @return
   * @throws Exception
   */
  public Sells saveSells(Sells sellsvo, LoginData loginvo) throws Exception;

  /**
   * 修改Sells
   * 
   * @param vo
   * @return
   * @throws Exception
   */
  public boolean updateSells(Sells vo) throws Exception;

  /**
   * 使用 SellsNo 查詢
   * 
   * @param sellsNo
   * @return
   * @throws Exception
   */
  public Sells findSellsById(String sellsNo) throws Exception;

  public SellsSearch findSellsSearch(SellsSearch search) throws Exception;

  public Collection findSellsByVo(SellsSearch search) throws Exception;

  // 查詢訂單基本資料
  public Orders getOrdersById(String ordersNo, String sellsNo, String memberNo);

  // 查詢訂單基本資料
  public Orders getOrdersById(String ordersNo);

  /**
   * 訂單查詢
   * 
   * @param search
   * @param control
   * @return
   */
  public Collection<Orders> findOrdersSearch(OrdersSearch search,
      PageControl control);

  /**
   * 訂單查詢筆數
   * 
   * @param search
   * @return
   */
  public int findOrdersSearchSize(OrdersSearch search);

  /**
   * 訂單明細
   * 
   * @param orderNo
   * @return
   */
  public Collection findOrdersItemById(String orderNo);

  /**
   * 新增
   * 
   * @param vo
   */
  public void saveOrdersMsg(OrdersMsg vo, String orderNo) throws Exception;

  public void saveOrdersMsg(OrdersMsg vo, String orderNo, Orders ovo)
      throws Exception;

  /**
   * 修改狀態
   * 
   * @param id
   * @param st
   * @return
   */
  public boolean saveOrdersMsg(OrdersMsgId id, String st) throws Exception;

  /**
   * 查詢留言內容
   * 
   * @param orderNo
   * @param st
   * @return
   */
  public Collection findOrdersMsg(String orderNo, String st);

  public boolean updateOrders(Orders vo) throws Exception;
}
