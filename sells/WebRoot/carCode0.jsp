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
<%
if (StringUtils.isBlank(request.getParameter("carImg"))){
  request.setAttribute("carImg","text");
}
if (StringUtils.isBlank(request.getParameter("target"))){
  request.setAttribute("target","_same");
}
if (StringUtils.isBlank(request.getParameter("carText"))){
  request.setAttribute("carText","加入購物車");
}
if (StringUtils.isBlank(request.getParameter("userImg"))){
  request.setAttribute("userImg","http://www.icart.tw/Sells/images/cartu.gif");
}
%>
<script>
function check(formObj){
  if (formObj.itemNo.value == '' ){
    alert('請輸入商品編號');
    formObj.itemNo.focus();
    return false ;
  }
  if (formObj.itemNm.value == '' ){
    alert('請輸入商品名稱');
    formObj.itemNm.focus();
    return false ;
  }
  if (formObj.price.value == '' ){
    alert('請輸入商品售價');
    formObj.price.focus();
    return false ;
  }
  var number = parseInt(formObj.price.value,10) ;
  if (isNaN(number)) {
    alert('金額僅可輸入數字');
    formObj.price.select();
    formObj.price.focus();
    return false;
  }
  if (number != formObj.price.value){
    alert('金額僅可輸入數字，不可包含任何標點符號');
    formObj.price.select();
    formObj.price.focus();
    return false ;
  }
  if (number == 0 ) {
    return confirm ("你的確定金額是0元 ? ") ;
  }
}
</script>
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%>
<table width="615" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td ><table width="600" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF">
          <tbody>
            <tr>
              <td width="100%" align="left" class="style3"><BR>
              快速置建購物車的方式：</td>
            </tr>
    				<tr>
      				<td width="100%" align="left" class="style5">
<span class="style1"> 若你的網站是自行設計及開發時可以使用下述方式開快建置<br>
將下列語法複製後，貼在您要放購物車的連結上。</span><br>      				  
      				  &lt;script src='<a href="http://www.icart.tw/Sells/cart.js%27" target="_blank" onClick="return top.js.OpenExtLink(window,event,this)">http://www.icart.tw/Sells/cart.js'</a>&gt;&lt;/script&gt;<br>
      				  &lt;a href="javascript:addCart('商品編號','商品名稱','規格1','規格2','售價','店家編號','目標視窗')"&gt;我要訂購&lt;/a&gt;<br>
      				  <br>
      				  1：&lt;a href="javascript:addCart('商品編號','商品名稱','規格1','規格2','售價','店家編號','目標視窗')"&gt;<br>
      				  ＊內容說明<br>
      				  商品編號：<span class="style1">必填</span><br>
      				  商品名稱：<span class="style1">必填</span><br>
      				  規格1：自由輸入<br>
      				  規格2：自由輸入<br>
      				  售價：<span class="style1">需是數字</span><br>
      				  店家編號：<span class="style1">必填</span><br>
      				  目標視窗：若是要開啟在新視窗請填入：<span class="style1">_blank</span><br>
      				  <br>
     				  2：<span class="style1">我要訂購</span>也可以自行換成圖片或任何文字，<br>
     				  購物車圖示範例：&lt;img src=&quot;<a href="http://www.icart.tw/Sells/images/cart10.jpg" target="_blank" onClick="return top.js.OpenExtLink(window,event,this)">http://www.icart.tw/Sells/images/cart10.jpg</a>&quot; border=&quot;0&quot;&gt;<br>
     				  <span class="style1">你可以將src的路徑指到你自己做好的購物車圖片圖</span></td>
    				</tr>
          </tbody>
        </table>
              <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img src="images/0.gif" width="1" height="4" /></td>
                </tr>
              </table>
          </td>
      </tr>
    </table>
<%@ include file="footer1.jsp"%>
</body>
</html>