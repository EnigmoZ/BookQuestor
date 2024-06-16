package com.bookquestor.web;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.bookquestor.dao.UserDAO;
import com.bookquestor.model.User;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		
		
		
		HttpSession session=null;
		if("adminansh@quest.com".equals(email) && "iamboss".equals(password)) {
			User us = new User();
			us.setName("Admin");
			session=request.getSession();
			session.setAttribute("userlogin", us);
			response.sendRedirect("admin/adminhome.jsp");
		}
		else {
			
			User user = UserDAO.UserLoginValidate(email,password);
			if(user!=null)
			{
				session=request.getSession();
				session.setAttribute("userlogin", user);
				response.sendRedirect("home.jsp");
			}
			else 
			{
				session=request.getSession();
				session.setAttribute("login-failed", "Invalid Username or Password");
				response.sendRedirect("login.jsp");
			}
		}
	}

}
