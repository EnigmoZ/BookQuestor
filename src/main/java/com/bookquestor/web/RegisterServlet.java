package com.bookquestor.web;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.bookquestor.model.User;
import com.bookquestor.dao.UserDAO;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String name= request.getParameter("name");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String password= request.getParameter("password");
		String check= request.getParameter("check");
		System.out.println(name+" "+email+" "+phone+" "+password+" "+check);
		
		User us = new User();
		us.setName(name);
		us.setEmail(email);
		us.setPhone(phone);
		us.setPassword(password);
		
		int status= UserDAO.UserRegister(us);
		HttpSession session=null;
		if(check!=null)
		{
			if(status>0)
			{
				session=request.getSession();
				session.setAttribute("reg-success", "Registration Successful!!");
				response.sendRedirect("register.jsp");
			}
			else
			{
				session=request.getSession();
				session.setAttribute("failed-msg", "The Email is Already registered! Use another");
				response.sendRedirect("register.jsp");
			}
		}
		else {
			session=request.getSession();
			session.setAttribute("failed-msg", "Agree to Terms & Conditions!!");
			response.sendRedirect("register.jsp");
		}
	}

}
