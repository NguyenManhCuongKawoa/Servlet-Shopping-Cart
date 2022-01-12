package com.babyboy.api.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babyboy.dao.jpa.ProductDao;
import com.babyboy.model.Cart;
import com.babyboy.model.Product;

/**
 * Servlet implementation class ApiCartAddServlet
 */
@WebServlet("/api/carts/add")
public class ApiCartAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApiCartAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Cart> carts = new ArrayList<Cart>();

		HttpSession session = request.getSession();
		Object cartsSession = session.getAttribute("carts");
				
		if(cartsSession != null) {
			carts = new LinkedList<Cart>((Collection<? extends Cart>) (cartsSession));
		}
		
		
		String idCart = request.getParameter("id");
		if(idCart != null) {
			if(idCart.matches("\\d+")) {
				ProductDao pDao = new ProductDao();
				Cart cart =  new Cart();
				Product product  = pDao.getProductById(Long.parseLong(idCart)); 
				cart.setProduct(product);
				if(cart != null) {
					boolean flag = true;
					for(int i = 0; i < carts.size(); i++ ) {
						if(carts.get(i).getProduct().getId() == cart.getProduct().getId()) {
							carts.get(i).setQuantity(carts.get(i).getQuantity() + 1);
							flag = false;
							break;
						}
					}
					
					if(flag) {
//						System.out.println(carts);
//						System.out.println(cart);
						carts.add(cart);	
					}
				}
				session.setAttribute("carts", carts);
				
				response.getWriter().print(carts.size());
			} else {
				response.getWriter().print("Add to cart Fail!!! - Please check again!");
			}
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
