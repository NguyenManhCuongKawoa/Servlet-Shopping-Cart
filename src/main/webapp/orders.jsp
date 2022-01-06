<%@include file="includes/importTag.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Shopping Order</title>
	<%@include file="includes/head.jsp" %>
</head>
<body>
	<%@include file="includes/navbar.jsp" %>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${orders == null || orders.size() == 0}" >
					<p class="text-danger">Nothing here</p>
				</c:if>
				<c:forEach items="${orders}" var="order">
					<tr>
						<td>${order.getO_date()}</td>
						<td>${order.getProduct().getName()}</td>
						<td>${order.getProduct().getCategory()}</td>
						<td>${order.getO_quantity()}</td>
						<td>${order.getProduct().getPrice()}</td>
						<td>
							<a class="btn btn-sm btn-danger" href="<c:url value='/orders?action=remove&id=${order.getO_id()}'/>">Cancel Order</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<%@include file="includes/footer.jsp" %>
	<%@include file="includes/script.jsp" %>
</body>
</html>