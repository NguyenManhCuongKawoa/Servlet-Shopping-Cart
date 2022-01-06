package com.babyboy.servlet.product;

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
 * Servlet implementation class ProductCategoryServlet
 */
@WebServlet("/products/category")
public class ProductCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idStr = request.getParameter("id");
		String page = request.getParameter("page");
		if(page == null) {
			page = "1";
		}
		
		if(idStr != null && idStr.matches("\\d+")) {
			Long cId = Long.parseLong(idStr);
			
			// Get Products by category;
			List<Product> products = ProductDao.getPaginProductsByCategory(cId, Pagination.PRODUCT, Integer.parseInt(page));
			

			int numberPage = ProductDao.size(CategoryDao.getCategoryById(cId).getName());
			request.setAttribute("numberPage", numberPage / Pagination.PRODUCT + (numberPage % Pagination.PRODUCT != 0 ? 1 : 0));
			
			if(numberPage > 0) {
				request.setAttribute("currentPage", page);
			}				
			
			request.setAttribute("products", products);
			String productsJson = JsonConverter.toJson(products);
			request.setAttribute("productsJson", productsJson);
			
			// Get Categories
			List<Category> categories = CategoryDao.getAllCategories();
			request.setAttribute("categories", categories);
			
			request.setAttribute("categoryActive", cId);
			
			RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
			rd.forward(request, response);
		}
			
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
