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
 * MyEclipse Struts
 * Creation date: 09-04-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class MemberUpdateMisAction extends Action {
  private MemberService memberService ;
  private Log log = LogFactory.getLog(MemberUpdateMisAction.class);
  private ServletContext servletContext;
  
  /* (non-Javadoc)
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
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession ();
    ActionErrors errors = new ActionErrors();
    //1.確認Sells 是否到期
    try {
      Sells sells= (Sells) session.getAttribute("sells") ;
      if (sells == null ) {
        return mapping.findForward("sessionLost");
      }
      String memberNo = StringUtils.defaultString(request.getParameter("memberNo"));
      if (memberNo.equals("")) {
        errors.add("errMsg", new ActionError("alert.Error", "會員編號錯誤!"));
        saveErrors(request, errors);
        return mapping.findForward("error1");
      }
//      2.查詢會員
        Member vo = memberService.getMember(sells.getSellsNo(), memberNo) ;
        if (StringUtils.defaultString( request.getParameter("func")).equals("UPDATE")) { //修改會員資料
          if (StringUtils.defaultString(request.getParameter("name")).equals("") ) {
            errors.add("errMsg", new ActionError("alert.Error","姓名  未輸入"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          if (StringUtils.defaultString(request.getParameter("birthDt")).equals("") ) {
            errors.add("errMsg", new ActionError("alert.Error","出生年月日 未輸入"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          vo.setAddress(request.getParameter("address"));
          vo.setBirthDt(request.getParameter("birthDt"));
          vo.setEpYn(request.getParameter("epYn"));
          vo.setMobile(request.getParameter("mobile"));
          vo.setName(request.getParameter("name"));
          vo.setStatus(request.getParameter("status"));
          vo.setTel(request.getParameter("tel"));
          vo.setZip(request.getParameter("zip"));
          vo.setModiDt(new java.util.Date());
          vo.setModiMan(sells.getSellsNo());
          memberService.updateMember(vo);
          return mapping.findForward("success");
        } else if (StringUtils.defaultString( request.getParameter("func")).equals("UPDATEPWD")) { //修改會員密碼
          if (StringUtils.defaultString(request.getParameter("password")).equals("") ) {
            errors.add("errMsg", new ActionError("alert.Error","新密碼 未輸入"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          if (!StringUtils.defaultString(request.getParameter("password")).equals(StringUtils.defaultString(request.getParameter("cfPassword"))) ) {
            errors.add("errMsg", new ActionError("alert.Error","密碼驗證錯誤"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          vo.setPassword(request.getParameter("password"));
          vo.setModiDt(new java.util.Date());
          vo.setModiMan(sells.getSellsNo());
          memberService.updateMember(vo);
          return mapping.findForward("success");
        } else {
          errors.add("errMsg", new ActionError("alert.Error","Func 未傳入異動失敗!"));
          saveErrors(request, errors);
          return mapping.findForward("error1");
        }
    } catch (Exception e ) {
      log.info(e.toString());
      errors.add("errMsg", new ActionError("alert.Error",e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("error1");
    }
	}
}