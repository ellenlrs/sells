﻿<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/><%@ include file="taglibs.jsp"%>
<BR>
<%=StringUtils.substring("一二三四五",0,10)%><BR>
<%=StringUtils.substring("一二三四五",0,2)%><BR>
<%=StringUtils.substring(StringUtils.defaultString(null),0,2)%><BR>
1:request.getParameter:
<%=request.getParameter("Data")%>
<BR>
2:URLDecoder.decode:
<%=URLDecoder.decode(com.sells.common.util.UtilString.fpIsNull(request.getParameter("Data")))%>
<BR>
3:UtilString.getString
<%=com.sells.common.util.UtilString.getString(com.sells.common.util.UtilString.fpIsNull(request
              .getParameter("Data")), "utf-8")%>
<BR>
5:c:out<c:out value="${param.Data}" />
<BR>
<a href="test.jsp?Data=中文字">1</a>
<BR>
<a href="test.jsp?Data=<%=URLEncoder.encode("中文字","utf-8")%>">1</a>