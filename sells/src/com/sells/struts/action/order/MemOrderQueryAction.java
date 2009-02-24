/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sells.struts.action.order;

import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionServlet;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sells.common.util.DateUtils;
import com.sells.common.util.HibernatePageAction;
import com.sells.common.util.PageControl;
import com.sells.dao.Orders;
import com.sells.dao.Sells;
import com.sells.search.OrdersSearch;
import com.sells.service.imp.SellsService;

/** 
 * MyEclipse Struts
 * Creation date: 09-07-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class MemOrderQueryAction extends HibernatePageAction {
  private SellsService sellsService ;
  private Log log = LogFactory.getLog(MemOrderQueryAction.class);
  private ServletContext servletContext;
  private String sellsNo = "" ;
  private String memberNo = "" ;
  private String memNm = "" ;
  /* (non-Javadoc)
   * @see org.apache.struts.action.Action#setServlet(org.apache.struts.action.ActionServlet)
   */
  public void setServlet(ActionServlet actionServlet) {
      super.setServlet(actionServlet);
      servletContext = actionServlet.getServletContext();
      WebApplicationContext wac = WebApplicationContextUtils
              .getRequiredWebApplicationContext(servletContext);
      this.sellsService = (SellsService) wac.getBean("sellsService");
  } 

  @Override
  public ActionForward readPage(ActionMapping mapping, HttpServletRequest request, HttpServletResponse response, PageControl pagecontrol) {
    ActionErrors errors = new ActionErrors();
    //1.確認Sells 是否到期
    HttpSession session = request.getSession();
    try {
      this.sellsNo = ObjectUtils.toString(session.getAttribute("icSells"));
      this.memberNo = ObjectUtils.toString(session.getAttribute("icMem"));
      this.memNm = ObjectUtils.toString(session.getAttribute("icMemNm"));
      
//      if (hm ==null ) { //找不到Cookies 
//        errors.add("errMsg", new ActionError("alert.Error","請開啟瀏覽器Cookie,或重新登入"));
//        saveErrors(request, errors);
//        return mapping.findForward("memError");
//      } else {
        if (sellsNo.equals("") || memberNo.equals("")) { //找不到Cookies 
          response.sendRedirect("memSessionEx.do");
          return null;
        } else {
          Sells sells= (Sells) sellsService.findSellsById(sellsNo);
          if (sells == null ) {
            errors.add("errMsg", new ActionError("alert.Error", "登入已過期，請重新登入!"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          } 
          if (sells.getExpiredDt().compareTo(DateUtils.getToday("yyyy/MM/dd")) < 0 ) {
            errors.add("errMsg", new ActionError("alert.Error", "商家使用期限至："+sells.getExpiredDt()));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          pagecontrol.setShowrows(20);
          OrdersSearch search = new OrdersSearch();
          search.setSellsNo(sells.getSellsNo());
          search.setMemeberNo(memberNo);
          Collection<Orders> list = sellsService.findOrdersSearch(search, pagecontrol) ;
          request.setAttribute("mainlist",list);
          request.setAttribute("sells", sells);
          session.setAttribute("icSells",sellsNo);
          session.setAttribute("icMem",memberNo);
          session.setAttribute("icMemNm",memNm);
          return mapping.findForward("success");
        }
    } catch (Exception e ) {
      log.info(e.toString());
      errors.add("errMsg", new ActionError("alert.Error",e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("memError");
    }
  }

  @Override
  public int readSize(ActionMapping mapping, HttpServletRequest request, HttpServletResponse response, PageControl pagecontrol) {
    int rowSize = 0 ;
    HttpSession session = request.getSession();
    try {
          this.sellsNo = ObjectUtils.toString(session.getAttribute("icSells"));
          this.memberNo = ObjectUtils.toString(session.getAttribute("icMem"));
          pagecontrol.setShowrows(20);
          OrdersSearch search = new OrdersSearch();
          search.setSellsNo(this.sellsNo);
          search.setMemeberNo(this.memberNo);
          pagecontrol.setShowrows(20);
          rowSize = sellsService.findOrdersSearchSize(search) ;
    } catch (Exception e) { log.debug(e.getMessage()); }
    return rowSize;
  }
}