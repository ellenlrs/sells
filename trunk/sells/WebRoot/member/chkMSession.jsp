<%@ page contentType="text/html; charset=Utf-8"%><%@ include file="../taglibs.jsp"%>
<jsp:directive.page import="org.apache.commons.lang.ObjectUtils"/>
<%
//HttpSession session = request.getSession();
try {
	String sellsNo = ObjectUtils.toString(session.getAttribute("icSells"));
	String memNo = ObjectUtils.toString(session.getAttribute("icMem"));
	if ( memNo.equals("") ) {%>
     <c:redirect url="memSessionEx.do"/>
  <%} 
} catch (Exception e) {%>
  <c:redirect url="memSessionEx.do"/>
<%}
%>
