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

import com.sells.common.util.DateUtils;
import com.sells.dao.Member;
import com.sells.dao.Sells;
import com.sells.service.imp.MemberService;
import com.sells.service.imp.SellsService;

/**
 * MyEclipse Struts Creation date: 09-03-2007
 * 
 * XDoclet definition:
 * 
 * @struts.action validate="true"
 */
public class LoginMemberSessAction extends Action {
  private SellsService sellsService;
  private MemberService memberService;
  private Log log = LogFactory.getLog(LoginMemberSessAction.class);
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
    ActionErrors errors = new ActionErrors();
    HttpSession session = request.getSession();
    // 1.確認Sells 是否到期
    try {
      String sellsNoFromSession = ObjectUtils.toString(session
          .getAttribute("icSells"));
      String memNo = ObjectUtils.toString(session.getAttribute("icMem"));
      String memNm = ObjectUtils.toString(session.getAttribute("icMemNm"));
      if (sellsNoFromSession.equals("")) {
        errors.add("errMsg", new ActionError("alert.Error", "登入已過期，請重新登入!"));
        saveErrors(request, errors);
        return mapping.findForward("memError");
      }
      Sells sells = (Sells) sellsService.findSellsById(sellsNoFromSession);
      if (sells == null) {
        errors.add("errMsg", new ActionError("alert.Error", "商家代號錯誤!"));
        saveErrors(request, errors);
        return mapping.findForward("memError");
      }
      if (sells.getExpiredDt().compareTo(DateUtils.getToday("yyyy/MM/dd")) < 0) {
        errors.add("errMsg", new ActionError("alert.Error", "商家使用期限至："
            + sells.getExpiredDt()));
        saveErrors(request, errors);
        return mapping.findForward("memError");
      }
      session.setAttribute("icSells", sellsNoFromSession);
      session.setAttribute("icMem", memNo);
      session.setAttribute("icMemNm", memNm);
      log.info("getSellsId:" + session.getId() + ",setSellsNO:"
          + sellsNoFromSession + ",setMemNo:" + memNo);
      request.setAttribute("sells", sells);
      return mapping.findForward("success");
    } catch (Exception e) {
      log.info(e.toString());
      errors.add("errMsg", new ActionError("alert.Error", "登入失敗，"
          + e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("memError");
    }
  }
}