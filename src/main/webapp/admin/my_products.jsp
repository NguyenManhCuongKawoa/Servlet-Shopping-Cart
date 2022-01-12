<%@page import="com.babyboy.model.Product"%>
<%@page import="java.util.List"%>
<%@include file="../includes/importTag.jsp" %>
<%@page import="com.babyboy.model.User"%>

<!DOCTYPE html>
<html>
<head>
	<title>My Products</title>
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
	
	<div class="container d-flex flex-lg-row-reverse flex-column my-4">
		<div class="bg-light d-flex flex-column mx-lg-3 p-2 mb-3 mb-lg-0" >
			<h3 class="text-center p-2 border-bottom">INFORMATION</h3>
			<div>
				<div>Total Products: ${products.size()}</div>
				<div>Total price: $${products.stream().map(p -> p.getPrice()).sum()}</div>
				<a class="mx-auto mt-3  btn btn-primary w-100" href="<c:url value='/admin/products/item/update'/>">Add new product</a>
			</div> 
		</div>
		<table class="table table-light mb-0">
			<thead>
				<tr  class="text-center"> 
					<th scope="col">No</th>
					<th scope="col">Image</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${products == null || products.size() == 0}" >
					<p class="text-danger">Enter your product to people can buy it!!</p>
				</c:if>
				<c:if test="${products != null || products.size() > 0}" >
					<c:forEach begin="0" end="${products.size() - 1}" var="index">
						<tr style="vertical-align: middle;">
							<td class="fs-4 text-center">${index + 1}</td>
							<td class="text-center">
								<img style="width:3rem; height: 3rem; object-fit: cover;" src="${products.get(index).getImageUrl()}" class="img-thumbnail" alt="avatar"/>	
							</td>
							<td>${products.get(index).getName()}</td>
							<td  class="text-center">${products.get(index).getCategory().getName()}</td>
							<td  class="text-center"> ${products.get(index).getPrice()}</td>
							<td  class="text-center">
								<a href="<c:url value='/admin/products/item?action=update&id=${products.get(index).getId()}'/>" class="btn btn-sm btn-info">Update</a>
								<a href="<c:url value='/admin/products/item?action=remove&id=${products.get(index).getId()}'/>" class="btn btn-sm btn-danger mt-2 mt-md-0">Remove</a>
							</td>
						</tr>
	
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	
	
	<%@include file="../includes/footer.jsp" %>
	<%@include file="../includes/script.jsp" %>
	
</body>
</html>