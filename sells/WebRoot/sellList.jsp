﻿﻿<%@ page contentType="text/html; charset=Utf-8"%>
<jsp:directive.page import="com.sells.dao.Sells"/>
<jsp:directive.page import="com.sells.dao.LoginData"/>
<%@ include file="taglibs.jsp"%>
<html>
<head>
<LINK REL="SHORTCUT ICON" HREF="http://www.icart.tw/Sells/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=Utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="iCart,購物車,部落格,blog,相片,網站,簡單,個人網站,3c,手工香皂,美容,美髮,香水,旅遊,日本,機票,火車,自由行,高鐵,影片,投資,理財">
<META NAME="Description" CONTENT="iCart,購物車,部落格,blog,相片,網站,簡單,個人網站,3c,手工香皂,美容,美髮,香水,旅遊,日本,機票,火車,自由行,高鐵,影片,投資,理財">
<META NAME="copyright" content="Copyright 2007 iCart">
<META NAME="author" content="service">
<META NAME="email" content="service@icart.tw"> 
<META NAME="Robots" content="INDEX,FOLLOW">
<META NAME="Revisit-after" content="1">
<title><bean:message key="app.title"/></title>
<link href="car.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0">
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%>
  <table width="95%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td align="center" bgcolor="#0066CC" class="style6" ><strong>賣家編號</strong></td>
      <td align="center" bgcolor="#0066CC" class="style6" ><strong>店名</strong></td>
      <td align="center" bgcolor="#0066CC" class="style6" ><strong>帳號</strong></td>
      <td align="center" bgcolor="#0066CC" class="style6" ><strong>加入日期</strong></td>
      <td align="center" bgcolor="#0066CC" class="style6" ><strong>到期日期</strong></td>
      <td align="center" bgcolor="#0066CC" class="style6" ><strong>等級</strong></td>
      <td align="center" bgcolor="#0066CC" class="style6" >&nbsp;</td>
    </tr>
    <c:forEach items="${search.sellsList}" var="item" varStatus="s">
    <tr bgcolor="#ffffff">
      <td width="15%" align="center" class="style5"><strong>${item.sellsNo}</strong></td>
      <td align="center" class="style5">${item.storeNm}</td>
      <td width="20%" align="center" class="style5">${search.loginDataList[s.index].loginId}</td>
      <td width="10%" align="center" class="style5">${item.joinDt}</td>
      <td width="10%" align="center" class="style5">${item.expiredDt}</td>
      <td width="10%" align="center" class="style5">${item.sellsLv}</td>
      <td width="10%" align="center" ><a class="style1" href='sellResult.do?sellsNo=${item.sellsNo}' >詳細資料</a></td>
    </tr>
    </c:forEach>
</table>
<span align="center" ><a href="javascript:history.back();" class="style1">回上一頁</a></span>
<%@ include file="footer1.jsp"%>
</body>
</html>