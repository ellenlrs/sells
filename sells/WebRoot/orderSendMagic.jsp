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
<%@ include file="cartcss.jsp" %>
</head>
<body>
<center>
<table width="800" border="0" align="center" cellpadding="4" cellspacing="2" class="tb1">
  <tr>
    <td height="28" align=center class="tb2"><a href="${requestScope.sells.homepage}"><c:if test="${ ! empty requestScope.sells.logo}"><img src="${requestScope.sells.logo}" width="18" height="18" border="0"></c:if>${requestScope.sells.storeNm}</a></td>
  </tr> 
  <tr>
    <th width="364" class="tb2">訂單確定送出，<br>
      非常感謝您的購買!<br>
    我們同時會將您的訂單寄到您的mail，敬請查收~!<BR>
<span style="background-color: rgb(255, 255, 0);">
<a href="http://www.magicshop.url.tw/buy/pay.htm" target="_blank">如您選擇超商繳費[7-11,萊爾富,全家]，請按此即可獲得繳費代碼</a><br/>
</span>
<span style="text-decoration: none;">如您選擇貨到付款，請將金額準備好在家等待產品送達即可</span>
<br/>
<span style="text-decoration: none;">如您選擇ATM或銀行轉帳，請儘速撥空將金額匯款給${requestScope.sells.storeNm}</span>
    </th>
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
	  地址︰${requestScope.address}-${requestScope.addressList}
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
	  希望抵達時間︰${requestScope.deTime}
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