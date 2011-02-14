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

import com.sells.common.mail.Mail;
import com.sells.common.mail.MailBean;
import com.sells.common.util.DateUtils;
import com.sells.common.util.EcServer;
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
public class SaveMemberAction extends Action {
  private SellsService sellsService;
  private MemberService memberService;
  private final Log log = LogFactory.getLog(SaveMemberAction.class);
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
  @Override
  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    ActionErrors errors = new ActionErrors();
    HttpSession session = request.getSession();
    // 1.確認Sells 是否到期
    try {
      String sellsNo = StringUtils.defaultString(request.getParameter("sells"));
      if (sellsNo.equals("")) {
        errors.add("errMsg", new ActionError("alert.Error", "商家代號錯誤!"));
        saveErrors(request, errors);
        return mapping.findForward("memError");
      }
      Sells sells = sellsService.findSellsById(sellsNo);
      if (sells == null) {
        errors.add("errMsg", new ActionError("alert.Error", "商家代號錯誤!"));
        saveErrors(request, errors);
        return mapping.findForward("memError");
      }
      if (sells.getExpiredDt().compareTo(DateUtils.getToday("yyyy/MM/dd")) < 0) {
        errors.add("errMsg",
            new ActionError("alert.Error", "商家使用期限至：" + sells.getExpiredDt()));
        saveErrors(request, errors);
        return mapping.findForward("memError");
      }
      // 2.存檔
      if (StringUtils.defaultString(request.getParameter("func"))
          .equals("JOIN")) {// 加入會員
        if (StringUtils.defaultString(request.getParameter("email")).equals("")) {
          errors.add("errMsg", new ActionError("alert.Error", "Email 未輸入"));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
        if (StringUtils.defaultString(request.getParameter("name")).equals("")) {
          errors.add("errMsg", new ActionError("alert.Error", "姓名  未輸入"));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
        if (StringUtils.defaultString(request.getParameter("birthDt")).equals(
            "")) {
          errors.add("errMsg", new ActionError("alert.Error", "出生年月日 未輸入"));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
        if (StringUtils.defaultString(request.getParameter("password")).equals(
            "")) {
          errors.add("errMsg", new ActionError("alert.Error", "密碼 未輸入"));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
        if (!StringUtils.defaultString(request.getParameter("password"))
            .equals(
                StringUtils.defaultString(request.getParameter("cfPassword")))) {
          errors.add("errMsg", new ActionError("alert.Error", "密碼驗證錯誤"));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
        Member vo = new Member();
        vo.setActDt(new java.util.Date());
        vo.setAddress(request.getParameter("address"));
        vo.setBirthDt(request.getParameter("birthDt"));
        vo.setEmail(request.getParameter("email"));
        vo.setEpYn(request.getParameter("epYn"));
        vo.setIp(request.getRemoteAddr());
        vo.setJoinDt(new java.util.Date());
        vo.setMobile(request.getParameter("mobile"));
        vo.setPassword(request.getParameter("password"));
        vo.setName(request.getParameter("name"));
        vo.setSellsNo(request.getParameter("sells"));
        vo.setStatus("Y");
        vo.setTel(request.getParameter("tel"));
        vo.setZip(request.getParameter("zip"));
        memberService.saveMember(vo);
        // 發送Email
        StringBuffer sb = new StringBuffer();
        sb.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
        sb.append("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
        sb.append("<head>");
        sb.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
        sb.append("<title>歡迎 加入").append(sells.getSellsNm())
            .append(" 會員</title>");
        sb.append("</head>");
        sb.append("");
        sb.append("<body>");
        sb.append("<p><br />");
        sb.append("  親愛的 ").append(vo.getName()).append(" 您好：");
        sb.append("  <br />");
        sb.append("</p>");
        sb.append("<p>這是系統自動發出的訊息。<br />");
        sb.append("  您已成功申請加入  <a href='").append(sells.getHomepage())
            .append("' target='_blank' >");
        sb.append(sells.getStoreNm()).append("</a> 會員。<br />");
        sb.append("您的帳號：").append(vo.getEmail()).append(" <br />");
        // sb.append("您的密碼：").append(vo.getPassword()).append("<br />");
        sb.append("<p>為了保障您的權益，請您牢記且妥善保管您的帳號及密碼。<br />");
        sb.append("  <br />");
        sb.append("<br />");
        sb.append(sells.getStoreNm()).append("站長敬上。</p>");
        sb.append("<p><a href=\"").append(sells.getHomepage()).append("\">")
            .append(sells.getStoreNm()).append("</a></p>");
        sb.append("</body>");
        sb.append("</html>");
        MailBean mailBean = new MailBean();
        mailBean.setFrom(sells.getEmail());
        mailBean.setFromName(sells.getStoreNm());
        mailBean.setTo(vo.getEmail());
        mailBean.setToName(vo.getName());
        mailBean.setMailServer(EcServer.getMailServer());
        mailBean.setSubject(sells.getStoreNm() + " - 加入會員通知");
        mailBean.setBody(sb.toString());
        mailBean.setCharset("UTF-8");
        MailBean mailBean2 = new MailBean();
        mailBean2.setFrom(sells.getEmail());
        mailBean2.setFromName(sells.getStoreNm());
        mailBean2.setTo(sells.getEmail());
        if ("S0000000136".equals(sells.getSellsNo())) {
          mailBean2.setMailServer("msa.hinet.net");
        } else {
          mailBean2.setMailServer(EcServer.getMailServer());
        }
        mailBean2.setSubject(sells.getStoreNm() + " - 加入會員通知");
        mailBean2.setBody(sb.toString());
        mailBean2.setCharset("UTF-8");
        try {
          Mail mail = new Mail(mailBean);
          Mail mail2 = new Mail(mailBean2);
        } catch (Exception e) {
          log.info("mail e:" + e.getMessage());
        }
        session.setAttribute("icSells", sells.getSellsNo());
        session.setAttribute("icMem", vo.getMemberNo());
        session.setAttribute("icMemNm", vo.getName());
        request.setAttribute("sells", sells);
        return mapping.findForward("successJoin");
      } else {
        if (StringUtils.isBlank(request.getParameter("func"))) {
          errors.add("errMsg", new ActionError("alert.Error", "傳入參數錯誤"));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
        // 1.確認Sells 是否到期
        String memNo = ObjectUtils.toString(session.getAttribute("icMem"));
        String memNm = ObjectUtils.toString(session.getAttribute("icMemNm"));
        if (memNo.equals("")) { // 找不到Cookies
          response.sendRedirect("memSessionEx.do");
          return null;
        }
        // 2.查詢會員
        Member vo = memberService.getMember(sells.getSellsNo(), memNo);
        if (!vo.getSellsNo().equals(request.getParameter("sells"))) {
          errors.add("errMsg", new ActionError("alert.Error", "店家編號驗證錯誤"));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
        if (vo == null) {
          return mapping.findForward("memSessionLost");
        }
        if (StringUtils.defaultString(request.getParameter("func")).equals(
            "UPDATE")) { // 修改會員資料
          if (StringUtils.defaultString(request.getParameter("name"))
              .equals("")) {
            errors.add("errMsg", new ActionError("alert.Error", "姓名  未輸入"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          if (StringUtils.defaultString(request.getParameter("birthDt"))
              .equals("")) {
            errors.add("errMsg", new ActionError("alert.Error", "出生年月日 未輸入"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          vo.setAddress(request.getParameter("address"));
          vo.setBirthDt(request.getParameter("birthDt"));
          vo.setEpYn(request.getParameter("epYn"));
          vo.setMobile(request.getParameter("mobile"));
          vo.setName(request.getParameter("name"));
          vo.setStatus("Y");
          vo.setTel(request.getParameter("tel"));
          vo.setZip(request.getParameter("zip"));
          vo.setModiDt(new java.util.Date());
          vo.setModiMan(vo.getMemberNo());
          memberService.updateMember(vo);
          session.setAttribute("icSells", sellsNo);
          session.setAttribute("icMem", memNo);
          session.setAttribute("icMemNm", vo.getName());
          request.setAttribute("sells", sells);
          request.setAttribute("member", vo);
          return mapping.findForward("successUpdate");
        } else if (StringUtils.defaultString(request.getParameter("func"))
            .equals("UPDATEPWD")) { // 修改會員密碼
          if (StringUtils.defaultString(request.getParameter("oldPassword"))
              .equals("")) {
            errors.add("errMsg", new ActionError("alert.Error", "舊密碼 未輸入"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          if (StringUtils.defaultString(request.getParameter("password"))
              .equals("")) {
            errors.add("errMsg", new ActionError("alert.Error", "新密碼 未輸入"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          if (!StringUtils.defaultString(request.getParameter("oldPassword"))
              .equals(vo.getPassword())) {
            errors.add("errMsg", new ActionError("alert.Error", "舊密碼 錯誤"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          if (!StringUtils
              .defaultString(request.getParameter("password"))
              .equals(
                  StringUtils.defaultString(request.getParameter("cfPassword")))) {
            errors.add("errMsg", new ActionError("alert.Error", "密碼驗證錯誤"));
            saveErrors(request, errors);
            return mapping.findForward("memError");
          }
          vo.setPassword(request.getParameter("password"));
          vo.setModiDt(new java.util.Date());
          vo.setModiMan(vo.getMemberNo());
          memberService.updateMember(vo);
          StringBuffer sb = new StringBuffer();
          sb.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
          sb.append("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
          sb.append("<head>");
          sb.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
          sb.append("<title>").append(sells.getSellsNm())
              .append(" 會員密碼變更</title>");
          sb.append("</head>");
          sb.append("");
          sb.append("<body>");
          sb.append("<p><br />");
          sb.append("  親愛的 ").append(vo.getName()).append(" 您好：");
          sb.append("  <br />");
          sb.append("</p>");
          sb.append("<p>這是系統自動發出的訊息。<br />");
          sb.append("您已成功修改密碼。<br />");
          sb.append("下次登入請使用新密碼。<br />");
          sb.append("<p>為了保障您的權益，請您牢記且妥善保管您的帳號及密碼。<br />");
          sb.append("  <br />");
          sb.append("<br />");
          sb.append(sells.getStoreNm()).append("站長敬上。</p>");
          sb.append("<p><a href=\"").append(sells.getHomepage()).append("\">")
              .append(sells.getStoreNm()).append("</a></p>");
          sb.append("</body>");
          sb.append("</html>");
          MailBean mailBean = new MailBean();
          mailBean.setFrom(sells.getEmail());
          mailBean.setFromName(sells.getSellsNm());
          mailBean.setTo(vo.getEmail());
          mailBean.setToName(vo.getName());
          mailBean.setMailServer(EcServer.getMailServer());
          mailBean.setSubject(sells.getStoreNm() + " - 會員密碼變更通知");
          mailBean.setBody(sb.toString());
          mailBean.setCharset("UTF-8");
          try {
            Mail mail = new Mail(mailBean);
          } catch (Exception e) {
            log.info("mail e:" + e.getMessage());
          }
          session.setAttribute("icSells", sellsNo);
          session.setAttribute("icMem", memNo);
          session.setAttribute("icMemNm", memNm);
          request.setAttribute("sells", sells);
          request.setAttribute("member", vo);
          return mapping.findForward("successUpdate");
        } else {
          errors.add("errMsg", new ActionError("alert.Error", "Func 未傳入異動失敗!"));
          saveErrors(request, errors);
          return mapping.findForward("memError");
        }
      }
    } catch (Exception e) {
      log.info(e.toString());
      errors.add("errMsg", new ActionError("alert.Error", e.getMessage()));
      saveErrors(request, errors);
      return mapping.findForward("memError");
    }
  }
}