<%@ page contentType="text/html;charset=Big5"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<jsp:directive.page import="com.sells.service.imp.MemberService"/>
<jsp:directive.page import="com.sells.dao.LoginData"/>
<%
      // spring test
      try {
        WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext()); 

        MemberService memberService=(MemberService)context.getBean("memberService");
        memberService.updateMemberUserSeq();
        //LoginData vo = sellsService.findLoginDataById("davide","856069","A");
        //out.println(vo.getSellsNo());
      } catch (Exception e) {
        out.println(e.toString());
      }
%>
