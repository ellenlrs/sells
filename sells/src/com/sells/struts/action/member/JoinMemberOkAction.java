/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sells.struts.action.member;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.ObjectUtils;
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

import com.sells.dao.Sells;
import com.sells.service.imp.SellsService;

/**
 * MyEclipse Struts Creation date: 09-04-2007
 * 
 * XDoclet definition:
 * 
 * @struts.action validate="true"
 */
public class JoinMemberOkAction extends Action {
  private SellsService sellsService;
  private Log log = LogFactory.getLog(JoinMemberOkAction.class);
  private ServletContext servletContext;

  /*
   * (non-Javadoc)
   * 
   * @see org.apache.struts.action.Action#setServlet(org.apache.struts.action.ActionServlet)
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
    ActionErrors errors = new ActionErrors();
    HttpSession session = request.getSession();
    // 1.確認Sells 是否到期
    try {
      String sells = ObjectUtils.toString(session.getAttribute("icSells"));
      String memNo = ObjectUtils.toString(session.getAttribute("icMem"));
      log.info("Join ok sells:" + sells);
      if (sells.equals("")) { // 找不到Cookies
        response.sendRedirect("memSessionEx.do");
        return null;
      } else {
        Sells sellsvo = (Sells) sellsService.findSellsById(sells);
        session.setAttribute("icSells", sells);
        session.setAttribute("icMem",memNo);
        request.setAttribute("sells", sellsvo);
        return mapping.findForward("success");
      }
    } catch (Exception e) {
      log.info(e.toString());
      errors.add("errMsg", new ActionError("alert.Error", e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("memError");
    }
  }
}