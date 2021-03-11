<%@page import="kajastayDAO.KajastayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("user_id");
	KajastayDAO kjdao = new KajastayDAO();
	
	boolean flag = kjdao.id_ck(id);
	
	if(flag){
		out.print("NO");
	}else{
		out.print("OK");
	}
	
%>