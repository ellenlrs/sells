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
<body topmargin="0"><script src="urchin.js" type="text/javascript">
</script>
<%@ include file="chkSession.jsp"%>
<form action='orderStUpdate.do' name=order method="post">
<center>
<table width="100%" border="0" align="center" cellspacing="1" class="t1" >
    <tr>
      <td bgcolor="#FFFFFF" ><table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#0066FF">
        <tr>
          <td width="24%" valign="middle" bgcolor="#FFFFFF"><span class="style3">訂單編號︰${orders.orderNo}</span></td>
          <td width="25%" valign="middle" bgcolor="#FFFFFF" class="style1">目前訂購狀態：<img src="images/st${orders.orderSt}.gif" border="0" align="absmiddle"></td>
          <td width="51%" valign="middle" bgcolor="#FFFFFF" class="style1">新訂單狀態：<span class="style5">
          <select name="orderSt">
            <option ${orders.orderSt == '00'?'selected':'' } value="00" >處理中</option>
            <option ${orders.orderSt == '10'?'selected':'' } value="10">出貨</option>
            <option ${orders.orderSt == '20'?'selected':'' } value="20">匯款已收到</option>
            <option ${orders.orderSt == '30'?'selected':'' } value="30">備貨中</option>
            <option ${orders.orderSt == '99'?'selected':'' } value="99">取消</option>
            <option ${orders.orderSt == '80'?'selected':'' } value="80">線上付款未完成</option>
            <option ${orders.orderSt == '85'?'selected':'' } value="85">線上付款成功</option>
            <option ${orders.orderSt == '88'?'selected':'' } value="88">線上付款失敗</option>
          </select >
          <br>
          （當訂單狀態更改成出貨時，將會自動發送出貨通知）
          </span></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF" class="style9">訂購日期：<br>
            ${orders.orderDt}</td>
          <td width="25%" bgcolor="#FFFFFF"><span class="style3">
            物流說明：</span></td>
          <td width="51%" bgcolor="#FFFFFF" ><span class="style11">
            <textarea name="logisticDesc" cols="30" rows="4">${orders.logisticDesc}</textarea>
            <input name="orderNo" type="hidden" value="${orders.orderNo}">
            <input type="submit" name="Submit222" value="存檔">
          </span></td>
        </tr>
      </table>
	  <br><br>
<%@ include file="./member/ads_txt.jsp"%>
<c:if test="${orders.payTp == '線上刷卡'}">
<span class="style1">刷卡資料</span>
    <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#0066FF">
        <tr>
          <td bgcolor="#FFFFFF" width="100" height="25" ><span class="style55">授權碼</span></td>
          <td colspan="" bgcolor="#FFFFFF" class="style1"><span class="style55">${orders.approveCode} </span></td>
          <td bgcolor="#FFFFFF" width="140" height="25" ><span class="style55">批次號碼(BatchNumber)︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.batchNumber} </span></td>
          <td bgcolor="#FFFFFF" width="120"><span class="style1">交易完成時間︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style1">${orders.modiDt} </span></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF" height="25" ><span class="style55">主回覆碼(PRC)︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.prc} </span></td>
          <td bgcolor="#FFFFFF"><span class="style55">輔助回覆碼(SRC)︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.src} </span></td>
          <td bgcolor="#FFFFFF" class="style9"><span class="style55">銀行回覆碼(BankRC):</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.bankRc}</span></td>
        </tr>
      </table>
          <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#0066FF">
        <tr>
          <td bgcolor="#FFFFFF" height="25" ><span class="style55">交易說明</span></td>
         </tr><tr>
          <td colspan="" bgcolor="#FFFFFF" class="style1"><span class="style55">
          I. PRC=34,SRC=171,BankResponseCode=xx 至銀行端交易失敗，通常為信用卡的問題，可用BankResponseCode 對應相關問題。
          </span>
          </td>
        </tr>
        <tr>
          <td colspan="" bgcolor="#FFFFFF" class="style1"><span class="style55">
II. PRC=15,SRC=1018 此交易未至銀行端即已失敗，可能原因為銀行主機忙碌、至銀行端網路瞬斷。
          </span>
          </td>
        </tr>
        <tr>
          <td colspan="" bgcolor="#FFFFFF" class="style1"><span class="style55"> 
III. PRC=52,SRC=554 此交易至藍新即已失敗，原因為帳號密碼錯誤。
          </span>
          </td>
        </tr>
        <tr>
          <td colspan="" bgcolor="#FFFFFF" class="style1"><span class="style55">
IV. PRC=8,SRC=204 此交易至藍新即已失敗，原因為訂單編號重複。
          </span>
          </td>
        </tr>
        <tr>
          <td colspan="" bgcolor="#FFFFFF" class="style1"><span class="style55">
V. 其他回應可能為所帶參數不正確，請查照交易狀態回覆碼處理或與藍新聯絡。
          </span>
          </td>
        </tr>
      </table>
