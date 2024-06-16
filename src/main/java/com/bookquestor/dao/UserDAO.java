package com.bookquestor.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookquestor.model.Book;
import com.bookquestor.model.Cart;
import com.bookquestor.model.Orders;
import com.bookquestor.model.User;


public class UserDAO {
	
	public static Connection getConnection(){
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookquestor","root","root");
			System.out.println("Connection object: "+con);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
	
	public static int UserRegister(User us)
	{
		int status=0;
		Connection con=UserDAO.getConnection();
		try {
			String sql = "insert into user(name,email,phone,password) values(?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());
			
			status=ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	public static User UserLoginValidate(String email,String password) {
		Connection con = UserDAO.getConnection();
		User user=null;
		String sql = "select * from user where email=? and password=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				user= new User();
				user.setId(rs.getInt("uid"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	public static int addBook(Book bk)
	{
		int status=0;
		Connection con = UserDAO.getConnection();
		String query="insert into book (bookname,author,price,category,status,cover,email) values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,bk.getBookname());
			ps.setString(2,bk.getAuthor());
			ps.setString(3,bk.getPrice());
			ps.setString(4,bk.getCategory());
			ps.setString(5,bk.getStatus());
			ps.setString(6,bk.getCover());
			ps.setString(7,bk.getEmail());
			
			status = ps.executeUpdate();
			
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public static List<Book> getBookList(){
		Connection con = UserDAO.getConnection();
		List<Book> list = new ArrayList<Book>();
		
		PreparedStatement ps=null;
		try {
			ps = con.prepareStatement("select * from book");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Book book = new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getString("price"));
				book.setCategory(rs.getString("category"));
				book.setStatus(rs.getString("status"));
				book.setCover(rs.getString("cover"));
				book.setEmail("email");
				
				list.add(book);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static Book getBookById(String bid)
	{
		int id  = Integer.parseInt(bid);
		Connection con = UserDAO.getConnection();
		Book book = new Book();
		String sql = "select * from book where bookid=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getString("price"));
				book.setCategory(rs.getString("category"));
				book.setStatus(rs.getString("status"));
				book.setCover(rs.getString("cover"));
				book.setEmail(rs.getString("email"));
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		} 
		return book;
	}
	
	public static int updateBook(Book book) {
		int status = 0;
		Connection con= UserDAO.getConnection();
		String sql = "update book set bookname=?,author=?,price=?,status=? where bookid=?";
		try {
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1, book.getBookname());
			ps.setString(2, book.getAuthor());
			ps.setString(3, book.getPrice());
			ps.setString(4, book.getStatus());
			ps.setInt(5, book.getBookid());
			
			status=ps.executeUpdate();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public static int deleteBookById(int id) {
		int status=0;
		Connection con=UserDAO.getConnection();
		String sql = "Delete from book where bookid=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			
			status = ps.executeUpdate();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public static List<Book> getNewBook(){
		Connection con = UserDAO.getConnection();
		List<Book> list = new ArrayList<Book>();
		
		String sql = "select * from book where category=? AND status=? ORDER BY bookid DESC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"NEW");
			ps.setString(2,"Active");
			int i=0;
			ResultSet rs=ps.executeQuery();
			while(rs.next() && i<4) {
				Book book = new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getString("price"));
				book.setCategory(rs.getString("category"));
				book.setStatus(rs.getString("status"));
				book.setCover(rs.getString("cover"));
				book.setEmail(rs.getString("email"));
				list.add(book);
				i++;
			}
		} 
		catch (SQLException e) {
				e.printStackTrace();
		}
		return list;
	}
	
	public static List<Book> getRecentBook(){
		Connection con = UserDAO.getConnection();
		List<Book> list = new ArrayList<Book>();
		
		String sql = "select * from book where status=? ORDER BY bookid DESC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"Active");
			int i=0;
			ResultSet rs=ps.executeQuery();
			while(rs.next() && i<4) {
				Book book = new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getString("price"));
				book.setCategory(rs.getString("category"));
				book.setStatus(rs.getString("status"));
				book.setCover(rs.getString("cover"));
				book.setEmail(rs.getString("email"));
				list.add(book);
				i++;
			}
		} 
		catch (SQLException e) {
				e.printStackTrace();
		}
		return list;
	}
	
	public static List<Book> getOldBook(){
		Connection con = UserDAO.getConnection();
		List<Book> list = new ArrayList<Book>();
		
		String sql = "select * from book where category=? AND status=? ORDER BY bookid DESC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"OLD");
			ps.setString(2,"Active");
			int i=0;
			ResultSet rs=ps.executeQuery();
			while(rs.next() && i<4) {
				Book book = new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getString("price"));
				book.setCategory(rs.getString("category"));
				book.setStatus(rs.getString("status"));
				book.setCover(rs.getString("cover"));
				book.setEmail(rs.getString("email"));
				list.add(book);
				i++;
			}
		} 
		catch (SQLException e) {
				e.printStackTrace();
		}
		return list;
	}
	
	public static List<Book> getAllNewBook(){
		Connection con = UserDAO.getConnection();
		List<Book> list = new ArrayList<Book>();
		
		String sql = "select * from book where category=? AND status=? ORDER BY bookid DESC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"NEW");
			ps.setString(2,"Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Book book = new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getString("price"));
				book.setCategory(rs.getString("category"));
				book.setStatus(rs.getString("status"));
				book.setCover(rs.getString("cover"));
				book.setEmail(rs.getString("email"));
				list.add(book);
			}
		} 
		catch (SQLException e) {
				e.printStackTrace();
		}
		return list;
	}
	
	public static List<Book> getAllRecentBook(){
		Connection con = UserDAO.getConnection();
		List<Book> list = new ArrayList<Book>();
		
		String sql = "select * from book where status=? ORDER BY bookid DESC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Book book = new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getString("price"));
				book.setCategory(rs.getString("category"));
				book.setStatus(rs.getString("status"));
				book.setCover(rs.getString("cover"));
				book.setEmail(rs.getString("email"));
				list.add(book);
				
			}
		} 
		catch (SQLException e) {
				e.printStackTrace();
		}
		return list;
	}
	
