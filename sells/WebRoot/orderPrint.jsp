<%@ page contentType="text/html; charset=Utf-8"%>
<jsp:directive.page import="com.sells.dao.Sells"/>
<jsp:directive.page import="com.sells.dao.LoginData"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
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
<%@ include file="cartcss.jsp" %>
</head>
<body topmargin="0"><script src="urchin.js" type="text/javascript">
</script>
<%@ include file="chkSession.jsp"%>
<table width="800" border="0" align="center" cellpadding="5" cellspacing="1" class="tb1">
    <tr>
      <td class="tb3" bgcolor="#FFFFFF" >線上付款交易完成。<BR>
    ${requestScope.sells.storeNm} 網址：<a href='${requestScope.sells.homepage}'>${requestScope.sells.homepage}</a>
    <hr noshade size=1>訂單編號︰${requestScope.orders.orderNo}<hr noshade size=1>
    ${requestScope.orders.name} 您好您訂購的商品清單如下：<br><br>
    ${requestScope.orderItem}
    <hr noshade size=1>
    訂購人資料<br>   
    姓名︰${requestScope.orders.name}
    <br>
    郵遞區號︰${requestScope.orders.zip}
    <br>
    地址︰${requestScope.orders.address}
    <br>
    E-mail︰${requestScope.orders.email}
    <br>
    電話︰${requestScope.orders.tel}
    <br>
    手機︰${requestScope.orders.mobile}
    <br>
    付款方式︰${requestScope.orders.payTp}
    <br>
    備註︰
    <br>
    ${requestScope.orders.descTxt}
    <hr noshade size=1>
    付款資料︰<br>
    <pre class="pre">${requestScope.sells.payDesc}</pre>
    <hr noshade size=1>
    ${requestScope.sells.storeNm}網址：<a href='${requestScope.sells.homepage}'>${requestScope.sells.homepage}</a>
    </td>
    </tr>
</table>

</body>
</html>
