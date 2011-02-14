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
import com.sells.common.util.SellsSearch;
import com.sells.dao.LoginData;
import com.sells.dao.Sells;
import com.sells.service.imp.SellsService;

/**
 * MyEclipse Struts Creation date: 02-09-2007
 * 
 * XDoclet definition:
 * 
 * @struts.action validate="true"
 * @struts.action-forward name="success" path="/getPasswdOk.jsp"
 */
public class GetPasswdAction extends Action {
  private SellsService sellsService;
  private final Log log = LogFactory.getLog(GetPasswdAction.class);
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
    SellsSearch search = new SellsSearch();
    search.setEmail(StringUtils.defaultString(request.getParameter("email")));
    search.setLoginId(StringUtils
        .defaultString(request.getParameter("loginId")));
    search.setSellsNm(StringUtils
        .defaultString(request.getParameter("sellsNm")));
    try {
      Collection col = sellsService.findSellsByVo(search);
      Sells admin = sellsService.findSellsById(EcServer.getAdminNo());
      if (!col.isEmpty()) {
        if (col.size() > 1) {
          Iterator iter = col.iterator();
          Object[] obj = (Object[]) iter.next();
          Sells sells = (Sells) obj[1];
          LoginData loginData = (LoginData) obj[0];
          StringBuffer mailmsg = new StringBuffer();
          mailmsg.append("");
          MailBean mailBean = new MailBean();
          mailBean.setFrom(admin.getEmail());
          mailBean.setFromName(admin.getSellsNm());
          mailBean.setTo(sells.getEmail());
          mailBean.setToName(sells.getSellsNm());
          if ("S0000000136".equals(sells.getSellsNo())) {
            mailBean.setMailServer("msa.hinet.net");
          } else {
            mailBean.setMailServer(EcServer.getMailServer());
          }
          mailBean.setSubject(EcServer.getSysName() + " - 密碼通知信!");
          mailBean.setBody(mailmsg.toString());
          mailBean.setCharset("UTF-8");
          try {
            Mail mail = new Mail(mailBean);
          } catch (Exception e) {
            log.info("GetPasswdAction mail e:" + e.getMessage());
          }
          mailmsg = null;
          admin = null;
          return mapping.findForward("success");
        } else {
          errors.add("errMsg", new ActionError("alert.Error", "查詢失敗-1！"));
          saveErrors(request, errors);
          admin = null;
          return mapping.findForward("globalFail");
        }
      } else {
        errors.add("errMsg", new ActionError("alert.Error", "查詢失敗-2！"));
        saveErrors(request, errors);
        admin = null;
        return mapping.findForward("globalFail");
      }
    } catch (Exception e) {
      errors.add("errMsg", new ActionError("alert.Error", "查詢失敗-3！"));
      saveErrors(request, errors);
      return mapping.findForward("globalFail");
    }
  }
}