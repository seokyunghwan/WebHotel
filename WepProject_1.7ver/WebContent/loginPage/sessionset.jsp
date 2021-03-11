<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if(request.getAttribute("login1")!=null)
	{
		session.setAttribute("cp_name", request.getAttribute("cp_name"));
		session.setAttribute("login1", request.getAttribute("login1"));
		%>
		<script>
		 location.href="../MainPage/mainFrame.jsp";
		</script>
		<% 
	}else{
		%>
		<script>
			alert("아이디가 존재하지않거나 입력하신 비빌번호가 잘못되었습니다.")
		 	location.href="login.jsp";
		</script>
		<% 
	}
%> 
