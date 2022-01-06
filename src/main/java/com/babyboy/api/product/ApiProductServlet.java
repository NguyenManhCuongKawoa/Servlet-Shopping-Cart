package com.babyboy.api.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babyboy.dao.jpa.ProductDao;
import com.babyboy.model.Product;
import com.babyboy.util.constants.Pagination;

/**
 * Servlet implementation class ApiProductServlet
 */
@WebServlet("/api/products")
public class ApiProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApiProductServlet() {
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
		
		try (PrintWriter out = response.getWriter()) {
			String keyword = request.getParameter("keyword");
			
			// Get Products;
			List<Product> products = ProductDao.getPaginProducts(Pagination.PRODUCT, Integer.parseInt(page));

			out.print(RenderProduct.getHTMLProduct(products, request, response));
			
			int numberPage = ProductDao.size(null);
			numberPage = numberPage / Pagination.PRODUCT + (numberPage % Pagination.PRODUCT != 0 ? 1 : 0);
			
			out.print(RenderProduct.getHTMLPagination(numberPage, Integer.parseInt(page), -1L, request.getContextPath()));				
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
