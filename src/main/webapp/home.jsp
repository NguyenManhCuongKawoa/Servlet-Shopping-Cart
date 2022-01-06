<%@page import="com.babyboy.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.babyboy.connection.DBConnection"%>
<%@include file="includes/importTag.jsp" %>
<%@page import="com.babyboy.model.User"%>

<!DOCTYPE html>
<html>
<head>
	<title>Shopping</title>
	<%@include file="includes/head.jsp" %>
</head>
<body>

	<%@include file="includes/navbar.jsp" %>
	
	<div class="container">
	 	<c:if test = '${sessionScope.auth != null && sessionScope.auth.getRole().equals(Role.ADMIN)}'>
	 		<div class="card-header text-center my-3">Welcome Admin "${sessionScope.auth.getName()}"!! Have a good day!!</div>
	 	</c:if>
	 	<c:if test = '${sessionScope.auth == null || sessionScope.auth.getRole().equals(Role.USER)}'>
			<div class="card-header text-center my-3">Welcome To My Page. Give me your feedback, thank so much!!</div>
		</c:if>
		<div class="row flex-column flex-lg-row flex-nowrap">
<!-- 			Body Left d-none d-lg-block -->
			<div class="col-lg-3"> 
<!-- 				Categories -->
				<%@include file="includes/categories.jsp" %>
			</div>
			
<!-- 			Body Right -->
			<div class="col-12 col-lg-9">
<!-- 				Begin: Error id product -->
<%-- 				<c:if test="${sessionScope.id_error != null && sessionScope.id_error == true}" > --%>
<!-- 					<p class="text-danger">Add to cart is fail, Something was wrong!!!</p> -->
<%-- 				</c:if> --%>
<!-- 				End: Error id product -->
				<div class="row">
<!-- 				   Begin: Search & Sort & Filter & Something else -->
					<div class="pb-4">
						<div class="">
							<form class="d-flex mb-0" action="<c:url value='/search'/>" method="get">
						      <input id="search-product" name="keyword" class="form-control me-2" type="search" placeholder="Enter name of product ..." aria-label="Search">
<!-- 						      <button class="btn btn-outline-success" type="submit" onclick="handleSearchProduct()">Search</button>				 -->
						      <button class="btn btn-outline-success" type="submit"">Search</button>				
							</form>
						</div>
						<div class="d-flex flex-column flex-sm-row align-items-center justify-content-between py-4 border-bottom flex-nowrap">
							<div class="me-4 w-sm-auto mb-3 mb-sm-0">
								<!-- Example single danger button -->
								<div class="btn-group w-80">
								  <button type="button" class="btn btn-outline-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
								    Sort Products
								  </button>
								  <ul class="dropdown-menu">
								    <li><a class="dropdown-item" onclick="sortProducts('name')">By Name</a></li>
								    <li><a class="dropdown-item" onclick="sortProducts('price')">By Price</a></li>
								    <li><a class="dropdown-item" onclick="sortProducts('random')">Random Order</a></li>
								    <li><hr class="dropdown-divider"></li>
								    <li><a class="dropdown-item" onclick="sortProducts('default')">Default Order</a></li>
								  </ul>
								</div>
							</div>						
							<div class="">
								<form class="d-flex align-items-center mb-0">
									
									<div class="d-flex align-items-center me-2" >
										<label>Price: </label>
										
										<select class="form-select ms-1" aria-label="Default select example" sylte="hover:pointer">
										  <option selected>All Products</option>
										  <option value="1">Greater than $100</option>
										  <option value="2">Greater than $200</option>
										  <option value="3">Greater than $500</option>
										  <option value="3">Greater than $1000</option>
										</select>
									</div>
									
									<div class="d-flex align-items-center">
										<label>Size: </label>
										
										<select class="form-select ms-1" aria-label="Default select example" sylte="hover:pointer" 
											onchange="developping('This Feature is developping!!')">
										  <option selected>All Products</option>
										  <option value="1">X</option>
										  <option value="2">M</option>
										  <option value="3">L</option>
										  <option value="3">XL</option>
										  <option value="3">XLL</option>
										</select>
									</div>
								
									<div class="ms-2">
										<button class="btn btn-outline-success" type="submit">Filter</button>
									</div>
								</form>
							</div>						
						</div>
					</div>
