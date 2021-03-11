<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (request.getAttribute("login1")!= null) {
		session.setAttribute("login1", request.getAttribute("login1"));
%>
<script>
	alert("아이디 가입완료!!!\n자동으로 로그인됩니다.")
	location.href = "../MainPage/mainFrame.jsp";
</script>
<%
	} else {
%>
<script>
	alert("아이디 가입오류!!!")
	location.href = "login.jsp";
</script>
<%
	}
%>
