<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getAttribute("id") != null){
%>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/Pwfind.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<body>
<div class="wrap_pwfind2">
	<h1>새 비밀번호 설정</h1>
	<h4>인증이 완료되었습니다.<br>
	새로운 비밀번호를 입력해주세요.<br>
	</h4>
	<span id="pwcstr"></span>
	<br>
	<form action="repw.do" method="post" id="form_ac">
	<input type="hidden" name="id1" value="${id}">
	새로운 비밀번호:
	<input type="password"  style="width:110px" name="npw1" id="pw" required placeholder="새로운 비밀번호" oninvalid="this.setCustomValidity('비밀번호를 입력해주세요')" oninput = "setCustomValidity('')"><br><br>

	새로운 비밀번호 확인:
	<input type="password"  style="width:110px" id="pwc" required placeholder="새로운 비밀번호" oninvalid="this.setCustomValidity('비밀번호를 입력해주세요')" oninput = "setCustomValidity('')"><br><br>
	
	<input type="button" value="비밀번호 변경"  id="sub_btn"> 
	<a href="../MainPage/mainFrame.jsp"><button type="button">취소</button></a><br>
	</form>
 </div>
 <script>
 $(function(){
	 $('#sub_btn').click(function(e) {
			if($("#pw").val() == $("#pwc").val()) {
					$('#form_ac').submit();
			} else {
				alert('입력정보를 다시 확인하세요.');
				$("#pw").val("");
				$("#pwc").val("");
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
<%
	}else{
 %>
<script>
	alert("비정상 접근!!!")
	location.href = "../MainPage/mainFrame.jsp";
</script>
 <% }%>