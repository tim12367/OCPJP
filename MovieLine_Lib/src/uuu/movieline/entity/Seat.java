package uuu.movieline.entity;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Objects;

import uuu.movieline.exception.MLInvalidDataException;

public class Seat implements Comparable<Seat> {
	private LocalDate date;
	private int showing;
	private String row;
	private int booked;//被訂的位置
	private int stock;
	
	public String getRow() {
		return row;
	}
	public void setRow(String row) {
		this.row = row;
	}
	public int getBooked() {
		return booked;
	}
	public void setBooked(int booked) {
		this.booked = booked;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getShowing() {
		return showing;
	}
	public void setShowing(int showing) {
		this.showing = showing;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public void setDate(String dateString) {
		try {
			LocalDate movieDate = LocalDate.parse(dateString);
			setDate(movieDate);
		} catch (DateTimeParseException  ex) {
			String msg = String.format("電影日期不符合iso8601 :%s",dateString);
			throw new MLInvalidDataException(msg,ex);
		}
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(date, row, showing);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Seat other = (Seat) obj;
		return Objects.equals(date, other.date) && Objects.equals(row, other.row) && showing == other.showing;
	}
	@Override
	public String toString() {
		return "座位 ["
				+ "日期=" + date + 
				", 第幾行=" + row + 
				", 已訂位(十進位)=" + booked + 
				", 已訂位(二進位)=" + Integer.toBinaryString(booked) + 
				", 剩餘位子數=" + stock + 
				", 第幾場=" + showing + "]";
	}
	@Override
	public int compareTo(Seat otherSeat) {
		int thisOrd = this.row.charAt(0)-'A';
		int otherOrd = otherSeat.row.charAt(0)-'A';
		return thisOrd-otherOrd;
	}
	
	
}
