package com.babyboy.servlet.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babyboy.dao.jpa.UserDao;
import com.babyboy.facebook_login.RestFB;
import com.babyboy.google_login.IdTokenVerifierAndParser;
import com.babyboy.model.LoginType;
import com.babyboy.model.Role;
import com.babyboy.model.User;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if(action!= null && action.equals("facebook")) {
			handleFacebookLogin(request, response);
			return;
		} 
		
		User user = (User) request.getSession().getAttribute("auth");
		if(user != null) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action!= null && action.equals("google")) {
			handleGoogleLogin(request, response);
		} else {
			handleRawLogin(request, response);
		}
		
		
	}

	private void handleFacebookLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		
		if (code == null || code.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
	    } else {
			String accessToken = RestFB.getToken(code);
		    User user = RestFB.getUserInfo(accessToken);
			
		    request.getSession().setAttribute("auth", user);
			response.sendRedirect(request.getContextPath());
	    }
	}

	private void handleGoogleLogin(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String idToken = request.getParameter("id_token");
			GoogleIdToken.Payload payLoad = IdTokenVerifierAndParser.getPayLoad(idToken);
			
			
			String name = (String) payLoad.get("name");
            String email = payLoad.getEmail();
            String imageUrl = request.getParameter("user_image");
            
            User user = new User();
            user.setEmail(email);
            user.setName(name);
            user.setImageUrl(imageUrl);
            user.setRole(Role.USER);
            user.setLoginType(LoginType.GOOGLE);
            
            if(UserDao.isExistsEmail(email) == false) UserDao.saveUser(user);
            
            // login successfully and then redirect to home page
            request.getSession().setAttribute("auth", user);
			response.sendRedirect(request.getContextPath());
		} catch (GeneralSecurityException | IOException e) {
			e.printStackTrace();
		}

	}

	private void handleRawLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
	
		String email = request.getParameter("login-email");
		String password = request.getParameter("login-password");

		User user = UserDao.getUserByEmailAndPassword(email, password);
		
		if(user == null) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else {
			request.getSession().setAttribute("auth", user);
			
			response.sendRedirect(request.getContextPath());
		}
	}

}
