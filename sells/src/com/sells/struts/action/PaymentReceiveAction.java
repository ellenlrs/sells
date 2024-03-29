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
import javax.servlet.http.HttpSession;

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

import com.sells.common.mail.Mail;
import com.sells.common.mail.MailBean;
import com.sells.common.util.DateUtils;
import com.sells.common.util.EcServer;
import com.sells.dao.Orders;
import com.sells.dao.OrdersItem;
import com.sells.dao.Sells;
import com.sells.service.imp.SellsService;

/**
 * MyEclipse Struts Creation date: 11-20-2008
 * 
 * XDoclet definition:
 * 
 * @struts.action validate="true"
 */
public class PaymentReceiveAction extends Action {
  private SellsService sellsService;
  private final Log log = LogFactory.getLog(PaymentReceiveAction.class);
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
    log.info("Payment start receive:");
    String CheckSum = StringUtils.defaultString(request
        .getParameter("P_CheckSum"));
    log.info("CheckSum:" + CheckSum);
    String PRC = StringUtils.defaultString(request
        .getParameter("final_return_PRC"));
    log.info("PRC:" + PRC);
    String SRC = StringUtils.defaultString(request
        .getParameter("final_return_SRC"));
    log.info("SRC:" + SRC);
    String ApprovalCode = StringUtils.defaultString(request
        .getParameter("final_return_ApproveCode"));
    log.info("ApprovalCode:" + ApprovalCode);
    String BankResponseCode = StringUtils.defaultString(request
        .getParameter("final_return_BankRC"));
    log.info("BankResponseCode:" + BankResponseCode);
    String MerchantNumber = StringUtils.defaultString(request
        .getParameter("P_MerchantNumber"));
    log.info("MerchantNumber:" + MerchantNumber);
    String OrderNumber = StringUtils.defaultString(request
        .getParameter("P_OrderNumber"));
    log.info("OrderNumber:" + OrderNumber);
    String Amount = StringUtils.defaultString(request.getParameter("P_Amount"));
    log.info("Amount:" + Amount);
    String BatchNumber = StringUtils.defaultString(request
        .getParameter("final_return_BatchNumber"));
    log.info("BatchNumber:" + BatchNumber);
    String final_result = StringUtils.defaultString(request
        .getParameter("final_result"));
    log.info("final_result:" + final_result);
    String orderNo = StringUtils.right(("0000000000" + String
        .valueOf(OrderNumber)), 10);
    log.info("orderNo:" + orderNo);
    String msg = "";
    StringBuffer sb = new StringBuffer();
    try {
      Orders vo = sellsService.getOrdersById(orderNo);
      Collection orderItem = sellsService.findOrdersItemById(orderNo);
      Sells sells = sellsService.findSellsById(vo.getSellsNo());
      sb.append(orderNo).append(vo.getSellsNo()).append("iCart856069");
      String icartChecksum = DigestUtils.md5Hex(sb.toString());
      request.setAttribute("orderNo", orderNo);
      request.setAttribute("checksum", icartChecksum);
      request.setAttribute("sells", sells);
      if (vo == null || sells == null) {
        // 資料異常
        msg = "帳號資料異常";
      } else {
        sb.setLength(0);
        sb.append(MerchantNumber);
        sb.append(OrderNumber);
        sb.append(final_result);
        sb.append(PRC);
        sb.append(sells.getFeedbackCode());
        sb.append(SRC);
        sb.append(Amount);
        String md5 = DigestUtils.md5Hex(sb.toString());
        log.info("md5:" + md5);
        vo.setApproveCode(ApprovalCode);
        vo.setBankRc(BankResponseCode);
        vo.setBatchNumber(BatchNumber);
        vo.setPrc(PRC);
        vo.setSrc(SRC);
        vo.setBankRc(BankResponseCode);
        vo.setModiDt(DateUtils.getToday());
        vo.setCardNumber(Amount);
        Sells admin = sellsService.findSellsById(EcServer.getAdminNo());
        if (CheckSum.length() > 0) {
          if (!md5.equals(CheckSum)) {
            // checksum 錯誤
            msg = "資料檢查碼異常";
            vo.setOrderSt("88");
            sellsService.updateOrders(vo);
            return mapping.findForward("fail-check");
          }
        }
        if (final_result.equals("1")) {
          vo.setOrderSt("85");
          sellsService.updateOrders(vo);
          StringBuffer items = new StringBuffer();
          Iterator iter = orderItem.iterator();
          while (iter.hasNext()) {
            OrdersItem oi = (OrdersItem) iter.next();
            items.append(oi.getItemNo()).append("  ").append(oi.getItemNm());
            if (StringUtils.isNotBlank(oi.getItemSpec1())
                || StringUtils.isNotBlank(oi.getItemSpec2())) {
              items.append("(").append(oi.getItemSpec1()).append("、").append(
                  oi.getItemSpec2()).append(")");
            }
            items.append("數量:").append(oi.getQty()).append(" 單價").append(
                oi.getPrice()).append(" 元");
            items.append(" 小計:").append(oi.getQty() * oi.getPrice()).append(
                " 元");
            items.append("<BR>");
          }
          items.append("<BR>運費金額:").append(vo.getFreightfar()).append("元<BR>");
          // items.append("<BR>貨到付款金額:").append(vo.getProcess()).append("元<BR>");
          items.append("<BR>商品金額:").append(vo.getAmt()).append("元<BR>");
          items.append("<BR>購物總金額:").append(
              vo.getFreightfar() + vo.getAmt() + vo.getProcess()).append(
              "元<BR>");
          // 發Mail
          sb.setLength(0);
          sb.append("<html>\n");
          sb.append("<head>\n");
          sb
              .append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n");
          sb.append("<title>").append(sells.getStoreNm()).append(
              " 訂購信函(線上付款成功)</title>\n");
          sb.append("</head>\n");
          sb.append("<body >\n");
          sb
              .append("<table width=\"800\" border=\"0\" align=\"center\" cellpadding=\"5\" cellspacing=\"3\" bgcolor=\"#006699\">\n");
          sb.append("  <tr>\n");
          sb
              .append("    <td bgcolor=\"#99CCFF\" class=\"content3\">訂購單送出，非常謝謝您的購買!<br>\n");
          sb.append("      我們同時會將您的訂單寄到您的mail，敬請查收~!</td>\n");
          sb.append("  </tr>\n");
          sb.append("</table>\n");
          sb.append("<br>\n");
          sb
              .append("  <table width=\"800\" border=\"0\" align=\"center\" cellpadding=\"5\" cellspacing=\"1\" bgcolor=\"#C0C0C0\">\n");
          sb.append("    <tr>\n");
          sb
              .append(
                  "      <td bgcolor=\"#F5F5F5\" class=\"en\">此信件為自動回覆信函，來自 ")
              .append(sells.getStoreNm()).append(" 請勿直接回信<br>\n");
          sb.append("   ").append(sells.getStoreNm()).append(" 網址：<a href='")
              .append(sells.getHomepage()).append("'>").append(
                  sells.getHomepage()).append("</a>\n");
          sb.append("   <hr noshade size=1>訂單編號︰").append(vo.getOrderNo())
              .append("<hr noshade size=1>\n");
          sb.append("   ").append(vo.getName()).append(" 您好您訂購的商品清單如下：<br>\n");
          sb.append("   ").append(items.toString()).append("\n");
          sb.append("   <hr noshade size=1>\n");
          sb.append("   訂購人資料<br>   \n");
          sb.append("   姓名︰").append(vo.getName()).append("\n");
          sb.append("   <br>\n");
          sb.append("   郵遞區號︰").append(vo.getZip()).append("\n");
          sb.append("   <br>\n");
          sb.append("   地址︰").append(vo.getAddress()).append("\n");
          sb.append("   <br>\n");
          sb.append("   E-mail︰").append(vo.getEmail()).append("\n");
          sb.append("   <br>\n");
          sb.append("   電話︰").append(vo.getTel()).append("\n");
          sb.append("   <br>\n");
          sb.append("   手機︰").append(vo.getMobile()).append("\n");
          sb.append("   <br>\n");
          sb.append("   付款方式︰").append(vo.getPayTp()).append("\n");
          sb.append("   <br>\n");
          sb.append("   轉出帳號後5碼︰").append(vo.getExportAccount()).append("\n");
          sb.append("   <br>\n");
          sb.append("   備註︰\n");
          sb.append("   <br>\n");
          sb.append("   ").append(vo.getDescTxt()).append("\n");
          sb.append("   <hr noshade size=1>\n");
          sb.append("   付款資料︰<br>\n");
          sb.append("   ").append(
              StringUtils.defaultString(sells.getPayDesc()).replace("\n",
                  "<BR>")).append("\n");
          sb.append("   <hr noshade size=1>\n");
          sb.append("   ").append(sells.getStoreNm()).append(" 網址：<a href='")
              .append(sells.getHomepage()).append("'>").append(
                  sells.getHomepage()).append("</a>\n");
          sb.append("   </td>\n");
          sb.append("    </tr>\n");
          sb.append("</table>\n");
          sb.append("</body>\n");
          sb.append("</html>\n");
          MailBean mailBean = new MailBean();
          mailBean.setFrom(sells.getEmail());
          mailBean.setFromName(sells.getStoreNm());
          mailBean.setTo(sells.getEmail());
          mailBean.setToName(sells.getStoreNm());
          mailBean.setBcc(admin.getEmail());
          if ("S0000000136".equals(sells.getSellsNo())) {
            mailBean.setMailServer("msa.hinet.net");
          } else {
            mailBean.setMailServer(EcServer.getMailServer());
          }
          mailBean.setSubject(sells.getStoreNm() + " - 線上交易完成通知:"
              + vo.getOrderNo());
          mailBean.setBody(sb.toString());
          mailBean.setCharset("UTF-8");
          MailBean mailBean2 = new MailBean();
          mailBean2.setFrom(sells.getEmail());
          mailBean2.setFromName(sells.getStoreNm());
          mailBean2.setTo(vo.getEmail());
          if ("S0000000136".equals(sells.getSellsNo())) {
            mailBean2.setMailServer("msa.hinet.net");
          } else {
            mailBean2.setMailServer(EcServer.getMailServer());
          }
          mailBean2.setSubject(sells.getStoreNm() + " - 線上交易完成通知:"
              + vo.getOrderNo());
          mailBean2.setBody(sb.toString());
          mailBean2.setCharset("UTF-8");
          try {
            Mail mail = new Mail(mailBean);
            Mail mail2 = new Mail(mailBean2);
          } catch (Exception e) {
            log.info(e.getMessage());
          }
          sb = null;
          admin = null;
          session.removeAttribute("itemSeq");
          session.removeAttribute(sells.getSellsNo());
          return mapping.findForward("success");
        } else {
          vo.setOrderSt("88");
          sellsService.updateOrders(vo);
          msg = "交易失敗:<BR>PRC-" + PRC + ",SRC-" + SRC + ",BRC-"
              + BankResponseCode;
        }
      }
    } catch (Exception e) {
      msg = "交易失敗(E)";
      log.info("e:" + e.toString());
    }
    request.setAttribute("msg", msg);
    log.info("Payment receive end");
    return mapping.findForward("fail");
  }
}