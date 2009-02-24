<%@ page contentType="text/html; charset=Utf-8"%>
<html>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
<jsp:directive.page import="com.sells.dao.Sells"/>
<jsp:directive.page import="com.sells.dao.LoginData"/>
<%@ include file="taglibs.jsp"%><head>
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
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%>
<table width="600" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
  <tbody>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><b><a href="carCode5.jsp" class="t1">檢視購物車連結</a></b> </td>
      <td align="center" bgcolor="#CCCCCC"><b class="style3">快速產生器</b><b><a href="carCode4.jsp" class="t1"></a></b> </td>
      <td align="center" bgcolor="#FFFFFF"><b><a href="carCode1.jsp" class="t1">單一商品規格Html產生器</a></b></td>
      <td align="center" bgcolor="#FFFFFF"><b><a href="carCode2.jsp" class="t1">多重商品規格Html產生器</a></b></td>
      <td align="center" bgcolor="#FFFFFF"><b><a href="carCode3.jsp" class="t1">大量商品訂購表單Html產生器</a></b></td>
      <td align="center" bgcolor="#FFFFFF"><b><a href="carCode6.jsp" class="t1">手動輸入購物車</a></b></td>
    </tr>
  </tbody>
</table>
<form name="a1" >
<table width="600" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#0066FF">
  <tr>
    <td width="93" bgcolor="#FFFFFF" class="style1">商品編號</td>
    <td width="211" bgcolor="#FFFFFF"><label>
      <input type="text" name="itemNo">
    </label></td>
    <td width="59" bgcolor="#FFFFFF" class="style1">商品名稱</td>
    <td width="198" bgcolor="#FFFFFF"><input type="text" name="itemNm"></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" class="style5">規格1</td>
    <td bgcolor="#FFFFFF"><input type="text" name="spec1"></td>
    <td bgcolor="#FFFFFF" class="style5">規格2</td>
    <td bgcolor="#FFFFFF"><input type="text" name="spec2"></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" class="style1">售價</td>
    <td bgcolor="#FFFFFF"><input type="text" name="price"></td>
    <td bgcolor="#FFFFFF" class="style1">商家編號</td>
    <td bgcolor="#FFFFFF"><input name="sellsNo" type="text" value="${sessionScope.sells.sellsNo}" readonly></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" class="style5">開啟方式</td>
    <td colspan="3" bgcolor="#FFFFFF"><span class="style3">
      <input name="target" type="radio" id="radiobutton1" value="" checked>
      <label for="radiobutton">同視窗</label>
    </span>
      <label for="radiobutton">      <span class="style3">
      <input name="target" type="radio" value="_blank" id="radiobutton2">
      新視窗</span></label></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" class="style1">購物車文字說明</td>
    <td colspan="3" bgcolor="#FFFFFF"><input name="cartTxt" type="text" id="cartTxt" value="加入購物車"></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" class="style1">購物車圖片</td>
    <td colspan="3" bgcolor="#FFFFFF"><input name="cartImg" type="text" id="cartImg" value="http://www.icart.tw/Sells/images/cart15.jpg" size="50" onChange="document.a1.img1.src = this.value ;">
      <input type="button" name="Submit12" value="選擇購物車外型" onClick="window.open('cartImg.jsp','','scrollbars=yes,width=700,height=580,top=20,left=20');"> 
      <span class="style8"><br>
      請貼路徑
      <br>
      <img name="img1" id="img1" src="http://www.icart.tw/Sells/images/cart15.jpg" border="0"></span></td>
    </tr>
  <tr>
    <td colspan="4" bgcolor="#FFFFFF">
      <input type="button" name="Submit1" value="產生購物車文字連結" onClick="gen('text');">
      <input type="button" name="Submit2" value="產生購物車圖片連結" onClick="gen('img');">
    </td>
    </tr>
  <tr>
    <td colspan="4" bgcolor="#FFFFFF"><span class="style8">結果：</span><br>
      <textarea name="result" cols="50" rows="10" onClick="this.focus(); this.select();"></textarea></td>
    </tr>
</table>
</form>
<script>
function gen(genType) {
  var urlstr = "" ;
  if (document.a1.itemNm.value == '') {
    alert('商品名稱未輸入');
	document.a1.itemNm.focus();
    return ;
  }
  if (document.a1.itemNo.value == '') {
    alert('商品編號未輸入');
	document.a1.itemNo.focus();
    return ;
  }
  if (document.a1.itemNm.value == '') {
    alert('商品名稱未輸入');
	document.a1.itemNm.focus();
    return ;
  }
  if (document.a1.price.value == '') {
    alert('售價未輸入');
	document.a1.price.focus();
    return ;
  }
  var number = parseInt(document.a1.price.value,10) ;
  if (isNaN(number)) {
    alert('金額僅可輸入數字');
    document.a1.price.select();
    document.a1.price.focus();
    return false;
  }
  if (number != document.a1.price.value){
    alert('金額僅可輸入數字，不可包含任何標點符號');
    document.a1.price.select();
    document.a1.price.focus();
    return false ;
  }
  if (document.a1.sellsNo.value == '') {
    alert('商家編號未輸入');
	document.a1.sellsNo.focus();
    return ;
  }
  urlstr = "itemNo="+document.a1.itemNo.value ;
  urlstr = urlstr + "&itemNm="+encodeURIComponent(document.a1.itemNm.value) ;
  urlstr = urlstr + "&spec1="+encodeURIComponent(document.a1.spec1.value) ;
  urlstr = urlstr + "&spec2="+encodeURIComponent(document.a1.spec2.value) ;
  urlstr = urlstr + "&price="+document.a1.price.value ;
  urlstr = urlstr + "&qty=1" ;
  urlstr = urlstr + "&sells="+document.a1.sellsNo.value ;
  var target = document.a1.target[1].checked?"target='_blank'":"" ;
  if ( genType == "text") {
	if (document.a1.cartTxt.value == '') {
	  alert('購物車文字說明未輸入');
	  document.a1.cartTxt.focus();
	  return ;
	}
    urlstr = "http://www.icart.tw/Sells/shopcar.do?" + urlstr ;
	urlstr = "<a href='" + urlstr +"'" + target +">"+document.a1.cartTxt.value+"</a>" ;
  } else {
	if (document.a1.cartTxt.value == '') {
	  alert('購物車圖片未輸入');
	  document.a1.cartTxt.focus();
	  return ;
	}
    urlstr = "http://www.icart.tw/Sells/shopcar.do?" + urlstr ;
	urlstr = "<a href='" + urlstr +"'" + target +"><img src='"+document.a1.cartImg.value+"' border='0' align='absmiddle'></a>" ;
  }
  document.a1.result.value = urlstr ;
}
</script>
<%@ include file="footer1.jsp"%>
</body>
</html>
