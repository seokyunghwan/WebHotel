<%@page import="java.util.Collections"%>
<%@page import="kajastayVO.CpnameVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/calendar.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="../css/RoomList.css?ver=1">
<script>
function checked(type) {
	type.checked = true;
}
function inputCheck(formDate){
	if(formDate.startDate.value){
		var startArr = formDate.startDate.value.split("-");
		var start = Number(startArr[0]+startArr[1]+startArr[2]);
		var todayData = new Date();
		var mm = todayData.getMonth()+1;
		var dd = todayData.getDate();
		if(dd<10) {
		    dd='0'+dd;
		} 
		if(mm<10) {
		    mm='0'+mm;
		} 
		var today = Number(todayData.getFullYear()+""+mm+""+dd);
		if(start<today){
			alert("상세검색오류!!!\n입실날짜가 이미 지나간 날짜입니다.")
			return false;
		}else{
			if(!formDate.endDate.value){
				alert("상세검색오류!!!\n퇴실날짜가 입력되있지 않습니다.")
				return false;
			}else{
				var endArr = formDate.endDate.value.split("-");
				var end = Number(endArr[0]+endArr[1]+endArr[2]);
				if(start<=end){
					
				}else{
					alert("상세검색오류!!!\n퇴실날짜를 입실날짜 이후로 선택해주십시오.")
					return false;
				}
			}
		}
	}else{
		if(formDate.endDate.value){
			alert("상세검색오류!!!\n입실날짜가 입력되있지 않습니다.");
			return false;
		}
	}
	if(formDate.min_price.value && formDate.max_price.value){
		var min = Number(formDate.min_price.value);
		var max = Number(formDate.max_price.value);
		if(min>max){
			alert("상세검색오류!!!\n최소가격이 최대가격보다 큽니다.");
			return false;
		}
	}else if(formDate.min_price.value && !formDate.max_price.value){
		formDate.max_price.value=100000000;
		formDate.min_price.value=Number(formDate.min_price.value);
	}else if(!formDate.min_price.value && formDate.max_price.value){
		formDate.min_price.value=0;
		formDate.max_price.value=Number(formDate.max_price.value);
	}else{
		formDate.max_price.value=100000000;
		formDate.min_price.value=0;
	}
	return true;
}
</script>
<script>
function sort(){
		
	$("#div의 id").load(window.location.href + "#div의 id");
}
</script>
</head>
<body>
	<div class="searchPage">
		<div class="filter_wrap">
			<form action="sear.do" method="post"
				onsubmit="return inputCheck(this)">

				<div class="filter0">
					<h3>날짜</h3>
					<!-- http://gnujava.com/board/article_view.jsp?article_no=5511&menu_cd=24&board_no=11&table_cd=EPAR04&table_no=04 -->
					<input style="width: 80px"
						onclick="fnPopUpCalendar(startDate,startDate,'yyyy-mm-dd');"
						type="text" id="startDate" name="startDate" value="" />~<input
						style="width: 80px"
						onclick="fnPopUpCalendar(endDate,endDate,'yyyy-mm-dd');"
						type="text" id="endDate" name="endDate" value="" />
				</div>

				<div class="filter1">
					<h3>상세조건</h3>
					<input type="reset" value="초기화"> <input type="hidden"
						name="searchbox" value=<%=request.getParameter("searchbox")%>>
					<input type="submit" value="적용">
				</div>

				<div class="filter2">
					<h3>숙소유형</h3>
					<input type="checkbox" id="type1" name="RoomType1" value="모텔">모텔<br>
					<input type="checkbox" id="type2" name="RoomType2" value="호텔">호텔<br>
					<input type="checkbox" id="type3" name="RoomType3" value="리조트">리조트<br>
					<input type="checkbox" id="type5" name="RoomType5" value="게스트하우스">게스트하우스<br>
					<input type="checkbox" id="type6" name="RoomType6" value="펜션">펜션<br>
				</div>

				<div class="filter3">
					<h3>가격</h3>
					<input type="text" style="width: 65px;" name="min_price"
						placeholder="최소금액">~<input type="text"
						style="width: 65px;" name="max_price" placeholder="최대금액">
				</div>
			</form>
		</div>
		<div class="roomsList">
			<div class="priceSort">
				<div id="searchText">
					검색어 :
					<%=request.getParameter("searchbox")%>
				</div>
				<form action="listsortdown.do" method="post">

					<input type="hidden" value="<%=request.getParameter("searchbox")%>"
						name="searchbox">
					<%
						for (int i = 1; i < 7; i++) {
							if (request.getParameter("RoomType" + i) != null) {
					%>
					<input type="hidden"
						value="<%=request.getParameter("RoomType" + i)%>"
						name="RoomType<%=i%>">
					<%
						}
						}
					%>
					<input type="submit" value="낮은가격순">
				</form>
				<form action="listsortup.do" method="post">
					<input type="hidden" value="<%=request.getParameter("searchbox")%>"
						name="searchbox">
					<%
						for (int i = 1; i < 7; i++) {
							if (request.getParameter("RoomType" + i) != null) {
					%>
					<input type="hidden"
						value="<%=request.getParameter("RoomType" + i)%>"
						name="RoomType<%=i%>">
					<%
						}
						}
					%>
					<input type="submit" value="높은가격순">
				</form>
			</div>
			<%
				int count = 0;
				for (int i = 1; i < 7; i++) {
					if (request.getParameter("RoomType" + i) != null) {
						count++;
			%>
			<script>checked(document.getElementById("type<%=i%>"))
			</script>
			<%
				}
				}
				if (count == 0) {
			%>
			<c:set var="type1">모텔</c:set>
			<c:set var="type2">호텔</c:set>
			<c:set var="type3">리조트</c:set>
			<c:set var="type4">캠핑</c:set>
			<c:set var="type5">게스트하우스</c:set>
			<c:set var="type6">팬션</c:set>
			<%
				} else {
			%>
			<c:set var="type1" value='<%=request.getParameter("RoomType1")%>' />
			<c:set var="type2" value='<%=request.getParameter("RoomType2")%>' />
			<c:set var="type3" value='<%=request.getParameter("RoomType3")%>' />
			<c:set var="type4" value='<%=request.getParameter("RoomType4")%>' />
			<c:set var="type5" value='<%=request.getParameter("RoomType5")%>' />
			<c:set var="type6" value='<%=request.getParameter("RoomType6")%>' />
			<%
				}
				if (request.getParameter("min_price") == null && request.getParameter("max_price") == null) {
			%>
			<c:set var="min">0</c:set>
			<c:set var="max">100000000</c:set>
			<%
				} else {
			%>
			<c:set var="min" value='<%=request.getParameter("min_price")%>' />
			<c:set var="max" value='<%=request.getParameter("max_price")%>' />
			<%
				}
			%>
			<div id="re">
				<c:forEach var="room" items="${roomList1}">
					<c:if
						test="${room.cptype==type1 || room.cptype==type2 || room.cptype==type3 || room.cptype==type4 || room.cptype==type5 || room.cptype==type6}">
						<c:if test="${min<room.allday_pr && max>room.allday_pr}">
							<div class="rooms"
								OnClick="location.href='rm_click.do?name=${room.name}'">
								<div id="imgInText"
									style="background-image: url('../roomImg/${room.first_img}'); ">
									<div id="textCover">
										<div id=text>${room.name}<br>${room.cp_address}</div>
									</div>
								</div>
								<div id="roomInfo">
									<div id="starText">
										<p>별점${room.grade}</p>
									</div>
									<div id="starScore">
										<c:choose>
											<c:when test="${room.grade<=0.6}">
												<img src="../img/star/0.5.png" width="180px" height="60px">
											</c:when>
											<c:when test="${room.grade<=1.2}">
												<img src="../img/star/1.png" width="180px" height="60px">
											</c:when>
											<c:when test="${room.grade<=1.7}">
												<img src="../img/star/1.5.png" width="180px" height="60px">
											</c:when>
											<c:when test="${room.grade<=2.2}">
												<img src="../img/star/2.png" width="180px" height="60px">
											</c:when>
											<c:when test="${room.grade<=2.7}">
												<img src="../img/star/2.5.png" width="180px" height="60px">
											</c:when>
											<c:when test="${room.grade<=3.2}">
												<img src="../img/star/3.png" width="180px" height="60px">
											</c:when>
											<c:when test="${room.grade<=3.7}">
												<img src="../img/star/3.5.png" width="180px" height="60px">
											</c:when>
											<c:when test="${room.grade<=4.2}">
												<img src="../img/star/4.png" width="180px" height="60px">
											</c:when>
											<c:when test="${room.grade<5}">
												<img src="../img/star/4.5.png" width="180px" height="60px">
											</c:when>
											<c:when test="${room.grade==5}">
												<img src="../img/star/5.png" width="180px" height="60px">
											</c:when>
										</c:choose>
									</div>
									<div id="roomPrice">
										대실<b>${room.rent_pr}</b> 입실 <b>${room.allday_pr}</b>
									</div>
								</div>
							</div>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>