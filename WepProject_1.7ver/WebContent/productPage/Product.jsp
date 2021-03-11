<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="../css/product.css?after">

<script src="../js/product.js" defer></script>
<script src="../js/jquery.js"></script>
<title>Insert title here</title>
<script>
function dateCheck(form){
	if(form.resIndate.value && form.resOutdate.value){
		var indateSplit = form.resIndate.value.split("-");
		var indate = Number(indateSplit[0]+indateSplit[1]+indateSplit[2]);
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
		if(indate>today){
			var outdateSplit = form.resOutdate.value.split("-");
			var outdate = Number(outdateSplit[0]+outdateSplit[1]+outdateSplit[2]);
			if(indate>=outdate){
				alert("퇴실날짜가 입실날짜를 지나갔습니다.\n대실인경우 대실을 이용해주세요")
				return false;
			} else {
				 var con = confirm(form.resIndate.value+"~"+form.resOutdate.value+"까지 \n"+
						 (outdate-indate)+"박"(outdate-indate+1)+"일\n입력하신 정보가 맞습니까?");
			     if ( con == true ) {
			    	 return true;
			     }else if ( con == false ) {
			        alert("취소되었습니다.");
			     }
			     return false;
			}
		}else{
			alert("입실날짜가 이미 지나간 날짜입니다.")
			return false;
		}
		
	}else{
		alert("입,퇴실날짜가 입력되지않았습니다.")
	}	
}
function rentCheck(rent){
	var con = confirm("대실하시려는 날짜 : "+rent.resIndate.value+"\n정보가 맞습니까?");
    if ( con == true ) {
    	rent.resOutdate.value=rent.resIndate.value;
   	 	return true;
    }else if ( con == false ) {
       	alert("취소되었습니다.");
    }
    return false;
} 
</script>
</head>


<body>
<!-- <div class="virtual-box"></div> -->
		
<div class="productinfo">
	<div class="top">
		<div class="left">
			<div id="bpic"><img src="../roomImg/${roomInfo.first_img}" width="500px" height="300px"></div>
			<div class="spic">
				<div class="prev"><img src="../img/arrow.png" style="margin-top:19px"></div>
				<div class="slide_wrapper">
					<ul class="slides" style="list-style:none;">
						<li class="spic on"><img src="../roomImg/motel10.jpg" alt=""></li>
						<li class="spic"><img src="../roomImg/motel11.jpg" alt=""></li>
						<li class="spic"><img src="../roomImg/motel12.jpg" alt=""></li>						
						<li class="spic"><img src="../roomImg/motel21.jpg" alt=""></li>
						<li class="spic"><img src="../roomImg/motel8.jpg" alt=""></li>
						<li class="spic"><img src="../roomImg/motel7.jpg" alt=""></li>
					</ul>
				</div>
				<div class="next"><img src="../img/arrow.png" style="margin-top:19px"></div>
				
			</div>
		</div>
		<div class="right">
			<h3>${roomInfo.name}</h3>
			<p>${roomInfo.cp_address}<br>
				${roomInfo.cp_detail2}
			</p>
				
		</div>
	</div>
	<!-- 탭 -->
	<div class="tab">
	  <button class="tablinks active" onclick="openTab(event, 'tab1')">객실안내/예약</button>
	  <button class="tablinks" onclick="openTab(event, 'tab2')">숙소정보</button>
	  <button class="tablinks" onclick="openTab(event, 'tab3')">리뷰</button>
	</div>
	
	
	<div id="tab1" class="tabcontent">
	
		<c:forEach var="rooms" items="${roomsList}">
			<div class="roomreservation">
				<div class="left">	
					<img src="../roomImg/${rooms.second_img}" width="500px" height="300px">	
				</div>	
				<div class="right">${rooms.romnum} ${rooms.rmtype}
					<div class="half">
						<table style="float:left;">
							<tr>
								<td>대실</td>
							</tr>
							<tr>
								<td>가격 : ${rooms.rent_pr}</td>
							</tr>
							<tr>
								<td>
									<%if(session.getAttribute("login1")==null){%>
										예약은 로그인이 필요합니다
									<%}else{%>
										<form action="../paymentPage/paymentFrame.jsp">
											<input type="hidden" value="${roomInfo.name}" name="resname">
											<input type="hidden" value="${rooms.romnum}" name="resnum">
											<input type="hidden" value=":${rooms.rmtype}:대실" name="restype">
											<input type="hidden" value="${rooms.rent_pr}" name="resprice">
											대실날짜
											<input type="date" name="resIndate"><br>
											<input type="hidden" name="resOutdate"><br><br>
											<input type="submit" value="예약" onsubmit="return rentCheck(this)">
										</form>
									<%} %>
								</td>
							</tr>
						</table>
					</div>
					<div class="half">
						<table style="float:left;">
							<tr>
								<td>숙박</td>
							</tr>
							<tr>
								<td>가격 : ${rooms.allday_pr}</td>
							</tr>
							
							<tr>
								<td>
									<%if(session.getAttribute("login1")==null){%>
										예약은 로그인이 필요합니다
									<%}else{%>
										<form action="../paymentPage/paymentFrame.jsp" >
											<input type="hidden" value="${roomInfo.name}" name="resname">
											<input type="hidden" value="${rooms.romnum}" name="resnum">
											<input type="hidden" value="ㅣ${rooms.rmtype}ㅣ숙박" name="restype">
											<input type="hidden" value="${rooms.allday_pr}" name="resprice">
											입실날짜
											<input type="date" name="resIndate"><br>
											퇴실날짜
											<input type="date" name="resOutdate"><br><br>
											<input type="submit" value="예약" onsubmit="return dateCheck(this)">
										</form>
									<%} %>
									
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div id="tab2" class="tabcontent" >${roomInfo.cp_tel}<br>${roomInfo.cp_detail}</div>
	<div id="tab3" class="tabcontent" > 침대가 편함</div>

</div>



</body>
</html>