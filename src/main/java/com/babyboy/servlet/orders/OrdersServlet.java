package com.babyboy.servlet.orders;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babyboy.connection.DBConnection;
import com.babyboy.dao.jpa.BillDao;
import com.babyboy.model.Bill;
import com.babyboy.model.Cart;
import com.babyboy.model.Status;
import com.babyboy.model.User;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public OrdersServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("auth");
		
		System.out.println(user.getId());
		List<Bill> bills = BillDao.getBillsByUserId(user.getId());
		System.out.println(bills);
		request.setAttribute("bills", bills);
		
		request.getRequestDispatcher("orders.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Cart> carts = null;

		HttpSession session = request.getSession();
		Object cartsSession = session.getAttribute("carts");
				
		if(cartsSession != null) {
			carts = new LinkedList<Cart>((Collection<? extends Cart>) (cartsSession));
		}
		
		if(carts == null) {
			session.setAttribute("mess", "please chose something before you checkout!!");
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		} else {
			orderProducts(carts, request, response);
		}

	}

	private void orderProducts(List<Cart> carts, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address= request.getParameter("address");
		String moreInfo = request.getParameter("more-info");
		
		User user = (User) request.getSession().getAttribute("auth");
		
		Bill bill = new Bill();
		bill.setName(name);
		bill.setPhone(phone);
		bill.setAddress(address);
		bill.setMoreInfo(moreInfo);
		bill.setUser(user);
		bill.setStatus(Status.PROCESSING);
		
		for(int i = 0; i < carts.size(); i++) {
			carts.get(i).setBill(bill);
		}
		
		bill.setCarts(carts);
		boolean res = BillDao.saveBill(bill);
		
		if(res) {
			response.sendRedirect(request.getContextPath() + "/orders");
		} else {
			request.getSession().setAttribute("mess", "Having something wrong, please try again!!");
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
	}

}
