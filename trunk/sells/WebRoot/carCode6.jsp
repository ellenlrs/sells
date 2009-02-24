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
<%
if (StringUtils.isBlank(request.getParameter("carImg"))){
  request.setAttribute("carImg","text");
}
if (StringUtils.isBlank(request.getParameter("target"))){
  request.setAttribute("target","_same");
}
if (StringUtils.isBlank(request.getParameter("carText"))){
  request.setAttribute("carText","手動輸入購物車");
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
              <td width="100%" align="left" class="style1">檢視我的購物清單連結</td>
            </tr>
    				<tr>
      				<td width="100%" align="left" class="style5">帳號︰${sessionScope.loginvo.loginId}　帳戶等級︰${sessionScope.sells.sellsLv}　帳戶期限︰${sessionScope.sells.expiredDt}
      			</td>
    				</tr>
          </tbody>
        </table>
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
          <tbody>
            <tr>
			  <td align="center" bgcolor="#FFFFFF"><b><a href="carCode5.jsp" class="t1">檢視購物車連結</a></b> </td>
              <td align="center" bgcolor="#FFFFFF"><b><a href="carCode4.jsp" class="t1">快速產生器</a></b> </td>
              <td align="center" bgcolor="#FFFFFF"><b><a href="carCode1.jsp" class="t1">單一商品規格Html產生器</a></b></td>
              <td align="center" bgcolor="#FFFFFF"><b><a href="carCode2.jsp" class="t1">多重商品規格Html產生器</a></b> </td>
              <td align="center" bgcolor="#FFFFFF"><b><a href="carCode3.jsp" class="t1">大量商品訂購表單Html產生器</a></b></td>
              <td align="center" bgcolor="#CCCCCC"><b class="t1 style3">手動輸入購物車</b></td>
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
                    <td colspan="3" bgcolor="#ffffff" width="740"><form method="post" name="cart" action="carCode6.do#code" onSubmit="return check(this);" >
                      <span class="style5">1：顯示方式(可選文字連結或圖片連結)</span><br />
                              <table width="590" border="0" cellspacing="0" cellpadding="5">
                                <tr>
                                  <td ><input type="radio" id="Radiot" value="text" name="carImg" 
                          ${carImg == 'text' ?'checked':''} >
                                  <td colspan="5" valign="middle"><span class="style5">
                                    <label for="Radiot" style="cursor:hand;cursor: pointer;">文字說明連結</label>
                                    </span>
                                      <input type="text" name="carText" size="31" value="${carText}">
                                      <span class="style5">(可用html碼)</span></td>
                                </tr>
                                <tr>
                                  <td><input type="radio" id="Radiou" value="userImg" name="carImg"  
                          ${carImg == 'userImg' ?'checked':''}></td>
                                  <td colspan="5" valign="middle"><span class="style5">
                                    <label for="Radiou" style="cursor:hand;cursor: pointer;">自定圖片連結</label>
                                    </span>
                                      <input type="text" name="userImg" size="31" value="${userImg}" onChange="document.cart.img1.src = this.value ;">
                                      <img src="${requestScope.userImg}" onerror="this.src='images/cartu.gif'" border=0 name="img1" id="img1" align="absmiddle"></td>
                                </tr>
                              </table>
                              <span class="style5">2：加入購物車是否跳出新視窗<br />
                        <input type="radio" value="_same" name="target" ${requestScope.target == '_same' ?'checked':''} >
                        同視窗&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="_blank" name="target" ${requestScope.target == '_blank' ?'checked':''}>
                      跳出新視窗</span><br />
                      &nbsp;
                      <input value="產生html語法" name="B12" type="submit" /></form>
										<c:if test="${requestScope.car != NULL }">
  <table border="0" cellspacing="1" width="100%" bgcolor="#CCCCCC" cellpadding="5">
    <tr>
      <td  bgcolor="#33CCD1"><a name="code"></a><span class="style4">結果預覽：</span></td>
    </tr>
    <tr>
      <td  bgcolor="#FFFFFF">${car}</td>
    </tr>
    <tr>
      <td  bgcolor="#33CCD1" class="style4">html原始碼 (可用Ctrl+C複製，Ctrl+V貼上)</td>
    </tr>
    <tr>
      <td  bgcolor="#FFFFFF"><textarea id="textarea" name="textarea" cols="70" onClick="this.focus(); this.select();"  rows="10">${car}</textarea>
        <br>
        <input type="button" name="b1" onClick='document.getElementById("textarea").createTextRange().execCommand("Copy");' value="複製"></td>
    </tr>
  </table>
  </c:if></td>
                  </tr>
                </tbody>
          </table></td>
      </tr>
    </table>
<%@ include file="footer1.jsp"%>
</body>
</html>