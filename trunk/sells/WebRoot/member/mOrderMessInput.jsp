<%@ page contentType="text/html; charset=Utf-8"%>
<%@ include file="../taglibs.jsp"%>
<jsp:directive.page import="com.sells.common.util.UtilString"/>
<jsp:directive.page import="java.util.HashMap"/>
<jsp:directive.page import="org.apache.commons.lang.ObjectUtils"/>
<html>
<head>
<LINK REL="SHORTCUT ICON" HREF="http://www.icart.tw/Sells/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="iCart,購物車,部落格,blog,相片,網站,簡單,個人網站,3c,手工香皂,美容,美髮,香水,旅遊,日本,機票,火車,自由行,高鐵,影片,投資,理財">
<META NAME="Description" CONTENT="iCart,購物車,部落格,blog,相片,網站,簡單,個人網站,3c,手工香皂,美容,美髮,香水,旅遊,日本,機票,火車,自由行,高鐵,影片,投資,理財">
<META NAME="Title" CONTENT="${requestScope.sells.storeNm} 專屬購物車">
<META NAME="copyright" content="Copyright 2007 iCart">
<META NAME="author" content="service">
<META NAME="email" content="service@icart.tw"> 
<META NAME="Robots" content="INDEX,FOLLOW">
<META NAME="Revisit-after" content="1">
<title>${requestScope.sells.storeNm} 會員服務</title>
<link href="./car.css" rel="stylesheet" type="text/css">
<style type="text/css"><!--
body {
	font-size: 12px;
	background-color: #FFFFFF;
	margin-top: 0px;
	margin-left: 0px;
	color: #666666;
}
.button {
	color: ${requestScope.sells.color2 == null || requestScope.sells.color2 == '' ?'#99CCFF':requestScope.sells.color2};
	font-size: 12px;
	padding-top: 3px;
	background-color: ${requestScope.sells.color1 == null || requestScope.sells.color1 == '' ?'#006699':requestScope.sells.color1};
}
.tb2 {
    background-color: ${requestScope.sells.color2 == null || requestScope.sells.color2 == '' ?'#99CCFF':requestScope.sells.color2};
	color: #666666;
	font-size: 12px;
}
.tb1 {
    background-color: ${requestScope.sells.color1 == null || requestScope.sells.color1 == '' ?'#006699':requestScope.sells.color1};
	color: #666666;
	font-size: 12px;
}
.tb3 {
    color: #666666;
	font-size: 12px;
}-->
</style>
</head>
<body><center><form name="member" action="memOrderMessageUpdate.do" method="Post" onSubmit="return sendForm(this);">
<table width="670" border="0" align="center" cellspacing="1" class="tb1">
  <tr class="tb2">
    <td height="28" align=center bgcolor="#FFFFFF" ><a href="${requestScope.sells.homepage}" target="_top">
      <c:if test="${ ! empty requestScope.sells.logo}"><img src="${requestScope.sells.logo}" width="18" height="18" border="0"></c:if>
      ${requestScope.sells.storeNm}</a></td>
  </tr>
  <tr><td bgcolor="#FFFFFF">
    <span class="style5">訂單編號：${orderNo} </span>
</td></tr></table><table width="670" border="0" align="center" cellspacing="1" class="tb1">
        <tr >
          <td height="28" colspan="2" align="center" bgcolor="#FFFFFF" class="tb2" >留言內容</td>
        </tr>
        <tr >
          <td width="65%" height="45" align="left" bgcolor="#FFFFFF" class="style5" >訂單Email：
            <input name="email" type="text" value="${orders.email}" size="30" maxlength="130">
            <br>
            <span class="style1">若Email錯誤，可直接填上使用者Email來更新訂單中的Email</span></td>
          <td width="35%" rowspan="2" align="center" bgcolor="#FFFFFF" class="style5" ><script type="text/javascript"><!--
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
          <td align="left" bgcolor="#FFFFFF" class="style5" ><textarea name="message" cols="55" rows="6"></textarea>
            <br>
            <span class="style1">字數不可超過1500字</span></td>
        </tr>
		<tr>
          <td height="28" colspan=7 align="center" bgcolor=#ffffff>
            <input name="b122" value="留言" type="submit" class="button">
            <input name="b1232" value="放棄" type="button" class="button" onClick="window.close();">
            <input name="b12322" value="回上頁" type="button" class="button" onClick="history.back();">
            <input type="hidden" name="st" value="${st}">
            <input name="orderNo" type="hidden" id="orderNo" value="${orders.orderNo}"></td>
        </tr>
      </table>
</form><%@ include file="footer.jsp"%>
</center>
</body>
</html>
<script src="./global/global.js" type="text/javascript"></script>
<script>
<!--
function sendForm(formObj){
  if ( checkObj(formObj.oldPassword,"舊密碼") ){
    return false ;
  }
  if ( formObj.oldPassword.value != formObj.oldCfPassword.value ) {
    alert("舊密碼不正確");
    return false ;
  }
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