package com.bookquestor.model;

public class Orders{
	private int oid;
	private int uid;
	private int quantity;
	private String name;
	private String address;
	private String city;
	private String landmark;
	private String state;
	private String pincode;
	private double total;
	private String ptype;
	private String email;
	private String phone;
	
	public Orders() {}
	
	public Orders(int uid, int quantity, String name, String address, String city, String landmark, String state,
			String pincode, double total, String ptype,String email,String phone) {
		super();
		this.uid = uid;
		this.quantity = quantity;
		this.name = name;
		this.address = address;
		this.city = city;
		this.landmark = landmark;
		this.state = state;
		this.pincode = pincode;
		this.total = total;
		this.ptype = ptype;
		this.email = email;
		this.phone = phone;
	}


	public String getPincode() {
		return pincode;
	}


	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getLandmark() {
		return landmark;
	}


	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	
	
	
	public int getOid() {
		return oid;
	}


	public void setOid(int oid) {
		this.oid = oid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public double getTotal() {
		return total;
	}


	public void setTotal(double total) {
		this.total = total;
	}


	public String getPtype() {
		return ptype;
	}


	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Orders [oid=" + oid + ", uid=" + uid + ", quantity=" + quantity + ", name=" + name + ", address="
				+ address + ", city=" + city + ", landmark=" + landmark + ", state=" + state + ", pincode=" + pincode
				+ ", total=" + total + ", ptype=" + ptype + "]";
	}


	


	
}
