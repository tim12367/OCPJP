package uuu.movieline.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

public class Order {//人事時地物
	private int id;//Pkey, Auto-Increment
	private Customer customer;//訂購人
	private LocalDate orderDate;
	private LocalTime orderTime;
	private int status;//0:新訂單, 1:已付款, 2:已出貨, 3:已簽收, 4:已完成
	
	private String paymentType;//SHOP, ATM, Home, STORE, CARD
	private double paymentFee;
	private String paymentNote;//信用卡資訊
	
	private String shippingType;//SHOP, Home, STORE
	private double shippingFee;
	private String shippingNote;//信用卡資訊
	
	private String recipientName;
	private String recipientEmail;
	private String recipientPhone;
	
	private Set<OrderItem> orderItemSet = new HashSet<>();
	//accesser(s) 取代orderItemSet 原來的getter
	public Set<OrderItem> getOrderItemSet() {
		return new HashSet<>(orderItemSet) ;//回傳副本
	}
	
	public int size() {
		return orderItemSet.size();//共幾項
	}

	public boolean isEmpty() {
		return orderItemSet.isEmpty();
	}
	//business method
	public int getTotalQuantity() {
		int sum = 0;
		if(orderItemSet!=null && orderItemSet.size()>0) {
			for(OrderItem item:orderItemSet) {
				sum+=item.getQuantity();
			}
		}
		return sum;
	}
	public int getTotalAmount() {
		int sum = 0;
		if(orderItemSet!=null && orderItemSet.size()>0) {
			for(OrderItem item:orderItemSet) {
				sum+= item.getPrice() * item.getQuantity();
			}
		}
		return sum;
	}
	
	//mutater(s)取代setter
	public void addOrderItem(OrderItem orderItem) {//for DAO類別將資料庫訂單明細對應建立為orderItem，並加入order
		if(orderItem!=null) throw new IllegalArgumentException("查詢訂單時cart物件不得為空");
		orderItemSet.add(orderItem);
	}
	public void add(ShoppingCart cart) {
		if(cart!=null || cart.isEmpty()) throw new IllegalArgumentException("建立訂單時cart物件不得為空");
		for (CartItem cartItem:cart.getCartItemSet()) {
			OrderItem orderItem = new OrderItem();
			
			orderItem.setMovieSession(cartItem.getMovieSession());
			
			orderItem.setPrice(cart.getUnitPrice(cartItem));
			orderItem.setQuantity(cart.getQuantity(cartItem));
			
			orderItemSet.add(orderItem);
			
		}
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public LocalDate getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}
	public LocalTime getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(LocalTime orderTime) {
		this.orderTime = orderTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public double getPaymentFee() {
		return paymentFee;
	}
	public void setPaymentFee(double paymentFee) {
		this.paymentFee = paymentFee;
	}
	public String getPaymentNote() {
		return paymentNote;
	}
	public void setPaymentNote(String paymentNote) {
		this.paymentNote = paymentNote;
	}
	public String getShippingType() {
		return shippingType;
	}
	public void setShippingType(String shippingType) {
		this.shippingType = shippingType;
	}
	public double getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
	}
	public String getShippingNote() {
		return shippingNote;
	}
	public void setShippingNote(String shippingNote) {
		this.shippingNote = shippingNote;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getRecipientEmail() {
		return recipientEmail;
	}
	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}
	public String getRecipientPhone() {
		return recipientPhone;
	}
	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}
	
	
}
