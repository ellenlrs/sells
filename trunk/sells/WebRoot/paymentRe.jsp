<%@ page contentType="text/html; charset=Utf-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
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
<title> 專屬購物車</title>
<link href="car.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	font-size: 12px;
	background-color: #FFFFFF;
	margin-top: 0px;
	margin-left: 0px;
}
.button {
	color: ${requestScope.sells.color2 == null || requestScope.sells.color2 == '' ?'#99CCFF':requestScope.sells.color2};
	font-size: 12px;
	padding-top: 3px;
	background-color: ${requestScope.sells.color1 == null || requestScope.sells.color1 == '' ?'#006699':requestScope.sells.color1};
}
.tb2 {
    background-color: ${requestScope.sells.color2 == null || requestScope.sells.color2 == '' ?'#99CCFF':requestScope.sells.color2};
	font-size: 12px;
}
.tb1 {
    background-color: ${requestScope.sells.color1 == null || requestScope.sells.color1 == '' ?'#006699':requestScope.sells.color1};
	font-size: 12px;
}
.tb3 {
	font-size: 12px;
}-->
</style>
</head>
<body>
<center>
<%
    out.println("Payment start receive:");
    String CheckSum = StringUtils.defaultString(request.getParameter("P_CheckSum"));
    out.println("CheckSum:"+CheckSum);
    String PRC = StringUtils.defaultString(request.getParameter("final_return_PRC"));
    out.println("PRC:"+PRC);
    String SRC = StringUtils.defaultString(request.getParameter("final_return_SRC"));
    out.println("SRC:"+SRC);
    String ApprovalCode = StringUtils.defaultString(request.getParameter("final_return_ApproveCode"));
    out.println("ApprovalCode:"+ApprovalCode);
    String BankResponseCode = StringUtils.defaultString(request.getParameter("final_return_BankRC"));
    out.println("BankResponseCode:"+BankResponseCode);
    String MerchantNumber = StringUtils.defaultString(request.getParameter("P_MerchantNumber"));
    out.println("MerchantNumber:"+MerchantNumber);
    String OrderNumber = StringUtils.defaultString(request.getParameter("P_OrderNumber"));
    out.println("OrderNumber:"+OrderNumber);
    String Amount = StringUtils.defaultString(request.getParameter("P_Amount"));
    out.println("Amount:"+Amount);
    String BatchNumber = StringUtils.defaultString(request.getParameter("final_return_BatchNumber"));
    out.println("BatchNumber:"+BatchNumber);
    String orderNo = StringUtils.right(("0000000000"+String.valueOf(OrderNumber)), 10);
    out.println("orderNo:"+orderNo);
    %>
<%@ include file="footer.jsp"%>
</center>
</body>
</html>