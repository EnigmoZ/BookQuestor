package com.bookquestor.model;

public class Book {
	private int bookid;
	private String bookname;
	private String author;
	private String price;
	private String category;
	private String status;
	private String cover;
	private String email;
	
	
	public Book() {
		
	}
	
	public Book(String bookname, String author, String price, String category, String status, String cover,String email) {
		super();
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.category = category;
		this.status = status;
		this.cover = cover;
		this.email = email;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
