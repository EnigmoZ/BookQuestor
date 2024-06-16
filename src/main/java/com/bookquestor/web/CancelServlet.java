package com.bookquestor.web;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.bookquestor.dao.UserDAO;

/**
 * Servlet implementation class CancelServlet
 */
public class CancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelServlet() {
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
		int oid = Integer.parseInt(request.getParameter("order_id"));
		int status = UserDAO.cancelOrder(oid);		
		HttpSession session = request.getSession();
		if(status>0) {
			session.setAttribute("cancelsuccess", "Order is canceled!");
			response.sendRedirect("myorder.jsp");
		}else {
			session.setAttribute("cancelfail", "Some error occured!");
			response.sendRedirect("myorder.jsp");
		}
	}

}
