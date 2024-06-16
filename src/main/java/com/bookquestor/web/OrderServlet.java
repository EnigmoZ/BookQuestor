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
import com.bookquestor.model.Orders;

/**
 * Servlet implementation class OrderServlet
 */
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		int uid = Integer.parseInt(request.getParameter("uid"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		double totalcost = Double.parseDouble(request.getParameter("tcost"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String landmark = request.getParameter("landmark");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");
		String ptype = request.getParameter("COD");
		
		Orders o = new Orders(uid, qty, name, address, city, landmark, state, pincode, totalcost, ptype, email, phone);
		
		int status = UserDAO.setOrderDetails(o);
		HttpSession session = request.getSession();
		if(status>0) {
			session.setAttribute("order-success", "Order Placed Successfully!");
			response.sendRedirect("settings.jsp");
		}else {
			session.setAttribute("order-fail", "Some error occured");
			response.sendRedirect("cart.jsp");
		}
		
		
	}

}
