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
<body topmargin="0"><%@ include file="chkSession.jsp"%>
<%@ include file="top1.jsp"%>
<form action=orderCar.do name="form" >
  <table width="602" border="1" align="center" cellpadding="10" cellspacing="0">
    <tr>
      <td bgcolor="#0066CC" align="center" colspan="2" width="590"><b class="style6">帳　戶　設　定</b></td>
    </tr>
    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>帳 號</b></td>       
      <td width="435" bgcolor="#FFFFFF" class="style5">${sessionScope.loginvo.loginId}</td>
    </tr>

    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>帳  
        戶 等 級</b></td> 
      <td bgcolor="#FFFFFF" width="435">
        <font color="#FF0000" class="style1">目前帳戶等級：
      <c:if test="${sessionScope.sells.sellsLv == 'T' }">試用會</c:if><c:if test="${sessionScope.sells.sellsLv == 'R' }">正式會員</c:if></font> </td>
    </tr>
    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>帳 
        戶 期 限</b></td> 
      <td width="435" bgcolor="#FFFFFF" class="style5">${sessionScope.sells.expiredDt}</td>
    </tr>
    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>帳   
        戶 延 長</b></td> 
      <td bgcolor="#FFFFFF" width="435">
        <table width="100%" border="0" cellpadding="8" cellspacing="0">
          <tr>
            <td width="7%"><input type="radio" value="R" name="orderTp" checked></td>
            <td><b class="style3">R級正式會員</b></td>
          </tr>
          <tr>
            <td width="7%"></td>
            <td class="style3"> 租用
              <select size="1" name="orderMonth"> 
                <option value="12 個月;費用1,280元">一</option>
            </select>年</td>
          </tr>
        </table>
      </td>

    </tr>
    <tr>
      <td bgcolor="#FFFFFF" align="center" colspan="2" width="590">
        <input type="submit" value="送出">
        <input name="submit" type="reset" value="重填"></td>
    </tr>
  </table>
</form>
<%@ include file="footer1.jsp"%>
</body>
</html>