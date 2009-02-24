<%@ page contentType="text/html; charset=Utf-8"%>
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
<form name="form1" method="post" action="sellList.do" >
  <table width="602" border="0" align="center" cellpadding="8" cellspacing="0">
    <tr>
      <td bgcolor="#0066CC" align="center" colspan="2" width="590"><b class="style6">購物車店家查詢</b></td>
    </tr>
    <tr>
      <td width="590" align="center" bgcolor="#FFFFFF" class="style5"><b>帳 號</b></td>        
      <td bgcolor="#FFFFFF" width="435"><input name=loginId type=text value="" maxlength="30"></td>
    </tr>
    <tr>
      <td width="590" align="center" bgcolor="#FFFFFF" class="style5"><b>編 號</b></td>
      <td bgcolor="#FFFFFF" width="435"><input name=sellNo type=text value="" maxlength="30"></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" class="style5"><b>姓 名</b></td>
      <td bgcolor="#FFFFFF"><input name=sellNm type=text value="" maxlength="150"></td>
    </tr>
    <tr>
      <td width="590" align="center" bgcolor="#FFFFFF" class="style5"><b>店 名</b></td>
      <td bgcolor="#FFFFFF" width="435"><input name=storeNm type=text value="" maxlength="150"></td>
    </tr>
    <tr class="style5">
      <td bgcolor="#FFFFFF" align="center" colspan="2"></td>
    </tr>
    <tr>
      <td width="590" align="center" bgcolor="#FFFFFF" class="style5"><b>帳        
      戶 等 級</b></td> 
      <td bgcolor="#FFFFFF" width="435">
        <select name="sellsLv">
          <option value="T" selected>測試會員</option>
          <option value="R">正式會員</option>
      </select></td></tr>
    <tr>
      <td bgcolor="#FFFFFF" align="center" colspan="2" width="590">
      <input type="submit" value="查詢">
      <input name="submit" type="reset" value="重填"></td>
    </tr>
</table>
</form> 
<%@ include file="footer1.jsp"%>
</body>
</html>