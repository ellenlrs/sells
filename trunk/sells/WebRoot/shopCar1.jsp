<%@ page contentType="text/html; charset=Utf-8"%>
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
<title>${requestScope.sells.storeNm} 專屬購物車</title>
<link href="car.css" rel="stylesheet" type="text/css">
<style type="text/css"><!--
body {
	font-size: 12px;
	background-color: #FFFFFF;
	margin-top: 0px;
	margin-left: 0px;
}
.button {
	color: ${requestScope.sells.color2 == null || requestScope.sells.color2 == '' ?'#99CCFF':requestScope.sells.color2};
	font-size: 12px;
	padding-top: 3px;
	background-color: ${requestScope.sells.color1 == null || requestScope.sells.color1 == '' ?'#006699':requestScope.sells.color1};
}
.tb2 {
    background-color: ${requestScope.sells.color2 == null || requestScope.sells.color2 == '' ?'#99CCFF':requestScope.sells.color2};
	font-size: 12px;
}
.tb1 {
    background-color: ${requestScope.sells.color1 == null || requestScope.sells.color1 == '' ?'#006699':requestScope.sells.color1};
	font-size: 12px;
}
.tb3 {
	font-size: 12px;
}-->
</style>
</head>
<body><center><form name="shopcar" action="shopcar.do" method="Post">
<table width="800" border="0" align="center" cellspacing="1" class="tb1">
  <tr>
    <td height="28" align=center class="tb2"><a href="${requestScope.sells.homepage}"><c:if test="${ ! empty requestScope.sells.logo}"><img src="${requestScope.sells.logo}" width="18" height="18" border="0"></c:if>${requestScope.sells.storeNm}</a></td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#FFFFFF"><table border=0 width=100% cellspacing="1" class="tb1" cellpadding="2">
        <tr class="tb2">
          <td width=62 height="28" align="center">編號</td>
          <td width="415" align="center" >品名(規格)</td>
          <td align="center" width=122 >數量</td>
          <td align="center" width=55 >單價</td>
          <td align="center" width=55 >小計</td>
          <td align="center" width=56 >刪除</td>
        </tr>
		 <c:set var="total" scope="request" value="${0}"/>
		 <c:set var="totQty" scope="request" value="${0}"/>
		 <c:forEach items="${requestScope.car}" var="item" varStatus="s">
        <tr>
          <td width=62 height="28" align="center" bgcolor="#FFFFFF">${item.itemNo}</td>
          <td width="415" align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;${item.itemNm} ( ${item.spec1} ${item.spec2})</td>
          <td align="center" width=122 bgcolor="#FFFFFF">
		   <input type="hidden" name="itemNo" value="${item.itemNo}">
		   <input type="hidden" name="itemNm" value="${item.itemNm}">
		   <input type="hidden" name="spec1" value="${item.spec1}">
		   <input type="hidden" name="spec2" value="${item.spec2}">
		   <input type="hidden" name="price" value="${item.price}">
		   <input type="hidden" name="seqno" value="${item.seqno}">
		   <input type="text" name="qty" size="3" value="${item.qty}"><input type="button" onClick="gotoPage('UPDATE')" class="button" value="修改">
		   <c:set var="total" scope="request" value="${total + item.qty * item.price}"/>
		   <c:set var="totQty" scope="request" value="${totQty + item.qty}"/>		  </td>
          <td align="center" width=55 bgcolor="#FFFFFF">${item.price}</td>
          <td align="center" width=55 bgcolor="#FFFFFF">${item.qty * item.price}</td>
          <td align="center" width=56 bgcolor="#FFFFFF"><a href='shopcar.do?removeSeqno=${item.seqno}&func=REMOVE&sells=${requestScope.sells.sellsNo}' ><font color="#006699">刪除</font></a></td>
        </tr>
		</c:forEach>
        <tr>
          <td height="28" colspan=6 class="tb2">您選購了 ${totQty} 個商品 </td>
        </tr>
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff>最低結帳金額︰${requestScope.sells.lowAccount}元<span class="style1"> <br>
            （結帳時沒有超過此金額，將無法結帳，不包含運費金額）</span></td>
        </tr>
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff>商品金額為︰${total}元</td>
        </tr>
		<c:if test="${requestScope.sells.process > '0'}">
		<tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 若您結帳時選擇<span class="style1">貨到付款</span>將加收物流處理費︰${requestScope.sells.process}元 </td>
        </tr>
		</c:if>
		<c:if test="${requestScope.sells.freightTp == '0'}">
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 運費金額為︰${requestScope.sells.freightFare}元 </td>
        </tr>
        <tr>
          <td height="28" colspan=6 class="tb2">購物總金額為︰${total + requestScope.sells.freightFare}元 (含運費)</td>
        </tr>
		</c:if>
		<c:if test="${requestScope.sells.freightTp == '1'}"><!--價格-->
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 運費金額為︰${requestScope.sells.freightFare}元 <span class="style1"><br>
（當消費金額超過 ${requestScope.sells.nofreightFare}元，享有免運費服務<c:if test="${requestScope.sells.process > '0'}">及貨到付款物流處理費</c:if>）</span></td>
        </tr>
        <tr>
          <td height="28" colspan=6 class="tb2">
		  購物總金額為︰
		  <c:if test="${total <= requestScope.sells.nofreightFare}">${total + requestScope.sells.freightFare} (含運費)</c:if>
		  <c:if test="${total > requestScope.sells.nofreightFare}">${total} 元 (免運費)</c:if></td>
        </tr>
		</c:if>
		<c:if test="${requestScope.sells.freightTp == '2'}"><!--數量-->
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 運費金額為︰${requestScope.sells.freightFare}元<span class="style1"><br>
（當數量超過 ${requestScope.sells.nofreightQty}件，享有免運費服務<c:if test="${requestScope.sells.process > '0'}">及貨到付款物流處理費</c:if>） </span></td>
        </tr>
        <tr>
          <td height="28" colspan=6 class="tb2">
		  購物總金額為
		  <c:if test="${totQty <= requestScope.sells.nofreightQty}">${total + requestScope.sells.freightFare}元 (內含運費)</c:if>
		  <c:if test="${totQty >requestScope.sells.nofreightQty}">${total}元 (免運費)</c:if></td>
        </tr>
		</c:if>
    <c:if test="${requestScope.sells.freightTp == '3'}"><!--價格-->
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 運費金額為︰${requestScope.sells.freightFare}元 <span class="style1"><br>
（當消費金額超過 ${requestScope.sells.nofreightFare}元，享有免運費服務）</span></td>
        </tr>
        <tr>
          <td height="28" colspan=6 class="tb2">
      購物總金額為︰
      <c:if test="${total <= requestScope.sells.nofreightFare}">${total + requestScope.sells.freightFare} (含運費)</c:if>
      <c:if test="${total > requestScope.sells.nofreightFare}">${total} 元 (免運費)</c:if></td>
        </tr>
    </c:if>
    <c:if test="${requestScope.sells.freightTp == '4'}"><!--數量-->
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 運費金額為︰${requestScope.sells.freightFare}元<span class="style1"><br>
（當數量超過 ${requestScope.sells.nofreightQty}件，享有免運費服務）</span></td>
        </tr>
        <tr>
          <td height="28" colspan=6 class="tb2">
      購物總金額為
      <c:if test="${totQty <= requestScope.sells.nofreightQty}">${total + requestScope.sells.freightFare}元 (內含運費)</c:if>
      <c:if test="${totQty >requestScope.sells.nofreightQty}">${total}元 (免運費)</c:if></td>
        </tr>
    </c:if>		
		<tr>
		  <td colspan=6 align="center" bgcolor=#ffffff>
		  <table border=0 width=70% cellspacing="1" class="tb1" cellpadding="2">
  <tr>
    <td width="30%" align="center" bgcolor="#FFFFFF">帳號</td>
    <td width="70%" bgcolor="#FFFFFF"><input type="text" name="email"> 
      <a href="javascript:joinMember();" class="style3">加入會員</a></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#ffffff">密碼</td>
    <td bgcolor="#ffffff"><input type="password" name="password">
      <a href="javascript:query();" class="style3">忘記密碼</a></td>
  </tr>
