/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sells.struts.action;

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

import com.sells.dao.LoginData;
import com.sells.dao.Sells;
import com.sells.service.imp.SellsService;

/**
 * MyEclipse Struts Creation date: 02-03-2007
 * 
 * XDoclet definition:
 * 
 * @struts.action validate="true"
 * @struts.action-forward name="success" path="/update.jsp"
 */
public class SellFareAction extends Action {
  private SellsService sellsService;
  private Log log = LogFactory.getLog(SellFareAction.class);
  private ServletContext servletContext;

  /*
   * (non-Javadoc)
   * 
   * @see org.apache.struts.action.Action#setServlet(org.apache.struts.action.
   * ActionServlet)
   */
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
  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    ActionErrors errors = new ActionErrors();
    try {
      Sells sells = (Sells) session.getAttribute("sells");
      LoginData loginvo = (LoginData) session.getAttribute("loginvo");
      if (sells == null) {
        return mapping.findForward("sessionLost");
      } else {
        sells.setFreightFare(Integer.parseInt(StringUtils.defaultString(
            request.getParameter("freightFare"), "0")));
        sells.setFreightTp(StringUtils.defaultString(
            request.getParameter("freightTp"), "0"));
        sells.setProcess(Integer.parseInt(StringUtils.defaultString(
            request.getParameter("process"), "0")));
        sells.setLowAccount(Integer.parseInt(StringUtils.defaultString(
            request.getParameter("lowAccount"), "0")));
        sells.setNofreightFare(Integer.parseInt(StringUtils.defaultString(
            request.getParameter("nofreightFare"), "0")));
        sells.setNofreightQty(Integer.parseInt(StringUtils.defaultString(
            request.getParameter("nofreightQty"), "0")));
        sells.setCodeProcess(Integer.parseInt(StringUtils.defaultString(
            request.getParameter("codeProcess"), "0")));
        sellsService.updateSells(sells);
        session.setAttribute("sells", sells);
        session.setAttribute("loginvo", loginvo);
        return mapping.findForward("success");
      }
    } catch (Exception e) {
      log.info("SellPayDesc e:" + e.toString());
      errors.add("errMsg",
          new ActionError("alert.Error", "查詢失敗!" + e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("error1");
    }
  }
}