package com.babyboy.servlet.cart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
       
	private static final long serialVersionUID = 7836437592612903556L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		
		request.setAttribute("carts", carts);
//			double totalPrice = carts.stream().mapToDouble(cart -> cart.getPrice()).reduce(0, (init, next) -> init + next);
//			double totalPrice = carts.stream().mapToDouble(cart -> cart.getPrice()).reduce(0, Double::sum);
		double totalPrice = carts.stream().mapToDouble(cart -> cart.getProduct().getPrice()).sum();
		request.setAttribute("totalPrice", totalPrice);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