	public static List<Book> getAllOldBook(){
		Connection con = UserDAO.getConnection();
		List<Book> list = new ArrayList<Book>();
		
		String sql = "select * from book where category=? AND status=? ORDER BY bookid DESC";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,"OLD");
			ps.setString(2,"Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Book book = new Book();
				book.setBookid(rs.getInt("bookid"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getString("price"));
				book.setCategory(rs.getString("category"));
				book.setStatus(rs.getString("status"));
				book.setCover(rs.getString("cover"));
				book.setEmail(rs.getString("email"));
				list.add(book);
			
			}
		} 
		catch (SQLException e) {
				e.printStackTrace();
		}
		return list;
	}
	
	public static int addCart(Cart c){
		int status=0;
		Connection con = UserDAO.getConnection();
		String sql = "insert into cart(uid,bid,bookname,author,price,totalcost) values(?,?,?,?,?,?)";
		
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, c.getUid());
			ps.setString(2, c.getBid());
			ps.setString(3, c.getBookname());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalcost());
			
			status = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;	
	}
	
	public static List<Cart> getCartList(int uid){
		Connection con = UserDAO.getConnection();
		List<Cart> list = new ArrayList<Cart>();
		
		PreparedStatement ps=null;
		try {
			ps = con.prepareStatement("select *, count(bid) as quantity from cart where uid=? group by bid order by bid;");
			ps.setInt(1,uid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Cart cart = new Cart();
				cart.setCid(rs.getInt("cid"));
				cart.setBid(rs.getString("bid"));
				cart.setUid(rs.getString("uid"));
				cart.setBookname(rs.getString("bookname"));
				cart.setAuthor(rs.getString("author"));
				cart.setPrice(rs.getDouble("price"));
				cart.setTotalcost(rs.getDouble("totalcost"));
				cart.setQuantity(rs.getInt("quantity"));
				list.add(cart);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static int deleteCartById(int id) {
		int status=0;
		Connection con=UserDAO.getConnection();
		String sql = "Delete from cart where cid=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			
			status = ps.executeUpdate();
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public static int OrderDetails(User us)
	{
		int status=0;
		Connection con=UserDAO.getConnection();
		try {
			String sql = "update user set name=?, email=?, phone=?, address=?, landmark=?, city=?, state=?, zip=?, where uid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getAddress());
			ps.setString(5,us.getLandmark());
			ps.setString(6, us.getCity());
			ps.setString(7, us.getState());
			ps.setString(8, us.getZip());
			ps.setInt(9, us.getId());
			
			status=ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}

	public static int UpdateUser(User user) {
		int status=0;
		Connection con = UserDAO.getConnection();
		String sql = "update user set name=?,email=?,phone=?,password=? where uid=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone());
			ps.setString(4, user.getPassword());
			ps.setInt(5, user.getId());
			
			status = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public static List<Orders> getOrderList(int uid){
		Connection con = UserDAO.getConnection();
		List<Orders> list = new ArrayList<Orders>();
		
		PreparedStatement ps=null;
		try {
			ps = con.prepareStatement("select oid, name, qty,address ,total, ptype from orders where uid=?");
			ps.setInt(1,uid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Orders o = new Orders();
				o.setOid(rs.getInt("oid"));
				o.setName(rs.getString("name"));
				o.setQuantity(rs.getInt("qty"));
				o.setAddress(rs.getString("address"));
				o.setTotal(rs.getDouble("total"));
				o.setPtype(rs.getString("ptype"));
				list.add(o);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static int setOrderDetails(Orders obj) {
		int status=0;
		Connection con = UserDAO.getConnection();
		String sql="insert into orders (uid,name,address,email,phone,city,state,landmark,ptype,qty,total) values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, obj.getUid());
			ps.setString(2, obj.getName());
			ps.setString(3, obj.getAddress());
			ps.setString(4, obj.getEmail());
			ps.setString(5, obj.getPhone());
			ps.setString(6, obj.getCity());
			ps.setString(7, obj.getState());
			ps.setString(8, obj.getLandmark());
			ps.setString(9, obj.getPtype());
			ps.setInt(10, obj.getQuantity());
			ps.setDouble(11, obj.getTotal());
			
			status = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
	public static int cancelOrder(int oid) {
		int status = 0;
		Connection con = UserDAO.getConnection();
		String sql = "delete from orders where oid=?";
		
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1,oid);
			status=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
}

