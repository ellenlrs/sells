<%@ page contentType="text/html; charset=Utf-8"%><%@ include file="taglibs.jsp"%>
<jsp:directive.page import="com.sells.dao.Sells"/>
<jsp:directive.page import="com.sells.dao.LoginData"/>
<%
try {
Sells sellvo = (Sells) request.getSession().getAttribute("sells") ;
LoginData loginvo = (LoginData) request.getSession().getAttribute("loginvo") ;
  if ( sellvo == null ) {%>
     <c:redirect url="./sessionLost.jsp"/>
  <%} 
  if ( loginvo == null ){%>
    <c:redirect url="./sessionLost.jsp"/>
  <%}
} catch (Exception e) {%>
  <c:redirect url="./sessionLost.jsp"/>
<%}
%>
