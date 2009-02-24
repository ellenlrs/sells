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
<%@ include file="top.jsp"%>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="185" valign="top"><table width="185" border="0" cellspacing="0" cellpadding="0">
<tr>
            <td><img src="images/login-1.jpg" width="185" height="14" /></td>
          </tr><tr>
        <form name="form1" method="post" action="login.do" onSubmit="return checkForm(this);"><td valign="top" background="images/login-bg.jpg">
				<table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td  colspan="2"><img src="images/login-3.jpg" width="160" height="22" /></td>
          </tr>
          <tr>
            <td width="51" height="30" align="center" valign="middle"><span class="t1">
              帳號：</span> </td>
            <td width="109" align="left" valign="middle"><input name="loginId" type="text" class="login-box" size="10" ></td>
          </tr>
          <tr>
            <td height="30" align="center" valign="middle"><span class="t1">密碼：</span> </td>
            <td align="left" valign="middle"><input name="passwd" type="password" class="login-box" size="10"></td>
          </tr>
          <tr>
            <td height="30" align="center" colspan="2"><input type="image" src="images/login.gif" name="image" width="46" height="18" >
              　 
              <a href="javascript:document.form1.reset()"><img src="images/clear.gif" width="46" border=0 height="18" /></a></td>
          </tr></table>
				</td></form>
      </tr><tr>
            <td><img src="images/login-2.jpg" width="185" height="11" /></td>
          </tr>
            <tr>
        <td><%@ include file="ads_search.jsp"%></td>
      </tr>
      <tr>
        <td><%@ include file="ads_firefox.jsp"%></td>
      </tr>
      <tr>
        <td><%@ include file="ads_left_txt.jsp"%></td>
      </tr>
      <tr>
        <td><a href="http://icarttw.blogspot.com/2007/03/icart.html" target="_blank"><img src="images/index-15.jpg" width="185" height="59" border="0"/></a></td>
      </tr>
      <!--<tr>
        <td><img src="images/index-16.jpg" width="185" height="55" /></td>
      </tr>-->
      <tr>
        <td><a href="sellJoin.jsp"><img src="images/index-17.jpg" width="185" height="71" border="0" /></a></td>
      </tr>
    </table></td>
    <td width="615" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="4"><%@ include file="ads_txt.jsp"%><br><br>

<form name="form1" method="post" action="sellModi.do" onSubmit="return checkForm(this.form);">
  <table width="384" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
    <tr>
      <td bgcolor="#999999" align="center" colspan="2"><b class="style3">密碼查詢</b></td>
    </tr>
    <tr>
      <td width="133" bgcolor="#FFFFFF" align="center"><b class="style5">帳 號</b></td>        
      <td width="208" bgcolor="#FFFFFF"><input name=loginId type=text value="" maxlength="30"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" align="center"><b class="style5">姓 名</b></td>
      <td bgcolor="#FFFFFF"><input name=sellNm type=text value="" maxlength="150"></td>
    </tr>
    <tr>
      <td width="133" bgcolor="#FFFFFF" align="center"><b><font color="#49ADF8">Email</font></b></td>
      <td width="208" bgcolor="#FFFFFF"><input name=email type=text value="" maxlength="150"></td>
    </tr>
    <tr>
      <td bgcolor="#97D0FB" align="center" colspan="2"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" align="center" colspan="2">
        <input type="submit" value="查詢">
        <input name="submit" type="reset" value="重送"></td>
    </tr>
</table>
</form>
</td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="footer.jsp"%>
</body>
</html>