</table></td>
		</tr>
		<tr>
          <td height="28" colspan=6 align="center" bgcolor=#ffffff>
            <input name="b121" type=button onClick="gotoPage('order')" value="直接結帳" class="button">
            <c:if test="${requestScope.sess == 'haveSess'}">
            <input name="b122" value="我是 ${sessionScope.icMemNm}；直接登入" type="button" onclick="gotoPageSess('ordermembersess')" class="button">
            </c:if>
            <input name="b1212" type=button onClick="gotoPage('ordermember')" value="登入會員後結帳" class="button">
            <input name="b122" onClick="history.go(-1)" value="繼續購物" type="button" class="button">
            <input name="b123" onClick="goHome();'" value="返回首頁" type="button" class="button">
            <INPUT name="b1" type=button onClick="gotoPage('REMOVEALL')" value="清空購物車" class="button">
<input type="hidden" name="member" value="0"></td>
        </tr>
      </table>
</td>
  </tr>
</table><input type="hidden" name="func" value="UPDATE"><input type="hidden" name="sells" value="${requestScope.sells.sellsNo}">
</form><%@ include file="footer.jsp"%>
</center>
<script>
function gotoPage(func){
  if (func == "order" ){
    document.shopcar.member.value = "0" ;
    document.shopcar.action = "order.do" ;
  } else if (func == "ordermember" ){
    document.shopcar.member.value = "1" ;
		if ( document.shopcar.email.value == "" ){
		  alert("請輸入帳號");
		  document.shopcar.email.focus();
		  return false ;
		}
		if ( document.shopcar.password.value == "" ){
		  alert("請輸入密碼");
		  document.shopcar.password.focus();
		  return false ;
		} 
    document.shopcar.action = "order.do" ;
  } else if (func == "ordermembersess" ){
    document.shopcar.member.value = "2" ;
    document.shopcar.action = "order.do" ;
  } else {
    document.shopcar.func.value= func ;
  }
  document.shopcar.submit();
}
<c:if test="${requestScope.sess == 'haveSess'}">
function gotoPageSess(){
    document.shopcar.member.value = "2" ;
    document.shopcar.action = "order.do" ;
  document.shopcar.submit();
}
</c:if>
function goHome(){
  var winName = "_top" ;
  var features = "";
  var theURL = "${requestScope.sells.homepage}";
  window.open(theURL,winName,features);
}
function query(){
  var winName = "update" ;
  var features = "width=650, height=500,resizable=yes,scrollbars=auto,toolbar=no,location=no,menubar=no,status=no,left=10,top=20";
  var theURL = "funcMember.do?func=QRPWD&sells=${requestScope.sells.sellsNo}";
  window.open(theURL,winName,features);
}
 function joinMember(){
  var winName = "update" ;
  var features = "width=650, height=500,resizable=yes,scrollbars=auto,toolbar=no,location=no,menubar=no,status=no,left=10,top=20";
  var theURL = "funcMember.do?func=JOIN&sells=${requestScope.sells.sellsNo}";
  window.open(theURL,winName,features);
}
</script>
</body>
</html>
