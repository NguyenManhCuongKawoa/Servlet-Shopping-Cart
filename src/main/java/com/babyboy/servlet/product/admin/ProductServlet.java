package com.babyboy.servlet.product.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babyboy.dao.jpa.CategoryDao;
import com.babyboy.dao.jpa.ProductDao;
import com.babyboy.model.Category;
import com.babyboy.model.Product;
import com.babyboy.util.constants.Pagination;
import com.babyboy.util.json.JsonConverter;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/admin/products")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page == null) {
			page = "1";
		}
		
		// Get products
		List<Product> products = ProductDao.getPaginProducts(Pagination.PRODUCT, Integer.parseInt(page));
		
		int numberPage = ProductDao.size(null);
		request.setAttribute("numberPage", numberPage / Pagination.PRODUCT + (numberPage % Pagination.PRODUCT != 0 ? 1 : 0));
		
		if(numberPage > 0) {
			request.setAttribute("currentPage", page);
		}			
		
		request.setAttribute("products", products);
		String productsJson = JsonConverter.toJson(products);
		request.setAttribute("productsJson", productsJson);
		System.out.println(productsJson);
		
		// Get Categories
		List<Category> categories = CategoryDao.getAllCategories();
		request.setAttribute("categories", categories);
		
		request.setAttribute("categoryActive", -1);
		
		request.getRequestDispatcher("/admin/my_products.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