</c:if>
        <span class="style3"><br>
        商品清單如下：</span><br>
	  <table width=100% border=0 cellpadding="2" cellspacing="1" bgcolor="#0066FF">
        <tr>
          <td width=62 height="28" align="center" bgcolor="#0066FF" class="style4" >編號</td>
          <td width="415" align="center" bgcolor="#0066FF" class="style4" >品名(規格)</td>
          <td width=122 align="center" bgcolor="#0066FF" class="style4" >數量</td>
          <td width=55 align="center" bgcolor="#0066FF" class="style4" >單價</td>
          <td width=55 align="center" bgcolor="#0066FF" class="style4" >小計</td>
        </tr>
		 <c:set var="total" scope="request" value="${0}"/>
		 <c:set var="totQty" scope="request" value="${0}"/>
		 <c:forEach items="${items}" var="item" varStatus="s">
        <tr>
          <td width=62 height="28" align="center" bgcolor="#FFFFFF" class="style55">${item.itemNo}</td>
          <td width="415" align="left" bgcolor="#FFFFFF" class="style55">${item.itemNm} ( ${item.itemSpec1} ${item.itemSpec2})</td>
          <td align="center" width=122 bgcolor="#FFFFFF">
		   <span class="style9">${item.qty}</span>
		   <c:set var="total" scope="request" value="${total + item.qty * item.price}"/>
		   <c:set var="totQty" scope="request" value="${totQty + item.qty}"/>		  </td>
          <td width=55 align="center" bgcolor="#FFFFFF" class="style9">${item.price}</td>
          <td width=55 align="center" bgcolor="#FFFFFF" class="style1">${item.qty * item.price}</td>
        </tr>
		</c:forEach>
        <tr>
          <td height="28" colspan=6 bgcolor="#FFFFFF" class="style3" >共買了 ${totQty} 個商品 </td>
        </tr>
        <tr>
          <td height="28" colspan=6 bgcolor=#FFFFFF class="style3">商品金額︰${total}元</td>
        </tr>
	      <tr>
          <td height="28" colspan=6 bgcolor="#FFFFFF" class="style3" >運費：${orders.freightfar} </td>
          <c:set var="total" scope="request" value="${total + orders.freightfar}"/>
          <c:set var="total" scope="request" value="${total + orders.process}"/>
        </tr>
	      <tr>
          <td height="28" colspan=6 bgcolor="#FFFFFF" class="style3" >處理費：${orders.process} </td>
        </tr>
        <tr>
          <td height="28" colspan=6 bgcolor="#FFFFFF" class="style3" >購物總金額：${total} </td>
        </tr>
		</table>
	  <span class="style5"><br>
	  訂購人資料</span>
	  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#0066FF">
        <tr>
          <td width="15%" height="25" bgcolor="#FFFFFF"><span class="style55">姓名︰</span></td>
          <td width="85%" bgcolor="#FFFFFF" class="style1"><span class="style55">${orders.name} </span></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF" height="25" class="style9"><span class="style55">地址︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.zip}<br>
            ${orders.address}
	  </span></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style55">E-mail︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.email} </span></td>
        </tr>
		        <tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style55">電話︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.tel} </span></td>
        </tr>
		        <tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style55">手機︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style55">${orders.mobile} </span></td>
        </tr>
		<tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style1">付款方式︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style1">${orders.payTp} </span></td>
        </tr>
        <c:if test="${orders.payTp == 'ibon代碼繳款' || orders.payTp == '全家.萊爾富.OK.代碼繳款'}">
		<tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style1">繳費超商</span></td>
          <td bgcolor="#FFFFFF"><span class="style1">${orders.payfrom}</span></td>
        </tr>
		<tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style1">處理時間</span></td>
          <td bgcolor="#FFFFFF">${fn:substring(orders.procDate, 0, 4)}/${fn:substring(orders.procDate, 4, 6)}/${fn:substring(orders.procDate, 6, 8)} 
  ${fn:substring(orders.procTime, 0, 2)}:${fn:substring(orders.procTime, 2, 4)}</td>
        </tr>
		<tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style1">繳費代碼</span></td>
          <td bgcolor="#FFFFFF">${orders.payno}</td>
        </tr>
		<tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style1">交易單號</span></td>
          <td bgcolor="#FFFFFF">${orders.tsr}</td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style1">繳費期限</span></td>
          <td bgcolor="#FFFFFF">${fn:substring(orders.expireDate, 0, 4)}/${fn:substring(orders.expireDate, 4, 6)}/${fn:substring(orders.expireDate, 6, 8)} 
  ${fn:substring(orders.expireTime, 0, 2)}:${fn:substring(orders.expireTime, 2, 4)}</td>
        </tr>
        </c:if>
		<tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style1">轉出帳號後5碼︰</span></td>
          <td bgcolor="#FFFFFF"><span class="style1">${orders.exportAccount} </span></td>
        </tr>
		     <tr>
          <td bgcolor="#FFFFFF" height="25"><span class="style1">訂單成立時間</span></td>
          <td bgcolor="#FFFFFF"><span class="style1">${orders.createDt} </span></td>
        </tr>
      </table>
	  <span class="style5"><br>
	  備註︰ <br>
	  </span><span class="style9">${orders.descTxt} </span></td>
    </tr>
	<tr><td align="center">
      <input type="submit" name="Submit22" value="存檔">
      <input type="button" name="Submit2" onClick="window.print();" value="列印">
      <input type="button" name="Submit" onClick="window.close();" value="關閉"><br><br>
<%@ include file="./member/ads_img.jsp"%></td></tr>
</table>
</center></form>
</body>
</html>
<script>
<c:if test="${ ! empty msg}">
alert("存檔成功！");
</c:if>
</script>