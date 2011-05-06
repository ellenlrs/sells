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
}
<c:if test="${ requestScope.sells.colorTp == 5}">
.tb1 .tb2 a:link,.tb1 .tb2 a:visited{font-size:15px; color:#fff; font-weight:bold;}
.tb1 th{font-weight:bold; color:#FFF;}
.tb1 .tb2 a:hover{text-decoration:none;}
.tb1 .button{color:#fff;}
.tb3 .tb2{background:#ffe9bb;}
.tb1 tr th.tb2{text-align:left; font-size:15px;}
</c:if><c:if test="${ requestScope.sells.colorTp != 5}">
.tb1 .tb2 a:link,.tb1 .tb2 a:visited{font-size:15px; color:#000; font-weight:bold;}
.tb1 th{font-weight:bold; color:#000;}
.tb1 .tb2 a:hover{text-decoration:none;}
.tb1 .button{color:#fff;}
.tb1 tr th.tb2{text-align:left; font-size:15px;}
</c:if>
-->
</style>