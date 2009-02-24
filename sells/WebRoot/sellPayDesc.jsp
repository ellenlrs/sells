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
<form name="form1" method="post" action="sellPayDesc.do">
  <table width="95%" border="0" align="center" cellpadding="8" cellspacing="0">
    <tr>
      <td bgcolor="#0066CC" align="center" colspan="2"><b class="style6"><strong>商家付款方式說明修改</strong></b></td>
    </tr>
    <tr>
      <td width="25%" align="center" bgcolor="#FFFFFF"><span class="style1"><strong>付款說明</strong></span><strong><br>
      </strong><span class="style5">300字元內<br>
      <br>
客戶結帳後<br>
系統將會寄出此<br>
付款方式資料<br>
給您的客戶<br>
<br>
不設定客戶將<br>
無法得知如何付款</span></td>        
      <td bgcolor="#FFFFFF"><textarea name="payDesc" cols="45" rows="18">${sessionScope.sells.payDesc}</textarea></td>
    </tr>
    <tr>
      <td colspan="2" align="center" bgcolor="#FFFFFF"><table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td width="100%"><strong class="style3">格式範例︰(可直接copy下列資料貼於上面表單內，修改資料即可)</strong></td>
          </tr>
          <tr>
            <td width="100%" class="style5">【ATM匯款資料】<br>
              郵局代碼：<br>
              轉帳帳號：<br>
              <br>
              【貨到付款】<br>
              送貨到的時候付款<br>
              <br>
              【郵政劃撥】<br>
              劃撥帳號：<br>
              戶名：<br>
              <br>
              【銀行匯款】<br>
              銀行名：<br>
              分行名：<br>
              戶名：<br>
              帳號：</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" align="center" colspan="2">

        <input type="submit" value="修改">
      <input name="submit" type="reset" value="重填"></td>
    </tr>
</table>
</form>  
<%@ include file="footer1.jsp"%>
</body>
</html>