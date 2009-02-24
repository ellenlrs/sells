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
<script>
function checkForm(formObj){
  if ( formObj.oldPasswd.value == '') {
     alert("請輸入舊密碼!");
	 formObj.oldPasswd.focus();
	 return false ;
  }
  if ( formObj.passwd.value == '') {
     alert("請輸入新密碼!");
	 formObj.passwd.focus();
	 return false ;
  }
  if ( formObj.passwd.value != formObj.rePasswd.value) {
    alert("確認密碼和新密碼不相符!");
	  formObj.rePasswd.focus();
	  return false ;
  }
}
</script>
<body topmargin="0">
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%>
<form name="form1" method="post" action="sellPasswd.do" onSubmit="return checkForm(this);">
  <table width="377" border="0" align="center" cellpadding="8" cellspacing="0">
    <tr>
      <td bgcolor="#0066CC" align="center" colspan="2"><span class="style6">商家密碼修改</span></td>
    </tr>
    <tr>
      <td width="158" align="center" bgcolor="#FFFFFF" class="style5"><strong>舊密碼</strong></td>        
      <td bgcolor="#FFFFFF" width="199">
      <input name="oldPasswd" type="password" id="oldPasswd" value="" maxlength="20" size="20"></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" class="style5"><strong>新密碼</strong></td>
      <td bgcolor="#FFFFFF"><input name="passwd" type="password" id="passwd" value="" maxlength="20" size="20"></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" class="style5"><strong>確認密碼</strong></td>
      <td bgcolor="#FFFFFF"><input name="rePasswd" type="password" id="rePasswd" value="" maxlength="20" size="20">
      </td>
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