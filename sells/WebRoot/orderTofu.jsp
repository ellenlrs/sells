<%@ page contentType="text/html; charset=Utf-8"%>
<%@ include file="taglibs.jsp"%>
<html>
<head>
<LINK REL="SHORTCUT ICON" HREF="http://www.icart.tw/Sells/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
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
<title>${requestScope.sells.storeNm} 專屬購物車</title>
<link href="car.css" rel="stylesheet" type="text/css">
<style type="text/css"><!--
body {
	font-size: 12px;
	background-color: #FFFFFF;
	margin-top: 0px;
	margin-left: 0px;
}
pre {
white-space: pre-wrap;       /* css-3 */
white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
white-space: -pre-wrap;      /* Opera 4-6 */
white-space: -o-pre-wrap;    /* Opera 7 */
word-wrap: break-word;       /* Internet Explorer 5.5+ */
} 
.button {
	color: ${requestScope.sells.color2 == null || requestScope.sells.color2 == '' ?'#99CCFF':requestScope.sells.color2};
	font-size: 12px;
	padding-top: 3px;
	background-color: ${requestScope.sells.color1 == null || requestScope.sells.color1 == '' ?'#006699':requestScope.sells.color1};
}
.tb2 {
    background-color: ${requestScope.sells.color2 == null || requestScope.sells.color2 == '' ?'#99CCFF':requestScope.sells.color2};
	font-size: 12px;
}
.tb1 {
    background-color: ${requestScope.sells.color1 == null || requestScope.sells.color1 == '' ?'#006699':requestScope.sells.color1};
	font-size: 12px;
}
.tb3 {
	font-size: 12px;
}-->
</style>
<script>
function checkForm(formObj){
  if ( formObj.name.value == '') {
     alert("請輸入姓名!");
	 formObj.name.focus();
	 return false ;
  }
  if ( formObj.zip.value == '') {
     alert("請輸入郵遞區號!");
	 formObj.zip.focus();
	 return false ;
  }
  if ( formObj.address.value == '') {
     alert("請輸入地址!");
	 formObj.address.focus();
	 return false ;
  }
  if ( formObj.email.value == '') {
     alert("請輸入Email!");
	 formObj.email.focus();
	 return false ;
  }
  if ( formObj.tel.value == '') {
     alert("請輸入聯絡電話!");
	 formObj.tel.focus();
	 return false ;
  }
  if ( formObj.mobile.value == '') {
     alert("請輸入行動電話!");
	 formObj.mobile.focus();
	 return false ;
  }
  if ( formObj.payTp.selectedIndex == '0') {
     alert("請選擇付款方式!");
	 formObj.payTp.focus();
	 return false ;
  }
  if ( formObj.payTp.options[formObj.payTp.selectedIndex].value.indexOf('貨到付款') == -1 && 
       formObj.payTp.options[formObj.payTp.selectedIndex].value.indexOf('線上刷卡') == -1) {
    if ( formObj.exportId.value=="" ) {
      alert("請輸入轉出帳號後5碼!");
	    formObj.payTp.focus();
	    return false ;
	  }
  }
  if ( formObj.desc.value.length > 1500 ) {
    alert("備註不可超過1500字數,你目前字數:" +formObj.desc.value.length  );
    formObj.mobile.focus();
    return false ;
  } 
}
</script>
</head>
<body>
<center>
<form name="shopcar" action="orderSend.do" method="Post" onSubmit="return checkForm(this);">
  <table width="800" border="0" align="center" cellspacing="1" class="tb1">
    <tr>
      <td width="100%" height="28" colspan="2"  class="tb2">
      <b>．購買商品內容</b></td>
    </tr>
    <tr>
      <td width="100%" bgcolor="#ffffff" >
<table border=0 width=100% cellspacing="1" class="tb1" cellpadding="2">
        <tr>
          <td width=62 height="28" align="center" class="tb2">編號</td>
          <td width="415" align="center" class="tb2">品名(規格)</td>
          <td align="center" width=122 class="tb2">數量</td>
          <td align="center" width=55 class="tb2">單價</td>
          <td align="center" width=55 class="tb2">小計</td>
        </tr>
		 <c:set var="total" scope="request" value="${0}"/>
		 <c:set var="totQty" scope="request" value="${0}"/>
		 <c:forEach items="${requestScope.car}" var="item" varStatus="s">
        <tr>
          <td width=62 height="28" align="center" bgcolor="#FFFFFF"><input type=hidden name='itemNo' value='${item.itemNo}'>
