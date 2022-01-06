package com.babyboy.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babyboy.connection.DBConnection;
import com.babyboy.dao.jdbc.OrderDao;
import com.babyboy.model.Cart;
import com.babyboy.model.Order;
import com.babyboy.model.User;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderDao oDao = null;
		try {
			oDao = new OrderDao(DBConnection.getConnection());
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		String action = request.getParameter("action");
		if(action != null && action.equals("remove")) {
			int orderId = Integer.parseInt(request.getParameter("id"));
			
			boolean res = oDao.removeOrderById(orderId);
		} else if(action != null && action.equals("order-all")) {
			User user = (User) request.getSession().getAttribute("auth");
			if(user != null) {
				
				HttpSession session = request.getSession();
				List<Cart> carts = (List<Cart>) session.getAttribute("carts");
				if(carts != null) {
					for(Cart c : carts) {
						Order order = new Order();
						order.setO_date(new Date());
						order.setO_quantity(c.getQuantity());
						order.setProduct(c);
//						order.setU_id(user.getId());
						
						boolean res = oDao.addOrder(order);
						
						if(!res) {					
							request.getSession().setAttribute("mess", "Add to order fail");
							response.sendRedirect(request.getContextPath() + "/cart");
							return;
						}	
					}
					
					response.sendRedirect(request.getContextPath() + "/orders");
					return;
				}
				request.getSession().setAttribute("mess", "Add some product before you checkout");
				response.sendRedirect(request.getContextPath() + "/cart");
				return;
				
			} else {
				response.sendRedirect(request.getContextPath() + "/login");
				return;
			}
		}
		
		User user = (User) request.getSession().getAttribute("auth");
		if(user != null) {
//			List<Order> orders = oDao.getOrdersByUserId(user.getId());
			
//			request.setAttribute("orders", orders);
		}
		
		request.getRequestDispatcher("orders.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
