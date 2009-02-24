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
<%@ include file="chkSession.jsp"%><%@ include file="top1.jsp"%><form action='memberQuery3.do' name=search method=post>
  <table width="615" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td ><table width="600" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF">
          <tbody>
            <tr>
              <td colspan="5" align="left" class="style5">匯出生日名單</td>
            </tr>
            <tr>
              <td align="left" class="style5">分隔符號</td>
              <td align="left" class="style5"><select name="sp" id="sp">
                <option ${sp == ';' ?'selected':''} value=";" >;</option>
                <option ${sp == ',' ?'selected':''} value=",">,</option>
                <option ${sp == ' ' ?'selected':''} value=" ">空白</option>
              </select ></td>
              <td colspan="2" align="left" class="style5">生日月份              
                <select name="birM" id="birM">
                  <option ${birM == '01' ?'selected':''} value="01">1月</option>
                  <option ${birM == '02' ?'selected':''} value="02">2月</option>
                  <option ${birM == '03' ?'selected':''} value="03">3月</option>
                  <option ${birM == '04' ?'selected':''} value="04">4月</option>
                  <option ${birM == '05' ?'selected':''} value="05">5月</option>
                  <option ${birM == '06' ?'selected':''} value="06">6月</option>
                  <option ${birM == '07' ?'selected':''} value="07">7月</option>
                  <option ${birM == '08' ?'selected':''} value="08">8月</option>
                  <option ${birM == '09' ?'selected':''} value="09">9月</option>
                  <option ${birM == '10' ?'selected':''} value="10">10月</option>
                  <option ${birM == '11' ?'selected':''} value="11">11月</option>
                  <option ${birM == '12' ?'selected':''} value="12">12月</option>
                </select ></td>
            </tr>
            <tr>
              <td align="left" class="style5">匯出欄位</td>
              <td align="left" colspan=2 class="style5">
                <input name="field" type="checkbox" id="field1" value="email" disabled checked>
                <label for="field1" class="style1" style="cursor:hand;cursor: pointer;">Email</label>
                <input type="checkbox" ${ ! empty namefield ?"checked":""} name="field" id="field2" value="namefield">
<label for="field2" style="cursor:hand;cursor: pointer;">姓名</label>
<input type="checkbox" ${ ! empty tel ?"checked":""} name="field" id="field3" value="tel">
<label for="field3" style="cursor:hand;cursor: pointer;">電話</label>
<input type="checkbox" ${ ! empty mobile ?"checked":""} name="field" id="field4" value="mobile">
<label for="field4" style="cursor:hand;cursor: pointer;">行動電話</label>
<input type="checkbox" ${ ! empty address ?"checked":""} name="field" id="field5" value="address">
<label for="field5" style="cursor:hand;cursor: pointer;">地址</label>
<input type="checkbox" ${ ! empty birthDt ?"checked":""} name="field" id="field6" value="birthDt">
<label for="field6" style="cursor:hand;cursor: pointer;">生日</label></td>
              <td width="24%" align="left" class="style5"><input type="submit" name="Submit" value="查詢"><input type="hidden" name="search" value="search"></td>
            </tr>

            <c:if test="${ ! empty result}">
              <tr>
                <td align="left" class="style5">輸出結果</td>
                <td colspan="4" align="left" class="style5"><span class="style3">總筆數：${count}</span><br>
                  <textarea id="textarea" name="textarea" cols="60" onClick="this.focus(); this.select();"  rows="10">${result}</textarea>
                  <br>
                    <input type="button" name="b1" onClick='document.getElementById("textarea").createTextRange().execCommand("Copy");' value="複製">
                    <span class="style1">(可用Ctrl+C複製，Ctrl+V貼上)</span></td>
              </tr>
            </c:if>
          </tbody>
      </table></td>
    </tr>
  </table>
  </form>
<%@ include file="footer1.jsp"%>
</body>
</html>