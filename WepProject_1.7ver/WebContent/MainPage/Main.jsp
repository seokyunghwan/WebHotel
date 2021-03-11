<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="../css/Main.css?after">
</head>
<body>
	<div class="main">

		<!-- 메인화면이미지 -->
		<div id="main_img"></div>
	
		<!-- 메인화면 업종별검색버튼 -->
		<div id="main_Button">
 			<div><button class="btn1" type="button" onclick="location.href='sear.do?searchbox=&RoomType1=모텔'"></button><br>
 				<center><a href="">모텔</a></center>
 			</div>
 			<div><button class="btn2" type="button" onclick="location.href='sear.do?searchbox=&RoomType2=호텔'"></button><br>
 				<center><a href="">호텔</a></center>
 			</div>
 			<div><button class="btn3" type="button" onclick="location.href='sear.do?searchbox=&RoomType6=펜션'"></button><br>
 				<center><a href="">펜션</a></center>
 			</div>
 			<div><button class="btn4" type="button" onclick="location.href='sear.do?searchbox=&RoomType3=리조트'"></button><br>
 				<center><a href="">리조트</a></center>
 			</div>
 			<div><button class="btn5" type="button" onclick="location.href='sear.do?searchbox=&RoomType5=게스트하우스'"></button><br>
 				<center><a href="">게스트 하우스</a></center>
 			</div>
		</div>
	
		<!-- 이벤트및 소식 -->
		<div class="main_news">
			<h1>오늘의 소식</h1>
			<div class="news_table">
				<div> 
					<img src="../img/motel.png"/>
					<a href="" target="_blank">
					<strong>kajastay 비즈니스</strong><br>
					출장부터 복지까지<br/>kajastay 비즈니스로 스마트하게</a>
				</div>	
				<div> 
					<img src="../img/motel.png"/>
					<a href="" target="_blank"><strong>kajastay 비즈니스</strong><br>
					출장부터 복지까지<br/>kajastay 비즈니스로 스마트하게</a>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>