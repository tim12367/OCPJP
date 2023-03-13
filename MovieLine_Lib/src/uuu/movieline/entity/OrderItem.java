package uuu.movieline.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public class OrderItem {
	private int orderId; //Pkey
	private MovieSession movieSession; //Pkey
	
	private double price;//交易時價格, 所以不是從產品來
	private int quantity;//交易時數量
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public MovieSession getMovieSession() {
		return movieSession;
	}
	public void setMovieSession(MovieSession movieSession) {
		this.movieSession = movieSession;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	//依據畫面欄位加getter
	public String getMovieName() {
		return movieSession.getMovie().getName();
	}
	public LocalDate getSessionDate() {
		return movieSession.getDate();
	}
	public LocalTime getSessionTime() {
		return movieSession.getTime();
	}
	public Double getUnitPrice() {
		return movieSession.getMovie().getUnitPrice();
	}
	public List<String> getSeatList(){
		return movieSession.getSeat().getSeatList();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((movieSession == null) ? 0 : movieSession.hashCode());
		result = prime * result + orderId;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderItem other = (OrderItem) obj;
		if (movieSession == null) {
			if (other.movieSession != null)
				return false;
		} else if (!movieSession.equals(other.movieSession))
			return false;
		if (orderId != other.orderId)
			return false;
		return true;
	}
	
}
