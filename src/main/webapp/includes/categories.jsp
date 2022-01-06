<%@include file="./importTag.jsp" %>

<style>
	.category-wrapper::-webkit-scrollbar {
	    display: none; /* for Chrome, Safari, and Opera */
	}
</style>

<div class="mb-4 category-wrapper" style="overflow-x: scroll;">
	<div id="list-category" class="list-group flex-row flex-lg-column " >
	  <div class="d-none d-lg-block card-header text-center py-2 fs-4">Categories</div>
	  <c:if test = '${sessionScope.auth != null && sessionScope.auth.getRole().equals(Role.ADMIN)}'>
 		 <button class="list-group-item list-group-item-action d-flex alidn-items-center" style="background-color: #c8f1e3;" 
	  	  		onclick=""
	  	  >
	  	  	<div class="me-2 text-success fs-4 d-flex justify-content-center align-items-center " style="width: 30px; height: 30px; border-radius: 50%; object-fit: cover; box-shadow: rgba(0, 0, 0, 0.15) 0px 3px 3px 0px;">
	  	  		<i class="fas fa-plus" style="user-select: auto;"></i>
	  	  	</div>
		  	<span class="fs-5 text-nowrap">New Category</span>
		  </button>
      </c:if>
	  <button class="category-item list-group-item list-group-item-action d-flex alidn-items-center <c:if test="${categoryActive == -1}">active</c:if>" 
  	  		onclick="handleGetProducts(this, `<c:url value='/api/products'/>`, `<c:url value='/'/>`)"
  	  		data-id="-1"
  	  >
	  	<img class="me-2" style="width: 30px; height: 30px; border-radius: 50%; object-fit: cover; box-shadow: rgba(0, 0, 0, 0.15) 0px 3px 3px 0px;" src="data:image/png;base64,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">
	  	<span class="fs-5 text-nowrap">All Products</span>
	  </button>
	  <c:forEach items="${categories}" var="c">
	  	  <button class="category-item list-group-item list-group-item-action d-flex alidn-items-center <c:if test='${categoryActive == c.getId()}'>active</c:if>" 
	  	  		onclick="handleGetProducts(this, `<c:url value='/api/products/category?id=${c.getId()}'/>`, `<c:url value='/products/category?id=${c.getId()}'/>`)"
	  	  		data-id="${c.getId() }"
	  	  >
		  	<img class="me-2" style="width: 30px; height: 30px; border-radius: 50%; object-fit: cover; box-shadow: rgba(0, 0, 0, 0.15) 0px 3px 3px 0px;" src="${c.getImageUrl()}">
		  	<span class="fs-5 text-nowrap">${c.getName()}</span>
		  </button>
	  </c:forEach>
	  
	</div>
</div>