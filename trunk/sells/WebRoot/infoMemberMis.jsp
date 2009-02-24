<%@ page contentType="text/html; charset=Utf-8"%>
<jsp:directive.page import="com.sells.dao.Sells"/>
<jsp:directive.page import="com.sells.dao.LoginData"/>
<jsp:directive.page import="org.apache.commons.lang.StringUtils"/>
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
<title><bean:message key="app.title"/></title>
<link href="car.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0">
<%@ include file="chkSession.jsp"%><br>
<script type="text/javascript"><!--
google_ad_client = "pub-2224288299509306";
google_ad_width = 728;
google_ad_height = 15;
google_ad_format = "728x15_0ads_al_s";
//2007-09-10: iCart_blogger_center_txt
google_ad_channel = "4333174357";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "0066CC";
google_color_text = "000000";
google_color_url = "008000";
//-->
</script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script><br>
<form name="member" action="memberUpdateMis.do" method="Post" onSubmit="return sendForm(this);">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" bgcolor="#FFFFFF">
	<table border=0 width=100% cellspacing="1" cellpadding="2">
        <tr >
          <td height="28" align="center" class="style3">Email</td>
          <td align="left" class="style3" >${member.email}</td>
          <td align="center" class="style5" >訂閱電子報</td>
          <td align="left" class="style5" ><input name="epYn" ${member.epYn == 'Y' ?'checked':''} type="radio" value="Y">
            是
              <input name="epYn" ${member.epYn == 'N' ?'checked':''} type="radio" value="N">
            否</td>
        </tr>
        <tr >
          <td height="28" align="center" class="style1">姓名</td>
          <td align="left" ><input name="name" type="text" id="name" value="${member.name}" size="30" maxlength="50"></td>
          <td align="center" class="style1" >生日</td>
          <td align="left" ><input name="birY" type="text" value="${fn:substring(member.birthDt,0,4)}" size="5" maxlength="4">
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
        <tr >
          <td height="28" align="center" class="style5">聯絡電話</td>
          <td align="left" ><input name="tel" type="text" id="tel" value="${member.tel}" size="30" maxlength="30"></td>
          <td align="center" class="style5" >行動電話</td>
          <td align="left" ><input name="mobile" type="text" id="mobile" value="${member.mobile}" maxlength="30"></td>
        </tr>
        <tr >
          <td height="28" align="center" class="style5">郵遞區號</td>
          <td align="left" ><input name="zip" type="text" id="zip" value="${member.zip}" size="5" maxlength="5"></td>
          <td align="center" class="style5" >狀態</td>
          <td align="left" ><select name="status">
            <option ${member.status == 'Y' ?'selected':''} value="Y">正常</option>
            <option ${member.status == 'N' ?'selected':''} value="N">停用</option>
          </select></td>
        </tr>
        <tr >
          <td height="28" align="center" class="style5">地址</td>
          <td colspan="3" align="left" ><input name="address" type="text" id="address" value="${member.address}" size="50" maxlength="100"></td>
          </tr>
		<tr>
          <td height="28" colspan=6 align="center" bgcolor=#ffffff><span class="style1">紅字為必須輸入項目</span>
            <br>
            <input name="b122" value="確認送出" type="submit" class="button">
            <input name="b123" value="重填" type="reset" class="button">
            <input name="b1232" value="放棄" type="button" class="button" onClick="window.close();">
            <input type="hidden" name="func" value="UPDATE">
            <input name="memberNo" type="hidden" id="memberNo" value="${member.memberNo}"><br>
<br>
<script type="text/javascript"><!--
google_ad_client = "pub-2224288299509306";
google_ad_width = 728;
google_ad_height = 90;
google_ad_format = "728x90_as";
google_ad_type = "image";
//2007-09-10: iCart
google_ad_channel = "1272982672";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "0066CC";
google_color_text = "000000";
google_color_url = "008000";
google_ui_features = "rc:6";
//-->
</script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></td>
        </tr>
      </table>
</td>
  </tr>
</table>
</form>
</body>
</html>
<script src="./global/global.js" type="text/javascript"></script>
<script>
<!--
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