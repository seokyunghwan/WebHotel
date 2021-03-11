<%@page import="kajastayVO.MemVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYOE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<%=request.getParameter("resIndate")%>
<%MemVo login=(MemVo)session.getAttribute("login1"); %>
<script>
var resinfo = "<%=request.getParameter("resnum")%><%=request.getParameter("restype")%>";
</script>
<script>
<%=request.getParameter("resIndate")%>
$(function () {
IMP.init('imp48511970')
IMP.request_pay({
    pg : 'html5_inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : resinfo,
    amount : Number(100),
    buyer_email : "<%=login.getEmail()%>",
    buyer_name : "<%=login.getId()%>",
    buyer_tel : "<%=login.getTel()%>",
    buyer_addr : '개인주소미입력',
    buyer_postcode : '123-456',
    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        alert(msg);
        location.href="insert_booking.do?name=<%=request.getParameter("resname")%>&id=<%=login.getId()%>&romnum=<%=request.getParameter("resnum")%>&in_date=<%=request.getParameter("resIndate")%>&out_date=<%=request.getParameter("resOutdate")%>&price=<%=request.getParameter("resprice")%>";
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
        location.href="../MainPage/mainFrame.jsp";
    }
    
});
});
</script>
</body>
</html>