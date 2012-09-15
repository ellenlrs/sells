<%@ page contentType="text/html; charset=Utf-8"%><script src="urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-2147605-1";
urchinTracker();
</script>
<script>
function show(obj){
  document.getElementById("me1").style.visibility="hidden";
  document.getElementById("me2").style.visibility="hidden";
  document.getElementById("me3").style.visibility="hidden";
  document.getElementById(obj).style.visibility="visible";
}
</script><table width="819" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="333" height="87" rowspan="2"><a href="index.jsp"><img src="images/index-1.jpg" width="333" height="87" border="0" /></a></td>
    <td height="46" colspan="4">&nbsp;</td>
  </tr>
  <tr>
	<td height="41" background="images/index_menu_bg.jpg"><a href="free30.html"></a><a href="mamber.html"></a><a href="about_price.html"></a><a href="note.html"></a>
      <table width="460" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
          <td class="m1">&nbsp;</td>
        </tr>
        <tr>
          <td width="15">&nbsp;</td>
          <td class="m1"><a href="#" onMouseOver="show('me1');" class="m1">管理介面</a> │ <a href="#" onMouseOver="show('me2');" class="m1">會員管理</a> │ <a href="#" onMouseOver="show('me3');" class="m1">訂單管理</a> │ <a href="index.jsp" class="m1">收費說明</a> │ <a href="readme1.jsp" class="m1">使用說明</a></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="819" height="43" border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
		<td height="38" colspan="2" background="images/index-6_00.jpg"><table width="600" border="0" align="right" cellpadding="2">
	  <tr>
        <td><div id="menu" style="WIDTH: 580px; HEIGHT: 27px; visibility:visible; margin: 0px 0 0 0;">
		<div id="me1" class="m2"  style="position:absolute;float:left;WIDTH: 580px; HEIGHT: 20px; visibility:visible; margin: 5px 0 0 0;"><a href="carCode1.jsp" class="m2" >購物車代碼產生器</a> | <a href="sellModi.jsp" class="m2" >帳號管理</a> | <a href="sellPasswd.jsp" class="m2" >修改密碼</a> | <a href="sellPayDesc.jsp" class="m2" >更新付款說明</a> | <a href="sellFare.jsp" class="m2" >修改運費設定</a> | <a href="orderCar.jsp" class="m2" >購買延長</a> | <a href="help1.jsp" class="m2" >問題反應</a></div>
        <div id="me2" class="m2"  style="position:absolute;float:left; WIDTH: 580px; HEIGHT: 20px; visibility:hidden; margin: 5px 0 0 0;"><a href='linkGene.jsp' class="m2">會員服務連結產生器</a> | <a href="memberQuery.do" class="m2" >會員管理</a> | <a href="memberQuery2.do" class="m2" >電子報匯出</a> | <a href="memberQuery3.do" class="m2" >生日名單</a></div>
		<div id="me3" class="m2" style="position:absolute;float:left;WIDTH: 580px; HEIGHT: 20px; visibility:hidden; margin: 5px 0 0 0;"><a href='linkGene.jsp' class="m2">訂單查詢連結產生器</a> | <a href="sellOrderQuery.do" class="m2" >訂單查詢</a>| <a href="sellReportQuery.do" class="m2" >訂單報表查詢</a></div></div></td>
      </tr>
    </table></td>
  </tr>
	<tr>
		<td height="43" background="images/index6-3.jpg" colspan="9" align="right">
<script type="text/javascript"><!--
google_ad_client = "pub-2224288299509306";
google_ad_width = 468;
google_ad_height = 15;
google_ad_format = "468x15_0ads_al_s";
//2007-05-17: icart_index_center_txt
google_ad_channel = "0321530585";
google_color_border = "59C6FF";
google_color_bg = "59C6FF";
google_color_link = "FFFFFF";
google_color_text = "59C6FF";
google_color_url = "59C6FF";
//-->
</script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
	    </td>
	</tr>
</table>
<table width="819" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/0.gif" width="1" height="8" /></td>
  </tr>
</table>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="185" valign="top"><table width="185" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="185"  colspan="2" height="133" valign="top" align="center">
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="images/login_bg1.gif"></td>
	</tr>
	<tr>
		<td background="images/login_bg2.gif">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr class="t1" >
    <td height="30" align="center" valign="middle"> 編 號：</td>
    <td align="left" valign="middle">${sessionScope.sells.sellsNo}</td>
  </tr>
  <tr class="t1" >
    <td height="30" align="center" valign="middle"> 店 名：</td>
    <td align="left" valign="middle">${sessionScope.sells.storeNm}</td>
  </tr>
  <tr class="t1">
    <td height="30" align="center" valign="middle"> 姓 名：</td>
    <td align="left" valign="middle">${sessionScope.sells.sellsNm}</td>
  </tr>
  <tr class="t1">
    <td colspan="2" height="30" align="center" valign="middle"><a href="carCode0.jsp" class="style1">快速置作購物車</a>　<a href="logout.do"><img src="images/logout.gif" align="absmiddle" width="46" border=0 height="18" /></a></td>
  </tr>
</table>
		</td>
	</tr>
	<tr>
		<td>
			<img src="images/login_bg3.gif"></td>
	</tr>
</table>
        </td>
      </tr>
			 <tr>
        <td>
				<%@ include file="ads_search.jsp"%>
			   </td>
      </tr>
      <tr>
        <td>
        <%@ include file="ads_firefox.jsp"%>
		</td>
      </tr>
      <tr>
        <td><a href="http://icarttw.blogspot.com/2007/03/icart.html"  target="_blank"><img src="images/index-15.jpg" width="185" height="59" border="0"/></a></td>
      </tr>
      <tr>
        <td><%@ include file="ads_img.jsp"%>
        </td>
      </tr>
    </table></td>
    <td width="615" valign="top" align="center">
    <%@ include file="ads_txt_inside.jsp"%>