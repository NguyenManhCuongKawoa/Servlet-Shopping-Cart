/**
 * Render Product
 */

function getHTMLProducts(products, contextPath) {
	let prefix = "<div id=\"id-list-product\" class=\"product-list row\">";
	let suffix = "</div>";
	
	if(products != null && products.length == 0) {
		return prefix + "<div class='w-100 text-center'><div class=\"text-success \" role=\"status\">\r\n"
				+ "  	<span class=\"fs-5\">Nothing here...</span>\r\n"
				+ "  </div></div>" + suffix;
	}
	
	let res = prefix;
		products.forEach(p => {
			res += "<div class=\"product-item col-sm-6 col-md-6 col-lg-6 col-xl-4  mb-2\">\r\n"
					+ "							<div class=\"card w-100\" style=\"width: 18rem;\">\r\n"
					+ "								<img class=\"card-img-top\" src=\""+ p.imageUrl + "\" alt=\"Card image cap\"/>\r\n"
					+ "								<div class=\"card-body\">\r\n"
					+ "									<h5 class=\"card-title\">"+ p.name + "</h5>\r\n"
					+ "									<h6 class=\"price\">Price: $"+ p.price + "</h6>\r\n"
					+ "									<h6 class=\"category\">Category: "+ p.category.name+ "</h6>\r\n"
					+ "									<div class=\"mt-3 d-flex justify-content-between flex-wrap\">	\r\n"
					+ "										<button class=\"btn btn-success me-1 text-nowrap mb-2 w-100\" onclick=\"handleAddProduct('"+ contextPath +"/api/carts/add?id="+ p.id + "')\">Add to card</button>					\r\n"
					+ "										<a href=\"<c:url value='/cart/item?action=buy&id="+ p.id + "'/>\" class=\"btn btn-primary text-nowrap w-100\">Buy now</a>\r\n"
					+ "									</div>\r\n"
					+ "								</div>\r\n"
					+ "							</div>\r\n"
					+ "						</div>";
		});
		
		return res + suffix;
}


function getHTMLPagination(numberPage, currentPage, cId, contextPath) {
		if(numberPage == 0) return "";
		let prefixHis = "?", prefix = "?";
		if(cId != -1) {
			prefixHis = "/products/category?id=" + cId + "&";
			prefix = "/category?id=" + cId + "&";
		}
		
		let res = "<div class=\"mt-4\"\"><nav aria-label=\"Page navigation \"><ul class=\"pagination justify-content-center\">";
		
		if(currentPage == 1) {
			res += "<li class=\"page-item disabled\"><button class=\"page-link\" tabindex=\"-1\" aria-disabled=\"true\">Previous</button></li>";
		} else {
			res += "<li class=\"page-item\">\r\n"
					+ "	<button class=\"page-link\"\r\n"
					+ "			onclick=\"handleGetProducts(this, '"+ contextPath +"/api/products"+ prefix +"page="+ (currentPage - 1) +"', '"+ contextPath + prefixHis +"page="+ (currentPage - 1) +"')\"\r\n"
					+ "	>Previous</<button>\r\n"
					+ "</li>";
		}
		
		for(let i = 1; i <= numberPage; i++) {
			res += "<li class=\"page-item " + (currentPage == i ? "active" : "" ) + "\">\r\n"
					+ "		 	<button class=\"page-link\"\r\n"
					+ "			onclick=\"handleGetProducts(this, '"+ contextPath +"/api/products"+ prefix +"page="+ i +"', '"+ contextPath + prefixHis +"page="+ i +"')\"\r\n"
					+ "			>" + i + "</<button>\r\n"
					+ "		  </li>";
		}
		
		if(currentPage == numberPage) {
			res += "<li class=\"page-item disabled\"><button class=\"page-link\" href=\"#\" tabindex=\"-1\" aria-disabled=\"true\">Next</<button></li>";
		} else {
			res += "<li class=\"page-item\">\r\n"
					+ "								      <button class=\"page-link\"\r\n"
					+ "											onclick=\"handleGetProducts(this, '"+ contextPath +"/api/products"+ prefix +"page="+ (currentPage + 1) +"', '"+ contextPath + prefixHis +"page="+ (currentPage + 1) +"')\"\r\n"
					+ "									  >Next</<button>\r\n"
					+ "								    </li>";
		}
		
		res += "</ul></nav></div>";
		return res;
}