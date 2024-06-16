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
import com.bookquestor.model.Book;

/**
 * Servlet implementation class EditServlet
 */
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String bname= request.getParameter("bname");
			String aname= request.getParameter("aname");
			String price= request.getParameter("price");
			String bstatus= request.getParameter("bstatus");
			
			Book book = new Book();
			book.setBookid(id);
			book.setBookname(bname);
			book.setAuthor(aname);
			book.setPrice(price);
			book.setStatus(bstatus);
			
			int status = UserDAO.updateBook(book);
			HttpSession sess=null;
			if(status>0)
			{
				sess=request.getSession();
				sess.setAttribute("successmsg", "Book Updated Successfully!!");
				response.sendRedirect("admin/allbooks.jsp");
			}
			
			else {
				sess=request.getSession();
				sess.setAttribute("failedmsg", "Something went Wrong!!");
				response.sendRedirect("admin/allbooks.jsp");
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
