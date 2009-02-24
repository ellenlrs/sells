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
<title>
<bean:message key="app.title"/>
</title>
<link href="car.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0">
<%
if (StringUtils.isBlank(request.getParameter("carImg"))){
  request.setAttribute("carImg","text");
}
if (StringUtils.isBlank(request.getParameter("target"))){
  request.setAttribute("target","_same");
}
if (StringUtils.isBlank(request.getParameter("carText"))){
  request.setAttribute("carText","我的購物車");
}
if (StringUtils.isBlank(request.getParameter("web"))){
  request.setAttribute("web","utf-8");
}
if (StringUtils.isBlank(request.getParameter("userImg"))){
  request.setAttribute("userImg","http://www.icart.tw/Sells/images/cartu.gif");
}
%>
<script>
function check(formObj){

}
</script>
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%>
<table width="615" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td ><table width="600" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF">
        <tbody>
          <tr>
            <td width="100%" align="left" class="style1">連結產生器</td>
          </tr>
        </tbody>
      </table>
      <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="images/0.gif" width="1" height="4" /></td>
        </tr>
      </table>
      <table width="600" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
        <tbody>
          <tr>
            <td colspan="3" bgcolor="#ffffff" width="740"><form method="post" name="cart" action="" onSubmit="return check(this);" >
                <span class="style5">1：加入會員</span>
                <br>
                <textarea id="textarea1" name="textarea1" cols="40" onClick="this.focus(); this.select();"  rows="3"><a href='http://www.icart.tw/Sells/funcMember.do?sells=${sessionScope.sells.sellsNo}&func=JOIN'>加入會員</a></textarea>
                <input type="button" name="Submit" onClick='document.getElementById("textarea1").createTextRange().execCommand("Copy");'  value="複製">
                <br>
                <br />
                <span class="style5">2：會員登入</span><br>
                <textarea id="textarea2" name="textarea2" cols="40" onClick="this.focus(); this.select();"  rows="3"><a href='http://www.icart.tw/Sells/funcMember.do?sells=${sessionScope.sells.sellsNo}&func=LOGIN'>會員登入</a></textarea>
                <input type="button" name="Submit2" onClick='document.getElementById("textarea2").createTextRange().execCommand("Copy");'  value="複製">
                <br>
                <br />
                <span class="style5">3：密碼查詢</span><br>
                <textarea id="textarea3" name="textarea3" cols="40" onClick="this.focus(); this.select();"  rows="3"><a href='http://www.icart.tw/Sells/funcMember.do?sells=${sessionScope.sells.sellsNo}&func=QRPWD'>密碼查詢</a></textarea>
                <input type="button" name="Submit3" onClick='document.getElementById("textarea3").createTextRange().execCommand("Copy");'  value="複製">
                <br>
                <br />
                <span class="style5">4：訂單查詢</span><br>
                <textarea id="textarea4" name="textarea4" cols="40" onClick="this.focus(); this.select();"  rows="3"><a href='http://www.icart.tw/Sells/funcMember.do?sells=${sessionScope.sells.sellsNo}&func=LOGIN'>訂單查詢</a></textarea>
                <input type="button" name="Submit4" onClick='document.getElementById("textarea4").createTextRange().execCommand("Copy");'  value="複製">
                <br />
            </form></td>
          </tr>
        </tbody>
      </table></td>
  </tr>
</table>
<%@ include file="footer1.jsp"%>
</body>
</html>
