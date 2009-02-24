<%@ page contentType="text/html; charset=Utf-8"%>
<%@ include file="../taglibs.jsp"%>
<jsp:directive.page import="com.sells.common.util.UtilString"/>
<jsp:directive.page import="java.util.HashMap"/>
<jsp:directive.page import="org.apache.commons.lang.ObjectUtils"/>
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
<body><center><form name="member" action="saveMember.do" method="Post" onSubmit="return sendForm(this);">
<table width="670" border="0" align="center" cellspacing="1" class="tb1">
  <tr class="tb2">
    <td height="28" align=center bgcolor="#FFFFFF" ><a href="${requestScope.sells.homepage}">
      <c:if test="${ ! empty requestScope.sells.logo}"><img src="${requestScope.sells.logo}" width="18" height="18" border="0"></c:if>
      ${requestScope.sells.storeNm}</a></td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#FFFFFF"><%@ include file="menuMember.jsp"%>
</td></tr></table><table width="670" border="0" align="center" cellspacing="1" class="tb1">
        <tr>
          <td width="28%" bgcolor="#FFFFFF">訂單編號︰${orders.orderNo}</td>
          <td bgcolor="#FFFFFF">目前訂購狀態：<img src="images/st${orders.orderSt}.gif" border="0"></td>
          <td bgcolor="#FFFFFF"><a href="javascript:msg('${orders.orderNo}');" ><img src="images/msg.jpg" width="36" height="35" title='留言管理' border="0"></a></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF">訂購日期：<br>
            ${orders.orderDt}</td>
          <td width="21%" bgcolor="#FFFFFF"> 物流說明：</td>
          <td width="51%" bgcolor="#FFFFFF" ><span class="style11">
            <textarea name="logisticDesc" cols="30" rows="4">${orders.logisticDesc}</textarea>
          </span></td>
        </tr>
		<tr>
          <td bgcolor="#FFFFFF" colspan="3" class="style5">→訂購內容</td>
        </tr>
      </table>
      <table width=670 border="0" align="center" cellspacing="1" class="tb1">
        <tr>
          <td width=125 height="28" align="center" bgcolor="#FFFFFF" class="tb2" >編號</td>
          <td width="535" align="center" bgcolor="#FFFFFF" class="tb2" >品名(規格)</td>
          <td width=158 align="center" bgcolor="#FFFFFF" class="tb2" >數量</td>
          <td width=106 align="center" bgcolor="#FFFFFF" class="tb2" >單價</td>
          <td width=93 align="center" bgcolor="#FFFFFF" class="tb2" >小計</td>
        </tr>
        <c:set var="total" scope="request" value="${0}"/>
        <c:set var="totQty" scope="request" value="${0}"/>
        <c:forEach items="${items}" var="item" varStatus="s">
          <tr>
            <td width=125 height="28" align="center" bgcolor="#FFFFFF" class="style55">${item.itemNo}</td>
            <td width="535" align="left" bgcolor="#FFFFFF" class="style55">${item.itemNm} ( ${item.itemSpec1} ${item.itemSpec2})</td>
            <td width=158 align="center" bgcolor="#FFFFFF"><span class="style9">${item.qty}</span>
                <c:set var="total" scope="request" value="${total + item.qty * item.price}"/>
                <c:set var="totQty" scope="request" value="${totQty + item.qty}"/>
            </td>
            <td width=106 align="center" bgcolor="#FFFFFF" class="style9">${item.price}</td>
            <td width=93 align="center" bgcolor="#FFFFFF" class="style1">${item.qty * item.price}</td>
          </tr>
        </c:forEach>
        <tr>
          <td height="28" colspan=6 bgcolor="#FFFFFF" class="tb2" >共買了 ${totQty} 個商品 </td>
        </tr>
        <tr>
          <td height="28" colspan=6 bgcolor=#FFFFFF class="tb2">商品金額︰${total}元</td>
        </tr>
    </table>
      <table width="670" border="0" align="center" cellspacing="1" class="tb1">
        <tr>
          <td width="22%" height="25" bgcolor="#FFFFFF" colspan='2'  class="style5">→訂購人資料</td>
        </tr>
		<tr>
          <td width="22%" height="25" bgcolor="#FFFFFF"><span class="style55">姓名︰</span></td>
          <td width="78%" bgcolor="#FFFFFF" class="style1"><span class="style55">${orders.name} </span></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#FFFFFF" class="style9"><span class="style55">地址︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.zip}<br>
            ${orders.address} </span></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#FFFFFF"><span class="style55">E-mail︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.email} </span></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#FFFFFF"><span class="style55">電話︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.tel} </span></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#FFFFFF"><span class="style55">手機︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.mobile} </span></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#FFFFFF"><span class="style1">付款方式︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style1">${orders.payTp} </span></td>
        </tr>
        <tr>
          <td height="25" bgcolor="#FFFFFF"><span class="style1">轉出帳號後5碼︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style1">${orders.exportAccount} </span></td>
        </tr>
		<tr>
  <td align="left" bgcolor="#FFFFFF" colspan="2">      <span class="style5">
備註︰ <br>
      </span><span class="style9">${orders.descTxt} </span></td>
  </tr>
  <tr>
  <td align="center" bgcolor="#FFFFFF" colspan="2"><input type="button" name="Submit2" onClick="history.back();" value="回上頁"></td>
  </tr>
    </table>
</form><%@ include file="footer.jsp"%>
</center>
</body>
</html>
<script>
<!--
function msg(orderNo){
  var winName = "update" ;
  var features = "width=800, height=600,resizable=no,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,left=50,top=50";
  var theURL = "memOrderMessageList.do?orderNo="+orderNo;
  window.open(theURL,winName,features);
}
-->
</script>