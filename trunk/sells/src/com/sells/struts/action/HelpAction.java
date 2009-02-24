/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sells.struts.action;

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
import com.sells.dao.Sells;
import com.sells.service.imp.SellsService;

/**
 * MyEclipse Struts Creation date: 02-09-2007
 * 
 * XDoclet definition:
 * 
 * @struts.action validate="true"
 */
public class HelpAction extends Action {
  private Log log = LogFactory.getLog(HelpAction.class);
  private SellsService sellsService ;
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
   * 
   * @param mapping
   * @param form
   * @param request
   * @param response
   * @return ActionForward
   */
  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    String email = StringUtils.defaultString(request.getParameter("email"));
    String name = StringUtils.defaultString(request.getParameter("name"));
    String mailBody = StringUtils.defaultString(request
        .getParameter("mailBody"));
    String subject = StringUtils.defaultString(request.getParameter("subject"));
    ActionErrors errors = new ActionErrors();
    try {
      Sells admin = sellsService.findSellsById(EcServer.getAdminNo());
      if (email.equals("")) {
        errors.add("errMsg", new ActionError("alert.Error", "Email 未輸入!"));
        saveErrors(request, errors);
        return mapping.findForward("globalFail");
      }
      if (name.equals("")) {
        errors.add("errMsg", new ActionError("alert.Error", "姓名 未輸入!"));
        saveErrors(request, errors);
        return mapping.findForward("globalFail");
      }
      if (subject.equals("")) {
        errors.add("errMsg", new ActionError("alert.Error", "主題 未選取!"));
        saveErrors(request, errors);
        return mapping.findForward("globalFail");
      }
      if (mailBody.equals("")) {
        errors.add("errMsg", new ActionError("alert.Error", "信件內容未輸入!"));
        saveErrors(request, errors);
        return mapping.findForward("globalFail");
      }
      MailBean mailBean = new MailBean();
      mailBean.setFrom(email);
      mailBean.setFromName(name);
      mailBean.setCc(email);
      mailBean.setTo(admin.getEmail());
      mailBean.setToName(admin.getSellsNm());
      mailBean.setMailServer(EcServer.getMailServer());
      mailBean.setSubject(admin.getStoreNm()+" - " +subject +" 問題反應");
      mailBean.setBody(mailBody);
      mailBean.setCharset("UTF-8");
      try {
        Mail mail = new Mail(mailBean);
      } catch (Exception e) {
        log.info("HelpACtion mail e:" + e.getMessage());
      }
      admin = null ;
      return mapping.findForward("success");
    } catch (Exception e1 ) {
      errors.add("errMsg", new ActionError("alert.Error","問題反應發送失敗！"));
      saveErrors(request, errors);
      return mapping.findForward("globalFail");
    }
    
  }
}