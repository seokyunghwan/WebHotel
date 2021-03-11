<%@page import="kajastayVO.MemVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="../js/header.js" defer></script>
    <link rel="stylesheet" href="../css/Header.css">
    <title>Nav bar</title>
</head>
<%
MemVo login=(MemVo)session.getAttribute("login1");
%>
<script>

</script>
<body>
    <nav class="navbar">
        <div class="navbar_logo">
            <a href="../MainPage/mainFrame.jsp">Kaja Stay</a>
        </div>

        <ul class="navbar_menu"> 
      
        	<% if(session.getAttribute("login1") != null) {%>
            <li><a href="select_bk.do?id=<%=login.getId()%>">예약내역</a></li>
            <%} else { %>
            <li><a href="../loginPage/login.jsp?nologin=1">예약내역</a></li>
            <% } %>
           	<% if(session.getAttribute("login1") != null) {%>
            <li><a href="../myPage/MyFrame.jsp?mymenu=1">${login1.memname}님</a></li>
            <li><a href="../loginPage/sessiondel.jsp">로그아웃</a></li>
            <%} else { %>
            <li><a href="../loginPage/login.jsp">로그인</a></li>
            <% } %>
        </ul>

        <div class="navbar_menu2">
            <!-- 검색할-->
            <form action="sear.do" method="post" onsubmit="return check()">
            <li><input class="navbar__searchbox" id="searchbox" type="search" name="searchbox" onkeyup="chkword(this)" placeholder="검색할 단어를 입력하세요."></li>
            <input class="navbar_searchBtn" type="submit" value="검색">
            </form>
            
            <li><a href="#" class="navbar__toggleBtn"> <img width="28px" src="../img/menu.png"> </a> </li>
        <!-- 이미지 출처 https://iconmonstr.com/menu-1-png/-->
        
        </div>
    </nav>
</body>
</html>