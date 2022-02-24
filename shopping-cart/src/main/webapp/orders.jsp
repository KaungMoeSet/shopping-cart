<%@page import="java.util.*"%>
<%@page import="com.kaung.connection.DBConnection"%>
<%@page import="com.kaung.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth != null){
		request.setAttribute("auth", auth);
	}
	@SuppressWarnings("unchecked")
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<title>Orders Page</title>
<%@include file="include/head.jsp" %>
</head>
<body>
<%@include file="include/navbar.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
</html>