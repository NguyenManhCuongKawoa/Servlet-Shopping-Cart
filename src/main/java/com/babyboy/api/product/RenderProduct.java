package com.babyboy.api.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babyboy.model.Product;
import com.babyboy.util.json.JsonConverter;

public class RenderProduct {
	public static String getHTMLProduct(List<Product> products, HttpServletRequest request, HttpServletResponse response) {
		String pJson = "<input style=\"width:0; height: 0; position:absolute;\" id=\"products_json\" type=\"hidden\" value='"+JsonConverter.toJson(products)+"' />";
		String prefix = "<div id=\"id-list-product\" class=\"product-list row\">";
		String suffix = "</div>";
		
		if(products != null && products.size() == 0) {
			return pJson + prefix + "<div class='w-100 text-center'><div class=\"text-success \" role=\"status\">\r\n"
					+ "  	<span class=\"fs-5\">Nothing here...</span>\r\n"
					+ "  </div></div>" + suffix;
		}
		
		String res = pJson + prefix ;
		for(Product p : products) {
			res += "<div class=\"product-item col-sm-6 col-md-6 col-lg-6 col-xl-4  mb-2\">\r\n"
					+ "							<div class=\"card w-100\" style=\"width: 18rem;\">\r\n"
					+ "								<img class=\"card-img-top\" src=\""+ p.getImageUrl() + "\" alt=\"Card image cap\"/>\r\n"
					+ "								<div class=\"card-body\">\r\n"
					+ "									<h5 class=\"card-title\">"+ p.getName() + "</h5>\r\n"
					+ "									<h6 class=\"price\">Price: $"+ p.getPrice() + "</h6>\r\n"
					+ "									<h6 class=\"category\">Category: "+ p.getCategory().getName() + "</h6>\r\n"
					+ "									<div class=\"mt-3 d-flex justify-content-between flex-wrap\">	\r\n"
					+ "										<button class=\"btn btn-success me-1 text-nowrap mb-2 w-100\" onclick=\"handleAddProduct('"+ request.getContextPath() +"/api/carts/add?id="+ p.getId() + "')\">Add to card</button>					\r\n"
					+ "										<a href=\"<c:url value='/cart/item?action=buy&id="+ p.getId() + "'/>\" class=\"btn btn-primary text-nowrap w-100\">Buy now</a>\r\n"
					+ "									</div>\r\n"
					+ "								</div>\r\n"
					+ "							</div>\r\n"
					+ "						</div>";
		}
		
		return res + suffix;
	}
	
	public static String getHTMLPagination(int numberPage, int currentPage, Long cId, String contextPath) {
		if(numberPage == 0) return "";
		String prefixHis = "?", prefix = "?";
		if(cId != -1) {
			prefixHis = "/products/category?id=" + cId + "&";
			prefix = "/category?id=" + cId + "&";
		}
		
		String res = "<div class=\"mt-4\"\"><nav aria-label=\"Page navigation \"><ul class=\"pagination justify-content-center\">";
		
		if(currentPage == 1) {
			res += "<li class=\"page-item disabled\"><button class=\"page-link\" tabindex=\"-1\" aria-disabled=\"true\">Previous</button></li>";
		} else {
			res += "<li class=\"page-item\">\r\n"
					+ "	<button class=\"page-link\"\r\n"
					+ "			onclick=\"handleGetProducts(this, '"+ contextPath +"/api/products"+ prefix +"page="+ (currentPage - 1) +"', '"+ contextPath + prefixHis +"page="+ (currentPage - 1) +"')\"\r\n"
					+ "	>Previous</<button>\r\n"
					+ "</li>";
		}
		
		for(int i = 1; i <= numberPage; i++) {
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
}
