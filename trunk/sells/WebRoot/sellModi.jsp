<%@ page contentType="text/html; charset=Utf-8"%>
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
<script>
function chk_mail(mail){
  var vRegExp=new RegExp("^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.)+[a-z]{2,3}$","gi");
  var vValue=mail;
  if (!vRegExp.test(vValue)){
    return false;
  }else{
    return true;
  }
}
function fn_trim(str){
  var ltrim=0;
  var rtrim=str.length-1;
  while( str.charAt(ltrim)==" " ){ ltrim++; }
  while( str.charAt(rtrim)==" " ){ rtrim--; }
  if( ltrim==str.length&&rtrim==-1){
    str="";
  }else{
    str=str.substring(ltrim,rtrim+1);
  }
  return (str);
}
function checkForm(formObj){
  if ( formObj.sellsNm.value == '') {
     alert("請輸入姓名!");
	 formObj.sellsNm.focus();
	 return false ;
  }
  if ( formObj.email.value == '') {
     alert("請輸入Email!");
	 formObj.email.focus();
	 return false ;
  }
  if(formObj.email.value!=""){
    if(!chk_mail(fn_trim(formObj.email.value))){
      alert("請輸入正確的Email 位址!");
      formObj.email.focus();
	    return false;      
    }
  }
  if ( formObj.storeNm.value == '') {
     alert("請輸入店名!");
	 formObj.storeNm.focus();
	 return false ;
  }
  if ( formObj.homepage.value == '') {
     alert("請輸入店家首頁!");
	 formObj.homepage.focus();
	 return false ;
  }
  if ( !(formObj.payType5.checked || formObj.payType1.checked ||  formObj.payType2.checked || formObj.payType3.checked || formObj.payType4.checked )) {
    alert("請選擇一種付款方式!");
	  formObj.payType1.focus();
	  return false ;
  }
  if (formObj.payType5.checked) {
    if (formObj.storeId.value == '' ) {
      alert("您已勾選藍星線上付款，請輸入商城代碼!");
      formObj.storeId.focus();
      return false ;
    }
    if (formObj.sendCode.value == '' ) {
      alert("您已勾選藍星線上付款，請輸入r_Code!");
      formObj.sendCode.focus();
      return false ;
    }
    if (formObj.feedbackCode.value == '' ) {
      alert("您已勾選藍星線上付款，請輸入Code!");
      formObj.feedbackCode.focus();
      return false ;
    }
  }
  if ( formObj.color.selectedIndex == '0') {
     alert("請選擇購物車色系!");
	 formObj.color.focus();
	 return false ;
  }
}
</script>
</head>
<body topmargin="0">
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%>
<form name="form1" method="post" action="sellModi.do" onSubmit="return checkForm(this);">
  <table width="85%" border="0" align="center" cellpadding="5" cellspacing="0">
    <tr>
      <td bgcolor="#0066CC" align="center" colspan="2" width="590"><span class="style6"><b>購物車店家修改</b></span><b><br>
          <span class="style1">(違禁品、藥品、菸、酒、槍、砲、色情商品請勿申請)</span></b></td>
    </tr>
    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>帳 號</b></td>        
      <td width="435" bgcolor="#FFFFFF" class="style5">${sessionScope.loginvo.loginId}</td>
    </tr>
    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>姓   
        名</b></td>
      <td bgcolor="#FFFFFF" width="435"><input name=sellsNm type=text value="${sessionScope.sells.sellsNm}" maxlength="30"></td>
    </tr>
    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>E-mail</b></td>
      <td bgcolor="#FFFFFF" width="435"><input name=email type=text value="${sessionScope.sells.email}" maxlength="150"></td>
    </tr>
    <tr class="style5">
      <td bgcolor="#FFFFFF" align="center" colspan="2"></td>
    </tr>
    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>店&nbsp;           
        名</b></td> 
      <td bgcolor="#FFFFFF" width="435"><input name=storeNm type=text value="${sessionScope.sells.storeNm}" maxlength="100">
        &nbsp;           
        <span class="style5">例如︰客家小鋪</span></td>
    </tr>
    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>網 
        站 首 頁</b></td> 
      <td bgcolor="#FFFFFF" width="435"><input name=homepage type=text value="${sessionScope.sells.homepage}" maxlength="200">        &nbsp;&nbsp;<font size="2"><br>
      </font><span class="style1">當客戶訂購完成或按繼續購物時所導向的網址</span></td>
    </tr>
    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>接                   
        受 付 款 方 式</b>      </td>                
      <td bgcolor="#FFFFFF" width="435" valign="top"><table width="320" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="160" valign="middle" height="35" class="t1"><label><input name="payType1" type="checkbox"  ${sessionScope.sells.payType1 == '1' ?'checked' :''} value="1"> <span class="style5">ATM </span></label> </td>
          <td width="160" valign="middle" class="t1"><label><input name="payType2" type="checkbox"  ${sessionScope.sells.payType2 == '1' ?'checked' :''} value="1"><span class="style5">銀行匯款</span></label></td>
        </tr>
        <tr>
          <td valign="middle" height="35" class="t1"><label><input name="payType3" type="checkbox" ${sessionScope.sells.payType3 == '1' ?'checked' :''} value="1"> <span class="style5">郵局劃撥</span></label></td>
          <td valign="middle" class="t1"><label><input name="payType4" type="checkbox" ${sessionScope.sells.payType4 == '1' ?'checked' :''} value="1"> <span class="style5">貨到付款</span></label></td>
        </tr>
        <tr>
                  <td valign="top" class="t1"><input name="payTypeNobook" type="checkbox" ${sessionScope.sells.payTypeNobook == '1' ?'checked' :''} value="1">
                      <span class="style5">無摺存款</span></td>
                  <td valign="top" class="t1"><input name="payType711" type="checkbox" ${sessionScope.sells.payType711 == '1' ?'checked' :''} value="1">
                      <span class="style5">7-11繳費</span></td>
                </tr>
                <tr>
                  <td valign="top" class="t1"><input name="payTypeHilife" type="checkbox" ${sessionScope.sells.payTypeHilife == '1' ?'checked' :''} value="1">
                      <span class="style5">萊爾富繳費</span></td>
                  <td valign="top" class="t1"><input name="payTypeFamily" type="checkbox" ${sessionScope.sells.payTypeFamily == '1' ?'checked' :''} value="1">
                      <span class="style5">全家繳費</span></td>
        </tr>
        <tr>
          <td valign="middle" height="35" class="t1"><label><input name="payType5" type="checkbox" ${sessionScope.sells.payType5 == '1' ?'checked' :''} value="1"> <span class="style5">藍星上刷卡</span></label></td>
          <td valign="middle" class="t1"><span class="style1">商城編號</span><input name=storeId type=text value="${sessionScope.sells.storeId}" maxlength="10" size="10"></td>
        </tr>
        <tr>
          <td valign="middle" height="35" class="t1"><span class="style1">r_Code</span><input name=sendCode type=text value="${sessionScope.sells.sendCode}" maxlength="10" size="10"></td>

          <td valign="middle" class="t1"><span class="style1">Code</span><input name=feedbackCode type=text value="${sessionScope.sells.feedbackCode}" maxlength="10" size="10"></td>
        </tr>
      </table></td>
    </tr>
    <tr >
      <td class="style5" bgcolor="#FFFFFF" align="center" >購 物 車 色 系</td>
	  <td bgcolor="#FFFFFF" align="left" ><select name="color" >
  <option value="0" ${sessionScope.sells.colorTp == '0' ?'selected' :''} >請選色系</option>
  <option style="color:#006699; background-color: #99CCFF;" ${sessionScope.sells.colorTp == '1' ?'selected' :''} value="1,#006699,#99CCFF">預設色系</option>
  <option style="color:#f8adcd; background-color: #e96aa0;" ${sessionScope.sells.colorTp == '2' ?'selected' :''} value="2,#e96aa0,#f8adcd">粉紅色系</option>
  <option style="color:#e8f7ae; background-color: #a5c621;" ${sessionScope.sells.colorTp == '3' ?'selected' :''} value="3,#a5c621,#e8f7ae">哇沙米系列</option>
  <option style="color:#a76cc0; background-color: #e6bff6;" ${sessionScope.sells.colorTp == '4' ?'selected' :''} value="4,#e6bff6,#a76cc0">夢幻紫色</option>
