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
<body topmargin="0">
<%@ include file="chkSession.jsp"%><br>
<script type="text/javascript"><!--
google_ad_client = "pub-2224288299509306";
google_ad_width = 728;
google_ad_height = 15;
google_ad_format = "728x15_0ads_al_s";
//2007-09-10: iCart_blogger_center_txt
google_ad_channel = "4333174357";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "0066CC";
google_color_text = "000000";
google_color_url = "008000";
//-->
</script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script><br><br>
<form name="member" action="memberUpdateMis.do" method="Post" onSubmit="return sendForm(this);">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" bgcolor="#FFFFFF"><table border=0 width=100% cellspacing="1" cellpadding="2">
        <tr>
          <td width="40%" height="28" align="center" class="style1">新密碼</td>
          <td align="left" ><input name="password" type="password" id="password" size="30" maxlength="10"></td>
        </tr>
        <tr>
          <td height="28" align="center" class="style1">確認密碼</td>
          <td align="left" ><input name="cfPassword" type="password" id="tel" size="30" maxlength="10"></td>
        </tr>
		<tr>
          <td height="28" colspan=2 align="center" bgcolor=#ffffff>
            <input name="b122" value="確認送出" type="submit" class="button">
            <input name="b123" value="重填" type="reset" class="button">
            <input name="b1232" value="放棄" type="button" class="button" onClick="window.close();">
            <input type="hidden" name="func" value="UPDATEPWD"><input name="memberNo" type="hidden" id="memberNo" value="${member.memberNo}"><br>
<br>
<script type="text/javascript"><!--
google_ad_client = "pub-2224288299509306";
google_ad_width = 728;
google_ad_height = 90;
google_ad_format = "728x90_as";
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
      </table>
</td>
  </tr>
</table>
</form>
</body>
</html>
<script src="./global/global.js" type="text/javascript"></script>
<script>
<!--
function sendForm(formObj){
  if ( checkObj(formObj.password,"新密碼") ){
    return false ;
  }
  if ( formObj.password.value != formObj.cfPassword.value ) {
    alert("新密碼檢核不正確");
    return false ;
  }
}
-->
</script>