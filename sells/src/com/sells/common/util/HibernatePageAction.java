package com.sells.common.util;

import org.apache.struts.action.Action;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import com.sells.dao.Sells;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Hashtable;

public abstract class HibernatePageAction extends Action {
  Log log = LogFactory.getLog(HibernatePageAction.class);
  /**
   * @param mapping
   * @param form
   * @param request
   * @param response
   * @return org.apache.struts.action.ActionForward
   * @roseuid 40E511570168
   */
  @SuppressWarnings("unchecked")
  public ActionForward execute(ActionMapping mapping, ActionForm form,
      HttpServletRequest request, HttpServletResponse response) {
    PageControl control = (PageControl) request.getSession().getAttribute(
        "_PAGECONTROL");
    ActionForward forward;
    if (control == null) {
      control = new PageControl();
      Hashtable map = new Hashtable();
      java.util.Enumeration enu = request.getParameterNames();
      while (enu.hasMoreElements()) {
        Object obj = enu.nextElement();
        map.put(obj, request.getParameterValues((String) obj));

      }
      control.setValuemap(map);
      control.setAction(mapping.getPath());
    } else {
      if (!control.isThisAction(mapping.getPath())) {
        Hashtable map = new Hashtable();
        java.util.Enumeration enu = request.getParameterNames();
        while (enu.hasMoreElements()) {
          Object obj = enu.nextElement();
          map.put(obj, request.getParameterValues((String) obj));
        }
        control.clear();
        control.setValuemap(map);
        control.setAction(mapping.getPath());
      } else if (request.getParameter("pagecmd") == null) {
        Hashtable map = new Hashtable();
        java.util.Enumeration enu = request.getParameterNames();
        while (enu.hasMoreElements()) {
          Object obj = enu.nextElement();
          map.put(obj, request.getParameterValues((String) obj));
        }
        control.clear();
        control.setValuemap(map);
        control.setAction(mapping.getPath());
      } else if ("gopage".equals(request.getParameter("pagecmd"))) {
        Hashtable map = new Hashtable();
        java.util.Enumeration enu = request.getParameterNames();
        while (enu.hasMoreElements()) {
          Object obj = enu.nextElement();
          map.put(obj, request.getParameterValues((String) obj));
        }
        control.clear();
        control.setValuemap(map);
        control.setAction(mapping.getPath());

      }
    }
    int irows = readSize(mapping, request, response, control);
    control.setRowCount(irows);
    control.calPage(request);
    forward = readPage(mapping, request, response, control);
    request.getSession().setAttribute("_PAGECONTROL", control);
    return forward;
  }

  /**
   * @param mapping
   * @param request
   * @param response
   * @param pagecontrol
   * @return
   */
  public abstract int readSize(ActionMapping mapping,
      HttpServletRequest request, HttpServletResponse response,
      PageControl pagecontrol);

  /**
   * @param mapping
   * @param request
   * @param response
   * @param pagecontrol
   * @return
   */
  public abstract ActionForward readPage(ActionMapping mapping,
      HttpServletRequest request, HttpServletResponse response,
      PageControl pagecontrol);
}
