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
<style type="text/css">
<!--
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
<body>
<center><BR><BR><BR>
<table width="800" border="0" align="center" cellpadding="4" cellspacing="2" class="tb1">
  <tr>
    <td class="tb2" align=center><span class="style8" >錯誤代碼${msg}</span><br>
    <c:if test="${requestScope.payType == 'ibon代碼繳款' || requestScope.payType == '全家.萊爾富.OK.代碼繳款'}">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="2" class="tb1">
<tr ><td style="background-color: #eff0e6; border: 1px solid rgb(0, 0, 0); padding: 8px; vertical-align: middle;"><div dir="ltr" style="margin-bottom: 0pt; margin-top: 0pt; text-align: center;">
錯誤代碼
</td><td style="background-color: #eff0e6; border: 1px solid rgb(0, 0, 0); padding: 8px; vertical-align: middle;"><div dir="ltr" style="margin-bottom: 0pt; margin-top: 0pt; text-align: center;">
錯誤說明
</td></tr>
<tr ><td>1000</td><td>發票作業方式類型錯誤</td></tr>
<tr ><td>1001</td><td>商店代號錯誤</td></tr>
<tr ><td>1003</td><td>自訂編號錯誤</td></tr>
<tr ><td>1004</td><td>自訂編號這個月重覆</td></tr>
<tr ><td>1006</td><td>超過時間</td></tr>
<tr ><td>1106</td><td>客戶手機號碼格式錯誤</td></tr>
<tr ><td>1107</td><td>客戶電子信箱格式錯誤</td></tr>
<tr ><td>1108</td><td>手機或電子信箱二個欄位必須填寫一項</td></tr>
<tr ><td>1110</td><td>產品數量格式錯誤</td></tr>
<tr ><td>1111</td><td>總金額格式錯誤</td></tr>
<tr ><td>1112</td><td>發票捐贈格式錯誤</td></tr>
<tr ><td>1113</td><td>發票捐贈單位代碼格式錯誤</td></tr>
<tr ><td>1114</td><td>發票捐贈單位錯誤</td></tr>
<tr ><td>1200</td><td>無商品資料</td></tr>
<tr ><td>1201</td><td>商品名稱格式錯誤</td></tr>
<tr ><td>1202</td><td>購買數量格式錯誤</td></tr>
<tr ><td>1204</td><td>商品單價格式錯誤</td></tr>
<tr ><td>1300</td><td>無字軌號碼可以使用</td></tr>
<tr ><td>6001</td><td>延後開立發票天數錯誤</td></tr>
<tr ><td>9991</td><td>使用IP為封鎖IP</td></tr>
<tr ><td>9992</td><td>使用IP為允許IP之外</td></tr>
<tr ><td>9993</td><td>交易類型錯誤(pay_type)</td></tr>
<tr ><td>9994</td><td>付款類型錯誤(inv_pay)</td></tr>
<tr ><td>9995</td><td>tsr交易單號重複</td></tr>
<tr ><td>9996</td><td>ECBank 或ECPay 帳號尚未驗證</td></tr>
<tr ><td>9997</td><td>合約過期無法再新增發票</td></tr>
<tr ><td>9998</td><td>商店已停用</td></tr>
<tr ><td>9999</td><td>系統維護中
</td></tr>
</table>
    </c:if><form action='reOrder.do' name='a' method='post'>
    <input type="hidden" name=orderNo value='${requestScope.orderNo}' >
    <input type="hidden" name=checksum value='${requestScope.checksum}' >
    <input name="b123" onClick="goHome();" value="返回首頁" type="button" class="button">
    <input type=submit name=b1 value="重新訂購" class="button"></form></td>
  </tr>
</table>
<%@ include file="footer.jsp"%>
</center>
</body>
</html>
<script>
function goHome(){
  var winName = "_top" ;
  var features = "";
  var theURL = "${requestScope.sells.homepage}";
  window.open(theURL,winName,features);
}
</script>