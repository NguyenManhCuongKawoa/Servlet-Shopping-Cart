package com.babyboy.servlet.product.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.babyboy.dao.jpa.CategoryDao;
import com.babyboy.dao.jpa.ProductDao;
import com.babyboy.model.Category;
import com.babyboy.model.Product;
import com.babyboy.model.User;
import com.babyboy.util.constants.FilePath;
import com.babyboy.util.constants.Pagination;
import com.babyboy.util.json.JsonConverter;

/**
 * Servlet implementation class ProductServlet
 */
@MultipartConfig(fileSizeThreshold = 1024*1024*5)
@WebServlet("/admin/products/item/update")
public class ProductItemUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductItemUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Product product = (Product) session.getAttribute("product");
		if(product != null) { // Update product 	
			session.removeAttribute("product");
			request.setAttribute("product", product);	
		}
		
		// Get Categories
		List<Category> categories = CategoryDao.getAllCategories();
		request.setAttribute("categories", categories);

		request.getRequestDispatcher("/admin/new_product.jsp").forward(request, response);			
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("auth");
		
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String priceStr = request.getParameter("price");
		String description = request.getParameter("description");
		String idStr = request.getParameter("id");
		
		double price = 0.0;
		try {
			price = Double.parseDouble(priceStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// Handle save file;
		Part part = request.getPart("image");
		String fileName = part.getSubmittedFileName();
		String uploadPath = this.getServletContext().getRealPath("") + FilePath.ROOT_FILE_IMAGE 
								+ File.separator + fileName;
		System.out.println(uploadPath);
	
		
		Product p = new Product();
		if(idStr != null) p.setId(Long.parseLong(idStr)); 
		p.setName(name);
		p.setCategory(CategoryDao.getCategoryByName(category));
		p.setPrice(price);
		p.setDescription(description);
		p.setImageUrl(uploadPath);
		p.setUser(user);
		
		System.out.println(p.getId());
		
		boolean isSuccessSaveProduct = ProductDao.saveProduct(p);
		
		if(isSuccessSaveProduct) {
			response.sendRedirect(request.getContextPath() + "/admin/products");
		} else {
			request.setAttribute("product", p);
			request.setAttribute("error", "Can't save your product!! Some thing was wrong. Please check again!!");
			request.getRequestDispatcher("/admin/new_product.jsp").forward(request, response);
		}
	}

}
