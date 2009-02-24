package com.sells.common.util;

import java.util.Iterator;

import java.io.*;
import java.net.URLEncoder;

public class PageControl {
  private String action;
  private int iRowCount = 0;
  private int ishowrows = 20; //每頁筆數
  private int inowPage = 0;
  private java.util.Map valuemap;
  private String sortField;
  private String asc ;
  private boolean ascending = true;

  /**
   * @return Returns the iRowCount.
   */
  public int getIRowCount() {
    return iRowCount;
  }

  /**
   * @param rowCount The iRowCount to set.
   */
  public void setIRowCount(int rowCount) {
    iRowCount = rowCount;
  }

  /**
   * @return Returns the ishowrows.
   */
  public int getIshowrows() {
    return ishowrows;
  }

  /**
   * @param ishowrows The ishowrows to set.
   */
  public void setIshowrows(int ishowrows) {
    this.ishowrows = ishowrows;
  }

  /**
   * @return Returns the inowPage.
   */
  public int getInowPage() {
    return inowPage;
  }

  /**
   * @param ascending The ascending to set.
   */
  public void setAscending(boolean ascending) {
    this.ascending = ascending;
  }

  /**
   * @param asc The asc to set.
   */
  public void setAsc(String asc) {
    this.asc = asc;
  }

  /**
   * @param sortField The sortField to set.
   */
  public void setSortField(String sortField) {
    this.sortField = sortField;
  }

  public PageControl() {
  }

  public String getSortField() {
    return sortField;
  }

  public boolean isAscending() {
    return ascending;
  }

  public int getPageCount() {
    if (ishowrows == -1)
      return 1;
    else {
      if ((iRowCount % ishowrows) != 0)
        return (iRowCount / ishowrows) + 1;
      else
        return iRowCount / ishowrows;
    }
  }

  public int getRowCount() {
    return iRowCount;
  }

  public int getShowrows() {
    if (ishowrows == -1) {
      return getRowCount();
    } else

      return ishowrows;
  }

  public int getNowPage() {
    return inowPage;
  }

  public int getStartRow() {
    if (ishowrows == -1)
      return 0;
    else
      return inowPage * this.ishowrows;
  }

  public int getEndRow() {
    if (ishowrows == -1) {
      return getRowCount();
    } else {
      int itemp = (inowPage + 1) * this.ishowrows;
      if (itemp > getRowCount())
        itemp = getRowCount();
      return itemp;
    }
  }

  public String getParameter(String key, String defaultstr) {
    if (!valuemap.containsKey(key)) {
      return defaultstr;
    } else {
      return ((String[]) valuemap.get(key))[0];
    }
  }

  public String[] getParameterValues(String key) {
    if (valuemap.containsKey(key)) {
      return (String[]) valuemap.get(key);
    }
    return null;
  }

  public String getParameterValueURL(String enc)
      throws UnsupportedEncodingException {
    StringBuffer sb = new StringBuffer();
    Iterator keyIter = valuemap.keySet().iterator();
    while (keyIter.hasNext()) {
      String keytemp = (String) keyIter.next();
      if ("pagecmd".equals(keytemp) || keytemp.charAt(0) == '_')
        continue;
      String[] valuetemp = (String[]) valuemap.get(keytemp);
      for (int itemp = 0; itemp < valuetemp.length; itemp++) {
        sb.append(URLEncoder.encode(keytemp, enc));
        sb.append("=");
        sb.append(URLEncoder.encode(valuetemp[itemp], enc));
        sb.append("&");
      }
    }
    return sb.toString();
  }

  public String getAction() {
    return action;
  }

  public void setAction(String action) {
    this.action = action;
  }

  public void setRowCount(int iRowCount) {
    if (iRowCount > 0)
      this.iRowCount = iRowCount;
  }

  public java.util.Map getValuemap() {
    return valuemap;
  }

  public void setValuemap(java.util.Map valuemap) {
    this.valuemap = valuemap;
  }

  public void setShowrows(int ishowrows) {

    this.ishowrows = ishowrows;
  }

  public void setInowPage(int inowPage) {
    this.inowPage = inowPage;
  }

  public boolean isThisAction(String actioname) {
    return actioname.equals(this.action);
  }

  public void clear() {
    action = null;
    iRowCount = 0;
    valuemap.clear();
    ishowrows = 10;
    inowPage = 0;
  }

  public void calPage(javax.servlet.http.HttpServletRequest request) {
    String cmd = request.getParameter("pagecmd");
    if (cmd == null)
      cmd = "list";

    if (request.getParameter("_showrows") != null) {
      int itemp = Integer.parseInt(request.getParameter("_showrows"));
      if (itemp > 0) {
        int befrow = this.getStartRow();
        ishowrows = Integer.parseInt(request.getParameter("_showrows"));
        if (befrow % ishowrows == 0)
          this.setInowPage((befrow / ishowrows));
        else
          this.setInowPage((befrow / ishowrows));
      } else if ("-1".equals(request.getParameter("_showrows"))) {
        ishowrows = -1;
        this.setInowPage(0);
      }
    }
    // inowPage =
    // request.getParameter("nowPage")==null?inowPage:Integer.parseInt(request.getParameter("nowPage"));
    //下一頁
    if ("nextpage".equals(cmd)) {
      inowPage++;
      if (inowPage >= this.getPageCount())
        inowPage--;
//      System.out.println("nextpage:" +inowPage) ;
    } else if ("uppage".equals(cmd)) { //上一頁
      inowPage--;
      if (inowPage < 0)
        inowPage = 0;
//      System.out.println("uppage:" +inowPage) ;
    } else if ("gopage".equals(cmd)) { // goto Page
      int igopage = request.getParameter("_page") == null ? 1 : Integer
          .parseInt(request.getParameter("_page"));
      if (igopage > this.getPageCount()) {
        this.inowPage = this.getPageCount();
      } else
        this.inowPage = igopage;
//      System.out.println("gopage:" +inowPage) ;
    }else if ("sort".equals(cmd)) { 
      String sortfield = request.getParameter("_field");
      if (sortField != null) {
        if (sortField.equals(sortfield)) {
          ascending = !ascending;
        }
      }
      this.sortField = sortfield;
    } else if ("ascending".equals(cmd)) {
      String asc = request.getParameter("_asc");
      if (asc != null) {
        Boolean boo = new Boolean(asc);
        ascending = boo.booleanValue();
      }
    }
    //排序
    String sortfield = request.getParameter("_sort");
    if (sortField != null) {
      if (sortField.equals(sortfield)) {
        ascending = !ascending;
      }
      this.sortField = sortfield;
    }
    //升，降排序
    String _asc = request.getParameter("_asc");
    if (_asc != null) {
      this.asc = _asc ;
    }
  }

  /**
   * @return Returns the asc.
   */
  public String getAsc() {
    return asc;
  }
}
