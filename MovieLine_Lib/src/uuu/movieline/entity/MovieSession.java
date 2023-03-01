package uuu.movieline.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;

import uuu.movieline.exception.MLInvalidDataException;

public class MovieSession {
	private LocalDate date;
	private LocalTime time;
	private int thread;
	private Movie movie;
	private int stock;
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
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	@Override
	public String toString() {
		return this.getClass().getName()
				+ "\n[場次日期=" + date + 
				", 場次時間=" + time + 
				", 影廳=" + thread + 
				"\n, 電影=" + movie + 
				"\n, 庫存=" + stock + "]\n";
	}
	
}
