<%@ page contentType="text/html; charset=Utf-8"%>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<jsp:directive.page import="com.sells.dao.Sells"/>
<jsp:directive.page import="com.sells.dao.LoginData"/>
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
</head><body topmargin="0">
<%
if (StringUtils.isBlank(request.getParameter("carImg"))){
  request.setAttribute("carImg","text");
}
if (StringUtils.isBlank(request.getParameter("target"))){
  request.setAttribute("target","_same");
}
if (StringUtils.isBlank(request.getParameter("carText"))){
  request.setAttribute("carText","加入購物車");
}
if (StringUtils.isBlank(request.getParameter("userImg"))){
  request.setAttribute("userImg","http://www.icart.tw/Sells/images/cartu.gif");
}
if (StringUtils.isBlank(request.getParameter("web"))){
  request.setAttribute("web","utf-8");
}
%>
<script>
function check(formObj){
  if (formObj.itemList.value == '' ){
    alert('請輸入商品列表');
    formObj.itemList.focus();
    return false ;
  }
}
</script>
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%>
<table width="85%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td ><table width="600" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF">
        <tbody>
          <tr>
            <td width="100%" align="left" class="style1">此功能支援Blog、一般網頁，包含免費網頁空間，不支援相簿<br>
              <span class="style3">加入購物車按鈕不適合放置於Yahoo拍賣商品說明中，因為Yahoo拍賣會截斷購物車原始碼，導致無法成功加入購物車，並且違反購物網站不可連結其他網站規則，有被下架的風險，建議放置於Blog部落格或個人網頁中，會比較適合。</span></td>
          </tr>
          <tr>
            <td width="100%" align="left" class="style5">帳號︰${sessionScope.loginvo.loginId}　帳戶等級︰${sessionScope.sells.sellsLv}　帳戶期限︰${sessionScope.sells.expiredDt} </td>
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
            <td align="center" bgcolor="#CCCCCC"><b class="t1 style3">大量商品訂購表單Html產生器</b> </td>
            <td align="center" bgcolor="#FFFFFF"><b><a href="carCode6.jsp" class="t1">手動輸入購物車</a></b></td>
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
            <td colspan="3" bgcolor="#ffffff" width="740"><form method="post" name="cart"action="carCode3.do#code">
                <p class="t1"><span class="style5">商品列表︰</span><br>
                  <b class="style3">輸入順序方式如下︰<br>
                  編號,品名,規格1,規格2,售價<br>
                  (一個商品一行)<br>
                  <br>
                  <span class="style1"> B0001,電腦公事包,灰色,14吋,1499<br>
                  B0002,旅行箱,綠色,21吋,2500</span><br>
                  <b class="style3">
                  <textarea rows="10" name="itemList" cols="70">${itemList}</textarea>
                  </b><br>
                  </b><span class="style5">顯示方式(可選文字連結或圖片連結)</span>
                <table width="590" border="0" cellspacing="0" cellpadding="5">
                  <tr>
                    <td ><input type="radio" id="Radiot" value="text" name="carImg" 
                          ${carImg == 'text' ?'checked':''}
                      >
                    <td colspan="5" valign="middle"><span class="style5">
                      <label for="Radiot" style="cursor:hand;cursor: pointer;">文字說明連結</label>
                      </span>
                      <input type="text" name="carText" size="31" value="${carText}">
                      <span class="style5">(可用html碼)</span></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radiou" value="userImg" name="carImg"  
                          ${carImg == 'userImg' ?'checked':''}
                      >                    </td>
                    <td colspan="5" valign="middle"><span class="style5">
                      <label for="Radiou" style="cursor:hand;cursor: pointer;">自定圖片連結</label>
                      </span>
                      <input type="text" name="userImg" size="31" value="${userImg}" onChange="document.cart.img1.src = this.value ;">
                      <img src="${requestScope.userImg}" onerror="this.src='images/cartu.gif'" border=0 name="img1" id="img1" align="absmiddle"></td>
                  </tr>
                  <tr>
                    <td align="center"><input type="radio" id="Radio1" value="images/cart1.jpg" name="carImg" ${carImg == 'images/cart1.jpg' ?'checked':''}
                        ></td>
                    <td ><label for="Radio1" style="cursor:hand;cursor: pointer;"><img src="images/cart1.jpg" width="135" height="50" /></label></td>
                    <td><input type="radio" id="Radio2" value="images/cart2.jpg" name="carImg" ${carImg == 'images/cart2.jpg' ?'checked':''}></td>
                    <td ><label for="Radio2" style="cursor:hand;cursor: pointer;"><img src="images/cart2.jpg" width="125" height="50" /></label></td>
                    <td><input type="radio" id="Radio3" value="images/cart3.jpg" name="carImg"
                          
                          ${carImg == 'images/cart3.jpg' ?'checked':''}
                        ></td>
                    <td ><label for="Radio3" style="cursor:hand;cursor: pointer;"><img src="images/cart3.jpg" width="123" height="50" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio4" value="images/cart4.jpg" name="carImg"
                          ${carImg == 'images/cart4.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio4" style="cursor:hand;cursor: pointer;"><img src="images/cart4.jpg" width="118" height="42" /></label></td>
                    <td><input type="radio" id="Radio5" value="images/cart5.jpg" name="carImg"
                          ${carImg == 'images/cart5.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio5" style="cursor:hand;cursor: pointer;"><img src="images/cart5.jpg" width="122" height="50" /></label></td>
                    <td><input type="radio" id="Radio6" value="images/cart6.jpg" name="carImg"
                          ${carImg == 'images/cart5.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio6" style="cursor:hand;cursor: pointer;"><img src="images/cart6.jpg" width="135" height="52" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio7" value="images/cart7.jpg" name="carImg"
					  		${carImg == 'images/cart7.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio7" style="cursor:hand;cursor: pointer;"><img src="images/cart7.jpg" width="125" height="52" /></label></td>
                    <td><input type="radio" id="Radio8" value="images/cart8.jpg" name="carImg"
                          ${carImg == 'images/cart8.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio8" style="cursor:hand;cursor: pointer;"><img src="images/cart8.jpg" width="123" height="52" /></label></td>
                    <td><input type="radio" id="Radio9" value="images/cart9.jpg" name="carImg"
							${carImg == 'images/cart9.jpg' ?'checked':''}
                      ></td>
                    <td><label for="Radio9" style="cursor:hand;cursor: pointer;"><img src="images/cart9.jpg" width="118" height="52" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio10" value="images/cart10.jpg" name="carImg"
                          ${carImg == 'images/cart10.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio10" style="cursor:hand;cursor: pointer;"><img src="images/cart10.jpg" width="122" height="52" /></label></td>
                    <td><input type="radio" id="Radio19" value="images/cart19.jpg" name="carImg"
                          ${carImg == 'images/cart19.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio19" style="cursor:hand;cursor: pointer;"><img src="images/cart19.jpg" width="118" height="36" /></label></td>
                    <td><input type="radio" id="Radio18" value="images/cart18.jpg" name="carImg"
                          ${carImg == 'images/cart18.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio18" style="cursor:hand;cursor: pointer;"><img src="images/cart18.jpg" width="123" height="36" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio17" value="images/cart17.jpg" name="carImg"
                          ${carImg == 'images/cart17.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio17" style="cursor:hand;cursor: pointer;"><img src="images/cart17.jpg" width="125" height="36" /></label></td>
                    <td><input type="radio" id="Radio20" value="images/cart20.jpg" name="carImg"
                          ${carImg == 'images/cart20.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio20" style="cursor:hand;cursor: pointer;"><img src="images/cart20.jpg" width="122" height="36" /></label></td>
                    <td><input type="radio" id="Radio16" value="images/cart16.jpg" name="carImg"
                          ${carImg == 'images/cart16.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio16" style="cursor:hand;cursor: pointer;"><img src="images/cart16.jpg" width="128" height="36" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio41" value="images/cart41.jpg" name="carImg"
                          ${carImg == 'images/cart41.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio41" style="cursor:hand;cursor: pointer;"><img src="images/cart41.jpg" width="122" height="38" /></label></td>
                    <td><input type="radio" id="Radio13" value="images/cart13.jpg" name="carImg"
                          ${carImg == 'images/cart13.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio13" style="cursor:hand;cursor: pointer;"><img src="images/cart13.jpg" width="90" height="24" /></label></td>
                    <td><input type="radio" id="Radio12" value="images/cart12.jpg" name="carImg"
                          ${carImg == 'images/cart12.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio12" style="cursor:hand;cursor: pointer;"><img src="images/cart12.jpg" width="90" height="24" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio11" value="images/cart11.jpg" name="carImg"
                          ${carImg == 'images/cart11.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio11" style="cursor:hand;cursor: pointer;"><img src="images/cart11.jpg" width="90" height="20" /></label></td>
                    <td><input type="radio" id="Radio15" value="images/cart15.jpg" name="carImg"
                          ${carImg == 'images/cart15.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio15" style="cursor:hand;cursor: pointer;"><img src="images/cart15.jpg" width="90" height="24" /></label></td>
                    <td><input type="radio" id="Radio21" value="images/cart21.jpg" name="carImg"
                          ${carImg == 'images/cart21.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio21" style="cursor:hand;cursor: pointer;"><img src="images/cart21.jpg" width="94" height="50" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio22" value="images/cart22.jpg" name="carImg"
                          ${carImg == 'images/cart22.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio22" style="cursor:hand;cursor: pointer;"><img src="images/cart22.jpg" width="94" height="50" /></label></td>
                    <td><input type="radio" id="Radio23" value="images/cart23.jpg" name="carImg"
                          ${carImg == 'images/cart23.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio23" style="cursor:hand;cursor: pointer;"><img src="images/cart23.jpg" width="39" height="39" /></label></td>
                    <td><input type="radio" id="Radio24" value="images/cart24.jpg" name="carImg"
                          ${carImg == 'images/cart24.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio24" style="cursor:hand;cursor: pointer;"><img src="images/cart24.jpg" width="39" height="39" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio25" value="images/cart25.jpg" name="carImg"
                          ${carImg == 'images/cart25.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio25" style="cursor:hand;cursor: pointer;"><img src="images/cart25.jpg" width="39" height="39" /></label></td>
                    <td><input type="radio" id="Radio26" value="images/cart26.jpg" name="carImg"
                          ${carImg == 'images/cart26.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio26" style="cursor:hand;cursor: pointer;"><img src="images/cart26.jpg" width="39" height="39" /></label></td>
                    <td><input type="radio" id="Radio27" value="images/cart27.jpg" name="carImg"
                          ${carImg == 'images/cart27.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio27" style="cursor:hand;cursor: pointer;"><img src="images/cart27.jpg" width="39" height="39" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio28" value="images/cart28.jpg" name="carImg"
                          ${carImg == 'images/cart28.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio28" style="cursor:hand;cursor: pointer;"><img src="images/cart28.jpg" width="64" height="27" /></label></td>
                    <td><input type="radio" id="Radio29" value="images/cart29.jpg" name="carImg"
                          ${carImg == 'images/cart29.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio29" style="cursor:hand;cursor: pointer;"><img src="images/cart29.jpg" width="64" height="27" /></label></td>
                    <td><input type="radio" id="Radio30" value="images/cart30.jpg" name="carImg"
                          ${carImg == 'images/cart30.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio30" style="cursor:hand;cursor: pointer;"><img src="images/cart30.jpg" width="64" height="27" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio31" value="images/cart31.jpg" name="carImg"
                          ${carImg == 'images/cart31.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio31" style="cursor:hand;cursor: pointer;"><img src="images/cart31.jpg" width="64" height="27" /></label></td>
                    <td><input type="radio" id="Radio32" value="images/cart32.jpg" name="carImg"
                          ${carImg == 'images/cart32.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio32" style="cursor:hand;cursor: pointer;"><img src="images/cart32.jpg" width="64" height="27" /></label></td>
                    <td><input type="radio" id="Radio33" value="images/cart33.jpg" name="carImg"
                          ${carImg == 'images/cart33.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio33" style="cursor:hand;cursor: pointer;"><img src="images/cart33.jpg" width="91" height="25" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio34" value="images/cart34.jpg" name="carImg"
                          ${carImg == 'images/cart34.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio34" style="cursor:hand;cursor: pointer;"><img src="images/cart34.jpg" width="91" height="25" /></label></td>
                    <td><input type="radio" id="Radio35" value="images/cart35.jpg" name="carImg"
                          ${carImg == 'images/cart35.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio35" style="cursor:hand;cursor: pointer;"><img src="images/cart35.jpg" width="91" height="26" /></label></td>
                    <td><input type="radio" id="Radio36" value="images/cart36.jpg" name="carImg"
                          ${carImg == 'images/cart36.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio36" style="cursor:hand;cursor: pointer;"><img src="images/cart36.jpg" width="91" height="25" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio37" value="images/cart37.jpg" name="carImg"
                          ${carImg == 'images/cart37.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio37" style="cursor:hand;cursor: pointer;"><img src="images/cart37.jpg" width="91" height="26" /></label></td>
                    <td><input type="radio" id="Radio38" value="images/cart38.jpg" name="carImg"
                          ${carImg == 'images/cart38.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio38" style="cursor:hand;cursor: pointer;"><img src="images/cart38.jpg" width="91" height="26" /></label></td>
                    <td><input type="radio" id="Radio39" value="images/cart39.jpg" name="carImg"
                          ${carImg == 'images/cart39.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio39" style="cursor:hand;cursor: pointer;"><img src="images/cart39.jpg" width="91" height="25" /></label></td>
                  </tr>
                  <tr>
                    <td><input type="radio" id="Radio40" value="images/cart40.jpg" name="carImg"
                          ${carImg == 'images/cart40.jpg' ?'checked':''}
                        ></td>
                    <td><label for="Radio40" style="cursor:hand;cursor: pointer;"><img src="images/cart40.jpg" width="91" height="26" /></label></td>
                  </tr>
                </table>
                <span class="style5">加入購物車是否跳出新視窗<br />
                <input type="radio" value="_same" name="target" 
				 ${requestScope.target == '_same' ?'checked':''}
                >
                同視窗&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" value="_blank" name="target" 
				${requestScope.target == '_blank' ?'checked':''}
                >
                跳出新視窗</span><br />
                &nbsp;
                <input value="產生html語法" name="B12" type="submit" />
              </form>
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
                    <td  bgcolor="#FFFFFF"><textarea id="textarea" name="textarea" onClick="this.focus(); this.select();" cols="70" rows="10">${car}</textarea>
                      <br>
                      <input type="button" name="Submit" onClick='document.getElementById("textarea").createTextRange().execCommand("Copy");'  value="複製">                    </td>
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
