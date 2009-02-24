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
pre {
white-space: pre-wrap;       /* css-3 */
white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
white-space: -pre-wrap;      /* Opera 4-6 */
white-space: -o-pre-wrap;    /* Opera 7 */
word-wrap: break-word;       /* Internet Explorer 5.5+ */
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
<table width="800" border="0" align="center" cellpadding="4" cellspacing="2" class="tb1">
  <tr>
    <td width="364" class="tb2"><span class="style8" >訂單確定送出，<br>
      非常感謝您的購買!<br>
    我們同時會將您的訂單寄到您的mail，敬請查收~!</span></td>
  </tr>
</table>
<table width="800" border="0" align="center" cellpadding="5" cellspacing="1" class="tb1">
    <tr>
      <td class="tb3" bgcolor="#FFFFFF" >請務必以指定的付款方式來完成交易。<BR>
	  ${requestScope.sells.storeNm} 網址：<a href='${requestScope.sells.homepage}'>${requestScope.sells.homepage}</a>
	  <hr noshade size=1>訂單編號︰${requestScope.orderNo}<hr noshade size=1>
	  ${requestScope.name} 您好您訂購的商品清單如下：<br><br>
	  ${requestScope.orderItem}
	  <hr noshade size=1>
	  訂購人資料<br>	  
	  姓名︰${requestScope.name}
	  <br>
	  郵遞區號︰${requestScope.zip}
	  <br>
	  地址︰${requestScope.address}
	  <br>
	  E-mail︰${requestScope.email}
	  <br>
	  電話︰${requestScope.tel}
	  <br>
	  手機︰${requestScope.mobile}
	  <br>
	  付款方式︰${requestScope.payType}
	  <br>
	  轉出帳號後5碼︰${requestScope.exportId}
	  <br>
	  備註︰
	  <br>
	  ${requestScope.desc}
	  <hr noshade size=1>
	  付款資料︰<br>
    <div style="word-wrap: break-word;white-space : normal;">
<pre >${requestScope.sells.payDesc}</pre></div>
	  <hr noshade size=1>
	  ${requestScope.sells.storeNm}網址：<a href='${requestScope.sells.homepage}'>${requestScope.sells.homepage}</a>
	  </td>
    </tr>
</table>
<%@ include file="footer.jsp"%>
</center>
</body>
</html>