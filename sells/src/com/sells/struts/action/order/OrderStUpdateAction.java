/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sells.struts.action.order;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.sells.common.util.EcServer;
import com.sells.dao.Orders;
import com.sells.dao.Sells;
import com.sells.service.imp.SellsService;

/**
 * MyEclipse Struts Creation date: 09-07-2007
 * 
 * XDoclet definition:
 * 
 * @struts.action validate="true"
 */
public class OrderStUpdateAction extends Action {
  private SellsService sellsService;
  private final Log log = LogFactory.getLog(OrderStUpdateAction.class);
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
    HttpSession session = request.getSession();
    ActionErrors errors = new ActionErrors();
    try {
      Sells sells = (Sells) session.getAttribute("sells");
      if (sells == null) {
        return mapping.findForward("sessionLost1");
      }
      if (StringUtils.isBlank(request.getParameter("orderNo"))) {
        errors.add("errMsg", new ActionError("alert.Error", "訂單編號異常"));
        saveErrors(request, errors);
        return mapping.findForward("error3");
      }
      Orders vo = sellsService.getOrdersById(
          StringUtils.defaultString(request.getParameter("orderNo")),
          sells.getSellsNo(), null);
      vo.setOrderSt(StringUtils.defaultString(request.getParameter("orderSt")));
      vo.setLogisticDesc(StringUtils.substring(
          request.getParameter("logisticDesc"), 0, 150));
      if (sellsService.updateOrders(vo)) {
        if (vo.getOrderSt().equals("10") || vo.getOrderSt().equals("20")
            || vo.getOrderSt().equals("30")) { // 代表出貨 或 匯款已收到 備貨中
          StringBuffer sb = new StringBuffer();
          sb.append("<html>\n");
          sb.append("<head>\n");
          sb.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n");
          if (vo.getOrderSt().equals("10")) {
            sb.append("<title>").append(sells.getStoreNm())
                .append("出貨通知</title>\n");
          } else if (vo.getOrderSt().equals("20")) {
            sb.append("<title>").append(sells.getStoreNm())
                .append("收到匯款通知</title>\n");
          } else if (vo.getOrderSt().equals("30")) {
            sb.append("<title>").append(sells.getStoreNm())
                .append("備貨通知</title>\n");
          }
          sb.append("</head>\n");
          sb.append("<body >\n");
          sb.append("<table width=\"800\" border=\"0\" align=\"center\" cellpadding=\"5\" cellspacing=\"1\" bgcolor=\"#C0C0C0\">\n");
          sb.append("  <tr>\n");
          sb.append(
              "    <td colspan=\"2\" align=\"center\" bgcolor=\"#F5F5F5\" ><font size=\"2\">")
              .append(sells.getStoreNm());
          if (vo.getOrderSt().equals("10")) {
            sb.append("訂單出貨通知</font></td>\n");
          } else if (vo.getOrderSt().equals("20")) {
            sb.append("匯款已收到</font></td>\n");
          } else if (vo.getOrderSt().equals("30")) {
            sb.append("商品備貨處理中</font></td>\n");
          }
          sb.append("  </tr>\n");
          sb.append("  <tr>\n");
          sb.append("    <td width=\"137\" bgcolor=\"#F5F5F5\" ><font size=\"2\">訂單編號：</font></td>\n");
          sb.append(
              "    <td width=\"640\" bgcolor=\"#F5F5F5\" ><font size=\"2\">")
              .append(vo.getOrderNo()).append("</font></td>\n");
          sb.append("  </tr>\n");
          sb.append("  <tr>\n");
          sb.append("    <td width=\"137\" bgcolor=\"#F5F5F5\" ><font size=\"2\">物流說明：</font></td>\n");
          sb.append(
              "    <td width=\"640\" bgcolor=\"#F5F5F5\" ><font size=\"2\">")
              .append(vo.getLogisticDesc()).append("</font></td>\n");
          sb.append("  </tr>\n");
          sb.append("</table>\n");
          sb.append("</body>\n");
          sb.append("</html>\n");
          MailBean mailBean = new MailBean();
          mailBean.setFrom(sells.getEmail());
          mailBean.setFromName(sells.getStoreNm());
          if (StringUtils.isNotBlank(vo.getEmail())) {
            mailBean.setCc(sells.getEmail());
            mailBean.setTo(vo.getEmail());
          } else {
            mailBean.setTo(sells.getEmail());
          }
          if ("S0000000136".equals(sells.getSellsNo())) {
            mailBean.setMailServer("msa.hinet.net");
          } else {
            mailBean.setMailServer(EcServer.getMailServer());
          }
          if (vo.getOrderSt().equals("10")) {
            mailBean.setSubject(sells.getStoreNm() + " - " + vo.getOrderNo()
                + " 出貨通知");
          } else if (vo.getOrderSt().equals("20")) {
            mailBean.setSubject(sells.getStoreNm() + " - " + vo.getOrderNo()
                + " 收到匯款通知");
          } else if (vo.getOrderSt().equals("30")) {
            mailBean.setSubject(sells.getStoreNm() + " - " + vo.getOrderNo()
                + " 備貨處理通知");
          }
          mailBean.setBody(sb.toString());
          mailBean.setCharset("UTF-8");
          try {
            Mail mail = new Mail(mailBean);
          } catch (Exception e) {
            log.info(e.getMessage());
          }
          sb = null;
        }
        // Collection items =
        // sellsService.findOrdersItemById(StringUtils.defaultString(request.getParameter("orderNo")))
        // ;
        // request.setAttribute("orders",vo);
        // request.setAttribute("items",items);
        // 發送Email
        response.sendRedirect("sellOrderDetail.do?orderNo=" + vo.getOrderNo()
            + "&msg=ok");
        // return mapping.findForward("success");
        return null;
      } else {
        errors.add("errMsg", new ActionError("alert.Error", "訂單修改失敗"));
        saveErrors(request, errors);
        return mapping.findForward("error3");
      }
    } catch (Exception e) {
      log.info(e.getMessage());
      errors.add("errMsg", new ActionError("alert.Error", e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("error3");
    }
  }
}