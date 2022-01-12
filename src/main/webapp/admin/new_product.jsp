<%@include file="../includes/importTag.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New Product</title>
	<%@include file="../includes/head.jsp" %>
</head>
<body>

	<%@include file="../includes/navbar.jsp" %>
	
	<div class="card-header text-center py-5 my-3">
		<h4 class="fs-1 text-success">My Shop</h4>
		<div>
			<a href="<c:url value='/'/>" clas="fs-3">Home</a> - Shop
		</div>
	</div>
	
	<div class="container">
		<%@include file="./form_new_product.jsp" %>
	</div>

	<%@include file="../includes/footer.jsp" %>
	<%@include file="../includes/script.jsp" %>
</body>
</html>