<input type=hidden name='itemNm' value='${item.itemNm}'>
<input type=hidden name='spec1' value='${item.spec1}'>
<input type=hidden name='spec2' value='${item.spec2}'>
<input type=hidden name='qty' value='${item.qty}'>
<input type=hidden name='price' value='${item.price}'>${item.itemNo}</td>
          <td width="415" align="left" bgcolor="#FFFFFF">${item.itemNm} ( ${item.spec1} ${item.spec2})</td>
          <td align="center" width=122 bgcolor="#FFFFFF">
		   ${item.qty}
		   <c:set var="total" scope="request" value="${total + item.qty * item.price}"/>
		   <c:set var="totQty" scope="request" value="${totQty + item.qty}"/>
		  </td>
          <td align="center" width=55 bgcolor="#FFFFFF">${item.price}</td>
          <td align="center" width=55 bgcolor="#FFFFFF">${item.qty * item.price}</td>
        </tr>
		</c:forEach>
        <tr>
          <td height="28" colspan=6 class="tb2">您共買了 ${totQty} 個商品 </td>
        </tr>
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff>商品金額︰${total}元</td>
        </tr>
		<c:if test="${requestScope.sells.process > '0'}">
		<tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 若您結帳時選擇<span class="style1">貨到付款</span>將加收物流處理費︰${requestScope.sells.process}元 </td>
        </tr>
		</c:if>
		<c:if test="${requestScope.sells.freightTp == '0'}">
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 運費金額為︰冰品:${requestScope._toIcfare}元,非冰品:${requestScope._toOtfare}元<input type=hidden name=freight value='${requestScope._toIcfare+requestScope._toOtfare}'></td>
        </tr>
        <tr>
          <td height="28" colspan=6 class="tb2">購物總金額為︰${total + requestScope._toIcfare+requestScope._toOtfare}元 (含運費)</td>
        </tr>
		</c:if>
		<c:if test="${requestScope.sells.freightTp == '1'}"><!--價格-->
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 運費金額為︰冰品:${requestScope._toIcfare}元,非冰品:${requestScope._toOtfare}元 <span class="style1"><br>
            （當消費金額超過 ${requestScope.sells.nofreightFare}元，享有免運費服務
                <c:if test="${requestScope.sells.process > '0'}">及貨到付款物流處理費</c:if>）</span></td>
        </tr>
        <tr>
          <td height="28" colspan=6 class="tb2">
		  購物總金額為︰
		  <c:if test="${total <= requestScope.sells.nofreightFare}">${total + requestScope._toIcfare+requestScope._toOtfare}元 (已含運費)<input type=hidden name=freight value='${requestScope._toIcfare+requestScope._toOtfare}'></c:if>
		  <c:if test="${total > requestScope.sells.nofreightFare}">${total}元 (免運費)<input type=hidden name=freight value='0'></c:if></td>
        </tr>
		</c:if>
		<c:if test="${requestScope.sells.freightTp == '2'}"><!--數量-->
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 運費金額為︰冰品:${requestScope._toIcfare}元,非冰品:${requestScope._toOtfare}元<span class="style1"><br>
            （當數量超過 ${requestScope.sells.nofreightQty}件，享有免運費服務
                <c:if test="${requestScope.sells.process > '0'}">及貨到付款物流處理費</c:if>）</span></td>
        </tr>
        <tr>
          <td height="28" colspan=6 class="tb2">
		  購物總金額為
		  <c:if test="${totQty <= requestScope.sells.nofreightQty}">${total + requestScope._toIcfare+requestScope._toOtfare}元 (內含運費)<input type=hidden name=freight value='${requestScope._toIcfare+requestScope._toOtfare}'></c:if>
		  <c:if test="${totQty >requestScope.sells.nofreightQty}">${total}元 (免運費)<input type=hidden name=freight value='0'></c:if>
		  </td>
        </tr>
		</c:if>
    <c:if test="${requestScope.sells.freightTp == '3'}"><!--價格，貨到付款一律收取-->
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 運費金額為︰冰品:${requestScope._toIcfare}元,非冰品:${requestScope._toOtfare}元 <span class="style1"><br>
            （當消費金額超過 ${requestScope.sells.nofreightFare}元，享有免運費服務）</span></td>
        </tr>
        <tr>
          <td height="28" colspan=6 class="tb2">
      購物總金額為︰
      <c:if test="${total <= requestScope.sells.nofreightFare}">${total + requestScope._toIcfare+requestScope._toOtfare}元 (已含運費)<input type=hidden name=freight value='${requestScope._toIcfare+requestScope._toOtfare}'></c:if>
      <c:if test="${total > requestScope.sells.nofreightFare}">${total}元 (免運費)<input type=hidden name=freight value='0'></c:if></td>
        </tr>
    </c:if>
		<c:if test="${requestScope.sells.freightTp == '4'}"><!--數量，貨到付款一律收取-->
        <tr>
          <td height="28" colspan=6 bgcolor=#ffffff> 運費金額為︰冰品:${requestScope._toIcfare}元,非冰品:${requestScope._toOtfare}元<span class="style1"><br>
            （當數量超過 ${requestScope.sells.nofreightQty}件，享有免運費服務）</span></td>
        </tr>
        <tr>
          <td height="28" colspan=6 class="tb2">
      購物總金額為
      <c:if test="${totQty <= requestScope.sells.nofreightQty}">${total + requestScope._toIcfare+requestScope._toOtfare}元 (內含運費)
      <input type=hidden name=freight value='${requestScope._toIcfare+requestScope._toOtfare}'></c:if>
      <c:if test="${totQty >requestScope.sells.nofreightQty}">${total}元 (免運費)<input type=hidden name=freight value='0'></c:if>
      </td>
        </tr>
    </c:if>
		</table>  
