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
</style></head>
<body><center><form name="member" action="saveMember.do" method="Post" onSubmit="return sendForm(this);">
<table width="670" border="0" align="center" cellspacing="1" class="tb1">
  <tr class="tb2">
    <td height="28" align=center bgcolor="#FFFFFF" ><a href="${requestScope.sells.homepage}" target="_top">
      <c:if test="${ ! empty requestScope.sells.logo}"><img src="${requestScope.sells.logo}" width="18" height="18" border="0"></c:if>
      ${requestScope.sells.storeNm}</a></td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#FFFFFF"><%@ include file="menuMember.jsp"%></td></tr></table><table width="670" border="0" align="center" cellspacing="1" class="tb1">
        <tr class="tb2">
          <td width=109 height="28" align="center" bgcolor="#FFFFFF">Email</td>
          <td width="284" align="left" bgcolor="#FFFFFF" class="style1">${member.email}</td>
          <td width=119 align="center" bgcolor="#FFFFFF" >訂閱電子報</td>
          <td width=263 align="left" bgcolor="#FFFFFF" ><input name="epYn" ${member.epYn == 'Y' ?'checked':''} type="radio" value="Y">
            是
              <input name="epYn" ${member.epYn == 'N' ?'checked':''} type="radio" value="N">
          否</td>
        </tr>
        <tr class="tb2">
          <td height="28" align="center" bgcolor="#FFFFFF" class="style12">* 姓名</td>
          <td align="left" bgcolor="#FFFFFF" ><input name="name" type="text" id="name" value="${member.name}" size="30" maxlength="50"></td>
          <td align="center" bgcolor="#FFFFFF" class="style12" >* 生日</td>
          <td align="left" bgcolor="#FFFFFF" ><input name="birY" type="text" value="${fn:substring(member.birthDt,0,4)}" size="5" maxlength="4">
            年  
              <select name="birM">
                <option ${fn:substring(member.birthDt,4,6) == '01' ?'selected':''} value="01">01</option>
                <option ${fn:substring(member.birthDt,4,6) == '02' ?'selected':''} value="02">02</option>
                <option ${fn:substring(member.birthDt,4,6) == '03' ?'selected':''} value="03">03</option>
                <option ${fn:substring(member.birthDt,4,6) == '04' ?'selected':''} value="04">04</option>
                <option ${fn:substring(member.birthDt,4,6) == '05' ?'selected':''} value="05">05</option>
                <option ${fn:substring(member.birthDt,4,6) == '06' ?'selected':''} value="06">06</option>
                <option ${fn:substring(member.birthDt,4,6) == '07' ?'selected':''} value="07">07</option>
                <option ${fn:substring(member.birthDt,4,6) == '08' ?'selected':''} value="08">08</option>
                <option ${fn:substring(member.birthDt,4,6) == '09' ?'selected':''} value="09">09</option>
                <option ${fn:substring(member.birthDt,4,6) == '10' ?'selected':''} value="10">10</option>
                <option ${fn:substring(member.birthDt,4,6) == '11' ?'selected':''} value="11">11</option>
                <option ${fn:substring(member.birthDt,4,6) == '12' ?'selected':''} value="12">12</option>
              </select>
            月
            <select name="birD">
              <option ${fn:substring(member.birthDt,6,8) == '01' ?'selected':''} value="01">01</option>
              <option ${fn:substring(member.birthDt,6,8) == '02' ?'selected':''} value="02">02</option>
              <option ${fn:substring(member.birthDt,6,8) == '03' ?'selected':''} value="03">03</option>
              <option ${fn:substring(member.birthDt,6,8) == '04' ?'selected':''} value="04">04</option>
              <option ${fn:substring(member.birthDt,6,8) == '05' ?'selected':''} value="05">05</option>
              <option ${fn:substring(member.birthDt,6,8) == '06' ?'selected':''} value="06">06</option>
              <option ${fn:substring(member.birthDt,6,8) == '07' ?'selected':''} value="07">07</option>
              <option ${fn:substring(member.birthDt,6,8) == '08' ?'selected':''} value="08">08</option>
              <option ${fn:substring(member.birthDt,6,8) == '09' ?'selected':''} value="09">09</option>
              <option ${fn:substring(member.birthDt,6,8) == '10' ?'selected':''} value="10">10</option>
              <option ${fn:substring(member.birthDt,6,8) == '11' ?'selected':''} value="11">11</option>
              <option ${fn:substring(member.birthDt,6,8) == '12' ?'selected':''} value="12">12</option>
              <option ${fn:substring(member.birthDt,6,8) == '13' ?'selected':''} value="13">13</option>
              <option ${fn:substring(member.birthDt,6,8) == '14' ?'selected':''} value="14">14</option>
              <option ${fn:substring(member.birthDt,6,8) == '15' ?'selected':''} value="15">15</option>
              <option ${fn:substring(member.birthDt,6,8) == '16' ?'selected':''} value="16">16</option>
              <option ${fn:substring(member.birthDt,6,8) == '17' ?'selected':''} value="17">17</option>
              <option ${fn:substring(member.birthDt,6,8) == '18' ?'selected':''} value="18">18</option>
              <option ${fn:substring(member.birthDt,6,8) == '19' ?'selected':''} value="19">19</option>
              <option ${fn:substring(member.birthDt,6,8) == '20' ?'selected':''} value="20">20</option>
              <option ${fn:substring(member.birthDt,6,8) == '21' ?'selected':''} value="21">21</option>
              <option ${fn:substring(member.birthDt,6,8) == '22' ?'selected':''} value="22">22</option>
              <option ${fn:substring(member.birthDt,6,8) == '23' ?'selected':''} value="23">23</option>
              <option ${fn:substring(member.birthDt,6,8) == '24' ?'selected':''} value="24">24</option>
              <option ${fn:substring(member.birthDt,6,8) == '25' ?'selected':''} value="25">25</option>
              <option ${fn:substring(member.birthDt,6,8) == '26' ?'selected':''} value="26">26</option>
              <option ${fn:substring(member.birthDt,6,8) == '27' ?'selected':''} value="27">27</option>
              <option ${fn:substring(member.birthDt,6,8) == '28' ?'selected':''} value="28">28</option>
              <option ${fn:substring(member.birthDt,6,8) == '29' ?'selected':''} value="29">29</option>
              <option ${fn:substring(member.birthDt,6,8) == '30' ?'selected':''} value="30">30</option>
              <option ${fn:substring(member.birthDt,6,8) == '31' ?'selected':''} value="31">31</option>
            </select>
            日
          <input type="hidden" name="birthDt" value="${member.birthDt}"></td>
        </tr>
        <tr class="tb2">
          <td height="28" align="center" bgcolor="#FFFFFF">聯絡電話</td>
          <td align="left" bgcolor="#FFFFFF" ><input name="tel" type="text" id="tel" value="${member.tel}" size="30" maxlength="30"></td>
          <td align="center" bgcolor="#FFFFFF" >行動電話</td>
          <td align="left" bgcolor="#FFFFFF" ><input name="mobile" type="text" id="mobile" value="${member.mobile}" maxlength="30"></td>
        </tr>
        <tr class="tb2">
          <td height="28" align="center" bgcolor="#FFFFFF">郵遞區號</td>
          <td colspan="3" align="left" bgcolor="#FFFFFF" ><input name="zip" type="text" id="zip" value="${member.zip}" size="5" maxlength="5"></td>
      </tr>
        <tr class="tb2">
          <td height="28" align="center" bgcolor="#FFFFFF">地址</td>
          <td colspan="3" align="left" bgcolor="#FFFFFF" ><input name="address" type="text" id="address" value="${member.address}" size="50" maxlength="100">
            <br>
          <span class="style3">若商家有提供試用商品寄送地址</span></td>
      </tr>
		<tr>
          <td height="28" colspan=6 align="center" bgcolor=#FFFFFF><span class="style1">*為必須輸入項目</span>
            <br>
            <input name="b122" value="確認送出" type="submit" class="button">
            <input name="b123" value="重填" type="reset" class="button">
<input name="b123" onClick="goHome();" value="返回賣場" type="button" class="button">
<input type="hidden" name="sells" value="${requestScope.sells.sellsNo}">
<input type="hidden" name="func" value="UPDATE"></td>
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