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
function setPage(_cmd,pageValue)
{
   document.search.pagecmd.value = _cmd;
   document.search._page.value = pageValue;
   document.search.submit(); 
}
function sendForm() {
  var item = document.search;
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
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%><form action='sellOrderQuery.do' name=search method=post>
<table width="615" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td ><table width="600" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF">
          <tbody>
            <tr>
              <td width="100%" colspan="5" align="left" class="style5">查詢訂單</td>
            </tr>
            <tr>
              <td align="left" class="style5">訂單編號</td>
              <td align="left" class="style5"><input type="text" name="orderNo" size="20" value="${sessionScope._SEARCH.orderNo}" ></td>
              <td align="left" class="style5">訂購人</td>
              <td align="left" colspan="2" class="style5"><input type="text" name="name" size="20" value="${sessionScope._SEARCH.name}" ></td>
            </tr>
            <tr>
              <td align="left" class="style5">狀態</td>
              <td align="left" class="style5"><select name="orderSt">
			    <option ${sessionScope._SEARCH.orderSt == ''?'selected':'' } value="" >全部</option>
                <option ${sessionScope._SEARCH.orderSt == '00'?'selected':'' } value="00" >處理中</option>
                <option ${sessionScope._SEARCH.orderSt == '10'?'selected':'' } value="10">出貨</option>
                <option ${sessionScope._SEARCH.orderSt == '20'?'selected':'' } value="20">匯款已收到</option>
                <option ${sessionScope._SEARCH.orderSt == '30'?'selected':'' } value="30">備貨中</option>
                <option ${sessionScope._SEARCH.orderSt == '99'?'selected':'' } value="99">取消</option>
            <option ${sessionScope._SEARCH.orderSt == '80'?'selected':'' } value="80">線上付款未完成</option>
            <option ${sessionScope._SEARCH.orderSt == '85'?'selected':'' } value="85">線上付款成功</option>
            <option ${sessionScope._SEARCH.orderSt == '88'?'selected':'' } value="88">線上付款失敗</option>
              </select ></td>
              <td align="left" class="style5">訂購日期</td>
              <td align="left" class="style5">
              <input name="startDt" type="text" value="${sessionScope._SEARCH.startDt}" size="10" id="date1" maxlength="8" >
                ~
                <input name="endDt" type="text" value="${sessionScope._SEARCH.endDt}" size="10" id="date2" maxlength="8" >
                <br>
                <span class="style1">格式：20070801，可只輸入其中之一條件</span></td>
              <td align="left" class="style5"><input type="submit" name="Submit" value="查詢"><input type="hidden" name="search" value="search"></td>
            </tr>
          </tbody>
        </table>
         <c:if test="${ ! empty mainlist}">
		  <table align="center"  width="600" cellspacing="0">
  <tr >
    <td align="right" class="style5">（共${sessionScope._PAGECONTROL.rowCount} 筆）　　頁次：${sessionScope._PAGECONTROL.nowPage+1}/${sessionScope._PAGECONTROL.pageCount}｜ <a href="#" onClick="setPage('gopage','0'); " >第一頁</a>｜<a href="#" onClick="setPage('uppage','0'); " >上一頁</a>｜ <a href="#" onClick="setPage('nextpage','0'); " >下一頁</a>｜<a href="#" onClick="setPage('gopage','${sessionScope._PAGECONTROL.pageCount-1}'); " >最後一頁</a>　
      到第
      <select name="pages" onChange="setPage('gopage',this.value); ">
	    <c:forEach begin="1" end="${sessionScope._PAGECONTROL.pageCount}" var="item">
		<option <c:if test="${sessionScope._PAGECONTROL.nowPage == item-1 }">selected</c:if> value="${item-1}">${item}</option>
		</c:forEach>
        </select >
      <input type="hidden" name="_sort" value="${sessionScope._PAGECONTROL.sortField}" />
      <input type="hidden" name="_asc" value="${sessionScope._PAGECONTROL.asc }" />
      <input type="hidden" name="pagecmd" value="" />
      <input type="hidden" name="_page" value="${sessionScope._PAGECONTROL.nowPage}" />
      頁 </td>
  </tr>
</table>

        <table align="center" width="600" cellspacing="1" bgcolor="#0099FF">
          <tr>
            <td height="25" align="center" bgcolor="#FFFFFF" class="style5" >訂單編號</td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >訂購日期</td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >訂購人 </td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >電話</td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >付款方式</td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >狀態 </td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >留言</td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >留言</td>
          </tr>
          <logic:iterate id="item" name="mainlist">
            <tr >
              <td height="25" align="center" bgcolor="#FFFFFF" class="style5"> <a href="javascript:orderDetial('${item.orderNo}');">${item.orderNo} </a></td>
              <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.orderDt} </td>
              <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.name} </td>
              <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.tel} </td>
              <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.payTp} </td>
              <td align="center" bgcolor="#FFFFFF" class="style5"> <img src="images/st${item.orderSt}.gif" border="0"> </td>
              <td align="center" bgcolor="#FFFFFF" class="style5"><a href="javascript:msg('${item.orderNo}');" ><img src="images/msg.jpg" width="36" height="35" title='留言管理' border="0"></a></td>
              <td align="center" bgcolor="#FFFFFF" class="style5"><a href="javascript:orderPP('${item.orderNo}');"><img src="images/print.png" title='列印' border="0"></a></td>              
            </tr>
          </logic:iterate>
		  <tr >
			  <td height="25" colspan="8"  align="left" bgcolor="#FFFFFF" class="style1" >點選訂單編號，可以修改訂單狀態及查詢看訂單內容</td>
		  </tr>
        </table>
         </c:if></td>
      </tr>
    </table></form>
<%@ include file="footer1.jsp"%>
</body>
</html>
<script>
function msg(orderNo){
  var winName = "update" ;
  var features = "width=800, height=600,resizable=no,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,left=50,top=50";
  var theURL = "sellOrderMessageList.do?orderNo="+orderNo+"&st=0";
  window.open(theURL,winName,features);
}
function orderDetial(orderNo){
  var winName = "update" ;
  var features = "width=800, height=600,resizable=no,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,left=50,top=50";
  var theURL = "sellOrderDetail.do?orderNo="+orderNo;
  window.open(theURL,winName,features);
}
function orderPP(orderNo){
  var winName = "update" ;
  var features = "width=800, height=600,resizable=no,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,left=50,top=50";
  var theURL = "sellOrderPrint.do?orderNo="+orderNo;
  window.open(theURL,winName,features);
}
</script>