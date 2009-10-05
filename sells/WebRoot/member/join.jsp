<%@ page contentType="text/html; charset=Utf-8"%>
<%@ include file="../taglibs.jsp"%>
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
    <td height="28" align=center bgcolor="#FFFFFF" ><a href="${requestScope.sells.homepage}" target="_top">
      <c:if test="${ ! empty requestScope.sells.logo}"><img src="${requestScope.sells.logo}" width="18" height="18" border="0"></c:if>
      ${requestScope.sells.storeNm}</a></td>
  </tr>
</table>
<table width="670" border="0" align="center" cellspacing="1" class="tb1">
        <tr class="tb2">
          <td width=109 height="28" align="center" bgcolor="#FFFFFF" class="style12">* 帳號(Email)</td>
          <td width="284" align="left" bgcolor="#FFFFFF" ><input name="email" type="text" id="email" size="30" maxlength="150">
          <BR>
      <span class="style1">為避免收信阻擋，建議不要使用免費信箱，例如：Yahoo／Hotmail信箱</span></td>
          <td width=119 align="center" bgcolor="#FFFFFF" class="style55">訂閱電子報</td>
          <td width=263 align="left" bgcolor="#FFFFFF" class="style55"><input name="epYn" type="radio" value="Y" checked>
            是
              <input name="epYn" type="radio" value="N">
              否 
              若未選擇將自動勾選為是 </td>
        </tr>
        <tr class="tb2">
          <td height="28" align="center" bgcolor="#FFFFFF" class="style12">* 姓名</td>
          <td align="left" bgcolor="#FFFFFF" ><input name="name" type="text" id="name" size="30" maxlength="50"></td>
          <td align="center" bgcolor="#FFFFFF" class="style12" >* 生日</td>
          <td align="left" bgcolor="#FFFFFF" ><input name="birY" type="text" size="5" maxlength="4">
            年  <select name="birM">
			  <option value="">月</option>
              <option value="01">01</option>
			  <option value="02">02</option>
			  <option value="03">03</option>
			  <option value="04">04</option>
			  <option value="05">05</option>
			  <option value="06">06</option>
			  <option value="07">07</option>
			  <option value="08">08</option>
			  <option value="09">09</option>
			  <option value="10">10</option>
			  <option value="11">11</option>
			  <option value="12">12</option>
            </select>
            月
            <select name="birD">
<option value="">日</option>
              <option value="01">01</option>
			  <option value="02">02</option>
			  <option value="03">03</option>
			  <option value="04">04</option>
			  <option value="05">05</option>
			  <option value="06">06</option>
			  <option value="07">07</option>
			  <option value="08">08</option>
			  <option value="09">09</option>
			  <option value="10">10</option>
<option value="11">11</option>
			  <option value="12">12</option>
			  <option value="13">13</option>
			  <option value="14">14</option>
			  <option value="15">15</option>
			  <option value="16">16</option>
			  <option value="17">17</option>
			  <option value="18">18</option>
			  <option value="19">19</option>
			  <option value="20">20</option>
<option value="21">21</option>
			  <option value="22">22</option>
			  <option value="23">23</option>
			  <option value="24">24</option>
			  <option value="25">25</option>
			  <option value="26">26</option>
			  <option value="27">27</option>
			  <option value="28">28</option>
			  <option value="29">29</option>
			  <option value="30">30</option>
			  <option value="31">31</option>
            </select>
            日
            <input type="hidden" name="birthDt" value=""></td>
        </tr>
        <tr class="tb2">
          <td height="28" align="center" bgcolor="#FFFFFF" class="style12">* 密碼</td>
          <td align="left" bgcolor="#FFFFFF" ><input name="password" type="password" id="password" size="30" maxlength="10"></td>
          <td align="center" bgcolor="#FFFFFF" class="style12" >* 確認密碼</td>
          <td align="left" bgcolor="#FFFFFF" ><input name="cfPassword" type="password" id="cfPassword" maxlength="10"></td>
        </tr>
        <tr class="tb2">
          <td height="28" align="center" bgcolor="#FFFFFF" class="style55">聯絡電話</td>
          <td align="left" bgcolor="#FFFFFF" ><input name="tel" type="text" id="tel" size="30" maxlength="30"></td>
          <td align="center" bgcolor="#FFFFFF" class="style55">行動電話</td>
          <td align="left" bgcolor="#FFFFFF" ><input name="mobile" type="text" id="mobile" maxlength="30"></td>
        </tr>
        <tr class="tb2">
          <td height="28" align="center" bgcolor="#FFFFFF" class="style55">郵遞區號</td>
          <td colspan="3" align="left" bgcolor="#FFFFFF" class="style55"><input name="zip" type="text" id="zip" size="5" maxlength="5"></td>
          </tr>
        <tr class="tb2">
          <td height="28" align="center" bgcolor="#FFFFFF" class="style55">地址</td>
          <td colspan="3" align="left" bgcolor="#FFFFFF" ><input name="address" type="text" id="address" size="50" maxlength="100">
            <br>
            <span class="style3">若商家有提供試用商品寄送地址</span></td>
          </tr>
		<tr>
          <td height="28" colspan=6 align="center" bgcolor=#ffffff><span class="style1">* 為必須輸入項目</span><br>
            <input name="b122" value="確認送出" type="submit" class="button">
            <input name="b123" value="重填" type="reset" class="button">
  <input name="b123" onClick="goHome();" value="返回賣場" type="button" class="button">
  <input type="hidden" name="sells" value="${requestScope.sells.sellsNo}">
  <input type="hidden" name="func" value="JOIN"><br>
<%@ include file="ads_img.jsp"%></td>
		</tr>
      </table>
</form><%@ include file="footer.jsp"%>
</center>
</body>
</html>
<script src="./global/global.js" type="text/javascript"></script>
<script>
<!--
function goHome(){
  var winName = "_top" ;
  var features = "";
  var theURL = "${requestScope.sells.homepage}";
  window.open(theURL,winName,features);
}
function sendForm(formObj){
  if ( checkObj(formObj.email,"Email") ){
    return false ;
  }
  if(!chk_mail(formObj.email.value)){
    alert("Email 格式不正確");
    formObj.email.focus();
	return false;      
  }
  if ( checkObj(formObj.name,"姓名") ){
    return false ;
  }
  if ( checkObj(formObj.birY,"出生年") ){
    return false ;
  }
  if (parseInt(formObj.birY.value,10) < 1891  || parseInt(formObj.birY.value,10) > 2200 ) {
      alert("出生年請輸入下列範圍 : 1890 ~ this year");
      formObj.birY.focus();
	  return false;    
  }
  if ( formObj.birM.selectedIndex == 0 ) {
    alert("請選擇出生月");
    formObj.birM.focus();
    return false ;
  }
  if ( formObj.birD.selectedIndex == 0 ) {
    alert("請選擇出生日");
    formObj.birD.focus();
    return false ;
  }
  if ( checkObj(formObj.password,"密碼") ){
    return false ;
  }
  if ( formObj.password.value != formObj.cfPassword.value ) {
    alert("密碼檢核不正確");
    return false ;
  }
  if ( formObj.zip.value != "" ) {
    if ( checkNum(formObj.zip,"郵遞區號") ){
        return false ;
    } 
  }
  var birDt= formObj.birY.value +"" + 
   formObj.birM.options[formObj.birM.selectedIndex].value + "" +
   formObj.birD.options[formObj.birD.selectedIndex].value ;
  formObj.birthDt.value = birDt ;
}
-->
</script>