package uuu.movieline.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.HashSet;
import java.util.Set;

import uuu.movieline.exception.MLInvalidDataException;

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
	private String shippingAddress;//信用卡資訊
	
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
	private double totalAmount;
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public double getTotalAmount() {
		double sum = 0;
		if(orderItemSet!=null && orderItemSet.size()>0) {
			for(OrderItem item:orderItemSet) {
				sum+= item.getPrice() * item.getQuantity();
			}			
		}else {
			sum = this.totalAmount;
		}
		return sum;
	}
	public double getTotalAmountWithFee() {
		return getTotalAmount() + paymentFee + shippingFee;
	}
	//mutater(s)取代setter
	public void addOrderItem(OrderItem orderItem) {//for DAO類別將資料庫訂單明細對應建立為orderItem，並加入order
		if(orderItem==null) throw new IllegalArgumentException("加入明細時orderItem物件不得為空");
		orderItemSet.add(orderItem);
	}
	public void add(ShoppingCart cart) {
		if(cart==null || cart.isEmpty()) throw new IllegalArgumentException("建立訂單時cart物件不得為空");
		for (CartItem cartItem:cart.getCartItemSet()) {
			OrderItem orderItem = new OrderItem();
			
			orderItem.setMovieSession(cartItem.getMovieSession());
			
			orderItem.setPrice(cart.getUnitPrice(cartItem));
			orderItem.setQuantity(cart.getQuantity(cartItem));
			orderItem.setSeat(cart.get(cartItem));
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
	public void setOrderDate(String dateString) {
		try {
			LocalDate date = LocalDate.parse(dateString);
			setOrderDate(date);
		}catch (DateTimeParseException ex) {
			String msg = String.format("日期不符合iso8601 :%s",dateString)  ;
			throw new MLInvalidDataException(msg,ex);
		}
	}
	public LocalTime getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(LocalTime orderTime) {
		this.orderTime = orderTime;
	}
	public void setOrderTime(String timeString) {
		try {
			LocalTime time = LocalTime.parse(timeString);
			setOrderTime(time);
		} catch (DateTimeParseException ex) {
			String msg = String.format("時間不符合iso8601 :%s",timeString)  ;
			throw new MLInvalidDataException(msg,ex);
		}
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
	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
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
	
	@Override
	public String toString() {
		return this.getClass().getName() +
				"\n[訂單編號=" + id + 
				"\n, 客戶=" + customer + 
				"\n, 訂購日期=" + orderDate + 
				"\n, 訂購時間=" + orderTime + 
				"\n, 訂單狀態=" + status + 
				"\n, 付款方式=" + paymentType + 
				"\n, 付款手續費=" + paymentFee+
				"\n, paymentNote=" + paymentNote + 
				"\n, 運送方式=" + shippingType + 
				"\n, 運費=" + shippingFee+
				"\n, shippingNote=" + shippingNote + 
				"\n, 收貨地址=" + shippingAddress + 
				"\n, 收件人姓名=" + recipientName + 
				"\n, 收件人Email=" + recipientEmail + 
				"\n, 收件人電話=" + recipientPhone + 
				"\n, 訂購品項=" + getOrderItemSet() + 
				"\n, 總數量=" + getTotalQuantity() +
				"\n, 總價錢=" + getTotalAmount() + "]\n";
	}
	
}
