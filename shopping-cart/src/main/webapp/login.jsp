<%@page import="java.util.*"%>
<%@page import="com.kaung.connection.DBConnection"%>
<%@page import="com.kaung.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth != null){
		response.sendRedirect("index.jsp");
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
<title>Login Page</title>
<%@include file="include/head.jsp"%>
</head>
<body>
<%@include file="include/navbar.jsp" %>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>

			<form method="post" action="user-login">
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label> <input
						type="email" class="form-control" name="login-email"
						placeholder="Enter email" required>
						
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" name="login-password"
						placeholder="Password" required>
				</div>
				
				<div class="text-center">
				<button type="submit" class="btn btn-primary">Login</button>
				</div>
				
			</form>
		</div>
	</div>

	<%@ include file="include/footer.jsp"%>
</body>
</html>