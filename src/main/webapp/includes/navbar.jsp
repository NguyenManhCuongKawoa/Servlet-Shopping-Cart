<%@include file="./importTag.jsp" %>
<%@page import="com.babyboy.model.Role"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
	  <div class="container">
	  	<c:if test = '${sessionScope.auth != null}'>
	  		<div class = "d-flex align-items-center" >
	  			<c:if test = '${sessionScope.auth.getImageUrl() != null}'>
	  				<img style="width:3rem; height: 3rem; object-fit: cover;" src="${sessionScope.auth.getImageUrl()}" class="img-thumbnail" alt="avatar"/>
	  			</c:if>
	  			<c:if test = '${sessionScope.auth.getImageUrl() == null}'>
		  			<img style="width:3rem; height: 3rem; object-fit: cover;" src="https://ih1.redbubble.net/image.1046392292.3346/st,small,845x845-pad,1000x1000,f8f8f8.jpg" class="img-thumbnail" alt="avatar"/>
	  			</c:if>
	  			<a class="fs-5 ms-2 mb-0 text-decoration-none text-black" href="<c:url value='/profile'/>">
	  				${sessionScope.auth.getName()}
	  			</a>
	  		</div>
	  	</c:if>
	  	<c:if test = '${sessionScope.auth == null}'>
		    <a class="navbar-brand" href="<c:url value='/'/>">E-Commerce Shopping Cart</a>  		
	  	</c:if>
	  	
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fs-5">
	        <li class="nav-item border-end" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Home" >
	          <a class="nav-link active " aria-current="page" href="<c:url value='/'/>">
				<i class="fas fa-home "></i> Home
			  </a>
	        </li>
	        <li class="nav-item px-2 " data-bs-toggle="tooltip" data-bs-placement="bottom" title="Cart">
	          <a id="nav-cart" class=" nav-link position-relative" href="<c:url value='/cart'/>">
	          	<i class="fas fa-shopping-cart " style="user-select: auto;"></i> Cart
	          	<c:if test="${sessionScope.carts.size() > 0}">
		          	<span class="position-absolute top-10 translate-middle badge rounded-pill bg-success">
				   		${sessionScope.carts.size()}
				    </span>
			    </c:if>
	          </a>
	        </li>
       		<li class="nav-item mx-1 border-start" >
          		<a class="nav-link" href="<c:url value='/orders'/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Orders">
          			<i class="fas fa-file-invoice" ></i> Orders
          		</a>
          	</li>
	         <c:if test = '${sessionScope.auth != null && sessionScope.auth.getRole().equals(Role.ADMIN)}'>
	         	<li class="nav-item mx-1 border-start" data-bs-toggle="tooltip" data-bs-placement="bottom" title="My Products">
	          		<a class="nav-link" href="<c:url value='/admin/products'/>">
	          			<i class="fas fa-hat-cowboy-side"></i> My Products
	          		</a>
	        	</li>
	         </c:if>
	        <c:if test = '${sessionScope.auth != null}'>
	         	<li class="nav-item mx-1 border-start" >
	         		<c:if test = '${sessionScope.auth.getRole().equals(Role.ADMIN)}'>
		          		<a class="nav-link" href="<c:url value='/admin/bills'/>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Bills">
		          			<i class="fas fa-file-invoice" ></i> Bills
		          		</a>
	          		</c:if>
	        	</li>
	        	<li class="nav-item mx-1 border-start border-end" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Log out">
	          		<a class="nav-link" onclick = "handleGoogleLogout()" href="<c:url value='/logout'/>"> 
<%-- 	          		href="<c:url value='/logout'/>" --%>
	          			<i class="fas fa-sign-out-alt"></i> Log out
	          		</a>
	        	</li>
	      	</c:if>
	      	<c:if test = '${sessionScope.auth == null}'>
	         	<li class="nav-item mx-1 border-end border-start" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Log in">
		          <a class="nav-link" href="<c:url value='/login'/>">
		          	<i class="fas fa-sign-in-alt"></i> Log in
		          </a>
		        </li>
	      	</c:if>
	      </ul>
	    </div>
	  </div>
	</nav>
	