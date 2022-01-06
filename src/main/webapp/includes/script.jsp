<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" ></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/includes/js/render_product.js" type="text/javascript"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/includes/js/products.js" type="text/javascript"></script> --%>

<!-- Variables -->
<<script type="text/javascript">
</script>

<script>
function sortProducts(type) {
	let products = getProducts();
	let html = "<input style=\"width:0; height: 0; position:absolute;\" id=\"products_json\" type=\"hidden\" value='"+JSON.stringify(products)+"' />";
	// Sort
	switch(type) {
	  case 'name':
	    products = products.sort((p1, p2) => {
			return p1.name.localeCompare(p2.name);
		})
		break;
	  case 'price':
	    products = products.sort((p1, p2) => {
			return p1.price - p2.price;
		})
	  case 'random':
	    // code block
	    break;
	  default:
	}
	
	// Render
	const productsElement = document.getElementById('id-wrapper-product');
	
	html += getHTMLProducts(products, '/ShoppingCart');
	
	// Get current state
	const categories = document.querySelectorAll('.category-item');
	const pagins = document.querySelectorAll('.page-item');
	let currentPage = -1, cId = -1;
	
	categories.forEach(c => {
		if(c.classList.contains('active')) {
			cId = c.dataset.id;
		}
	})
	
	pagins.forEach((p, index) => {
		if(p.classList.contains('active')) {
			currentPage = index;
		}
	})
	
	html += getHTMLPagination(pagins.length - 2, currentPage, cId, '/ShoppingCart');
	
	productsElement.innerHTML = html;
	const parrentClass = '.product-list';
	resetMasonry(parrentClass, '');
}


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
	
</script>

<!-- Save products variable to sort and filter -->
<script>
	function getProducts() {
		const iComponent = document.getElementById('products_json');
		let products = JSON.parse(iComponent.value);
		return products;
	}
</script>


<script>
	// Tooltip
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	  return new bootstrap.Tooltip(tooltipTriggerEl)
	})
	
// 	validateEmail
	const validateEmail = (email) => {
	  return String(email)
	    .toLowerCase()
	    .match(
	      /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	    );
	};
	
	// Developping features
	function developping(message) {
		alert(message);
	}
	
</script>

<!-- Masonry layout -->
<script>
	function resetMasonry(parent, child) {
		var msnry = new Masonry(parent, {
		    itemSelector: child,
		    percentPosition: true
		});
	}
</script>

<!-- HTTP Request - AJAX -->
<script>
	const getData = (url) => {
		const  promise = new Promise((resolve, reject) => {
			const xhr = new XMLHttpRequest();
	        xhr.open('GET', url, true);
// 	        xhr.responseType = 'json';
	        
	        xhr.send();
	        
	        xhr.onload = () => {
	        	
	            if(xhr.status >= 400) {
	                reject(xhr.response);
	            } else {
	                resolve(xhr.response);
	            }
	        };

	        xhr.onerror = () => {
	            reject("Something went wrong!!!");
	        };
		});
		
		return promise;
	}
</script>

<!-- Reload page when popstate  -->
<script>
// 	window.addEventListener('hashchange', window.history.go());
// 	window.onhashchange = window.history.go
</script>

	
<!-- 	Handle login with google account -->
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	<script>
	
		function handleGoogleLogout() {
			var auth2 = gapi.auth2.getAuthInstance();
// 		    auth2.signOut().then(function () { // it only signOut and if you click again it will auto connect with old account
// 		    	console.log('User signed out.');
// 		    });
		    gapi.auth2.getAuthInstance().disconnect(); // it disconnect and the next time you login it does not auto connect
		}
	    
	    function init() {
    	  gapi.load('auth2', function() {
    		  	let ggAuth = gapi.auth2.init({
       	      		client_id: '846452851200-egpu2opeonr5u0umhb41h6amgud09qog.apps.googleusercontent.com',
       	      		
       	    	});
    		  	ggAuth.then(renderButton, onFailure);
    		  	console.log("init google auth2 successfully")
    	  });
    	}
	    
	    // Render Google Sign-in button
	    function renderButton() {
	    	console.log("Render google button");
	        gapi.signin2.render('gSignIn', {
	            'scope': 'profile email',	
	            'height': 40,
	            'longtitle': true,
	            'theme': 'dark',
	            'onsuccess': onSignIn,
	            'onfailure': onFailure
	        });
	    }
	    

		//google callback. This function will redirect to our login servlet
	    function onSignIn(googleUser) {
	       let profile = googleUser.getBasicProfile()
// 	       console.log('ID: ' + profile.getId());
	       console.log('Name: ' + profile.getName());
// 	       console.log('Image URL: ' + profile.getImageUrl());
// 	       console.log('Email: ' + profile.getEmail());
// 	       console.log('id_token: ' + googleUser.getAuthResponse().id_token);
	
	       //do not post all above info to the server because that is not secure.
	       //just send the id_token
	
	       const redirectUrl = 'login?action=google';
	
	       //post data dynamically
// 	       var form = '<form action="' + redirectUrl + '" method="post">' +
// 	                        '<input type="text" name="id_token" value="' +
// 	                         googleUser.getAuthResponse().id_token + '" />' +
// 	                                                              '</form>';
	       let formElement = document.createElement('form');
	       formElement.action = redirectUrl;
	       formElement.method = 'post';
	       formElement.id="gg-form"
	       
	       let inputElement = document.createElement('input');
	       inputElement.type = 'text';
	       inputElement.name= 'id_token';
	       inputElement.value =  googleUser.getAuthResponse().id_token;
	       
	       let inputElementImage = document.createElement('input');
	       inputElementImage.type = 'text';
	       inputElementImage.name= 'user_image';
	       inputElementImage.value =  profile.getImageUrl();
	       
	       formElement.append(inputElement);
	       formElement.append(inputElementImage);
	       
	       document.body.append(formElement);
	       
	       formElement.submit();
	       
	    }
		
	    // Sign-in failure callback or init failure callback
	    function onFailure(error) {
	        alert(error);
	    }
	</script>