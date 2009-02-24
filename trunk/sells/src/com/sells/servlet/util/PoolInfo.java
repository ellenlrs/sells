/*
 * Created on 2005/7/13
 *
 * 顯示目前connection pool的使用狀況
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.sells.servlet.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp.BasicDataSource;

/**
 * DB Connection 監測
 * @author davidelin
 *
 */
public class PoolInfo extends HttpServlet {

  /**
   * Constructor of the object.
   */
  public PoolInfo() {
    super();
  }

  /**
   * The doGet method of the servlet. <br>
   *
   * This method is called when a form has its tag value method equals to get.
   * 
   * @param request the request send by the client to the server
   * @param response the response send by the server to the client
   * @throws ServletException if an error occurred
   * @throws IOException if an error occurred
   */
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    String database = (String) getServletContext().getInitParameter("databaseName") ;
    Context initCtx = null;   
    try  {
        try {
            initCtx = new InitialContext();  
            BasicDataSource ds = (BasicDataSource) initCtx.lookup(database);
            out.println("<BR>Database");
            out.println("<BR>NumIdle:".concat(String.valueOf(String.valueOf(ds.getNumIdle()))));
            out.println("<BR>getMaxIdle:".concat(String.valueOf(String.valueOf(ds.getMaxIdle()))));
            out.println("<BR>getNumActive:".concat(String.valueOf(String.valueOf(ds.getNumActive()))));
            out.println("<BR>getMaxActive:".concat(String.valueOf(String.valueOf(ds.getMaxActive()))));
        } catch(Exception e) {
            out.println("Exception e:".concat(String.valueOf(String.valueOf(e.toString()))));
        }
    } finally {
        out.println("Finally--");
    }
    out.flush();
    out.close();
  }

  /**
   * The doPost method of the servlet. <br>
   *
   * This method is called when a form has its tag value method equals to post.
   * 
   * @param request the request send by the client to the server
   * @param response the response send by the server to the client
   * @throws ServletException if an error occurred
   * @throws IOException if an error occurred
   */
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request,response);
  }

}
