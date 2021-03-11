<%@page import="kajastayVO.MemVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemVo mvo = (MemVo)session.getAttribute("login1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/mypage.css">
<title>my_page</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
$(function(){
	$('#btn1').click(function(e2) {
		document.getElementById("in_pw1").style.display = "block";
		document.getElementById("in_pw2").style.display = "block";
		document.getElementById("in_name").style.display = "block";
		document.getElementById("in_email").style.display = "block";
		document.getElementById("in_tel").style.display = "block";
		document.getElementById("btn2").style.display = "block";
		document.getElementById("btn3").style.display = "block";
		for (var i = 1; i <= 5; i++) {
			document.getElementById("b"+i).style.display = "block";
		}
		document.getElementById("btn1").style.display = "none";
	});
	$('#btn3').click(function(e2) {
		document.getElementById("in_pw1").style.display = "none";
		document.getElementById("in_pw2").style.display = "none";
		document.getElementById("in_name").style.display = "none";
		document.getElementById("in_email").style.display = "none";
		document.getElementById("in_tel").style.display = "none";
		document.getElementById("btn2").style.display = "none";
		document.getElementById("btn3").style.display = "none";
		for (var i = 1; i <= 5; i++) {
			document.getElementById("b"+i).style.display = "none";
		}
		document.getElementById("btn1").style.display = "block";
	});
	 $('#btn2').click(function(e) {
		if($("#in_pw1").val() == "" && $("#in_name").val() == "" && $("#in_email").val() == "" && $("#in_tel").val() == ""){
			alert('변경된 내용이 없습니다.\n다시 확인해주세요.');
		} else {
			if($("#in_pw1").val() == "") {
				$("#in_pw1").val('<%=mvo.getPw()%>');
			}
			if($("#in_pw2").val() == "") {
				$("#in_pw2").val('<%=mvo.getPw()%>');
			}
			if($("#in_name").val() == "") {
				$("#in_name").val('<%=mvo.getMemname()%>');
			}
			if($("#in_email").val() == "") {
				$("#in_email").val('<%=mvo.getEmail()%>');
			}
			if($("#in_tel").val() == "") {
				$("#in_tel").val('<%=mvo.getTel()%>');
			}
			if($("#in_pw1").val() == $("#in_pw2").val()) {
				$('#form_ac').submit();
			} else {
				alert('입력정보를 다시 확인하세요.');
			}
		}
	});
	$('#in_pw1').on('keyup', function() {
		if($("#in_pw1").val() != "" && $("#in_pw2").val() != ""){
			if($("#in_pw1").val() != $("#in_pw2").val()){
				$('#pwcstr').html('<b style="font-size:16px;color:red;">[비밀번호 불일치!!]</b>');
			} else {
				$('#pwcstr').html('<b style="font-size:16px;color:green;">[비밀번호 일치]</b>');
			}
		}		
	});	
	$('#in_pw2').on('keyup', function() {
		if($("#in_pw2").val() == ""){
			$('#pwcstr').html('<b style="font-size:16px;color:red;">[비밀번호를 확인해주세요]</b>');
		} else if($("#in_pw1").val() != $("#in_pw2").val()){
			$('#pwcstr').html('<b style="font-size:16px;color:red;">[비밀번호 불일치!!]</b>');
		} 
		else {
			$('#pwcstr').html('<b style="font-size:16px;color:green;">[비밀번호 일치]</b>');
		}	
	});
	$('#in_tel').keydown( function(event) {
		var key = event.charCode || event.keyCode || 0;
		$text = $(this);
		if (key !== 8 && key !== 9) {
			if ($text.val().length === 3) $text.val($text.val()+ '-');
			if ($text.val().length === 8) $text.val($text.val()+ '-');
		} else if (key == 8) {
			if ($text.val().length === 5) $text.val($text.val().substr(0, 4));
			if ($text.val().length === 10) $text.val($text.val().substr(0,9));
		}
		return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
		// Key 8- 백스페이스, Key 9- 탭, Key 46- Delete || 0 ~ 9까지, Key 96 ~ 105- 넘버패트
		// 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
	});
});
</script>
</head>
<body>
	<div id="mypage">
		<form action="myInfo.do" id="form_ac" method="post">
			<strong>내정보 관리</strong>
			
			<div id="page">
				<b id="a">아이디</b>
				<span>${login1.id}</span>
				<input type="hidden" name="id" value="${login1.id}">
			</div>
			
			<div id="page">
				<b id="a">비밀번호</b>
				<span>${login1.pw}</span><br>
				<span id="sc">개인 정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</span><br><br>
				<span id="pwcstr"></span><br/>
				<b id="b1">변경할 비밀번호</b><input type="password" id="in_pw1" name="in_pw1">
				<b id="b2">비밀번호 확인</b><input type="password" id="in_pw2">
			</div>	
			
			<div id="page">	
				<b id="a">이름</b>
				<span>${login1.memname}</span><br><br>
				<b id="b3">변경할 이름</b><input type="text" id="in_name" name="in_name" required>
			</div>
			
			<div id="page">	
				<b id="a">이메일</b>
				<span>${login1.email}</span><br><br>
				<b id="b4">변경할 이메일</b><input type="text" id="in_email" name="in_email" value="<%=mvo.getEmail()%>" required>
			</div>
			
			<div id="page">	
				<b id="a">전화번호</b>
				<span>${login1.tel}</span><br>
				<span id="sc">개인 정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</span><br><br>
				<b id="b5">변경할 전화번호</b><input type="tel" id="in_tel" name="in_tel" required>
			</div>	
			
			<div id="btn">
				<input type="button" id="btn1" value="수정하기">
				<input type="button" id="btn2" value="수정완료">
				<input type="reset" id="btn3" value="수정취소">
			</div>
		</form>
	</div>

</body>
</html>