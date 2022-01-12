<%@include file="includes/importTag.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Shopping</title>
	<%@include file="includes/head.jsp" %>
</head>
<body style="background-color: #eee;">

	<%@include file="includes/navbar.jsp" %>
	<%@include file="includes/change_password_form.jsp" %>	
	
	<section class="container my-2" >
		<c:if test="${message != null }">
			<p class="text-danger">${message }</p>
	    </c:if>
	    <div class="row">
	      <div class="col-lg-4">
	        <div class="card mb-4">
	          <div class="card-body text-center">
	            <img src="${sessionScope.auth.getImageUrl() }" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
	            <h5 class="my-3">${sessionScope.auth.getName() }</h5>
	            <p class="text-muted mb-1">Shopping Now</p>
	            <p class="text-muted mb-4">Happiness is not in money, But in SHOPPING</p>
	            <div class="d-flex justify-content-center mb-2">
<!-- 	              <button type="button" class="btn btn-primary">Follow</button> -->
<!-- 	              <button type="button" class="btn btn-outline-primary ms-1">Change Password</button> -->
	              <button class="btn btn-outline-primary ms-1" data-bs-toggle="modal" href="#change-password-form" role="button">
	              	Change Password
	              </button>
	            </div>
	          </div>
	        </div>
	        <div class="card mb-4 mb-lg-0">
	          <div class="card-body p-0">
	            <ul class="list-group list-group-flush rounded-3">
	              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
	                <i class="fas fa-globe fa-lg text-warning"></i>
	                <p class="mb-0">https://mdbootstrap.com</p>
	              </li>
	              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
	                <i class="fab fa-github fa-lg" style="color: #333333;"></i>
	                <p class="mb-0">mdbootstrap</p>
	              </li>
	              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
	                <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
	                <p class="mb-0">@mdbootstrap</p>
	              </li>
	              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
	                <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
	                <p class="mb-0">mdbootstrap</p>
	              </li>
	              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
	                <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
	                <p class="mb-0">mdbootstrap</p>
	              </li>
	            </ul>
	          </div>
	        </div>
	      </div>
	      <div class="col-lg-8">
	        <div class="card mb-4">
	          <div class="card-body">
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Full Name</p>
	              </div>
	              <div class="col-sm-9">
	                <p class="text-muted mb-0">${sessionScope.auth.getName() }</p>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Email</p>
	              </div>
	              <div class="col-sm-9">
	                <p class="text-muted mb-0">${sessionScope.auth.getEmail() }</p>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Phone</p>
	              </div>
	              <div class="col-sm-9">
	                <p class="text-muted mb-0">${sessionScope.auth.getPhone() }</p>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Address</p>
	              </div>
	              <div class="col-sm-9">
	                <p class="text-muted mb-0">${sessionScope.auth.getAddress() }</p>
	              </div>
	            </div>
	          </div>
	        </div>
	        <div class="row">
	          <div class="col-md-6">
	            <div class="card mb-4 mb-md-0">
	              <div class="card-body">
	                <p class="mb-4"><span class="text-primary font-italic me-1">More</span> Information</p>
	                <p class="mb-1" style="font-size: .77rem;">Web Design</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
	                <div class="progress rounded mb-2" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="col-md-6">
	            <div class="card mb-4 mb-md-0">
	              <div class="card-body">
	                <p class="mb-4"><span class="text-primary font-italic me-1">More</span> Information</p>
	                <p class="mb-1" style="font-size: .77rem;">Web Design</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
	                <div class="progress rounded" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	                <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
	                <div class="progress rounded mb-2" style="height: 5px;">
	                  <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>

	<%@include file="includes/footer.jsp" %>
	<%@include file="includes/script.jsp" %>
	
	<script type="text/javascript">
		
		// Enable popup form checkout
		enableModal('change-password-form');
	
	</script>
</body>
</html>