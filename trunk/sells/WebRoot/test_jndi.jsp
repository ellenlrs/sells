<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import='javax.sql.*' %>
<%@ page import='java.sql.*' %>
<%@ page import='javax.naming.*' %>
<%
Connection con = null ;
try {
  //out.println("23402429429084");
  Context initCtx = new InitialContext();
  String database = (String) getServletContext().getInitParameter("databaseName") ;
  DataSource ds = (DataSource)  initCtx.lookup(database);
  con = ds.getConnection(); 
  Statement stmt = con.createStatement();
  ResultSet rs = stmt.executeQuery("select * from LOGIN_DATA WHERE LOGIN_TP = 'A' " );
  out.println("Rows:" + rs.getRow());
  if(rs.next()) {
    out.println("Server1 is life:");
    out.println(rs.getString(1));
    out.println("<BR>");
  }
  rs.close();
  con.close();
  con = null;
}catch (Exception e ) {
  //System.out.println("test:" + e.getMessage() );
  //out.println("test:" + e.getMessage() );
} finally {
  //out.println("test:fINALL;" );
}
%>