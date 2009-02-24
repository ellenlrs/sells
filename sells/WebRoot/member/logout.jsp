<%@ page contentType="text/html; charset=Utf-8"%>
<%@ include file="../taglibs.jsp"%>
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
<body><center><form name="member" action="c" method="Post" target="_blank" onSubmit="return sendForm(this);">
<table width="670" border="0" align="center" cellspacing="1" class="tb1">
  <tr class="tb2">
    <td height="28" align=center bgcolor="#FFFFFF" ><a href="${requestScope.sells.homepage}" target="_top">
      <c:if test="${ ! empty requestScope.sells.logo}"><img src="${requestScope.sells.logo}" width="18" height="18" border="0"></c:if>
      ${requestScope.sells.storeNm}</a></td>
  </tr>
</table>
<table width="670" border="0" align="center" cellspacing="1" class="tb1">
        <tr class="tb2">
          <td colspan="2" height="28" align="center" bgcolor="#FFFFFF">你已成功登出</td>
        </tr>
        <tr class="tb2">
          <td height="28" colspan="2" align="center" bgcolor="#FFFFFF">會員登入</td>
        </tr>
        <tr class="tb2">
          <td width="50%" height="28" align="center" bgcolor="#FFFFFF">帳號</td>
          <td align="left" bgcolor="#FFFFFF"><input name="email" type="text" id="email"></td>
        </tr>
        <tr class="tb2">
          <td height="28" align="center" bgcolor="#FFFFFF">密碼</td>
          <td height="28" align="left" bgcolor="#FFFFFF"><input name="password" type="password" id="password">
          <input name="b1222" value="忘記密碼" type="button" onClick="qrPwd(this.form);" class="button"></td>
        </tr>
		<tr>
          <td height="28" colspan=4 align="center" bgcolor=#FFFFFF><input name="b122" value="確認送出" type="submit" class="button">
            <input name="b123" value="重填" type="reset" class="button">
            <input name="b123" onClick="goHome();" value="返回賣場" type="button" class="button">
            <input type="hidden" name="sells" value="${requestScope.sells.sellsNo}">
<input type="hidden" name="func" value="QRPWD"><br>
<%@ include file="ads_img.jsp"%></td>
        </tr>
    </table>
</form><%@ include file="footer.jsp"%>
</center>
</body>
</html>
<script src="./global/global.js" type="text/javascript"></script>
<script>
<!--
function goHome(){
  var winName = "_top" ;
  var features = "";
  var theURL = "${requestScope.sells.homepage}";
  window.open(theURL,winName,features);
}
function qrPwd ( formObj){
  formObj.action = 'funcMember.do' ;
  formObj.submit();
}
function sendForm(formObj){
  if ( checkObj(formObj.email,"帳號") ){
    return false ;
  }
  if ( checkObj(formObj.password,"密碼") ){
    return false ;
  }
  formObj.action = 'loginMember.do' ;
}
-->
</script>