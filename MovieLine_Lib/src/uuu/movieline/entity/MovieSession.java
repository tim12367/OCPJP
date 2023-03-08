package uuu.movieline.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Objects;

import uuu.movieline.exception.MLInvalidDataException;

public class MovieSession {
	private int id;//UQ
	private LocalDate date;//PKey
	private LocalTime time;//PKey
	private int thread;//PKey
	private Movie movie;
	private Seat seat;
	private int stock;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public void setDate(String dateString) {
		try {
			LocalDate date = LocalDate.parse(dateString);
			setDate(date);
		}catch (DateTimeParseException ex) {
			String msg = String.format("日期不符合iso8601 :%s",dateString)  ;
			throw new MLInvalidDataException(msg,ex);
		}
	}
	public LocalTime getTime() {
		return time;
	}
	public void setTime(LocalTime time) {
		this.time = time;
	}
	public void setTime(String timeString) {
		try {
			LocalTime time = LocalTime.parse(timeString);
			setTime(time);
		} catch (DateTimeParseException ex) {
			String msg = String.format("時間不符合iso8601 :%s",timeString)  ;
			throw new MLInvalidDataException(msg,ex);
		}
	}
	public int getThread() {
		return thread;
	}
	public void setThread(int thread) {
		this.thread = thread;
	}
	
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public Seat getSeat() {
		return seat;
	}
	public void setSeat(Seat seat) {
		this.seat = seat;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public List<String> getSeatList(){
		if(seat!=null) {
			return seat.getSeatList();
		}else {
			return null;
		}
	}
	@Override
	public int hashCode() {
		return Objects.hash(date, thread, time);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MovieSession other = (MovieSession) obj;
		return Objects.equals(date, other.date) && thread == other.thread && Objects.equals(time, other.time);
	}
	@Override
	public String toString() {
		return this.getClass().getName()
				+ "\n[場次日期=" + date + 
				", 場次時間=" + time + 
				", 影廳=" + thread + 
				"\n, 電影=" + movie + 
				"\n, 庫存=" + stock + 
				"\n, 座位=" + seat + 
				"]\n";
	}
	
}
