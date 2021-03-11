<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (request.getAttribute("test") != null) {
%>
<script>
	alert("비밀번호 변경 완료!!!\n변경된 정보로 로그인해주세요.")
	location.href = "login.jsp";
</script>
<%
	}
%>