<!-- 				   End: Search & Sort & Something else -->
				</div>
				<div >	
<!-- 					Begin: List Product -->
					<div id="id-wrapper-product">
						<c:if test="${productsJson != null}" >
							<input style="width:0; height: 0; position:absolute;" id="products_json" type="hidden" value='${productsJson}' />
						</c:if>
						<div id="id-list-product" class="product-list row" data-masonry='{"percentPosition": true }'>
							<c:if test="${products == null || products.size() == 0}" >
								<div class='w-100 text-center'><div class="text-success " >
									<span class="fs-5">Nothing here...</span>
								</div></div>
							</c:if>
							
							<c:forEach items="${products}" var="product">
								<div class="product-item col-sm-6 col-md-6 col-lg-6 col-xl-4  mb-2">
									<div class="card w-100" style="width: 18rem;">
										<img class="card-img-top" src="<c:url value='${product.getImageUrl()}'/>" alt="Card image cap"/>
										<div class="card-body">
											<h5 class="card-title">${product.getName()}</h5>
											<h6 class="price">Price: $${product.getPrice()}</h6>
											<h6 class="category">Category: ${product.getCategory().getName()}</h6>
											<div class="mt-3 d-flex justify-content-between flex-wrap">	
												<button class="btn btn-success me-1 text-nowrap mb-2 w-100" onclick="handleAddProduct(`<c:url value='/api/carts/add?id=${product.getId()}'/>`)">Add to card</button>					
		<%-- 										<a href="<c:url value='/cart?id=${product.getId()}'/>" class="btn btn-success me-1 text-nowrap mb-2 w-100">Add to card</a> --%>
												<a href="<c:url value='/cart/item?action=buy&id=${product.getId()}'/>" class="btn btn-primary text-nowrap w-100">Buy now</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							
	<%-- 						<c:if test="${products != null && products.size() > 0}" > --%>
	<!-- 							<div class="load-more d-flex justify-content-center mt-4"> -->
	<!-- 								<button class="btn btn-outline-danger"  -->
	<%-- 										onclick="handleGetProductsByCategory(this, `<c:url value='/api/products/category?id=${categorieActive}&page=${currentPage + 1}'/>`)"									 --%>
	<!-- 								>Load More</button> -->
	<!-- 							</div> -->
	<%-- 						</c:if> --%>
						<!-- 					End: List Product -->
		<!-- 					Begin: Pagination -->
						<div class="mt-4"">			
							<c:if test="${numberPage != null && numberPage > 0}" > 
								<nav aria-label="Page navigation ">
								  <ul class="pagination justify-content-center">
								  	<c:if test="${currentPage != null && currentPage == 1}" > 
									    <li class="page-item disabled">
									      <button class="page-link" tabindex="-1" aria-disabled="true">Previous</button>
									    </li>
									</c:if>		
									<c:if test="${currentPage != null && currentPage > 1}" > 
									    <li class="page-item">
									      <button class="page-link"
									      		onclick="handleGetProducts(this, `<c:url value='/api/products?page=${currentPage - 1}'/>`, `<c:url value='?page=${currentPage - 1}'/>`)"
									      >Previous</<button>
									    </li>
									</c:if>	
								    <c:forEach begin="1" end="${numberPage}" var="page">
									    <li class="page-item ${ currentPage == page ? 'active' : '' }">
									    	<button class="page-link"
									    		onclick="handleGetProducts(this, `<c:url value='/api/products?page=${page}'/>`, `<c:url value='?page=${page}'/>`)"
									    	>${page}</<button>
									    </li>
								    </c:forEach>
								    <c:if test="${currentPage != null && currentPage == numberPage}" > 
									    <li class="page-item disabled">
									      <button class="page-link" tabindex="-1" aria-disabled="true">Next</<button>
									    </li>
								    </c:if>	
								    <c:if test="${currentPage != null && currentPage < numberPage}" > 
									    <li class="page-item">
									      <button class="page-link"
												onclick="handleGetProducts(this, `<c:url value='/api/products?page=${currentPage + 1}'/>`, `<c:url value='?page=${currentPage + 1}'/>`)"
										  >Next</<button>
									    </li>
								    </c:if>	
								  </ul>
								</nav>
								
							</c:if>		
						</div>
		<!-- 					End: Pagination -->
							
					</div>
					</div>
				</div>
			</div> 
		</div>

	</div>
	
	
	<%@include file="includes/footer.jsp" %>
	<%@include file="includes/script.jsp" %>
	<script>
	<!-- 	Call Ajax to get products by category -->
		const productsElement = document.getElementById('id-wrapper-product');
		const handleGetProducts = (elmnt, url, his) => {
			
			const parrentClass = '.product-list';
			const childClass = '.product-item'
			
			// Change active category 
			if(elmnt != null && elmnt.classList.contains('category-item')) {
				const categories = document.getElementById('list-category').querySelectorAll('.category-item');
				categories.forEach(category => {
					category.classList.remove('active');
				});
			
				elmnt.classList.add('active');				
			}
			
// 			productsElement.style.height = "auto"
			const oldHTML = productsElement.innerHTML;
			productsElement.innerHTML = `
				<div style="height: 200px;" class='w-100 d-flex flex-column justify-content-center align-items-center text-success'>
					<div class="spinner-border text-success" role="status">
				  	</div>
			  		<div class="fs-5 mt-2">Loading ...</span>
			  	</div>
			`
			
			// Change Data
			const promise = getData(url)
				.then(response => {
					productsElement.innerHTML = response;
					resetMasonry(parrentClass, '');
					window.history.pushState(null, null, his)
				})
				.catch(err => {
					productsElement.innerHTML = err;
				});
		}
		
	<!-- 	Call Ajax to add product to carts -->
		const handleAddProduct = (url) => {
			getData(url)
				.then(response => {
					
// 					alert(response)
					
					// Change quantity of cart 
					const navCartElement = document.getElementById('nav-cart');
					
					if(response == 0) {
						navCartElement.innerHTML = `
							<i class="fas fa-shopping-cart " style="user-select: auto;"></i> Cart
						`
					} else {
						navCartElement.innerHTML = `
							<i class="fas fa-shopping-cart " style="user-select: auto;"></i> 
							Cart
				          	<span class="position-absolute top-10 translate-middle badge rounded-pill bg-success">
						   		` + response + `
						    </span>
						`
					}
					
				})
				.catch(err => {
					alert(err)
				});
		}
		
		
// 		Handle Search Products
// 		const handleSearchProduct = () => {
// 			const inputElement = document.getElementById('search-product');
// 			if(inputElement != null) {
// 				const keyword = inputElement.value;
				
// 				const url = new URL(window.location.href);
// 				let mark = '?';
				
// 				if(url.search == null || url.search != "") {
// 					mark = '&'
// 				} 
				
// 				const hostname = window.location.hostname;
				
// 				let path = window.location.pathname;
// 				const urlHis = path + url.search + mark + 'keyword=' + keyword;
// 				if(!path.includes('products')) {
// 					path += 'products';
// 				}
// 				const urlApi = (path + url.search + mark + 'keyword=' + keyword).replace('ShoppingCart', 'ShoppingCart/api');
// 				console.log(urlHis, urlApi)
// 				handleGetProducts(null, urlApi, urlHis);
// 			}
// 		}

	</script>
</body>
</html>