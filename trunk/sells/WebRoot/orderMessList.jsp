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
</head>
<body topmargin="0"><script src="urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-2147605-1";
urchinTracker();
</script>
<%@ include file="chkSession.jsp"%>
<form name="member" action="sellOrderMessageInput.do" method="Post" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" bgcolor="#FFFFFF">
<br>
    <span class="style5">訂單編號：${orderNo} </span><br><br>
<%@ include file="./member/ads_txt.jsp"%>
	<table border=0 width=100% cellspacing="1" cellpadding="2">
        <tr >
          <td width="22%" height="28" align="center" bgcolor="#0066FF" class="style4">留言時間</td>
          <td width="58%" align="center" bgcolor="#0066FF" class="style4" >內容</td>
          <td width="20%" align="center" bgcolor="#0066FF" class="style4" >留言人</td>
        </tr>
		<c:forEach items="${items}" var="item" varStatus="s">
        <tr >
          <td height="28" align="center" class="style5">${item.messDt}</td>
          <td align="left" class="style5" >${item.message}</td>
          <td align="center" class="style5" >${item.messName}</td>
        </tr>
		</c:forEach>
		<tr>
          <td height="28" colspan=6 align="center" bgcolor=#ffffff>
            <input name="b122" value="我要留言" type="submit" class="button">
            <input name="b1232" value="放棄" type="button" class="button" onClick="window.close();">
            <input type="hidden" name="st" value="${st}">
            <input name="orderNo" type="hidden" id="orderNo" value="${orderNo}"><br><br>
<%@ include file="./member/ads_img.jsp"%>
</td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>