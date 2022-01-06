
<%@include file="includes/importTag.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>Shopping Cart</title>
	<%@include file="includes/head.jsp" %>
	
	<style type="text/css">
		.table tbody td{
			vertical-align: middle;
		}
		
		.btn-incre, .btn-decre{
			box-shadow: none;
			font-size: 25px;
		}
	</style>	
</head>
<body>
	<%@include file="includes/navbar.jsp" %>
	
	<div class="container my-3">
		<div class="d-flex py-3">
			<h3>Total Price: $${totalPrice} </h3> 
			<a class="mx-3 btn btn-primary" href="<c:url value='/orders?action=order-all'/>">Check Out</a>
		</div>
		<c:if test="${sessionScope.mess != null}" >
			<p class="text-danger">${sessionScope.mess}</p>
			<% session.removeAttribute("mess"); %>
		</c:if>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${carts == null || carts.size() == 0}" >
					<p class="text-danger">Please chose something in my website!!</p>
				</c:if>
				<c:forEach items="${carts}" var="cart">
					<tr >
						<td>
							<img style="width:3rem; height: 3rem; object-fit: cover;" src="${cart.getImageUrl()}" class="img-thumbnail" alt="avatar"/>	
						</td>
						<td>${cart.getName()}</td>
						<td>${cart.getCategory().getName()}</td>
						<td>${cart.getPrice()}</td>
						<td>
							<form action="<c:url value='/cart/item?action=buy'/>" method="post" class="d-flex align-items-center mb-0">
								<input type="hidden" name="id" value="${cart.getId()}" class="form-input" />
								<div class="form-group d-flex align-items-center">
									<a class="btn btn-sm btn-incre" href="<c:url value='/cart/item?action=inc&id=${cart.getId()}'/>"><i class="fas fa-plus-square"></i></a> 
									<div>
										<input type="text" name="quantity" class="form-control"  value="${cart.getQuantity()}" readonly> 
									</div>
									<a class="btn btn-sm btn-decre" href="<c:url value='/cart/item?action=dec&id=${cart.getId()}'/>"><i class="fas fa-minus-square"></i></a>
								</div>
								<div class="">
									<button type="submit" class="btn btn-success btn-sm ms-3 text-nowrap">Buy Now</button>
								</div>
							</form>
						</td>
						<td>
							<a href="<c:url value='/cart/item?action=remove&id=${cart.getId()}'/>" class="btn btn-sm btn-danger">Remove</a>
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