<%@page import="kajastayVO.MemVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/MySidebar.css?after">
<title>Insert title here</title>
</head>
<body>
	<nav id="sideMenu">
		<ul>
			<li><a class="menu" href="select_bk.do?id=${login1.id}"><h2>예약 내역</h2></a></li>
			<li><a class="menu" href="../myPage/MyFrame.jsp?mymenu=1"><h2>내 정보 관리</h2></a></li>
			<%if(session.getAttribute("login1") != null) {
				MemVo mvo = (MemVo)session.getAttribute("login1");
				if(mvo.getType().equals("사장")) {%>
					<li><a class="menu" id="register" href="MyFrame.jsp?mymenu=9"><h2>업소등록</h2></a></li>
				<%}
			}%>
		</ul>
	</nav>

</body>
</html>