<textarea rows="15" name="orderItem" cols="73" style='display:none;visibility:hidden;'>
<c:forEach items="${requestScope.car}" var="item" varStatus="s">
${item.itemNo}  ${item.itemNm}<c:if test="${item.spec1 != '' || item.spec2 != ''}">(${item.spec1}、${item.spec2})</c:if> 數量:${item.qty} 單價:${item.price} 小計${item.qty*item.price}<BR>
</c:forEach><BR>
運費金額為︰冰品:${requestScope._toIcfare}元,非冰品:${requestScope._toOtfare}元<br>
商品金額︰${total}元<BR>
購物總金額為︰
<c:if test="${requestScope.sells.freightTp == '0'}">
${total+ requestScope._toIcfare+requestScope._toOtfare}元 (含運費) <BR><c:if test="${requestScope.sells.process > '0'}">若您選擇貨到付款 購物總金額為︰${total+ requestScope._toIcfare+requestScope._toOtfare+requestScope.sells.process}元 (含運費及貨到付款物流處理費) <BR></c:if>
</c:if><c:if test="${requestScope.sells.freightTp == '1'}">
<c:if test="${total <= requestScope.sells.nofreightFare}">${total + requestScope._toIcfare+requestScope._toOtfare}元 (含運費)<BR><c:if test="${requestScope.sells.process > '0'}">若您選擇貨到付款 購物總金額為︰${total+ requestScope._toIcfare+requestScope._toOtfare+requestScope.sells.process}元 (含運費及貨到付款物流處理費) <BR></c:if></c:if>
<c:if test="${total > requestScope.sells.nofreightFare}">${total}元 (免運費)<BR></c:if>
</c:if><c:if test="${requestScope.sells.freightTp == '2'}">
<c:if test="${totQty <= requestScope.sells.nofreightQty}">${total + requestScope._toIcfare+requestScope._toOtfare}元 (含運費)<BR>
<c:if test="${requestScope.sells.process > '0'}">若您選擇的付款方式：貨到付款 購物總金額為︰${total+ requestScope._toIcfare+requestScope._toOtfare+requestScope.sells.process}元 (含運費及貨到付款物流處理費) <BR></c:if></c:if>
<c:if test="${totQty >requestScope.sells.nofreightQty}">${total}元 (免運費)<BR></c:if></c:if>
<c:if test="${requestScope.sells.freightTp == '3'}">
<c:if test="${total <= requestScope.sells.nofreightFare}">${total + requestScope._toIcfare+requestScope._toOtfare}元 (含運費)<BR><c:if test="${requestScope.sells.process > '0'}">若您選擇貨到付款 購物總金額為︰${total+ requestScope._toIcfare+requestScope._toOtfare+requestScope.sells.process}元 (含運費及貨到付款物流處理費) <BR></c:if></c:if>
<c:if test="${total > requestScope.sells.nofreightFare}">${total}元 (免運費)<BR><c:if test="${requestScope.sells.process > '0'}">若您選擇貨到付款 購物總金額為︰${total+requestScope.sells.process}元 (含貨到付款物流處理費) <BR></c:if></c:if>
</c:if><c:if test="${requestScope.sells.freightTp == '4'}">
<c:if test="${totQty <= requestScope.sells.nofreightQty}">${total + requestScope._toIcfare+requestScope._toOtfare}元 (含運費)<BR>
<c:if test="${requestScope.sells.process > '0'}">若您選擇的付款方式：貨到付款 購物總金額為︰${total+ requestScope._toIcfare+requestScope._toOtfare+requestScope.sells.process}元 (含運費及貨到付款物流處理費) <BR></c:if></c:if>
<c:if test="${totQty >requestScope.sells.nofreightQty}">${total}元 (免運費)<BR><c:if test="${requestScope.sells.process > '0'}">若您選擇貨到付款 購物總金額為︰${total+requestScope.sells.process}元 (含貨到付款物流處理費) <BR></c:if></c:if></c:if>
</textarea>
  </td>
    </tr>
  </table>
