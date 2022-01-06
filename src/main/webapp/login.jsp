
<%@include file="includes/importTag.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>Shopping Login</title>
	<%@include file="includes/head.jsp" %>
	
</head>
<body>

	<%@include file="includes/navbar.jsp" %>
	
	<div class="container hidden">
		<div class="row">
			<div class="col-8 col-md-6 col-lg-5 col-xl-4 mx-auto my-5 py-3" style="box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;">
				<div class="text-center fs-2 py-2">User Login</div>
				<hr/>
				<div class="">
					<form action="<c:url value='/login'/>" method="post">
						<div class="form-group mb-2">
							<label>Email Address</label>
							<input class="form-control" name="login-email" type="email" placeholder="Enter your email" required />
						</div>
						<div class="form-group mb-2">
							<label>Password</label>
							<input class="form-control" name="login-password" type="password" placeholder="********" required/>
						</div>
						<div class="form-check mb-2">
						  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						  <label class="form-check-label" for="flexCheckDefault">
						    Remember me
						  </label>
						</div>
						
						<div class="mb-3">
							<button type="submit"  class="btn btn-primary w-100">Login</button>
						</div>
					</form>
					
					<div class="text-center ">OR</div>
					<hr/>
					
					<div class="mb-3">
<!-- 							<button class="btn btn-danger w-100" onclick="handleGoogleLogin()">Login With Google</button> -->
							<div id="gSignIn" class="d-flex justify-content-center"></div> 
					</div>
					<div class="mb-3">
<!-- 							<a class="btn btn-primary w-100" href="https://www.facebook.com/dialog/oauth?client_id=1091291565027080&redirect_uri=http://localhost:8080/ShoppingCart/login?action=facebook">Login With Facebook</a>							 -->
					</div>
					
					<div class="text-center mb-3">
						Do you have an account? <a href="<c:url value='/signup'/>" class="">register here</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="includes/footer.jsp" %>
	<%@include file="includes/script.jsp" %>

	</script>
</body>
</html>