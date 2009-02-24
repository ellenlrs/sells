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
 * MyEclipse Struts
 * Creation date: 02-03-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class SellModiAction extends Action {
  private SellsService sellsService ;
  private Log log = LogFactory.getLog(SellModiAction.class);
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
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
    ActionErrors errors = new ActionErrors();
    HttpSession session = request.getSession ();
    try {
      Sells sells= (Sells) session.getAttribute("sells") ;
      LoginData loginvo= (LoginData) session.getAttribute("loginvo") ;
      if (sells == null ) {
        return mapping.findForward("sessionLost");
      } else {
        if (StringUtils.defaultString(request.getParameter("email")).equals("") ) {
          errors.add("errMsg", new ActionError("alert.Error","Email 未輸入"));
          saveErrors(request, errors);
          return mapping.findForward("error1");
        }
        if (StringUtils.defaultString(request.getParameter("homepage")).equals("") ) {
          errors.add("errMsg", new ActionError("alert.Error","店家網頁 未輸入"));
          saveErrors(request, errors);
          return mapping.findForward("error1");
        }
        if (StringUtils.defaultString(request.getParameter("sellsNm")).equals("") ) {
          errors.add("errMsg", new ActionError("alert.Error","姓名 未輸入"));
          saveErrors(request, errors);
          return mapping.findForward("error1");
        }
        if (StringUtils.defaultString(request.getParameter("storeNm")).equals("") ) {
          errors.add("errMsg", new ActionError("alert.Error","店名  未輸入"));
          saveErrors(request, errors);
          return mapping.findForward("error1");
        }
        if (StringUtils.defaultString(request.getParameter("color")).equals("0") || StringUtils.isBlank(request.getParameter("color")) ) {
          sells.setColorTp("1");
          sells.setColor1("#006699");
          sells.setColor2("#99CCFF");
        } else {
          sells.setColorTp(request.getParameter("color").split(",")[0]);
          sells.setColor1(request.getParameter("color").split(",")[1]);
          sells.setColor2(request.getParameter("color").split(",")[2]);        
        }
        sells.setEmail(request.getParameter("email"));
        sells.setHomepage(request.getParameter("homepage"));
        sells.setSellsNm(request.getParameter("sellsNm"));
        sells.setStoreNm(request.getParameter("storeNm"));
        sells.setLogo(StringUtils.defaultString(request.getParameter("logo")));
        sells.setPayType1(StringUtils.defaultString(request.getParameter("payType1"),"0"));
        sells.setPayType2(StringUtils.defaultString(request.getParameter("payType2"),"0"));
        sells.setPayType3(StringUtils.defaultString(request.getParameter("payType3"),"0"));
        sells.setPayType4(StringUtils.defaultString(request.getParameter("payType4"),"0"));
        sells.setPayType5(StringUtils.defaultString(request.getParameter("payType5"),"0"));
        sells.setStoreId(StringUtils.defaultString(request.getParameter("storeId")));
        sells.setFeedbackCode(StringUtils.defaultString(request.getParameter("feedbackCode")));
        sells.setSendCode(StringUtils.defaultString(request.getParameter("sendCode")));
        sells.setFeedbackCode(StringUtils.defaultString(request.getParameter("feedbackCode"),""));
        sells.setSendCode(StringUtils.defaultString(request.getParameter("sendCode"),""));
        sells.setStoreId(StringUtils.defaultString(request.getParameter("storeId"),""));
        sellsService.updateSells(sells);
        session.setAttribute("sells", sells) ;
        session.setAttribute("loginvo", loginvo) ;
        return mapping.findForward("success");
      }
    } catch (Exception e ) {
      log.info("SellModi e:" + e.getMessage());
      errors.add("errMsg", new ActionError("alert.Error","異動失敗!"+e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("error1");
    }
	}
}