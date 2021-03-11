<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<body>
   <h1 align="center">회원 가입</h1>
   <br>
   <br>
   <br>
   <br>
   <form action="insertmem.do" method="post" name="join" id="form_ac">
      
      <h4 align="center">아이디</h4>
      <p align="center">
         <span id="idstr"><b style="color:red;">[아이디를 입력해주세요]</b></span><br/>
         <input type="text" name="eid" id="idchk" maxlength="12" placeholder="영어,숫자 4~12글자" required>
      </p>
      <h4 align="center">비밀번호</h4>
      <p align="center">
         <input type="password" id="pw" name="epw" placeholder="비밀번호" required>
      </p>
      <h4 align="center">비밀번호 확인</h4>
      <p align="center">
         <input type="password" id="pwc" placeholder="비밀번호 확인" required><br/>
         <span id="pwcstr"></span>
      </p>
      <h4 align="center">이름</h4>
      <p align="center">
         <input type="text" name="name1" placeholder="이름입력창" required>
      </p>
      <h4 align="center">이메일 주소</h4>
      <p align="center">
         <input type="email" name="email" placeholder="이메일 주소" required>
      </p>
      <h4 align="center">전화번호</h4>
      <p align="center">
         <input type="text" name="tel" id="tel" maxlength="13" placeholder="010-0000-0000" required>
      </p>
      <h4 align="center">회원 유형</h4>
      <p align="center">
         <select name="type">
            <option value="고객">고객</option>
            <option value="사장">사장</option>
         </select>
      </p>
      <p align="center">
         <input type="button" value="가입하기" id="sub_btn">
      </p>
   </form>
   <script>
      var idc = false;
   	  var idck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	$(function(){
		$('#sub_btn').click(function(e) {
			if($("#pw").val() == $("#pwc").val() && idck) {
				$('#form_ac').submit();
			} else {
				alert("가입 내용을 확인하세요!!");
			}
		});
		$('#tel').keydown( function(event) {
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
		$('#idchk').on('keyup', function() {
			if($("#idchk").val() == ""){
				$('#idstr').html('<b style="color:red;">[아이디를 입력해주세요]</b>');
				idc=false;
			}
			else if(!idck.test($("#idchk").val())){
				$('#idstr').html('<b style="color:red;">[영문자,숫자 4~12자로 입력해주세요]</b>');
				idc=false;
			} 
			else {
	             $.ajax({
	                 type: "POST",
	                 url: "idck.jsp",
	                 data:{"user_id": $('#idchk').val()},
	                 success: function(data) {
	                    if($.trim(data) == "OK"){
	                       $('#idstr').html('<b style="color:green;">[사용가능한 아이디]</b>');
	                       idc=true;
	                    }else{
	                       $('#idstr').html('<b style="color:red;">[중복 아이디]</b>');
	                       idc=false;
	                    }
	                 }
	              });
			}
		});
		$('#pw').on('keyup', function() {
			if($("#pw").val() != "" && $("#pwc").val() != ""){
				if($("#pw").val() != $("#pwc").val()){
					$('#pwcstr').html('<b style="font-size:16px;color:red;">[비밀번호 불일치!!]</b>');
				} else {
					$('#pwcstr').html('<b style="font-size:16px;color:green;">[비밀번호 일치]</b>');
				}
			}		
		});
		
		$('#pwc').on('keyup', function() {
			if($("#pwc").val() == ""){
				$('#pwcstr').html('<b style="font-size:16px;color:red;">[비밀번호를 확인해주세요]</b>');
			}		         
			else if($("#pw").val() != $("#pwc").val()){
				$('#pwcstr').html('<b style="font-size:16px;color:red;">[비밀번호 불일치!!]</b>');
			} else {
				$('#pwcstr').html('<b style="font-size:16px;color:green;">[비밀번호 일치]</b>');
			}
			
		});
   });
   </script>
</body>
</html>