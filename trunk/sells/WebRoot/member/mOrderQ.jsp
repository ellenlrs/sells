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
</style>
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
</script>
</head>
<body><center><form name="member" action="memOrderQuery.do" method="Post" onSubmit="return sendForm(this);">
<table width="670" border="0" align="center" cellspacing="1" class="tb1">
  <tr class="tb2">
    <td height="28" align=center bgcolor="#FFFFFF" ><a href="${requestScope.sells.homepage}">
      <c:if test="${ ! empty requestScope.sells.logo}"><img src="${requestScope.sells.logo}" width="18" height="18" border="0"></c:if>
      ${requestScope.sells.storeNm}</a></td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#FFFFFF"><%@ include file="menuMember.jsp"%>
</td></tr></table><table width="670" border="0" align="center" cellspacing="1" class="tb1">
        <tr >
          <td align="right" bgcolor="#FFFFFF" class="tb2">（共${sessionScope._PAGECONTROL.rowCount} 筆）　　頁次：${sessionScope._PAGECONTROL.nowPage+1}/${sessionScope._PAGECONTROL.pageCount}｜ <a href="#" onClick="setPage('gopage','0'); " >第一頁</a>｜<a href="#" onClick="setPage('uppage','0'); " >上一頁</a>｜ <a href="#" onClick="setPage('nextpage','0'); " >下一頁</a>｜<a href="#" onClick="setPage('gopage','${sessionScope._PAGECONTROL.pageCount-1}'); " >最後一頁</a>　
            到第
            <select name="pages" onChange="setPage('gopage',this.value); ">
                <c:forEach begin="1" end="${sessionScope._PAGECONTROL.pageCount}" var="item"> <option 
                
                    <c:if test="${sessionScope._PAGECONTROL.nowPage == item-1 }">selected</c:if>
                  
               value="${item-1}">${item}
              
                  </option>
                </c:forEach>
            </select >
              <input type="hidden" name="_sort" value="${sessionScope._PAGECONTROL.sortField}" />
              <input type="hidden" name="_asc" value="${sessionScope._PAGECONTROL.asc }" />
              <input type="hidden" name="pagecmd" value="" />
              <input type="hidden" name="_page" value="${sessionScope._PAGECONTROL.nowPage}" />
          頁 </td>
        </tr>
      </table>
	  <table border=0 width=670 cellspacing="1" class="tb1" cellpadding="2">
        <tr>
          <td height="25" align="center" bgcolor="#FFFFFF" class="style5" >訂單編號</td>
          <td align="center" bgcolor="#FFFFFF" class="style5" >訂購日期</td>
          <td align="center" bgcolor="#FFFFFF" class="style5" >物流說明</td>
          <td align="center" bgcolor="#FFFFFF" class="style5" >付款方式</td>
          <td align="center" bgcolor="#FFFFFF" class="style5" >狀態 </td>
          <td align="center" bgcolor="#FFFFFF" class="style5" >留言</td>
        </tr>
        <logic:iterate id="item" name="mainlist">
          <tr >
            <td height="25" align="center" bgcolor="#FFFFFF" class="style5"><a href="memOrderDetail.do?orderNo=${item.orderNo}">${item.orderNo}</a></td>
            <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.orderDt} </td>
            <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.logisticDesc} </td>
            <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.payTp} </td>
            <td align="center" bgcolor="#FFFFFF" class="style5"><img src="images/st${item.orderSt}.gif" border="0"> </td>
            <td align="center" bgcolor="#FFFFFF" class="style5"><a href="javascript:msg('${item.orderNo}');" ><img src="images/msg.jpg" width="36" height="35" title='留言管理' border="0"></a></td>
          </tr>
        </logic:iterate>
        <tr >
          <td height="25" colspan="8"  align="left" bgcolor="#FFFFFF" class="style1" >點選訂單編號，可以修改訂單狀態及查詢看訂單內容</td>
        </tr>
      </table>
</form><%@ include file="footer.jsp"%>
</center>
</body>
</html>
<script>
<!--
function msg(orderNo){
  var winName = "update" ;
  var features = "width=800, height=600,resizable=no,scrollbars=yes,toolbar=no,location=no,menubar=no,status=no,left=50,top=50";
  var theURL = "memOrderMessageList.do?orderNo="+orderNo;
  window.open(theURL,winName,features);
}
-->
</script>