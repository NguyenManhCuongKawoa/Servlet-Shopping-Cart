package com.babyboy.api.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babyboy.dao.jpa.CategoryDao;
import com.babyboy.dao.jpa.ProductDao;
import com.babyboy.model.Product;
import com.babyboy.util.constants.Pagination;

@WebServlet("/api/products/category")
public class ApiProductCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApiProductCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		handleGetProductByCategory(request, response);
	}
	
	private void handleGetProductByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			
			String idStr = request.getParameter("id");
			String page = request.getParameter("page");
			if(page == null) {
				page = "1";
			}
			
			if(idStr != null && idStr.matches("\\d+")) {
				String keyword = request.getParameter("keyword");
				Long cId = Long.parseLong(idStr);
				
				// Get Products;
				List<Product> products = ProductDao.getPaginProductsByCategory(cId, Pagination.PRODUCT, Integer.parseInt(page));
				
				out.print(RenderProduct.getHTMLProduct(products, request, response));
				
				// Render pagination
				int numberPage = ProductDao.size(CategoryDao.getCategoryById(cId).getName());
				numberPage = numberPage / Pagination.PRODUCT + (numberPage % Pagination.PRODUCT != 0 ? 1 : 0);
				
				out.print(RenderProduct.getHTMLPagination(numberPage, Integer.parseInt(page), cId, request.getContextPath()));					
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
