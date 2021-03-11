<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/login.css">
<title>Insert title here</title>
</head>
<body>

	<% /* 로그인이필요한메뉴에서 튕겨서 날아올때 팝업출력 */
		if(request.getParameter("nologin")!=null){%>
		<script>alert("로그인이 필요한 메뉴입니다.")</script>
	<%}%>
	
	<div class="wrap_login">
		<h1>
			Welcome to KAJA STAY <br>
			<td><img src="../roomImg/motel11.jpg"></td>
		</h1>
			
		<form action="kajaLogin.do" method="post"><!-- 로그인서블릿으로보내는 폼 -->
			<input type="text" name="eid" placeholder="아이디" required><br> 
			<input type="password" name="epw" placeholder="비밀번호" required><br>
			<input type="submit" value="로그인"><br> 
			<a href="PwFind1.jsp"><span>비밀번호 재설정</span></a> <a href="join.jsp"><span>회원가입</span></a>
		</form>
	</div>
</body>
</html>