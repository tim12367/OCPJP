package uuu.movieline.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Objects;

public class CartItem {
	private MovieSession movieSession;//Pkey

	public MovieSession getMovieSession() {
		return movieSession;
	}
	public Movie getMovie() {
		return movieSession.getMovie();
	}
	public void setMovieSession(MovieSession movieSession) {
		this.movieSession = movieSession;
	}
	
	/*根據畫面撰寫getter*/
	public String getPhotoUrl() {
		return movieSession.getMovie().getPhotoUrl();
	}
	public String getMovieName() {
		return movieSession.getMovie().getName();
	}
	public LocalDate getSessionDate() {
		return movieSession.getDate();
	}
	public LocalTime getSessionTime() {
		return movieSession.getTime();
	}
	public Double getListPrice() {
		if(movieSession.getMovie() instanceof Outlet) {
			return ((Outlet)movieSession.getMovie()).getListPrice();
		}else {
			return null;
		}
	}
	public String getDiscountString() {
		if(movieSession.getMovie() instanceof Outlet) {
			return ((Outlet)movieSession.getMovie()).getDiscountString();
		}else {
			return "";
		}
	}
	public Double getUnitPrice() {
		return movieSession.getMovie().getUnitPrice();
	}
	/*
	 * //TODO:getStock
	public int getStock() {
		
	}
	*/
	public String getSeatListString() {
		String seatListString = "";
		if(movieSession.getSeatList()!=null) {
			for(String seatString:movieSession.getSeatList()) {
				seatListString+=(seatString+",");
			}
		}
		return seatListString.substring(0,seatListString.length()-1);
	}
	@Override
	public int hashCode() {
		return Objects.hash(movieSession);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartItem other = (CartItem) obj;
		return Objects.equals(movieSession, other.movieSession);
	}

	@Override
	public String toString() {
		return "購物明細 [getPhotoUrl()=" + getPhotoUrl() 
		+ "\n, 電影名稱()=" + getMovieName() 
		+ "\n, 日期="+ getSessionDate() 
		+ "\n, 時間=" + getSessionTime() 
		+ "\n, 定價" + getListPrice()
		+ "\n, 折數" + getDiscountString() 
		+ "\n, 優惠價" + getUnitPrice()
		+ "\n, 座位" + getSeatListString() + "]";
	}

	
}
