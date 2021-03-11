<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="../js/jquery.js"></script>
<style>
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#777;}

.reviewPage{
	width:800px;
}

.star_rating{
	display:inline-block;
	margin-left:100px;
}

.rating{
	display:inline-block;
	margin-left:130px;
}

.review{
	display:inline-block;
}

</style>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
	<div class="reviewPage">
	<%=request.getParameter("review_name")%>
	<%=request.getParameter("review_id")%>
	<%=request.getParameter("review_rmtype")%>
	<%=request.getParameter("review_bkcode")%>
	<form action="review.do" method="post">
		<div>
			<hr>
			<span>숙박후기 쓰기</span>
			<hr>
		</div>
		
		<div>
		<span>별점</span>
<!-- 			<p class="star_rating"> -->
<!-- 			    <a href="#" class="on">★</a> -->
<!-- 			    <a href="#">★</a> -->
<!-- 			    <a href="#">★</a> -->
<!-- 			    <a href="#">★</a> -->
<!-- 			    <a href="#">★</a> -->
<!-- 			</p> -->
<!-- 			<hr> -->
			<p class="rating">
				<input type="text" name="grade" placeholder="0~5를 입력해주세요.">
			</p>
		</div>
		<div>
			<span>숙박후기</span>
			<p class="review">
				<textarea cols="80" rows="5" style="resize: none; margin-left:100px;" name="revuwe_str"></textarea>
			</p>
		</div>
		<input type="hidden" value="<%=request.getParameter("review_name")%>" name="name">
		<input type="hidden" value="<%=request.getParameter("review_id")%>" name="id">
		<input type="hidden" value="<%=request.getParameter("review_rmtype")%>" name="rmtype">
		<input type="hidden" value="<%=request.getParameter("review_bkcode")%>" name="bkcode">
		<input type="submit" value="후기 등록" style="float:right;">
	</form>
	</div>
	

	


</body>

<script>
$('.star_rating a').click(function() {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
    return false;
});
</script>

</html>