<table width="800" border="0" align="center" cellspacing="1" class="tb1">
    <tr>
      <td width="100%" colspan="2"  bgcolor="#FFFFFF">
      
        <table width="100%" border="0" cellpadding="1" bgcolor="#FFFFFF" class="tb3">
    <tr>
      <td height="28" colspan="2"  class="tb2"><span class="style8">．訂購人基本資料 </span>                  
        <font color="#961B30" size="2">(以下資料請仔細填寫，聯絡和出貨將以此資料為主，謝謝您的填寫)</font></td>
    </tr>
    <tr>
      <td width="17%" height="28" align="center" bgcolor="#ffffff" >
        <span class="style8"><b>*姓名</b></span></td>
      <td width="83%" bgcolor="#ffffff" ><input name="name" type="text" value="${member.name}" size="14" maxlength="20" ></td>
    </tr>
    <tr>
      <td width="17%" align="center" bgcolor="#ffffff" >
        <span class="style8"><b>*地址</b></span></td>
      <td width="83%" bgcolor="#ffffff" ><span class="login-box">郵遞區號</span>
        <input name="zip" type="text" value="${member.zip}" size="7" maxlength="10" >
        <br>
        <input name="address" type="text" value="${member.address}" size="59" maxlength="100" ></td>
    </tr>
    <tr>
      <td width="17%" height="28" align="center" bgcolor="#ffffff" >
        <b class="style8">*E-mail</b></td>
      <td width="83%" bgcolor="#ffffff" ><input name="email" type="text" value="${member.email}" size="28" maxlength="130" ></td>
    </tr>
    <tr>
      <td width="17%" height="28" align="center" bgcolor="#ffffff" >
        <b class="style8">*電話</b></td>
      <td width="83%" bgcolor="#ffffff" ><input name="tel" type="text" value="${member.tel}" size="24" maxlength="20" ></td>
    </tr>
    <tr>
      <td width="17%" height="28" align="center" bgcolor="#ffffff" >
        <b class="style8">*手機</b></td>
      <td width="83%" bgcolor="#ffffff" ><input name="mobile" type="text" value="${member.mobile}" size="24" maxlength="20" >
