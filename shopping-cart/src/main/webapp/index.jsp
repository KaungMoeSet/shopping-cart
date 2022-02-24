<%@page import="java.util.*"%>
<%@page import="com.kaung.connection.DBConnection"%>
<%@page import="com.kaung.dao.ProductDao"%>
<%@page import="com.kaung.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DBConnection.getConnection());
List<Product> products = pd.getAllProducts();

@SuppressWarnings("unchecked")
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to shopping cart</title>
<%@include file="include/head.jsp"%>
</head>
<body>

	<%@include file="include/navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%><div class="mx-3 my-3">
				<div class="card" style="width: 18rem;">
					<img class="card-img-top" src="product-image/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h5 class="price">Price: <%=p.getPrice() %></h5>
						<h5 class="category">Category: <%=p.getCategory() %></h5>
						<div class="mt-3 d-flex justify-content-between">
							<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">Add to cart</a> <a href="#"
								class="btn btn-primary">Buy Now</a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			}
			%>

		</div>
	</div>

	<%@ include file="include/footer.jsp"%>
</body>
</html>