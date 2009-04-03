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
<center><BR><BR><BR>
<table width="800" border="0" align="center" cellpadding="4" cellspacing="2" class="tb1">
  <tr>
    <td class="tb2" align=center><span class="style8" >${msg}<br><form action='reOrder.do' name='a' method='post'>
    <input type="hidden" name=orderNo value='${requestScope.orderNo}' >
    <input type="hidden" name=checksum value='${requestScope.checksum}' >
    <input name="b123" onClick="goHome();" value="返回首頁" type="button" class="button">
    <input type=submit name=b1 value="重新訂購" class="button"></form></td>
  </tr>
</table>
<%@ include file="footer.jsp"%>
</center>
</body>
</html>
<script>
function goHome(){
  var winName = "_top" ;
  var features = "";
  var theURL = "${requestScope.sells.homepage}";
  window.open(theURL,winName,features);
}
</script>