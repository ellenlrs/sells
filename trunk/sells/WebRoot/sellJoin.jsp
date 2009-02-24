﻿﻿<%@ page contentType="text/html; charset=Utf-8"%>
<%@ include file="../taglibs.jsp"%>
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
  if ( formObj.loginId.value == '') {
     alert("請輸入帳號!");
	 formObj.loginId.focus();
	 return false ;
  }
  if ( formObj.passwd.value == '') {
     alert("請輸入密碼!");
	 formObj.passwd.focus();
	 return false ;
  }
  if ( formObj.passwd.value != formObj.rePasswd.value) {
     alert("確認密碼和密碼不相符!");
	 formObj.rePasswd.focus();
	 return false ;
  }
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
  if ( !(formObj.payType1.checked ||  formObj.payType2.checked || formObj.payType3.checked || formObj.payType4.checked )) {
     alert("請選擇一種付款方式!");
	 formObj.payType1.focus();
	 return false ;
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
<%@ include file="top.jsp"%><table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
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
        <td><a href="http://icarttw.blogspot.com/2007/03/icart.html" target="_blank"><img src="images/index-15.jpg" width="185" height="59" border="0"/></a></td>
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
<html:form action="/sellJoin.do" method="post" focus="loginId" onsubmit="return checkForm(this);" >
<span class="style1"><html:errors/></span>
  <table width="85%" border="0" align="center" cellpadding="5" cellspacing="0">
    <tr>
      <td bgcolor="#FFFFFF" align="center" colspan="2"><span class="style5"><b>購物車店家註冊</b></span><b><font color="#FFFFFF"><br>
        </font><font color="#FF0000" size="2">(違禁品、藥品、菸、酒、槍、砲、色情商品請勿申請)</font></b></td>
    </tr>
    <tr>
      <td width="106" align="center" bgcolor="#FFFFFF" class="style5"><b>*帳 號</b></td>        
      <td bgcolor="#FFFFFF" width="397"><html:text property="loginId"/></td>
    </tr>
    <tr>
      <td width="106" align="center" bgcolor="#FFFFFF" class="style5"><b>*密   
        碼</b></td>     
      <td bgcolor="#FFFFFF" width="397"><html:password property="passwd"/></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" class="style5"><strong>*確認密碼</strong></td>
      <td bgcolor="#FFFFFF"><html:password property="rePasswd"/></td>
    </tr>
    <tr>
      <td width="106" align="center" bgcolor="#FFFFFF" class="style5"><b>*姓   
        名</b></td>
      <td bgcolor="#FFFFFF" width="397"><html:text property="sellsNm"/></td>
    </tr>
    <tr>
      <td width="106" align="center" bgcolor="#FFFFFF" class="style5"><b>*E-mail</b></td>
      <td bgcolor="#FFFFFF" width="397"><html:text property="email"/></td>
    </tr>
    <tr class="style5">
      <td bgcolor="#FFFFFF" align="center" colspan="2"></td>
    </tr>

    <tr>
      <td width="106" align="center" bgcolor="#FFFFFF" class="style5"><b>*店&nbsp;           
        名</b></td> 
      <td bgcolor="#FFFFFF" width="397"><html:text property="storeNm"/>
      &nbsp;           
        <span class="style3">例如︰美體精品</span></td>
    </tr>
    <tr>
      <td width="106" align="center" bgcolor="#FFFFFF" class="style5"><b>*網 
        站 首 頁</b></td> 
      <td bgcolor="#FFFFFF" width="397"><html:text property="homepage"/>&nbsp;&nbsp;<font size="2"><br>

        </font><span class="style1">當客戶訂購完成或按繼續購物時所導向的網址</span></td>
    </tr>
    <tr>
      <td width="106" align="center" bgcolor="#FFFFFF" class="style5"><b>*接                   
        受 付 款 方 式</b></td>                
      <td bgcolor="#FFFFFF" width="397" valign="top"><table width="320" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="160" valign="top" ><html:checkbox property="payType1" value="1"/><span class="style5">ATM </span> </td>
            <td width="160" valign="top" ><html:checkbox property="payType2" value="1"/><span class="style5">銀行匯款</span></td>
          </tr>
          <tr>
            <td valign="top" ><html:checkbox property="payType3" value="1"/><span class="style5">郵局劃撥</span></td>
            <td valign="top" ><html:checkbox property="payType4" value="1"/><span class="style5">貨到付款</span>
            <html:hidden property="payType5" value="1"/></td>
          </tr>
        </table></td>
    </tr>
    <tr >
      <td class="style5" bgcolor="#FFFFFF" align="center" >購物車色系</td>
	  <td bgcolor="#FFFFFF" align="left" ><select name="color" >
  <option selected value="0" >請選色系</option>
  <option style="color:#006699; background-color: #99CCFF;" value="1,#99CCFF,#006699">預設色系</option>
  <option style="color:#f8adcd; background-color: #e96aa0;" value="2,#e96aa0,#f8adcd">粉紅色系</option>
  <option style="color:#e8f7ae; background-color: #a5c621;" value="3,#a5c621,#e8f7ae">哇沙米系列</option>
  <option style="color:#a76cc0; background-color: #e6bff6;" value="4,#e6bff6,#a76cc0">夢幻紫色</option>
</select></td>
    </tr>
    <tr>
      <td width="106" align="center" bgcolor="#FFFFFF" class="style5"><b>帳        
        戶 等 級</b></td>       
      <td bgcolor="#FFFFFF" width="397">
        <table border="0" width="100%">
          <tr>
            <td width="22%"><html:select property="sellsLv">
            <html:option value="T">試用會員</html:option></html:select></td>
            <td width="78%" class="style3"><strong class="style7">Free！</strong>（免費等級，可使用購物車功能30天）</td>                     
          </tr>
        </table></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" align="center" colspan="2">
        <input type="submit" value="完成">
        <input name="submit" type="reset" value="重填"></td>
    </tr>
</table>
</html:form> </td>
      </tr>
    </table></td>
  </tr>
</table>
<%@ include file="footer.jsp"%>
</body>
</html>