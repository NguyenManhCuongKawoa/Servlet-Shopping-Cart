<%@include file="../includes/importTag.jsp" %>

<div class="form-new-product mx-auto" style="max-width: 600px">
	<c:if test="${product != null }">
		<h4 class="text-center fs-3 mb-4">Update Product</h4>
	</c:if>
	<c:if test="${product == null}">
		<h4 class="text-center fs-3 mb-4">Add New Product</h4>
	</c:if>
	<c:if test="${error != null }">
		<p class="fs-4 mb-4 text-danger">${error}</h4>
	</c:if>
	<form action="<c:url value='/admin/products/item/update'/>" method="post" enctype="multipart/form-data">
		 <c:if test="${product != null }">
		 	<input type="hidden" name="id" value="${product.getId() }" />
		 </c:if>
		<div class="form-floating mb-3">
		  <input type="text" name="name" class="form-control" id="floatingName" placeholder="Enter name of product" required
		  	value="${product != null ? product.getName() : ''}">
		  <label for="floatingName">Enter name of product</label>
		</div>
		<div class="d-flex">
			<div class="form-floating w-50 me-4" >
			  <input type="text" class="form-control" name="price" id="floatingPrice" placeholder="Price of product"
			  	value="${product != null ? product.getPrice() : ''}">
			  <label for="floatingPrice">Price</label>
			</div>
			<div class="category w-50 d-flex">
			    <select class="form-select w-100" name="category" >
			      <c:if test="${product == null }">
					  <option selected>Category</option>			      
					  <c:forEach items="${categories }" var="c">
						  <option value="${c.getName()}" >${c.getName()}</option>
					  </c:forEach>
			      </c:if>
			       <c:if test="${product != null }">
					  <option >Category</option>			      
					  <c:forEach items="${categories }" var="c">
						  <option value="${c.getName()}" ${product.getCategory().getId() == c.getId() ? 'selected' : '' }>${c.getName()}</option>
					  </c:forEach>
			      </c:if>
				</select>
			</div>
		</div>
		<div class="form-floating mt-3">
		  <textarea class="form-control" name="description" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px">
		  	${product != null ? product.getDescription() : ''}
		  </textarea>
		  <label for="floatingTextarea2">Desciption about your product</label>
		</div>
		
		<div class="my-3 border " style="padding: 1rem 0.75rem; border-radius: 5px;">
		  <label for="formFile" class="form-label">Chose image for your product</label>
		  <input class="form-control" type="file" name="image" id="formFile">
		</div>
		
		
		<div class="mb-3">
			<c:if test="${product != null }">
				<button type="submit"  class="btn btn-info w-100">Update Product</button>			
			</c:if>
			<c:if test="${product == null }">
				<button type="submit"  class="btn btn-success w-100">New Product</button>			
			</c:if>
		</div>
	</form>
</div>