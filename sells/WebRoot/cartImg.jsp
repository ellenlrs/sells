<%@ page contentType="text/html; charset=Utf-8"%>
<jsp:directive.page import="com.sells.dao.Sells"/>
<jsp:directive.page import="com.sells.dao.LoginData"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<%@ include file="taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<form action="" name="cart">
<table width="590" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr>
    <td align="center"><input type="radio" id="Radio1" value="http://www.icart.tw/Sells/images/cart1.jpg" name="carImg" ></td>
    <td ><label for="Radio1" style="cursor:hand;cursor: pointer;"><img src="images/cart1.jpg" width="135" height="50" /></label></td>
    <td><input type="radio" id="Radio2" value="http://www.icart.tw/Sells/images/cart2.jpg" name="carImg" ></td>
    <td ><label for="Radio2" style="cursor:hand;cursor: pointer;"><img src="images/cart2.jpg" width="125" height="50" /></label></td>
    <td><input type="radio" id="Radio3" value="http://www.icart.tw/Sells/images/cart3.jpg" name="carImg" ></td>
    <td ><label for="Radio3" style="cursor:hand;cursor: pointer;"><img src="images/cart3.jpg" width="123" height="50" /></label></td>
    <td><input type="radio" id="Radio4" value="http://www.icart.tw/Sells/images/cart4.jpg" name="carImg" ></td>
    <td><label for="Radio4" style="cursor:hand;cursor: pointer;"><img src="images/cart4.jpg" width="118" height="42" /></label></td>

  </tr>
  <tr>
    <td><input type="radio" id="Radio5" value="http://www.icart.tw/Sells/images/cart5.jpg" name="carImg" ></td>
    <td><label for="Radio5" style="cursor:hand;cursor: pointer;"><img src="images/cart5.jpg" width="122" height="50" /></label></td>
    <td><input type="radio" id="Radio6" value="http://www.icart.tw/Sells/images/cart6.jpg" name="carImg" ></td>
    <td><label for="Radio6" style="cursor:hand;cursor: pointer;"><img src="images/cart6.jpg" width="135" height="52" /></label></td>
    <td><input type="radio" id="Radio7" value="http://www.icart.tw/Sells/images/cart7.jpg" name="carImg" ></td>
    <td><label for="Radio7" style="cursor:hand;cursor: pointer;"><img src="images/cart7.jpg" width="125" height="52" /></label></td>
    <td><input type="radio" id="Radio8" value="http://www.icart.tw/Sells/images/cart8.jpg" name="carImg" ></td>
    <td><label for="Radio8" style="cursor:hand;cursor: pointer;"><img src="images/cart8.jpg" width="123" height="52" /></label></td>

  </tr>
  <tr>
    <td><input type="radio" id="Radio10" value="http://www.icart.tw/Sells/images/cart10.jpg" name="carImg" ></td>
    <td><label for="Radio10" style="cursor:hand;cursor: pointer;"><img src="images/cart10.jpg" width="122" height="52" /></label></td>
    <td><input type="radio" id="Radio19" value="http://www.icart.tw/Sells/images/cart19.jpg" name="carImg" ></td>
    <td><label for="Radio19" style="cursor:hand;cursor: pointer;"><img src="images/cart19.jpg" width="118" height="36" /></label></td>
    <td><input type="radio" id="Radio18" value="http://www.icart.tw/Sells/images/cart18.jpg" name="carImg" ></td>
    <td><label for="Radio18" style="cursor:hand;cursor: pointer;"><img src="images/cart18.jpg" width="123" height="36" /></label></td>
    <td><input type="radio" id="Radio9" value="http://www.icart.tw/Sells/images/cart9.jpg" name="carImg" ></td>
    <td><label for="Radio9" style="cursor:hand;cursor: pointer;"><img src="images/cart9.jpg" width="118" height="52" /></label></td>
  </tr>
  <tr>
    <td><input type="radio" id="Radio17" value="http://www.icart.tw/Sells/images/cart17.jpg" name="carImg" ></td>
    <td><label for="Radio17" style="cursor:hand;cursor: pointer;"><img src="images/cart17.jpg" width="125" height="36" /></label></td>
    <td><input type="radio" id="Radio20" value="http://www.icart.tw/Sells/images/cart20.jpg" name="carImg" ></td>
    <td><label for="Radio20" style="cursor:hand;cursor: pointer;"><img src="images/cart20.jpg" width="122" height="36" /></label></td>
    <td><input type="radio" id="Radio16" value="http://www.icart.tw/Sells/images/cart16.jpg" name="carImg" ></td>
    <td><label for="Radio16" style="cursor:hand;cursor: pointer;"><img src="images/cart16.jpg" width="128" height="36" /></label></td>
    <td><input type="radio" id="Radio41" value="http://www.icart.tw/Sells/images/cart41.jpg" name="carImg" ></td>
    <td><label for="Radio41" style="cursor:hand;cursor: pointer;"><img src="images/cart41.jpg" width="122" height="38" /></label></td>
  </tr>
  <tr>
    <td><input type="radio" id="Radio13" value="http://www.icart.tw/Sells/images/cart13.jpg" name="carImg" ></td>
    <td><label for="Radio13" style="cursor:hand;cursor: pointer;"><img src="images/cart13.jpg" width="90" height="24" /></label></td>
    <td><input type="radio" id="Radio12" value="http://www.icart.tw/Sells/images/cart12.jpg" name="carImg" ></td>
    <td><label for="Radio12" style="cursor:hand;cursor: pointer;"><img src="images/cart12.jpg" width="90" height="24" /></label></td>
    <td><input type="radio" id="Radio11" value="http://www.icart.tw/Sells/images/cart11.jpg" name="carImg" ></td>
    <td><label for="Radio11" style="cursor:hand;cursor: pointer;"><img src="images/cart11.jpg" width="90" height="20" /></label></td>
    <td><input type="radio" id="Radio15" value="http://www.icart.tw/Sells/images/cart15.jpg" name="carImg" ></td>
    <td><label for="Radio15" style="cursor:hand;cursor: pointer;"><img src="images/cart15.jpg" width="90" height="24" /></label></td>
  </tr>
  <tr>
    <td><input type="radio" id="Radio21" value="http://www.icart.tw/Sells/images/cart21.jpg" name="carImg" ></td>
    <td><label for="Radio21" style="cursor:hand;cursor: pointer;"><img src="images/cart21.jpg" width="94" height="50" /></label></td>
    <td><input type="radio" id="Radio22" value="http://www.icart.tw/Sells/images/cart22.jpg" name="carImg" ></td>
    <td><label for="Radio22" style="cursor:hand;cursor: pointer;"><img src="images/cart22.jpg" width="94" height="50" /></label></td>
    <td><input type="radio" id="Radio23" value="http://www.icart.tw/Sells/images/cart23.jpg" name="carImg" ></td>
    <td><label for="Radio23" style="cursor:hand;cursor: pointer;"><img src="images/cart23.jpg" width="39" height="39" /></label></td>
    <td><input type="radio" id="Radio24" value="http://www.icart.tw/Sells/images/cart24.jpg" name="carImg" ></td>
    <td><label for="Radio24" style="cursor:hand;cursor: pointer;"><img src="images/cart24.jpg" width="39" height="39" /></label></td>
  </tr>
  <tr>
    <td><input type="radio" id="Radio25" value="http://www.icart.tw/Sells/images/cart25.jpg" name="carImg" ></td>
    <td><label for="Radio25" style="cursor:hand;cursor: pointer;"><img src="images/cart25.jpg" width="39" height="39" /></label></td>
    <td><input type="radio" id="Radio26" value="http://www.icart.tw/Sells/images/cart26.jpg" name="carImg" ></td>
    <td><label for="Radio26" style="cursor:hand;cursor: pointer;"><img src="images/cart26.jpg" width="39" height="39" /></label></td>
    <td><input type="radio" id="Radio27" value="http://www.icart.tw/Sells/images/cart27.jpg" name="carImg" ></td>
    <td><label for="Radio27" style="cursor:hand;cursor: pointer;"><img src="images/cart27.jpg" width="39" height="39" /></label></td>
    <td><input type="radio" id="Radio28" value="http://www.icart.tw/Sells/images/cart28.jpg" name="carImg" ></td>
    <td><label for="Radio28" style="cursor:hand;cursor: pointer;"><img src="images/cart28.jpg" width="64" height="27" /></label></td>
  </tr>
  <tr>
    <td><input type="radio" id="Radio29" value="http://www.icart.tw/Sells/images/cart29.jpg" name="carImg" ></td>
    <td><label for="Radio29" style="cursor:hand;cursor: pointer;"><img src="images/cart29.jpg" width="64" height="27" /></label></td>
    <td><input type="radio" id="Radio30" value="http://www.icart.tw/Sells/images/cart30.jpg" name="carImg" ></td>
    <td><label for="Radio30" style="cursor:hand;cursor: pointer;"><img src="images/cart30.jpg" width="64" height="27" /></label></td>
    <td><input type="radio" id="Radio31" value="http://www.icart.tw/Sells/images/cart31.jpg" name="carImg" ></td>
    <td><label for="Radio31" style="cursor:hand;cursor: pointer;"><img src="images/cart31.jpg" width="64" height="27" /></label></td>
    <td><input type="radio" id="Radio32" value="http://www.icart.tw/Sells/images/cart32.jpg" name="carImg" ></td>
    <td><label for="Radio32" style="cursor:hand;cursor: pointer;"><img src="images/cart32.jpg" width="64" height="27" /></label></td>
  </tr>
  <tr>
    <td><input type="radio" id="Radio33" value="http://www.icart.tw/Sells/images/cart33.jpg" name="carImg" ></td>
    <td><label for="Radio33" style="cursor:hand;cursor: pointer;"><img src="images/cart33.jpg" width="91" height="25" /></label></td>
    <td><input type="radio" id="Radio34" value="http://www.icart.tw/Sells/images/cart34.jpg" name="carImg" ></td>
    <td><label for="Radio34" style="cursor:hand;cursor: pointer;"><img src="images/cart34.jpg" width="91" height="25" /></label></td>
    <td><input type="radio" id="Radio35" value="http://www.icart.tw/Sells/images/cart35.jpg" name="carImg" ></td>
    <td><label for="Radio35" style="cursor:hand;cursor: pointer;"><img src="images/cart35.jpg" width="91" height="26" /></label></td>
    <td><input type="radio" id="Radio36" value="http://www.icart.tw/Sells/images/cart36.jpg" name="carImg" ></td>
    <td><label for="Radio36" style="cursor:hand;cursor: pointer;"><img src="images/cart36.jpg" width="91" height="25" /></label></td>
  </tr>
  <tr>
    <td><input type="radio" id="Radio37" value="http://www.icart.tw/Sells/images/cart37.jpg" name="carImg" ></td>
    <td><label for="Radio37" style="cursor:hand;cursor: pointer;"><img src="images/cart37.jpg" width="91" height="26" /></label></td>
    <td><input type="radio" id="Radio38" value="http://www.icart.tw/Sells/images/cart38.jpg" name="carImg" ></td>
    <td><label for="Radio38" style="cursor:hand;cursor: pointer;"><img src="images/cart38.jpg" width="91" height="26" /></label></td>
    <td><input type="radio" id="Radio39" value="http://www.icart.tw/Sells/images/cart39.jpg" name="carImg" ></td>
    <td><label for="Radio39" style="cursor:hand;cursor: pointer;"><img src="images/cart39.jpg" width="91" height="25" /></label></td>
  </tr>
  <tr>
    <td colspan="8" align="center" valign="middle">
    <input type="button" name="Submit" value="確認" id="Submit" onClick="choiceImg()"/>
    <input type="reset" name="Submit" value="重選" id="Submit" />
    <input type="button" name="Submit2" value="取消" id="Submit2" onclick="windows.close();"/></td>
  </tr>
</table></form>
<script>
function choiceImg(){
  var imgUrl = "" ;
  var formObj = document.cart;
  for ( var i = 0 ; i < formObj.elements.length; i++){
	if ( formObj.elements[i].name == "carImg" ) { 
      if (formObj.elements[i].checked ) {
	    imgUrl = formObj.elements[i].value
	  }
	}
  }
  if (imgUrl != "" ){
    opener.document.forms["a1"].cartImg.value = imgUrl;
	opener.document.forms["a1"].img1.src = imgUrl ;
  }
  window.close();
}
</script>
</body>
</html>