</select></td>
    </tr>
    <tr >
      <td class="style5" bgcolor="#FFFFFF" align="center" >LOGO圖片路徑</td>
      <td bgcolor="#FFFFFF" align="left" >http://
      <input name="logo" type="text" value="${sessionScope.sells.logo}" size="50" maxlength="200" onChange="document.cart.img1.src = 'http://' + this.value ;" ><br>
<img src="http://${sessionScope.sells.logo}" onerror="this.src='images/cartu.gif'" border=0 name="img1" id="img1" align="absmiddle"></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" class="style5"><b>申 請 日 期</b></td>
      <td bgcolor="#FFFFFF" class="style5"> ${sessionScope.sells.joinDt}</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" class="style5"><b>到 期 日 期 </b></td>
      <td bgcolor="#FFFFFF" class="style1">${sessionScope.sells.expiredDt}</td>
    </tr>
    <tr>
      <td width="143" align="center" bgcolor="#FFFFFF" class="style5"><b>帳        
        戶 等 級</b></td>       
      <td bgcolor="#FFFFFF" width="435"><c:if test="${sessionScope.sells.sellsLv == 'T' }"><span class="style5">${sessionScope.sells.sellsLv}:</span> <span class="style7">Free!</span> <span class="style3">試用會員<Br>
	  （免費等級，可使用購物車功能30天）</span></c:if>
	  <c:if test="${sessionScope.sells.sellsLv == 'R' }"><span class="style5">${sessionScope.sells.sellsLv}:</span><span class="style7">正式會員</span></c:if>      </td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" align="center" colspan="2" width="590">
        <input type="submit" value="修改">
      <input name="submit" type="reset" value="重填"></td>
    </tr>
</table>
</form> 
<%@ include file="footer1.jsp"%>
</body>
</html>