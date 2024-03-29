/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sells.struts.action;

import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionServlet;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sells.dao.Orders;
import com.sells.dao.OrdersItem;
import com.sells.dao.Sells;
import com.sells.service.imp.SellsService;

/** 
 * MyEclipse Struts
 * Creation date: 12-05-2008
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class PaymentFinalAction extends Action {
  private SellsService sellsService ;
  private Log log = LogFactory.getLog(PaymentReceiveAction.class);
  private ServletContext servletContext;
  
  /* (non-Javadoc)
   * @see org.apache.struts.action.Action#setServlet(org.apache.struts.action.ActionServlet)
   */
  public void setServlet(ActionServlet actionServlet) {
      super.setServlet(actionServlet);
      servletContext = actionServlet.getServletContext();
      WebApplicationContext wac = WebApplicationContextUtils
              .getRequiredWebApplicationContext(servletContext);
      this.sellsService =  (SellsService) wac.getBean("sellsService");
  }

  /** 
   * Method execute
   * @param mapping
   * @param form
   * @param request
   * @param response
   * @return ActionForward
   */
  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    String checksum = StringUtils.defaultString(request.getParameter("checksum"));
    String orderNo = StringUtils.defaultString(request.getParameter("orderNo"));
    StringBuffer sb = new StringBuffer();
    log.info("PaymentFinal start receive:");
    log.info("checksum:"+checksum);
    log.info("orderNo:"+orderNo);
    
    try {
      Orders vo = sellsService.getOrdersById(orderNo);
      Collection orderItem = sellsService.findOrdersItemById(orderNo);
      Sells sells = sellsService.findSellsById(vo.getSellsNo());
      
      sb.append(orderNo).append(vo.getSellsNo()).append("iCart856069");
      String icartChecksum = DigestUtils.md5Hex(sb.toString());
      log.info("icartChecksum:"+icartChecksum);
      if (! icartChecksum.equals(checksum)) 
        throw new Exception ("檢查碼錯誤") ;
      StringBuffer items = new StringBuffer();
      Iterator iter = orderItem.iterator();
      while (iter.hasNext()) {
        OrdersItem oi = (OrdersItem) iter.next();
        items.append(oi.getItemNo()).append("  ").append(oi.getItemNm());
        if (StringUtils.isNotBlank(oi.getItemSpec1()) || StringUtils.isNotBlank(oi.getItemSpec2())) {
          items.append("(").append(oi.getItemSpec1()).append("、").append(oi.getItemSpec2()).append(")");
        }
        items.append("數量:").append(oi.getQty()).append(" 單價").append(oi.getPrice()).append(" 元");
        items.append(" 小計:").append(oi.getQty()*oi.getPrice()).append(" 元");
        items.append("<BR>");
      }
      items.append("<BR>運費金額:").append(vo.getFreightfar()).append("元<BR>");
//      items.append("<BR>貨到付款金額:").append(vo.getProcess()).append("元<BR>");
      items.append("<BR>商品金額:").append(vo.getAmt()).append("元<BR>");
      items.append("<BR>購物總金額:").append(vo.getFreightfar()+vo.getAmt()+vo.getProcess()).append("元<BR>");
     
      sb = null ;
      
      request.setAttribute("orderItem", items.toString());
      request.setAttribute("orders", vo);
      request.setAttribute("sells", sells);
      return mapping.findForward("success");
    } catch (Exception e) {
      log.info("e:"+e.toString());
      return mapping.findForward("fail-check");
    }
  }
}