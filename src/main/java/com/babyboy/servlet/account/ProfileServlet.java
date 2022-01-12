package com.babyboy.servlet.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babyboy.dao.jpa.UserDao;
import com.babyboy.model.User;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("auth");
		
		String action = request.getParameter("action");
		
		if(action != null && action.equals("change-password")) {
			String oldPassword = request.getParameter("old-password");
			String newPassword = request.getParameter("new-password");
			String confirmPassword = request.getParameter("confirm-password");
			
			if(oldPassword != null && oldPassword.equals(user.getPassword())) {
				if(newPassword != null && confirmPassword != null && newPassword.equals(confirmPassword)) {
					
					UserDao.changePassword(user.getId(), newPassword);
					
					request.setAttribute("message", "Change password is successfully");
				} else {
					request.setAttribute("message", "Confirm password is not match!!");
				}
			} else {
				request.setAttribute("message", "Old password is not correct");
			}
			
		} else {
			request.setAttribute("message", "Something was wrong");
		}
		
		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}

}
