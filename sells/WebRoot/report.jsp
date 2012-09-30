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
<link rel="stylesheet" type="text/css" href="global/ui.datepicker.css" title="default"/>
<link href="car.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="global/jquery.js"></script>    
<script type="text/javascript" src="global/ui.datepicker.js"></script>  
<script type="text/javascript" src="global/ui.datepicker-zh-TW.js"></script> 
</head>
<body topmargin="0">
<script language="JavaScript" type="text/JavaScript">

function sendForm() {
  var item = document.search;
  if (item.startDt.value =="") {
	  item.startDt.focus();
	  alert("請輸入查詢開始日期");
	  return false;
  }
  if (item.endDt.value =="") {
	  item.endDt.focus();
	  alert("請輸入查詢結束日期");
	  return false;
  }
  /* var startDate */
  Date1=  new  Date(item.startDt.value.substring(0,4)  +  '-'  +  item.startDt.value.substring(4,6)  +  '-'  +  item.startDt.value.substring(6,8));   //轉換為2007-8-10格式
  Date2=  new  Date(item.endDt.value.substring(0,4)  +  '-'  +  item.endDt.value.substring(4,6)  +  '-'  +  item.endDt.value.substring(6,8)); 
  iDays  =  parseInt(Math.abs(Date1-  Date2)  /  1000  /  60  /  60  /24);    //轉換為天數
  if (iDays > 100 ) {
  	  alert("查詢天數不允許超過100天");
	  return false;    	
  }
  if (item.sort[1].checked || item.sort[2].checked ) {
	  item.col[2].checked = true ;
	  item.col[4].checked = true ;
  } 
  item.submit();
}
var date0 = new Date();
$(document).ready(function(){   
  $('#date1').datepicker({dateFormat: 'yymmdd', onClose:closeDate,numberOfMonths:2 ,buttonImage: "images/calendar.gif"});   
  $('#date2').datepicker({dateFormat: 'yymmdd', beforeShow: customRange,numberOfMonths:2 ,buttonImage: "images/calendar.gif"});
});
function closeDate(_date) {
 date0 = _date ;
}
function customRange(input) { 
  if (input.id == 'date2'){
    return {minDate: date0 ,maxDate: null};
  }
}
</script>
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%><form action='sellReportExport.do' name=search method=post>
<table width="615" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td ><table width="600" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF">
          <tbody>
            <tr>
              <td width="100%" colspan="5" align="center" class="style5">訂單報表查詢</td>
            </tr>
            <tr>
              <td align="left" class="style5">訂單狀態</td>
              <td align="left" class="style5" colspan="2" >
              <label><input type="checkbox" name="orderSt" checked value="00" />處理中</label>
              <label><input type="checkbox" name="orderSt" checked value="10" />出貨</label>
              <label><input type="checkbox" name="orderSt" checked value="20" />匯款已收到</label>
              <label><input type="checkbox" name="orderSt" checked value="30" />備貨中</label>
              <label><input type="checkbox" name="orderSt" checked value="99" />取消</label><BR>
              <label><input type="checkbox" name="orderSt" checked value="80" />線上付款未完成</label>
              <label><input type="checkbox" name="orderSt" checked value="85" />線上付款成功</label>
              <label><input type="checkbox" name="orderSt" checked value="88" />線上付款失敗</label>
              <BR><span class="style1">若全部未勾選視同全選</span>
			  </td>
			</tr><tr>  
              <td align="left" class="style5">訂購日期</td>
              <td align="left" class="style5" colspan="2" >
              <input name="startDt" type="text" value="${sessionScope._SEARCH.startDt}" size="10" id="date1" maxlength="8" >
                ~
                <input name="endDt" type="text" value="${sessionScope._SEARCH.endDt}" size="10" id="date2" maxlength="8" >
                <br>
                <span class="style1">格式：20070801，日期區間不可超過100天。</span></td>
            </tr> 
			<tr>  
              <td align="left" class="style5">查詢欄位</td>
              <td align="left" class="style5" colspan="2" >
              <label><input type="checkbox" name="col" checked value="a.order_st" />訂單狀態</label>
			  <label><input type="checkbox" name="col" checked value="b.item_no,b.item_nm" />商品名稱</label>
              <label><input type="checkbox" name="col" checked value="a.member_no,a.name" />會員／訂購人</label>
              <label><input type="checkbox" name="col" checked value="date_format(a.order_dt,'%Y%m')" />訂購月份</label>
              <label><input type="checkbox" name="col" checked value="count(a.member_no)" />訂購次數</label>
              <BR><span class="style1">若全部未勾選視同全選</span>
              </td>
            </tr>
			<tr>  
              <td align="left" class="style5">排序</td>
              <td align="left" class="style5" colspan="2" >
			  <label><input type="radio" name="sort" checked value="0" />商品名稱</label><BR>
              <label><input type="radio" name="sort" value="1" />會員訂購金額，會員訂購次數，<span class="style1">查詢欄位的會員／訂購人／訂購次數需要勾選</span></label><BR>
              <label><input type="radio" name="sort" value="2" />會員訂購次數，會員訂購金額，<span class="style1">查詢欄位的會員／訂購人／訂購次數需要勾選</span></label>
              <BR><input type="button" name="button" value="查詢" onclick="sendForm();">
              </td>
            </tr><!--
            <tr>
              <td align="left" class="style5">報表類型</td>
              <td align="left" class="style5"><label><input type="radio" name="reportTp" value="1" />訂單匯總</label>
              <label><input type="radio" name="reportTp" value="2" />依訂單狀態區分</label>
              <label><input type="radio" name="reportTp" value="3" />依會員匯總</label>
              <label><input type="radio" name="reportTp" value="4" />依會員＋訂單狀態區分</label></td>
              <td align="left" class="style5"></td>
            </tr>-->
          </tbody>
        </table>
       </td>
      </tr>
    </table></form>
<%@ include file="footer1.jsp"%>
</body>
</html>
