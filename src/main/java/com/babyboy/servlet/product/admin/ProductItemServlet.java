package com.babyboy.servlet.product.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.babyboy.dao.jpa.CategoryDao;
import com.babyboy.dao.jpa.ProductDao;
import com.babyboy.model.Category;
import com.babyboy.model.Product;
import com.babyboy.model.User;
import com.babyboy.util.constants.Pagination;
import com.babyboy.util.json.JsonConverter;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/admin/products/item")
public class ProductItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("auth");
		
		boolean hasAction = doAction(user, request, response);
		
		if(hasAction == false) {
			// Get products
			List<Product> products = ProductDao.getProductsOfUser(user);
			
			
			request.setAttribute("products", products);
			
			request.getRequestDispatcher("/admin/my_products.jsp").forward(request, response);			
		} 
	}

	private boolean doAction(User user, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action != null) {
			long pId = 0l;
			try {
				pId = Long.parseLong(request.getParameter("id"));
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			switch(action ) {
				case "update": {
					
					Product product = ProductDao.getProductById(pId);
					HttpSession session = request.getSession();
					session.setAttribute("product", product);
					response.sendRedirect(request.getContextPath() + "/admin/products/item/update");
					break;
				}
				case "remove": {
					ProductDao.deleteProductById(pId);
					response.sendRedirect(request.getContextPath() + "/admin/products");
				}
				default:
					// Nothing here
			}
			
			return true;
		}
		return false;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
