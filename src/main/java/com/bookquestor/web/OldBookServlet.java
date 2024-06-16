package com.bookquestor.web;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.bookquestor.dao.UserDAO;
import com.bookquestor.model.Book;

/**
 * Servlet implementation class OldBookServlet
 */
public class OldBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OldBookServlet() {
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
		String bname= request.getParameter("bname");
		String aname= request.getParameter("aname");
		String price= request.getParameter("price");
		String btype= request.getParameter("btype");
		String bstatus= request.getParameter("bstatus");
		String email=request.getParameter("email");
		Part part= request.getPart("bimg");
		String filename = part.getSubmittedFileName();
		
		Book bk = new Book(bname,aname,price,btype,bstatus,filename,email);
			
		int status = UserDAO.addBook(bk);
		
		HttpSession session = null;
		if(status>0)
		{
			String path = getServletContext().getRealPath("") + "book";
			//File f= new File(path);
			part.write(path + File.separator + filename);
			session=request.getSession();
			session.setAttribute("successmsg", "Book add Successful!!");
			response.sendRedirect("sellbook.jsp");
		}	
		else {
			session=request.getSession();
			session.setAttribute("failedmsg", "Some error occured!!");
			response.sendRedirect("sellbook.jsp");
		}
	}

}
