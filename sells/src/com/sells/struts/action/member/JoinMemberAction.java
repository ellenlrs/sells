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
import com.sells.dao.Sells;
import com.sells.service.imp.SellsService;

/** 
 * MyEclipse Struts
 * Creation date: 09-03-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class JoinMemberAction extends Action {
  private SellsService sellsService ;
  private Log log = LogFactory.getLog(JoinMemberAction.class);
  private ServletContext servletContext;
  
  /* (non-Javadoc)
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
    //1.確認Sells 是否到期
    try {
      
      String sellsNoFromRequest = StringUtils.defaultString(request.getParameter("sells"));
      String sellsFromSession = ObjectUtils.toString(session.getAttribute("icSells"));
      String memNo = ObjectUtils.toString(session.getAttribute("icMem"));
      String memNm = ObjectUtils.toString(session.getAttribute("icMemNm"));
      if (sellsNoFromRequest.equals("")) {
        errors.add("errMsg", new ActionError("alert.Error", "商家代號錯誤!"));
        saveErrors(request, errors);
        return mapping.findForward("memError");
      }
      
      
      if (StringUtils.defaultString(request.getParameter("func")).equals("JOIN")) { // 加入會員
        
        return query("success",sellsNoFromRequest,mapping,request) ;
        
      } else if (StringUtils.defaultString(request.getParameter("func")).equals("QRPWD")){ // 密碼查詢
        return query("successQrpwd",sellsNoFromRequest,mapping,request) ;
      } else {
        if ( !sellsFromSession.equals(sellsNoFromRequest))  {
          return query("successLogin",sellsNoFromRequest,mapping,request) ;
        } else {
          session.setAttribute("icSells", sellsFromSession);
          session.setAttribute("icMem",memNo);
          session.setAttribute("icMemNm",memNm);
          return query("successLoginSession",sellsFromSession,mapping,request) ;
        }
      }
    } catch (Exception e ) {
      log.info( e.toString());
      errors.add("errMsg", new ActionError("alert.Error","異動失敗!"+e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("memError");
    }
	}
	public ActionForward query(String func,String sellsNo,
	    ActionMapping mapping,HttpServletRequest request) {
	  ActionErrors errors = new ActionErrors();
	  try {
      Sells sellsvo= (Sells) sellsService.findSellsById(sellsNo);
      if (sellsvo == null ) {
        errors.add("errMsg", new ActionError("alert.Error", "商家代號錯誤!"));
        saveErrors(request, errors);
        return mapping.findForward("memError");
      } 
      if (sellsvo.getExpiredDt().compareTo(DateUtils.getToday("yyyy/MM/dd")) < 0 ) {
        errors.add("errMsg", new ActionError("alert.Error", "商家使用期限至："+sellsvo.getExpiredDt()));
        saveErrors(request, errors);
        return mapping.findForward("memError");
      }
      request.setAttribute("sells", sellsvo);
      return mapping.findForward(func);
	  } catch (Exception e ) {
      log.info( e.toString());
      errors.add("errMsg", new ActionError("alert.Error","異動失敗!"+e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("memError");
    }
	}
}