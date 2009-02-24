<%@ page contentType="text/html; charset=Utf-8"%>
<%@ include file="taglibs.jsp"%>
<jsp:directive.page import="com.sells.dao.Sells"/>
<jsp:directive.page import="com.sells.dao.LoginData"/>
<html>
<head>
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
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%>
<br>
<br>
<table width="90%" border="1" align="center" cellpadding="10" cellspacing="0">
  <tr>
    <td width="904" bgcolor="#0066CC"><span class="style6"><strong>推薦目前支援 
          iCart 我的購物車
          的相簿</strong>  </span> </td>
  </tr>
  <tr>
    <td bgcolor="#ffffff"><table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td width="100%" align="left"><table width="200" border="0" align="left" cellpadding="2">
            <tr>
              <td width="91" class="style5"><a href="http://www.pixnet.net/" target="_blank">Pixnet</a></td>
              <td width="91" class="style5">範例 <a href="http://blog.pixnet.net/tofu911" target="_blank" class="style1">兜福工場</a></td>
            </tr>
            <tr>
              <td width="184" colspan="2" class="style1">持續測試中...</td>
            </tr>
          </table></td>
        </tr>
      <tbody>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#0066CC"><strong class="style6">推薦支援 
      iCart 我的購物車 的Blog </strong></td>
  </tr>
  <tr>
    <td bgcolor="#ffffff"><table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td width="100%" align="left"><table width="275" border="0" align="left" cellpadding="2">
          <tr>
            <td height="25" class="style5"><a href="http://www2.blogger.com/home" target="_blank">Blogger</a></td>
            <td><a class="style1" href="http://icarttw.blogspot.com/2007/03/icart.html" target="_blank">範例</a></td>
          </tr>
          <tr>
            <td width="81" height="24" class="style5"><a href="http://www.wretch.cc" target="_blank">無名小站</a></td>
            <td width="180"><a class="style1" href="http://www.wretch.cc/blog/icart" target="_blank">範例</a></td>
          </tr>
          <tr>
            <td height="25" class="style5"><a href="http://blog.sina.com.tw/" target="_blank">新浪網</a></td>
            <td><a class="style1" href="http://blog.sina.com.tw/icart/" target="_blank">範例</a></td>
          </tr>
          <tr>
            <td colspan="2"><span class="style1">持續測試中...</span></td>
          </tr>
        </table></td>
        </tr>
      <tbody>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#0066CC"><strong class="style6">推薦支援 
      iCart 我的購物車 個人網站 </strong></td>
  </tr>
  <tr>
    <td bgcolor="#ffffff"><table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td width="100%" align="left"><table width="279" border="0" align="left" cellpadding="2">
          <tr>
            <td width="175" height="25" class="style5"><a href="http://www.vivi-soap.net" target="_blank">純攪和手工香皂 vivi-soap </a></td>
            <td width="90"></td>
          </tr>
          <tr>
            <td colspan="2"><span class="style1">持續測試中...</span></td>
          </tr>
        </table></td>
        </tr>
      <tbody>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#ffffff"><strong class="style3">所有html網頁和免費空間和html的留言版和討論區都支援 
        <bean:message key="app.title"/>(不列舉)</strong></td>
  </tr>
</table>
<%@ include file="footer1.jsp"%>
</body>
</html>