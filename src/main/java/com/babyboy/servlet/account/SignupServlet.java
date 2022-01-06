package com.babyboy.servlet.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babyboy.dao.jpa.UserDao;
import com.babyboy.model.LoginType;
import com.babyboy.model.Role;
import com.babyboy.model.User;


@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("signup.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
//		String passwordConfirm = request.getParameter("password_confirm");
		
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		user.setName(name);
		user.setRole(Role.USER);
		user.setLoginType(LoginType.RAW);
		
		System.out.println(name);
		
		boolean res = UserDao.saveUser(user);
		if(res == true) {
			request.getSession().setAttribute("auth", user);
			
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("error", "Something was wrong");
			
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
	}

}
