<%@ page contentType="text/html; charset=Utf-8"%>
<jsp:directive.page import="com.sells.dao.Sells"/>
<jsp:directive.page import="com.sells.dao.LoginData"/>
<%@ include file="taglibs.jsp"%>
<html>
<head>
<LINK REL="SHORTCUT ICON" HREF="http://www.icart.tw/Sells/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<br>
<table width="90%" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" height="25" align="left" bgcolor="#0066CC"><strong class="style6">產生購物車html代碼／安裝</strong></td>
  </tr>
  <tr>
    <td width="100%" align="left" class="style5"><span class="style1"><strong>如何產生購物車代碼並安裝步驟</strong></span><strong><br>
    </strong>進入賣家管理介面後，可以依照系統指示產生出一組購物車代碼，將此代碼複製，貼於任何支援html的網站，例如網路相簿、部落格、個人網站、家族、免費網頁、電子郵件、eDM、讓您立刻就有一個購物網站。</td>
  </tr>
  <tr>
      <td width="100%" height="28" align="left"><a href="support1.jsp" class="style3">參考支援網站列表</a></td>
  </tr>
  <tr>
    <td align="left" width="100%"></td>
  </tr>
  <tr>
    <td width="100%" height="25" align="left" bgcolor="#0066CC"><strong class="style6">更多使用問題</strong></td>
  </tr>
  <tr>
    <td width="100%" align="left" class="style5"><a href="http://www.icart.tw/Sells/carCode0.jsp" class="style3"><br>
      快速產生購物車說明</a><br>
    如過還有更多問題，可以<a href="help1.jsp" class="style3">聯絡我們</a>喔。</td>
  </tr>
</table>
<%@ include file="footer1.jsp"%>
</body>
</html>