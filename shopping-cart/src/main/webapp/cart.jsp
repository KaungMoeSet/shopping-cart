<%@page import="java.util.*"%>
<%@page import="com.kaung.model.*"%>
<%@page import="com.kaung.dao.*"%>
<%@page import="com.kaung.connection.DBConnection"%>
<%@page import="com.kaung.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

@SuppressWarnings("unchecked")
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProducts = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DBConnection.getConnection());
	cartProducts = pDao.getAllCartProducts(cart_list);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Cart Page</title>
<%@include file="include/head.jsp"%>
<style type="text/css">
.table tbody td {
	vartical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<%@include file="include/navbar.jsp"%>

	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price : 123$</h3>
			<a class="mx-3 btn btn-primary" href="">Check out</a>
		</div>
		<table class="table table-loght">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProducts) {
				%>
				<tr>
					<td><%= c.getName() %></td>
					<td><%= c.getCategory() %></td>
					<td><%= c.getPrice() %></td>
					<td>
						<form method="post" class="form-inline" action="">
							<input type="hidden" name="id" value="<%= c.getId() %>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-decre" href=""><i
									class="fas fa-minus-square"></i> </a> <input type="text"
									name="quantity" class="form-control" value="1" readonly>
								<a class="btn btn-sm btn-incre" href=""><i
									class="fas fa-plus-square"></i> </a>

							</div>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="">Remove</a></td>
				</tr>
				<%
				}
				}
				%>

			</tbody>
		</table>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
</html>