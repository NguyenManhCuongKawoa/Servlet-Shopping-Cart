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
