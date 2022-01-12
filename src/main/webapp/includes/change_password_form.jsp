
<!-- Modal -->
<div class="modal fade" id="change-password-form" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Change - <code class="f-4">PASSWORD</code></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="<c:url value='/profile?action=change-password'/>" method="post">
        
          <!-- Text input -->
		  <div class="form-outline mb-1">
		    <label class="form-label" for="form6Example4">Old Password</label>
		    <input type="password" id="form6Example4" name="old-password" class="form-control" />
		  </div>
		  <!-- 2 column grid layout with text inputs for the first and last names -->
		  <div class="row mb-1">
		    <div class="col">
		      <div class="form-outline">
		        <label class="form-label" for="form6Example1">New Password</label>
		        <input type="password" id="form6Example1" name = "new-password" class="form-control" />
		      </div>
		    </div>
		    <div class="col">
		      <div class="form-outline">
		        <label class="form-label" for="form6Example2">Confirm Password</label>
		        <input type="password" id="form6Example2" name="confirm-password" class="form-control" />
		      </div>
		    </div>
		  </div>

		  <!-- Submit button -->
		  <button type="submit" class="btn btn-success btn-block my-2 w-50 mx-auto">Change</button>
		</form>
      </div>
    </div>
  </div>
</div>