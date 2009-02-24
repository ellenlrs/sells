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
import org.apache.commons.lang.math.NumberUtils;
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
import com.sells.common.util.EcServer;
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
public class CarCode1Action extends Action {
  private SellsService sellsService ;
  private Log log = LogFactory.getLog(CarCode1Action.class);
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
    HttpSession session = request.getSession ();
    ActionErrors errors = new ActionErrors();
    try {
      Sells sells= (Sells) session.getAttribute("sells") ;
      LoginData loginvo = (LoginData) session.getAttribute("loginvo") ;
      if (sells == null ) {
        return mapping.findForward("sessionLost");
      } else {
        if ( StringUtils.isBlank(request.getParameter("itemNo"))) {
          errors.add("errMsg", new ActionError("alert.Error", "商品編號 未輸入!"));
          saveErrors(request, errors);
          return mapping.findForward("error1");
        }
        if ( StringUtils.isBlank(request.getParameter("itemNm"))) {
          errors.add("errMsg", new ActionError("alert.Error", "商品名稱 未輸入!"));
          saveErrors(request, errors);
          return mapping.findForward("error1");
        }
        if ( StringUtils.isBlank(request.getParameter("price"))) {
          errors.add("errMsg", new ActionError("alert.Error", "商品價格 未輸入!"));
          saveErrors(request, errors);
          return mapping.findForward("error1");
        }
        if ( ! NumberUtils.isNumber(request.getParameter("price"))) {
          errors.add("errMsg", new ActionError("alert.Error", "商品價格 請輸入數字!"));
          saveErrors(request, errors);
          return mapping.findForward("error1");
        }
        if ( NumberUtils.createInteger(request.getParameter("price")) <= 0) {
          errors.add("errMsg", new ActionError("alert.Error", "商品價格 需要大於 0 !"));
          saveErrors(request, errors);
          return mapping.findForward("error1");
        }
        Sells admin = sellsService.findSellsById(EcServer.getAdminNo());
        //String web = StringUtils.defaultString(request.getParameter("web")) ;
        String web = "utf-8";
        /*
        <strong><font color="#0000FF">A001：XXXXX</font></strong><br />
                     商品說明(可不填)<br /><br />
                     規格1：<br />
                     規格2：<br>
        <font color=ff0000><strong>價格︰$80</strong></font><br>
        <a href=http://www.bidder.cc/cart_p.asp?pno=aaa&pname=bb&p1=111&p2=cc&price=80&num=1&sellerid=jinwei>加入我的購物車</a>
         */
        StringBuffer sb= new StringBuffer();
        if ( !web.equals("utf-8")) {
          sb.append("<script src='").append(admin.getHomepage()).append("/Sells/cart.js'></script>");
        }
        sb.append("<strong><font color=\"#0000FF\">");
        sb.append(request.getParameter("itemNo")).append("：").append(request.getParameter("itemNm")).append("</font></strong><br />\n");
        if ( StringUtils.isNotBlank(request.getParameter("desc"))) {
          sb.append(request.getParameter("desc")).append("<br />").append("<br />\n");
        }
        if ( StringUtils.isNotBlank(request.getParameter("spec1"))) {
          sb.append("規格1：").append(request.getParameter("spec1")).append("<br />\n");
        }
        if ( StringUtils.isNotBlank(request.getParameter("spec2"))) {
          sb.append("規格2：").append(request.getParameter("spec2")).append("<br />\n");
        }
        sb.append("<font color=\"#ff0000\"><strong>價格︰$").append(request.getParameter("price")).append("</strong><br /></font>\n");
        if ( web.equals("utf-8")) {
          sb.append("<a href='").append(admin.getHomepage()).append("/Sells/shopcar.do?itemNo=");
          sb.append(java.net.URLEncoder.encode(request.getParameter("itemNo"),"Utf-8"));
          sb.append("&itemNm=").append(java.net.URLEncoder.encode(request.getParameter("itemNm"),"Utf-8"));
          sb.append("&spec1=").append(java.net.URLEncoder.encode(request.getParameter("spec1"),"Utf-8"));
          sb.append("&spec2=").append(java.net.URLEncoder.encode(request.getParameter("spec2"),"Utf-8"));
          sb.append("&price=").append(request.getParameter("price"));
          sb.append("&qty=1&sells=").append(sells.getSellsNo()).append("' ");
          if (StringUtils.defaultString(request.getParameter("target")).equals("_blank") ) {
            sb.append(" target='_blank' ") ;
          }
//          sb.append("<a href='").append(admin.getHomepage()).append("/Sells/shopcar.do?itemNo=");
//          sb.append(request.getParameter("itemNo"));
//          sb.append("&itemNm=").append(request.getParameter("itemNm"));
//          sb.append("&spec1=").append(request.getParameter("spec1"));
//          sb.append("&spec2=").append(request.getParameter("spec2"));
//          sb.append("&price=").append(request.getParameter("price"));
//          sb.append("&qty=1&sells=").append(sells.getSellsNo()).append("' ");
//          if (StringUtils.defaultString(request.getParameter("target")).equals("_blank") ) {
//            sb.append(" target='_blank' ") ;
//          }

        } else {
          sb.append("<a href=\"javascript:addCart('").append(request.getParameter("itemNo")).append("','");
          sb.append(request.getParameter("itemNm")).append("','");
          sb.append(request.getParameter("spec1")).append("','");
          sb.append(request.getParameter("spec2")).append("','");
          sb.append(request.getParameter("price")).append("','");
          sb.append(sells.getSellsNo()).append("','");
          sb.append(request.getParameter("target")).append("')\"");
        }
        if ( StringUtils.defaultString(request.getParameter("carImg")).equals("text")) {
          sb.append("><font size=2>").append(StringUtils.defaultString(request.getParameter("carText"))).append("</font></a>");
        } else if ( StringUtils.defaultString(request.getParameter("carImg")).equals("userImg")) {
          sb.append("><img src=\"").append(StringUtils.defaultString(request.getParameter("userImg"))).append("\" border=\"0\" ></a>");
        } else {
          sb.append("><img src='").append(admin.getHomepage()).append("/Sells/");
          sb.append(StringUtils.defaultString(request.getParameter("carImg"))).append("' border=\"0\"></a>");
        }
        request.setAttribute("itemNo", request.getParameter("itemNo"));
        request.setAttribute("web", request.getParameter("web"));
        request.setAttribute("itemNm", request.getParameter("itemNm"));
        request.setAttribute("desc", request.getParameter("desc"));
        request.setAttribute("spec1", request.getParameter("spec1"));
        request.setAttribute("spec2", request.getParameter("spec2"));
        request.setAttribute("price", request.getParameter("price"));
        request.setAttribute("target", request.getParameter("target"));
        request.setAttribute("carImg", request.getParameter("carImg"));
        request.setAttribute("userImg", request.getParameter("userImg"));
        request.setAttribute("carText", request.getParameter("carText"));
        request.setAttribute("car", sb.toString());
        sb.setLength(0);
        sb = null ;
        return mapping.findForward("success");
      }
    } catch (Exception e ) {
      errors.add("errMsg", new ActionError("alert.Error", "輸入的資料有誤，請重新檢查後再送出!"));
      saveErrors(request, errors);
      return mapping.findForward("error1");
    }
	}
}