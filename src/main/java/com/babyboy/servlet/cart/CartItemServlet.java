package com.babyboy.servlet.cart;

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
//import com.babyboy.dao.jdbc.OrderDao;
import com.babyboy.dao.jdbc.ProductDao;
import com.babyboy.model.Cart;
import com.babyboy.model.User;


@WebServlet("/cart/item")
public class CartItemServlet extends HttpServlet {
    
	private static final long serialVersionUID = -7718624409402376556L;
	
	public CartItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Cart> carts = (List<Cart>) session.getAttribute("carts");
		
		String action = request.getParameter("action");
		int id =  Integer.parseInt(request.getParameter("id"));
		
		if(action.equals("remove")) { // remove Item
			carts = carts.stream().filter((cart) -> cart.getProduct().getId() != id).toList();
		} else if(action.equals("buy")) { // order Item 
//			orderProduct(request, response);
			return;
		} else { // Increment and Decrement Quantity of item
			int value = action.equals("inc") ? 1 : -1;
			
			for(int i = 0; i < carts.size(); i++ ) {
				if(carts.get(i).getProduct().getId() == id) {
					if(carts.get(i).getQuantity() + value > 0)
						carts.get(i).setQuantity(carts.get(i).getQuantity() + value);
					else if(carts.get(i).getQuantity() + value == 0) {
						carts.remove(i);
					}
					break;
				}
			}
		}
		session.setAttribute("carts", carts);
		response.sendRedirect(request.getContextPath() + "/cart");
	}
	
//	private void orderProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		User user = (User) request.getSession().getAttribute("auth");
//		if(user != null) {
//			
//			int pId = Integer.parseInt(request.getParameter("id"));
//			int pQuantity = Integer.parseInt(request.getParameter("quantity") == null ? "1" : request.getParameter("quantity"));
//
//			ProductDao pDao = null;
//			try {
//				pDao = new ProductDao(DBConnection.getConnection());
//			} catch (ClassNotFoundException | SQLException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			
//			Order order = new Order();
//			order.setO_date(new Date());
//			order.setO_quantity(pQuantity);
//			order.setProduct(pDao.getProductById(pId));
////			order.setU_id(user.getId());
//			
//			try {
//				OrderDao oDao = new OrderDao(DBConnection.getConnection());
//				boolean res = oDao.addOrder(order);
//				
//				if(!res) {					
//					request.getSession().setAttribute("mess", "Add to order fail");
//				}	
//			} catch (ClassNotFoundException | SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			response.sendRedirect(request.getContextPath() + "/orders");
//			return;
//		}
//		
//		response.sendRedirect(request.getContextPath() + "/login");
//	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
