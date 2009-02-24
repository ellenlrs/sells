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
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%><form action='memberQuery.do' name=search method=post>
<table width="615" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td ><table width="600" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF">
          <tbody>
            <tr>
              <td width="100%" colspan="5" align="left" class="style5">查詢會員</td>
            </tr>
            <tr>
              <td align="left" class="style5">會員Email </td>
              <td align="left" class="style5"><input type="text" name="email" size="20" value="${sessionScope._SEARCH.email}" ></td>
              <td align="left" class="style5">會員姓名</td>
              <td align="left" colspan="2" class="style5"><input type="text" name="name" size="20" value="${sessionScope._SEARCH.name}" ></td>
            </tr>
            <tr>
              <td align="left" class="style5">狀態</td>
              <td align="left" class="style5"><select name="status">
                <option ${sessionScope._SEARCH.status == ''?'selected':'' } value="" >不限</option>
                <option ${sessionScope._SEARCH.status == 'Y'?'selected':'' } value="Y">正常</option>
                <option ${sessionScope._SEARCH.status == 'N'?'selected':''  } value="N">停用</option>
              </select ></td>
              <td align="left" class="style5">電子報狀態</td>
              <td align="left" class="style5"><select name="epYn">
                <option ${sessionScope._SEARCH.epYn == ''?'selected':'' } value="" >不限</option>
                <option ${sessionScope._SEARCH.epYn == 'Y'?'selected':'' } value="Y">是</option>
                <option ${sessionScope._SEARCH.epYn == 'Y'?'selected':'' } value="N">否</option>
              </select ></td>
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
            <td height="25" align="center" bgcolor="#FFFFFF" class="style5" >姓名 </td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >Email</td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >生日 </td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >電子報</td>
            <td align="center" bgcolor="#FFFFFF" class="style5" >狀態 </td>
            <td align="center" bgcolor="#FFFFFF" class="style5" > 管理項目 </td>
          </tr>
          <logic:iterate id="item" name="mainlist">
            <tr>
              <td height="25" align="center" bgcolor="#FFFFFF" class="style5"> ${item.name} </td>
              <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.email} </td>
              <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.birthDt} </td>
              <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.epYn} </td>
              <td align="center" bgcolor="#FFFFFF" class="style5"> ${item.status} </td>
              <td align="center" bgcolor="#FFFFFF" class="style5"><a href="javascript:modi('${item.memberNo}','INFO');" >修改</a> | <a href="javascript:modi('${item.memberNo}','PWD');">變更密碼</a></td>
            </tr>
          </logic:iterate>
        </table>
         </c:if></td>
      </tr>
    </table></form>
<%@ include file="footer1.jsp"%>
</body>
</html>
<script>
function modi(memberNo,func){
  var winName = "update" ;
  var features = "width=800, height=340,resizable=no,scrollbars=no,toolbar=no,location=no,menubar=no,status=no,left=50,top=50";
  var theURL = "memberInfoMis.do?memberNo="+memberNo+"&func="+func;
  window.open(theURL,winName,features);
} 
</script>