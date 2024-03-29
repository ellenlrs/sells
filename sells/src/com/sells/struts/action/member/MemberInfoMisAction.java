/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sells.struts.action.member;

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
import com.sells.dao.Member;
import com.sells.dao.Sells;
import com.sells.service.imp.MemberService;

/**
 * MyEclipse Struts Creation date: 09-04-2007
 * 
 * XDoclet definition:
 * 
 * @struts.action validate="true"
 */
public class MemberInfoMisAction extends Action {
  private MemberService memberService;
  private Log log = LogFactory.getLog(MemberInfoMisAction.class);
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
    this.memberService = (MemberService) wac.getBean("memberService");
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
    // 1.確認Sells 是否到期
    try {
      Sells sells = (Sells) session.getAttribute("sells");
      if (sells == null) {
        return mapping.findForward("sessionLost");
      }
      String memberNo = StringUtils.defaultString(request
          .getParameter("memberNo"));
      if (memberNo.equals("")) {
        errors.add("errMsg", new ActionError("alert.Error", "會員編號錯誤!"));
        saveErrors(request, errors);
        return mapping.findForward("error1");
      }
      // 2.查詢會員
      Member vo = memberService.getMember(sells.getSellsNo(), memberNo);
      request.setAttribute("member", vo);
      if (request.getParameter("func").equals("INFO")) {
        return mapping.findForward("successInfo");
      } else if (request.getParameter("func").equals("PWD")) {
        return mapping.findForward("successPwd");
      } else {
        errors.add("errMsg", new ActionError("alert.Error", "傳入參數錯誤"));
        saveErrors(request, errors);
        return mapping.findForward("error1");
      }
    } catch (Exception e) {
      log.info( e.toString());
      errors.add("errMsg", new ActionError("alert.Error", e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("error1");
    }
  }
}