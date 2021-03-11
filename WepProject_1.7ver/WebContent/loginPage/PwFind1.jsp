<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/Pwfind.css">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap_pwfind">
		<h1>비밀번호 재설정</h1>
		<br>
		<h3>회원가입시 등록한 아이디를 입력하세요</h3>
		<br>
		<form action="forgotPW.do" method="post">
		
			<input type="text" name="eid" required placeholder="아이디" oninvalid="this.setCustomValidity('아이디를 입력해주세요')"	oninput="setCustomValidity('')"><br> <br> 
			<input type="email" name="email" required placeholder="이메일" oninvalid="this.setCustomValidity('이메일을 입력해주세요')"	oninput="setCustomValidity('')"><br> <br> 
			
			<input type="submit" value="확인">
			
		</form>
	</div>
</body>
</html>