&nbsp;</td>
    </tr>
    <tr>
      <td width="17%" align="center" bgcolor="#ffffff" >
        <b>備註</b></td>
      <td width="83%" bgcolor="#ffffff" ><textarea name="desc" cols="60" rows="10"></textarea>
        &nbsp;<br>
        <span class="style8">1500字以內</span></td>
    </tr>
  </table>
  </td>
    </tr>
  </table>
  <table width="800" border="0" align="center" cellspacing="1" class="tb1">
    <tr>
      <td width="100%" colspan="2"  bgcolor="#FFFFFF">
        <table width="100%" border="0" cellpadding="3" bgcolor="#FFFFFF" class="tb3">
    <tr>
      <td height="28" colspan="2" class="tb2"><b>．請選擇付款方式 </b></td>
    </tr>
    <tr>
      <td width="44%" height="28" bgcolor="#ffffff" >
        <b>*付款方式</b></td>
      <td width="56%" bgcolor="#ffffff" ><select size="1" name="payTp" >
	  <option value="">請選擇付款方式</option>
	  <c:if test="${requestScope.sells.payType5 == '1' }"><option value='線上刷卡'>線上刷卡</option></c:if> 
	  <c:if test="${requestScope.sells.payType1 == '1' }"><option value='ATM'>ATM</option></c:if> 
	  <c:if test="${requestScope.sells.payType2 == '1' }"><option value='銀行匯款'>銀行匯款</option></c:if> 
	  <c:if test="${requestScope.sells.payType3 == '1' }"><option value='郵政劃撥'>郵政劃撥</option></c:if> 
	  <c:if test="${requestScope.sells.payType4 == '1' }">
	    <c:choose>
		   <c:when test="${requestScope.sells.process > '0'}">
		     <c:choose>
		   		<c:when test="${requestScope.sells.freightTp == '0'}">
	  <option value='貨到付款-需加收處理費：${requestScope.sells.process}元'>貨到付款-需加收處理費:${requestScope.sells.process}元</option>
	  			</c:when>
		   		<c:when test="${requestScope.sells.freightTp == '1'}">
				  <c:if test="${total <= requestScope.sells.nofreightFare}">
	  <option value='貨到付款-需加收處理費：${requestScope.sells.process}元'>貨到付款-需加收處理費:${requestScope.sells.process}元</option>
				  </c:if>
				  <c:if test="${total > requestScope.sells.nofreightFare}">
				  <option value='貨到付款'>貨到付款</option>
				  </c:if>
				</c:when>
		   		<c:when test="${requestScope.sells.freightTp == '2'}">
				  <c:if test="${totQty <= requestScope.sells.nofreightQty}">
	  <option value='貨到付款-需加收處理費：${requestScope.sells.process}元'>貨到付款-需加收處理費:${requestScope.sells.process}元</option></c:if>
				  <c:if test="${totQty > requestScope.sells.nofreightQty}">
				  <option value='貨到付款'>貨到付款</option>
				  </c:if>
				</c:when>
        <c:when test="${requestScope.sells.freightTp == '3' || requestScope.sells.freightTp == '4'}">
          <option value='貨到付款-需加收處理費：${requestScope.sells.process}元'>貨到付款-需加收處理費:${requestScope.sells.process}元</option>
        </c:when>
			 </c:choose>
		   </c:when>
		   <c:otherwise>
		   <option value='貨到付款'>貨到付款</option>
		   </c:otherwise>
		</c:choose>
		</c:if>
	  </select>
	  <c:if test="${requestScope.sells.payType4 == '1' }">
      <c:choose>
       <c:when test="${requestScope.sells.process > '0'}">
         <c:choose>
          <c:when test="${requestScope.sells.freightTp == '0'}">
    <input type=hidden name=process value='${requestScope.sells.process}'>
          </c:when>
          <c:when test="${requestScope.sells.freightTp == '1'}">
          <c:if test="${total <= requestScope.sells.nofreightFare}">
    <input type=hidden name=process value='${requestScope.sells.process}'>
          </c:if>
          <c:if test="${total > requestScope.sells.nofreightFare}">
          <input type=hidden name=process value='0'>
          <option value='貨到付款'>貨到付款</option>
          </c:if>
        </c:when>
          <c:when test="${requestScope.sells.freightTp == '2'}">
          <c:if test="${totQty <= requestScope.sells.nofreightQty}">
    <input type=hidden name=process value='${requestScope.sells.process}'></c:if>
          <c:if test="${totQty > requestScope.sells.nofreightQty}">
          <input type=hidden name=process value='0'>
          </c:if>
        </c:when>
        <c:when test="${requestScope.sells.freightTp == '3' || requestScope.sells.freightTp == '4'}">
           <input type=hidden name=process value='${requestScope.sells.process}'>
        </c:when>
       </c:choose>
       </c:when>
       <c:otherwise>
       <input type=hidden name=process value='0'>
       </c:otherwise>
    </c:choose>
    </c:if>
        <input type="hidden" name="sells" value="${requestScope.sells.sellsNo}">
        <input type="hidden" name="memberNo" value="${member.memberNo}"></td>
    </tr>
    <tr>
      <td width="44%" height="28" bgcolor="#ffffff" >
        <b>*轉出帳號後5碼(若使用貨到付款可以不輸入)</b></td>
      <td width="56%" bgcolor="#ffffff" ><input name="exportId" type="text" size="10" maxlength="5" ></td>
    </tr>
    <tr>
      <td height="28" colspan="2"  bgcolor="#ffffff"><font class="style1">若您選擇使用ATM或匯款方式付款，請先填寫您預計轉出的帳號後5碼</font></td>
    </tr>
    <tr>
      <td height="28" colspan="2"  class="tb2" ><b>．付款方式說明</b></td>
    </tr>
    <tr>
      <td bgcolor="#ffffff" colspan="2"><div style="word-wrap: break-word;white-space : normal;">
<pre >${requestScope.sells.payDesc}</pre></div>
        </td>
    </tr>
	<tr>
      <td  colspan="2" align="center" bgcolor="#ffffff"><input type="submit" value="送出訂購單" class="button"></td>
    </tr>
  </table>
  </td>
    </tr>
  </table>
</form>
<%@ include file="footer.jsp"%></center>
</body>
</html>