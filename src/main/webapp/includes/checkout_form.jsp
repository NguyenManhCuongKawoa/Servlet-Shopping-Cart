
<!-- Modal -->
<div class="modal fade" id="check-out-form" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Insert Your Information - <code class="f-4">BILL</code></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="<c:url value='/orders'/>" method="post">
				  <!-- 2 column grid layout with text inputs for the first and last names -->
				  <div class="row mb-1">
				    <div class="col">
				      <div class="form-outline">
				        <label class="form-label" for="form6Example1">Name</label>
				        <input type="text" id="form6Example1" name = "name" class="form-control" />
				      </div>
				    </div>
				    <div class="col">
				      <div class="form-outline">
				        <label class="form-label" for="form6Example2">Phone</label>
				        <input type="text" id="form6Example2" name="phone" class="form-control" />
				      </div>
				    </div>
				  </div>
				
				  <!-- Text input -->
				  <div class="form-outline mb-1">
				    <label class="form-label" for="form6Example4">Address</label>
				    <input type="text" id="form6Example4" name="address" class="form-control" />
				  </div>
				
				  <!-- Message input -->
				  <div class="form-outline mb-1">
				    <label class="form-label" for="form6Example7">Additional information</label>
				    <textarea class="form-control" name="more-info" id="form6Example7" rows="4"></textarea>
				  </div>
				
				
				  <!-- Submit button -->
				  <button type="submit" class="btn btn-success btn-block my-2 w-50 mx-auto">Place order</button>
				</form>
				<div class="mt-2 p-2 border-top">
				
				   <h6 class="text-center fs-4 text-decoration-underline" >Products</h5>
				   <h3 class="">Total Price: $${totalPrice} </h3>
				   <table class="table table-light">
						<thead>
							<tr>
								<th scope="col">Image</th>
								<th scope="col">Name</th>
								<th scope="col">Category</th>
								<th scope="col">Price</th>
								<th scope="col">Quantity</th>
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
										<img style="width:3rem; height: 3rem; object-fit: cover;" src="${cart.getProduct().getImageUrl()}" class="img-thumbnail" alt="avatar"/>	
									</td>
									<td>${cart.getProduct().getName()}</td>
									<td>${cart.getProduct().getCategory().getName()}</td>
									<td>${cart.getProduct().getPrice()}</td>
									<td class="text-center">${cart.getQuantity()}</td>
									<td>
										<a href="<c:url value='/cart/item?action=remove&id=${cart.getProduct().getId()}'/>" class="btn btn-sm btn-danger">Remove</a>
									</td>
								</tr>
				
							</c:forEach>
						</tbody>
					</table>
			</div>
      </div>
    </div>
  </div>
</div>