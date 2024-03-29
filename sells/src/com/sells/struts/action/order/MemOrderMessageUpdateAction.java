/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sells.struts.action.order;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionServlet;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sells.common.mail.Mail;
import com.sells.common.mail.MailBean;
import com.sells.common.util.DateUtils;
import com.sells.common.util.EcServer;
import com.sells.dao.Orders;
import com.sells.dao.OrdersMsg;
import com.sells.dao.Sells;
import com.sells.service.imp.SellsService;

/**
 * MyEclipse Struts Creation date: 09-07-2007
 * 
 * XDoclet definition:
 * 
 * @struts.action validate="true"
 */
public class MemOrderMessageUpdateAction extends Action {
  private SellsService sellsService;
  private final Log log = LogFactory.getLog(MemOrderMessageUpdateAction.class);
  private ServletContext servletContext;

  /*
   * (non-Javadoc)
   * 
   * @seeorg.apache.struts.action.Action#setServlet(org.apache.struts.action.
   * ActionServlet)
   */
  @Override
  public void setServlet(ActionServlet actionServlet) {
    super.setServlet(actionServlet);
    servletContext = actionServlet.getServletContext();
    WebApplicationContext wac = WebApplicationContextUtils
        .getRequiredWebApplicationContext(servletContext);
    this.sellsService = (SellsService) wac.getBean("sellsService");
  }

  /**
   * Method execute
   * 
   * @param mapping
   * @param form
   * @param request
   * @param response
   * @return ActionForward
   */
  @Override
  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    ActionErrors errors = new ActionErrors();
    HttpSession session = request.getSession();
    // 1.確認Sells 是否到期
    try {
      String sellsNo = ObjectUtils.toString(session.getAttribute("icSells"));
      String memNo = ObjectUtils.toString(session.getAttribute("icMem"));
      String memNm = ObjectUtils.toString(session.getAttribute("icMemNm"));
      if (sellsNo.equals("") || memNo.equals("")) { // 找不到Cookies
        response.sendRedirect("memSessionEx.do");
        return null;
      } else {
        Sells sells = sellsService.findSellsById(sellsNo);
        if (sells == null) {
          errors.add("errMsg", new ActionError("alert.Error", "登入已過期，請重新登入!"));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
        if (sells.getExpiredDt().compareTo(DateUtils.getToday("yyyy/MM/dd")) < 0) {
          errors.add("errMsg", new ActionError("alert.Error", "商家使用期限至："
              + sells.getExpiredDt()));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
        // 2.查詢訂單明細
        String orderNo = StringUtils.defaultString(request
            .getParameter("orderNo"));
        String email = StringUtils.defaultString(request.getParameter("email"));
        Orders vo = sellsService.getOrdersById(orderNo, sells.getSellsNo(),
            memNo);
        // 需要判斷此訂單是不是有擁有權，增加安全性
        if (vo != null && StringUtils.isNotBlank(vo.getOrderNo())) {
          OrdersMsg vom = new OrdersMsg();
          vom.setMessage(request.getParameter("message"));
          vom.setMessDt(new java.util.Date());
          vom.setMessSt("0");
          vom.setMessName(vo.getName());
          if (email.equals(vo.getEmail())) {
            sellsService.saveOrdersMsg(vom, orderNo);
          } else {
            vo.setEmail(email);
            sellsService.saveOrdersMsg(vom, orderNo, vo);
          }
          // 發送Mail
          StringBuffer sb = new StringBuffer();
          sb.append("<html>\n");
          sb.append("<head>\n");
          sb
              .append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n");
          sb.append("<title>留言通知</title>\n");
          sb.append("</head>\n");
          sb.append("<body >\n");
          sb
              .append("<table width=\"800\" border=\"0\" align=\"center\" cellpadding=\"5\" cellspacing=\"1\" bgcolor=\"#C0C0C0\">\n");
          sb.append("  <tr>\n");
          sb
              .append("    <td colspan=\"2\" align=\"center\" bgcolor=\"#F5F5F5\" ><font size=\"2\">客戶線上留言通知</font></td>\n");
          sb.append("  </tr>\n");
          sb.append("  <tr>\n");
          sb
              .append("    <td width=\"137\" bgcolor=\"#F5F5F5\" ><font size=\"2\">訂單編號：</font></td>\n");
          sb.append(
              "    <td width=\"640\" bgcolor=\"#F5F5F5\" ><font size=\"2\">")
              .append(vo.getOrderNo()).append("</font></td>\n");
          sb.append("  </tr>\n");
          sb.append("  <tr>\n");
          sb
              .append("    <td width=\"137\" bgcolor=\"#F5F5F5\" ><font size=\"2\">留言人：</font></td>\n");
          sb.append(
              "    <td width=\"640\" bgcolor=\"#F5F5F5\" ><font size=\"2\">")
              .append(vom.getMessName()).append("</font></td>\n");
          sb.append("  </tr>\n");
          sb.append("  <tr>\n");
          sb
              .append("    <td width=\"137\" bgcolor=\"#F5F5F5\" ><font size=\"2\">內容</font>：</td>\n");
          sb.append("    <td bgcolor=\"#F5F5F5\" ><font size=\"2\">").append(
              vom.getMessage()).append("</font></td>\n");
          sb.append("  </tr>\n");
          sb.append("  <tr>\n");
          sb
              .append("    <td width=\"137\" bgcolor=\"#F5F5F5\" ><font size=\"2\">留言時間：</font></td>\n");
          sb.append("    <td bgcolor=\"#F5F5F5\" ><font size=\"2\">").append(
              DateUtils.getTodayAddDays(vom.getMessDt(), 0,
                  "yyyy/MM/dd HH:mm:ss")).append("</font></td>\n");
          sb.append("  </tr>\n");
          sb.append("</table>\n");
          sb.append("</body>\n");
          sb.append("</html>\n");
          MailBean mailBean = new MailBean();
          if (StringUtils.isNotBlank(vo.getEmail())) {
            mailBean.setFrom(vo.getEmail());
            mailBean.setCc(sells.getEmail());
            mailBean.setTo(vo.getEmail());
          } else {
            mailBean.setTo(sells.getEmail());
            mailBean.setFrom(sells.getEmail());
            mailBean.setFromName(sells.getStoreNm());
          }
          if ("S0000000136".equals(sells.getSellsNo())) {
            mailBean.setMailServer("msa.hinet.net");
          } else {
            mailBean.setMailServer(EcServer.getMailServer());
          }
          mailBean.setSubject(sells.getStoreNm() + " - " + vo.getOrderNo()
              + " 客戶留言通知");
          mailBean.setBody(sb.toString());
          mailBean.setCharset("UTF-8");
          try {
            Mail mail = new Mail(mailBean);
          } catch (Exception e) {
            log.info(e.getMessage());
          }
          sb = null;
          // Collection items = sellsService.findOrdersMsg(orderNo, "0");
          // request.setAttribute("orderNo",orderNo);
          // request.setAttribute("items",items);
          // return mapping.findForward("success");
          session.setAttribute("icSells", sellsNo);
          session.setAttribute("icMem", memNo);
          session.setAttribute("icMemNm", memNm);
          response.sendRedirect("memOrderMessageList.do?orderNo=" + orderNo);
          return null;
        } else {
          errors.add("errMsg", new ActionError("alert.Error", "訂單編號異常"));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
      }
    } catch (Exception e) {
      log.info(e.toString());
      errors.add("errMsg", new ActionError("alert.Error", e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("memError");
    }
  }
}