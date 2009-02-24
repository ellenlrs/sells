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
<title><bean:message key="app.title"/></title>
<link href="car.css" rel="stylesheet" type="text/css">
</head>
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
function checkForm(formObj) {
  if (formObj.name.value == "" ){
     alert("請輸入您的姓名!");
	 formObj.name.focus();
    return false ;
  }
  if (formObj.email.value == "" ){
     alert("請輸入您的Email!");
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
  if (formObj.mailBody.value == "" ){
     alert("請填寫信件內容!");
	 formObj.mailBody.focus();
    return false ;
  }
}
</script>
<body topmargin="0">
<%@ include file="top.jsp"%>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="185" valign="top"><table width="185" border="0" cellspacing="0" cellpadding="0">
<tr>
            <td><img src="images/login-1.jpg" width="185" height="14" /></td>
          </tr><tr>
        <form name="form1" method="post" action="login.do" onSubmit="return checkForm(this);"><td valign="top" background="images/login-bg.jpg">
				<table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td  colspan="2"><img src="images/login-3.jpg" width="160" height="22" /></td>
          </tr>
          <tr>
            <td width="51" height="30" align="center" valign="middle"><span class="t1">
              帳號：</span> </td>
            <td width="109" align="left" valign="middle"><input name="loginId" type="text" class="login-box" size="10" ></td>
          </tr>
          <tr>
            <td height="30" align="center" valign="middle"><span class="t1">密碼：</span> </td>
            <td align="left" valign="middle"><input name="passwd" type="password" class="login-box" size="10"></td>
          </tr>
          <tr>
            <td height="30" align="center" colspan="2"><input type="image" src="images/login.gif" name="image" width="46" height="18" >
              　 
              <a href="javascript:document.form1.reset()"><img src="images/clear.gif" width="46" border=0 height="18" /></a></td>
          </tr></table>
				</td></form>
      </tr><tr>
            <td><img src="images/login-2.jpg" width="185" height="11" /></td>
          </tr>
           <tr>
        <td><%@ include file="ads_search.jsp"%></td>
      </tr>
      <tr>
        <td><%@ include file="ads_firefox.jsp"%></td>
      </tr>
      <tr>
        <td><%@ include file="ads_left_txt.jsp"%></td>
      </tr>
      <tr>
        <td><a href="http://icarttw.blogspot.com/2007/03/icart.html"  target="_blank"><img src="images/index-15.jpg" width="185" height="59" border="0"/></a></td>
      </tr>
      <!--<tr>
        <td><img src="images/index-16.jpg" width="185" height="55" /></td>
      </tr>-->
      <tr>
        <td><a href="sellJoin.jsp"><img src="images/index-17.jpg" width="185" height="71" border="0" /></a></td>
      </tr>
    </table></td>
    <td width="615" valign="top"><table width="615" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><%@ include file="ads_txt.jsp"%><br><br>
<form action=help.do method=post name=form1 onSubmit="return checkForm(this);">
  <table width="550" border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="#CCCCCC">
    <tr>
      <td width="526" colspan="2" align="center" bgcolor="#0066CC"><b class="style6">聯　絡　我　們</b></td>
    </tr>
    <tr>
      <td width="99" align="right" valign="top" bgcolor="#FFFFFF"><b class="style5">您的姓名</b></td>
      <td width="409" bgcolor="#FFFFFF"><input type="text" name="name" size="20"></td>
    </tr>
    <tr>
      <td width="99" align="right" valign="top" bgcolor="#FFFFFF" class="style5"><b>您的E-mail</b></td>
      <td width="409" bgcolor="#FFFFFF"><input type="text" name="email" size="28"></td>
    </tr>
    <tr>
      <td width="99" align="right" valign="top" bgcolor="#FFFFFF" class="style5"><b>信件主題</b></td>
      <td width="409" bgcolor="#FFFFFF"><select name="subject">
          <option value="匯款通知" selected>匯款通知</option>
          <option value="購物車使用問題">購物車使用問題</option>
          <option value="賣家管理問題">賣家管理問題</option>
          <option value="合作提案">合作提案</option>
          <option value="其他">其他</option>
      </select></td>
    </tr>
    <tr>
      <td width="99" align="right" valign="top" bgcolor="#FFFFFF" class="style5"><b>信件內容</b></td>
      <td width="409" bgcolor="#FFFFFF"><textarea rows="8" name="mailBody" cols="45"></textarea></td>
    </tr>
    <tr>
      <td width="99" align="right" valign="top" bgcolor="#FFFFFF">&nbsp;</td>
      <td width="409" align="center" bgcolor="#FFFFFF"><input type="submit" value="送出信件" name="B1">
          <input type="reset" value="重設" name="B12">
          <br>
          <span align="left" class="style3"><strong>若您於1個工作天都沒有收到問題回覆，請再次來信，感謝喔!</strong></span></td>
    </tr>
  </table>
</form></td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="footer.jsp"%>
</body>
</html>
