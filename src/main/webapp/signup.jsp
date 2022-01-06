<%@include file="includes/importTag.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Sign up</title>
	<%@include file="includes/head.jsp" %>
	
	<style>
		body {
	    	background-color: #f2f7fb
		}
		
		.login-block {
		    margin: 30px auto;
		    min-height: 93.6vh
		}
		
		.login-block .auth-box {
		    margin: 20px auto 0;
		    max-width: 450px !important
		}
		
		.card {
		    border-radius: 5px;
		    -webkit-box-shadow: 0 0 5px 0 rgba(43, 43, 43, .1), 0 11px 6px -7px rgba(43, 43, 43, .1);
		    box-shadow: 0 0 5px 0 rgba(43, 43, 43, .1), 0 11px 6px -7px rgba(43, 43, 43, .1);
		    border: none;
		    margin-bottom: 30px;
		    -webkit-transition: all .3s ease-in-out;
		    transition: all .3s ease-in-out;
		    background-color: #fff
		}
		
		.card .card-block {
		    padding: 1.25rem
		}
		
		.f-80 {
		    font-size: 80px
		}
		
		.form-group {
		    margin-bottom: 1.25em
		}
		
		.form-material .form-control {
		    display: inline-block;
		    height: 43px;
		    width: 100%;
		    border: none;
		    border-radius: 0;
		    font-size: 16px;
		    font-weight: 400;
		    padding: 9px;
		    background-color: transparent;
		    -webkit-box-shadow: none;
		    box-shadow: none;
		    border-bottom: 1px solid #ccc
		}
		
		.btn-md {
		    padding: 10px 16px;
		    font-size: 15px;
		    line-height: 23px
		}
		
		.btn-primary {
		    background-color: #4099ff;
		    border-color: #4099ff;
		    color: #fff;
		    cursor: pointer;
		    -webkit-transition: all ease-in .3s;
		    transition: all ease-in .3s
		}
		
		.btn {
		    border-radius: 2px;
		    text-transform: capitalize;
		    font-size: 15px;
		    padding: 10px 19px;
		    cursor: pointer
		}
		
		.m-b-20 {
		    margin-bottom: 20px
		}
		
		.btn-md {
		    padding: 10px 16px;
		    font-size: 15px;
		    line-height: 23px
		}
		
		.heading {
		    font-size: 21px
		}
		
		#infoMessage p {
		    color: red !important
		}
		
		.btn-google {
		    color: #545454;
		    background-color: #ffffff;
		    box-shadow: 0 1px 2px 1px #ddd
		}
		
		.or-container {
		    align-items: center;
		    color: #ccc;
		    display: flex;
		    margin: 25px 0
		}
		
		.line-separator {
		    background-color: #ccc;
		    flex-grow: 5;
		    height: 1px
		}
		
		.or-label {
		    flex-grow: 1;
		    margin: 0 15px;
		    text-align: center
		}
	</style>	
</head>
<body>

	<%@include file="includes/navbar.jsp" %>

	<section class="login-block">
	    <div class="container-fluid">
	        <div class="row">
	            <div class="col-sm-12">
	                <form class="md-float-material form-material" id="form-signup" action="<c:url value='/signup'/>" method="POST">
	                    <div class="auth-box card">
	                        <div class="card-block">
	                            <div class="row">
	                                <div class="col-md-12 py-2">
	                                    <h3 class="text-center heading">Sign Up Now.</h3>
	                                </div>
	                            </div>
	                            <div class="form-group form-primary mb-1"> 
	                            	<input onchange="checkName()" type="text" class="form-control" name="name" value="" placeholder="Display name" id="name"/> </div>
	                        
	                            <div class="form-group form-primary mb-1"> 
	                            	<input onchange="checkEmail()" type="email" class="form-control" name="email" value="" placeholder="Email" id="email"/> </div>
	                            <div class="form-group form-primary mb-1"> 
	                            <input onchange="checkTheSamePassword()" type="password" class="form-control" name="password" placeholder="Password" value="" id="password"/> </div>
	                            <div class="form-group form-primary mb-1"> 
	                            	<input type="password" class="form-control" name="password_confirm" placeholder="Repeat password" value="" id="password_confirm" 
	                    				onchange="checkTheSamePassword()" /> 
	                    		</div>
	                            <div class="row mt-4">
	                                <div class="col-md-12 "> 
	                                	<input type="submit" id="input-submit" class="mb-0 w-100 btn btn-primary btn-md btn-block waves-effect text-center m-b-20" name="submit" value="Signup Now" /> 
	                                	<!-- <button type="button" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20"><i class="fa fa-lock"></i> Signup Now </button> -->
	                                </div>
	                            </div>
	                            <div class="or-container my-3">
	                                <div class="line-separator"></div>
	                                <div class="or-label ">or</div>
	                                <div class="line-separator"></div>
	                            </div>
	                            <div class="row justify-content-center">
	                            	<div class="justify-content-center d-flex ">
