<%@page import="java.util.GregorianCalendar"%>
<%@page import="kajastayVO.MemVo"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kajastayDAO.KajastayDAO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
MemVo login = (MemVo)session.getAttribute("login1");
%>
<body>
   
   <div>
      <strong style="font-size:30px;">예약 내역</strong>
   </div>
   <div class="reservationFrame">
   <c:forEach var="reser" items="${bkarr}">
   <div class="reservationInfo">
      <table class="reservationtable">
         <tr class="top">
            <td style="color: red;">${reser.name}</td><td rowspan="2"><img src="../roomImg/${reser.second_img}" width="150px" ></td>
         </tr>
         <tr class="bottom">
            <td>${reser.romnum} / n박</td>
         </tr>
         <tr><td colspan="2" style="height:1px;background-color:#f5f5f5;"></td></tr>
         <tr class="top">
            <td>체크인</td>
            <td>${reser.in_date} 12:00</td>
         </tr>         
         <tr>
            <td>체크아웃</td>
            <td>${reser.out_date} 12:00</td>
         </tr>
         
         <tr class="top">
            <td>예약자 이름</td>
            <td>${reser.memname}</td>
         </tr>
         <tr class="bottom">
            <td>연락처</td>
            <td>${reser.tel}</td>
         </tr>
         <tr><td colspan="2" style="height:1px;background-color:#f5f5f5;"></td></tr>
      
         <tr class="top">
            <td>결제정보</td>
         </tr>      
         <tr>
            <td>총 결제금액</td>
            <td class="right" style="color:red;">${reser.price }</td>
         </tr>
         
         <tr>
            <c:set var="indate">${reser.in_date }</c:set>
            <%
            String[] indata=((String)pageContext.getAttribute("indate")).split("-");
            int indate=Integer.parseInt(indata[0]+indata[1]+indata[2]);
            
            Date Data1 = new Date();
            String todayData = new SimpleDateFormat("yyyy-MM-dd").format(Data1);
            String[] todayS=todayData.split("-");
            int today = Integer.parseInt(todayS[0]+""+todayS[1]+""+todayS[2]);
            %>
            <%if(today>=indate){%>
            <td style="padding-top:20px;">이미 사용한 숙박입니다.</td>
            <c:if test="${reser.flag=='NO'}">
               <td>
                  <form action="../myPage/Review.jsp" method="post">
                     <input type="hidden" value="${reser.name}" name="review_name">
                     <input type="hidden" value="<%=login.getId()%>" name="review_id">
                     <input type="hidden" value="${reser.romnum}" name="review_rmtype">
                     <input type="hidden" value="${reser.bkcode}" name="review_bkcode">
                     <input type="submit" value="리뷰쓰기" style="height: 40px; width:180px; margin-top:20px;">
                  </form>
               </td> 
            </c:if>
            <%} else {%> 
            <td>
               <p>예약 중~<p>
            </td>
            <%} %>
         </tr>
      </table>
   </div>
   <br><br>
   </c:forEach>
   </div>
</body>
<style>
.reservationInfo{
   width:500px;
}

.reservationInfo td{
   font-size:20px;
}

.top td{
   padding-top:20px;
}

.bottom td{
   padding-bottom:20px;
}

</style>
</html>