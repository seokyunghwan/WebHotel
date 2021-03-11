<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% if(session.getAttribute("login1") != null) {%>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<body>
	<div id="myFrame">
		<jsp:include page="../commonPage/Header.jsp"/>
		<div id="mymenu" style="display: flex; min-height: 600px;">
			<div style="flex-basis: 25%;">
				<jsp:include page="MySidebar.jsp"/>
			</div>
			<div style="flex-basis: 75%; padding-top:50px; padding-bottom: 100px;">
				<%if(request.getParameter("mymenu").equals("1")){%>
					<jsp:include page="mypage.jsp"/>
				<%}else if(request.getParameter("mymenu").equals("9")){%>
					<jsp:include page="register.jsp"/>
				<%}else if(request.getParameter("mymenu").equals("2")){%>
					<jsp:include page="ReservationCheck.jsp"/>
				<%}%>	
			</div>
		</div>
		<jsp:include page="../commonPage/Footer.jsp"/>
	</div>
</body>
<%}else {%>
	<script>
		alert("로그인이 필요한 페이지 입니다.\n로그인페이지로 이동합니다.")
		location.href = "../loginPage/login.jsp";
	</script>
<%}%> 