<!-- 		                                <a class="btn btn-lg btn-google btn-block text-uppercase  btn-outline" href="#" > -->
<!-- 		                                	<img src="https://img.icons8.com/color/16/000000/google-logo.png"> Signup Using Google -->
<!-- 		                                </a> -->
											<div id="gSignIn" class="d-flex justify-content-center"></div> 
	                            	</div>
	                            </div> <br>
	                            <p class="text-inverse text-center">Already have an account? <a href="<c:url value='login'/>" data-abc="true">Login</a></p>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</section>
	
	<%@include file="includes/footer.jsp" %>
	<%@include file="includes/script.jsp" %>
	
	<script>
		const iSubmitComponent = document.getElementById('input-submit');
		
		function checkTheSamePassword() {
			const iComponent = document.getElementById('password');
			const iConfirmComponent = document.getElementById('password_confirm');
			
			if(iComponent.value == "" || iComponent.value != iConfirmComponent.value) {
				iConfirmComponent.style = "border-bottom-color: red";
				iSubmitComponent.classList.add("disabled");
				alert("Password is not empty or Confirm password should the same with password");
				return false;
			} else {
				iConfirmComponent.style = "none";
				iSubmitComponent.classList.remove("disabled");
				return true;	
			}
			
		}
		
		function checkName() {
			const iComponent = document.getElementById('name');
			
			if(iComponent.value == null || iComponent.value == "") {
				iComponent.style = "border-bottom-color: red";
				iSubmitComponent.classList.add("disabled")
				alert("Name is not empty")
				return false;
			} else {
				iComponent.style = "none";
				iSubmitComponent.classList.remove("disabled");
				return true;	
			}
		}
		
		async function checkEmail() {
			const iComponent = document.getElementById('email');
			
			const  email = iComponent.value;
			let res = true;
			if(email == null || email == "") {
				alert("Email is not empty")
				res = false;
			} else if(validateEmail(email) == false) {
				alert("Email is not valid")
				res = false;
			} else {
				const promise = getData("api/check?email=" + email);
				res = await promise.then(res => res == "true")
								.catch(err => false);
				
				if(res == false) {
					alert("email existed!!")
				}
			}
			
			if(res == false) {
				iComponent.style = "border-bottom-color: red";
				iSubmitComponent.classList.add("disabled");
			} else {
				iComponent.style = "none";
				iSubmitComponent.classList.remove("disabled");
			}
			return res;
		} 
		
		iSubmitComponent.addEventListener("click",  (async (e) => {
			
// 			e.preventDefault();
			let res = checkName();
			if(res) {
				console.log("before email")
				res = await checkEmail();
				console.log("afteremail")
			}
			console.log("under" + res)
			
			if(res) {
				console.log("password")
				res = checkTheSamePassword();
			}
			if(res) {
// 				const form = document.getElementById('form-signup');
// 				form.submit();
			}
		}));
	</script>
</body>
</html>