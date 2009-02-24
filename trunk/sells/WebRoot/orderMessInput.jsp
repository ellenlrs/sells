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
<%@ include file="chkSession.jsp"%>
<form name="member" action="sellOrderMessageUpdate.do" method="Post" onSubmit="return sendForm(this);">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" bgcolor="#FFFFFF"><br>
    <span class="style5">訂單編號：${orderNo} </span><br><br>
<%@ include file="./member/ads_txt.jsp"%>
	<table border=0 width=100% cellspacing="1" cellpadding="2">
        <tr >
          <td height="28" colspan="2" align="center" bgcolor="#0066FF" class="style4" >留言內容</td>
        </tr>
        <tr >
          <td width="50%" height="45" align="left" class="style5" >訂單Email：
            <input name="email" type="text" value="${orders.email}" size="30" maxlength="130">
            <br>
            <span class="style1">若Email錯誤，可直接填上使用者Email來更新訂單中的Email</span></td><td width="50%" rowspan="2" align="left" class="style5" ><script type="text/javascript"><!--
google_ad_client = "pub-2224288299509306";
google_ad_width = 200;
google_ad_height = 200;
google_ad_format = "200x200_as";
google_ad_type = "image";
//2007-09-10: iCart
google_ad_channel = "1272982672";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "0066CC";
google_color_text = "000000";
google_color_url = "008000";
google_ui_features = "rc:6";
//-->
</script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></td>
        </tr>
        <tr >
          <td align="left" class="style5" ><textarea name="message" cols="55" rows="6"></textarea>
            <br>
            <span class="style1">字數不可超過1500字</span></td>
        </tr>
		<tr>
          <td height="28" colspan=7 align="center" bgcolor=#ffffff>
            <input name="b122" value="我要留言" type="submit" class="button">
            <input name="b1232" value="放棄" type="button" class="button" onClick="window.close();">
            <input name="b12322" value="回上頁" type="button" class="button" onClick="history.back();">
            <input type="hidden" name="st" value="${st}">
            <input name="orderNo" type="hidden" id="orderNo" value="${orders.orderNo}"></td>
        </tr>
      </table>
</td>
  </tr>
</table>
</form>
</body>
</html>
<script>
<!--
function sendForm(formObj){
  if (formObj.message.value == "" ) {
      alert("留言內容不可空白");
      formObj.message.focus();
	  return false;    
  }
  if (formObj.message.value.length >1500 ) {
      alert("留言內容不可超過1500字，你目前字數："+formObj.message.value.length);
      formObj.message.focus();
	  return false;    
  }
}
-->
</script>