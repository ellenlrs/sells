/*
 * Created on 2005/7/25
 *
 */
package com.sells.servlet.util;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.sells.common.util.EcServer;

/**
 * 系統參數啟動器
 * @author davidelin
 *
 */
public class ServerInit extends HttpServlet {

  private Log log = LogFactory.getLog(ServerInit.class);
  /**
   * Constructor of the object.
   */
  public ServerInit() {
    super();
  }
  
  /* (non-Javadoc)
   * @see javax.servlet.Servlet#init(javax.servlet.ServletConfig)
   */
  public void init(ServletConfig config)  throws ServletException {
    log.info("Start server init...");
    EcServer.setSysName((String) config.getServletContext().getInitParameter("sysName")) ;
    EcServer.setAdminNo((String) config.getServletContext().getInitParameter("adminNo")) ;
    EcServer.setMailServer((String) config.getServletContext().getInitParameter("mailServer") ) ;

    log.info("End server init...");   
  }

  /**
   * Destruction of the servlet. <br>
   */
  public void destroy() {
    super.destroy(); // Just puts "destroy" string in log
    // Put your code here
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

    
  }

}
