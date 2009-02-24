﻿﻿<%@ page contentType="text/html; charset=Utf-8"%>
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
<style type="text/css">
<!--
.style7 {font-size: 12}
-->
</style>
</head>
<script>
function checkForm(formObj){
  if(formObj.freightFare.value == "" ) {
     alert("請輸入運費!");
	 formObj.freightFare.focus();
	 return false ;
  }
  if(isNaN(formObj.freightFare.value)) {
     alert("運費必須是數字!");
	 formObj.freightFare.focus();
	 return false ;
  } 
  if(isNaN(formObj.process.value)) {
     alert("貨到付款處理費 必須是數字!");
	 formObj.process.focus();
	 return false ;
  } 
  if ( !(formObj.freightTp[0].checked || formObj.freightTp[1].checked || formObj.freightTp[2].checked 
  || formObj.freightTp[3].checked || formObj.freightTp[4].checked )){
     alert("請設定免運費方式!");
	 formObj.freightTp[0].focus();
	 return false 
  }
  if( formObj.freightTp[1].checked  ) {
	  if(formObj.nofreightFare.value == "" ) {
		 alert("請輸入免運費金額!");
		 formObj.nofreightFare.focus();
		 return false ;
	  }
	  if(isNaN(formObj.nofreightFare.value)) {
		 alert("免運費金額必須是數字!");
		 formObj.nofreightFare.focus();
		 return false ;
	  }
	  formObj.nofreightQty.value = 0 ;
  }
  if (formObj.freightTp[2].checked){
	  if(formObj.nofreightQty.value == "" ) {
		 alert("請輸入免運費數量!");
		 formObj.nofreightQty.focus();
		 return false ;
	  }
	  if(isNaN(formObj.nofreightQty.value)) {
		 alert("免運費數量必須是數字!");
		 formObj.nofreightQty.focus();
		 return false ;
	  }
	  formObj.nofreightFare.value = 0 ;
  }
  if(formObj.lowAccount.value == "" ) {
     alert("請輸入最低購買金額!");
	 formObj.lowAccount.focus();
	 return false ;
  }
  if(isNaN(formObj.lowAccount.value)) {
     alert("最低購買金額是數字!");
	 formObj.lowAccount.focus();
	 return false ;
  } 
}
</script>
<body topmargin="0">
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%>
<form name="form1" method="post" action="sellFare.do" onSubmit="return checkForm(this.form);" >
  <table width="90%" border="0" align="center" cellpadding="8" cellspacing="0">
    <tr>
      <td align="center" bgcolor="#0066CC" class="style6" colspan="2" ><b>購物車店家運費設定</b></td>
    </tr>
	<tr>
          <td width="140" height="26" align="center" bgcolor="#FFFFFF" class="style5"><strong>運 費</strong></td>
          <td bgcolor="#FFFFFF" >$
            <input name="freightFare" size="9" value="${sessionScope.sells.freightFare}" type="text">
            <span class="style5">元</span></td>
    </tr>
	<tr>
      <td height="26" align="center" bgcolor="#FFFFFF" class="style5">貨到付款處理費<BR><span class="style1">（與免運費規則相同）</span></td>
	  <td bgcolor="#FFFFFF">$
	    <input name="process" size="9" value="${sessionScope.sells.process}" type="text">
          <span class="style5">元</span> <span class="style1">(不設定請輸入0)</span></td>
    </tr>
        <tr>
          <td height="26" align="center" bgcolor="#FFFFFF" class="style5"><strong>免 運 費 方 式</strong></td>
          <td bgcolor="#FFFFFF">
          <label><input name="freightTp" type="radio" ${sessionScope.sells.freightTp == '0' ? 'checked':''} value="0"><span class="style5">不設定</span></label>
					<label><input name="freightTp" type="radio" ${sessionScope.sells.freightTp == '1' ? 'checked':''} value="1"><span class="style5">價格</span></label>
					<label><input name="freightTp" type="radio" ${sessionScope.sells.freightTp == '2' ? 'checked':''} value="2"><span class="style5">數量</span></label><BR>
					<label><input name="freightTp" type="radio" ${sessionScope.sells.freightTp == '3' ? 'checked':''} value="3"><span class="style5">價格(貨到付款一律收取)</span></label><BR>
					<label><input name="freightTp" type="radio" ${sessionScope.sells.freightTp == '4' ? 'checked':''} value="4"><span class="style5">數量(貨到付款一律收取)</span></label>
					</td>
        </tr>
        <tr>
          <td width="140" height="26" align="center" bgcolor="#FFFFFF" class="style5"><strong>免 運 費 金 額</strong></td>
          <td bgcolor="#FFFFFF">$
            <input name="nofreightFare" size="9" value="${sessionScope.sells.nofreightFare}" type="text">
            <span class="style5">元</span> <span class="style1">(不設定請輸入0)</span></td>
        </tr>
        <tr>
          <td height="26" align="center" bgcolor="#FFFFFF" class="style5"><strong>免 運 費 數 量</strong></td>
          <td bgcolor="#FFFFFF"><input name="nofreightQty" size="9" value="${sessionScope.sells.nofreightQty}" type="text">
            <span class="style5">件</span> <span class="style1">(不設定請輸入0)</span></td>
        </tr>
        <tr>
          <td height="26" align="center" bgcolor="#FFFFFF" class="style5"><strong>最 低 結 帳 金 額</strong></td>
          <td bgcolor="#FFFFFF">$
            <input name="lowAccount" size="9" value="${sessionScope.sells.lowAccount}" type="text">
              <span class="style5">元</span> <span class="style1">(不設定請輸入0)</span></td>
        </tr>
    <tr>
      <td bgcolor="#FFFFFF" align="center" colspan="2">
      <input type="submit" value="完成">
      <input name="submit" type="reset" value="重填"></td>
    </tr>
</table>
</form> 
<%@ include file="footer1.jsp"%>
</body>
</html>