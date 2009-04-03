<%@ page contentType="text/html; charset=Utf-8"%>
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
<title>${requestScope.sells.storeNm} 專屬購物車</title>
</head>
<body onload="document.payment.submit();">
<center>
<form name="payment" action="https://aquarius.neweb.com.tw/mPP5/TransServlet" method="post">
<input type=hidden name="MerchantNumber" value="${requestScope.sells.storeId}">
<input type=hidden name="OrderNumber" value="${requestScope.sslNo}">
<input type=hidden name="Amount" value="${requestScope.order.amt+requestScope.order.process+requestScope.order.freightfar}.00">
<input type=hidden name="OrgOrderNumber" value="${requestScope.order.orderNo}">
<input type=hidden name="Englishmode" value="0">
<input type=hidden name="ApproveFlag" value="1">
<input type=hidden name="DepositFlag" value="1">
<input type=hidden name="OrderURL" value="http://www.icart.tw/Sells/paymentFeedback.do">
<input type=hidden name="ReturnURL" value="http://www.icart.tw/Sells/paymentReceive.do">
<input type=hidden name="checksum" value="${requestScope.checksum}">
<input type=hidden name="op" value="AcceptPayment">
<input type=submit name='b1' value='送出'>
</form>
</center>
</body>
</html>