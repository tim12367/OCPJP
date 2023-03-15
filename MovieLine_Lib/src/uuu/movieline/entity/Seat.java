package uuu.movieline.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.Stack;

import uuu.movieline.exception.MLInvalidDataException;

public class Seat {
	private LocalDate sessionDate;
	private LocalTime sessionTime;
	private int sessionThread;
	
	private int rowA;
	private int rowB;
	private int rowC;
	private int rowD;
	private int rowE;
	private int rowF;
	private int rowG;
	private int rowH;
	private int rowI;
	public static final int MAX_SEAT_INT_EACH_ROW = 0b11_1111_1111;
	
	public LocalDate getSessionDate() {
		return sessionDate;
	}
	public void setSessionDate(LocalDate sessionDate) {
		this.sessionDate = sessionDate;
	}
	public void setSessionDate(String dateString) {
		try {
			LocalDate date = LocalDate.parse(dateString);
			setSessionDate(date);
		}catch (DateTimeParseException ex) {
			String msg = String.format("日期不符合iso8601 :%s",dateString)  ;
			throw new MLInvalidDataException(msg,ex);
		}
	}
	public LocalTime getSessionTime() {
		return sessionTime;
	}
	public void setSessionTime(LocalTime sessionTime) {
		this.sessionTime = sessionTime;
	}
	public void setSessionTime(String timeString) {
		try {
			LocalTime time = LocalTime.parse(timeString);
			setSessionTime(time);
		} catch (DateTimeParseException ex) {
			String msg = String.format("時間不符合iso8601 :%s",timeString)  ;
			throw new MLInvalidDataException(msg,ex);
		}
	}
	public int getSessionThread() {
		return sessionThread;
	}
	public void setSessionThread(int sessionThread) {
		this.sessionThread = sessionThread;
	}
	public int getRowA() {
		return rowA;
	}
	public void setRowA(int rowA) {
		if (rowA >= 0 && rowA <= MAX_SEAT_INT_EACH_ROW) {
			this.rowA = rowA;
		} else {
			String msg = String.format("A行座位必須大於等於0小於%s:%s 不正確",MAX_SEAT_INT_EACH_ROW,rowA);
			throw new MLInvalidDataException(msg);
		}
	}
	public int getRowB() {
		return rowB;
	}
	public void setRowB(int rowB) {
		if (rowB >= 0 && rowB <= MAX_SEAT_INT_EACH_ROW) {
			this.rowB = rowB;
		} else {
			String msg = String.format("B行座位必須大於等於0小於%s:%s 不正確",MAX_SEAT_INT_EACH_ROW,rowB);
			throw new MLInvalidDataException(msg);
		}
	}
	public int getRowC() {
		return rowC;
	}
	public void setRowC(int rowC) {
		if (rowC >= 0 && rowC <= MAX_SEAT_INT_EACH_ROW) {
			this.rowC = rowC;
		} else {
			String msg = String.format("C行座位必須大於等於0小於%s:%s 不正確",MAX_SEAT_INT_EACH_ROW,rowC);
			throw new MLInvalidDataException(msg);
		}
	}
	public int getRowD() {
		return rowD;
	}
	public void setRowD(int rowD) {
		if (rowD >= 0 && rowD <= MAX_SEAT_INT_EACH_ROW) {
			this.rowD = rowD;
		} else {
			String msg = String.format("D行座位必須大於等於0小於%s:%s 不正確",MAX_SEAT_INT_EACH_ROW,rowD);
			throw new MLInvalidDataException(msg);
		}
	}
	public int getRowE() {
		return rowE;
	}
	public void setRowE(int rowE) {
		if (rowE >= 0 && rowE <= MAX_SEAT_INT_EACH_ROW) {
			this.rowE = rowE;
		} else {
			String msg = String.format("E行座位必須大於等於0小於%s:%s 不正確",MAX_SEAT_INT_EACH_ROW,rowE);
			throw new MLInvalidDataException(msg);
		}
	}
	public int getRowF() {
		return rowF;
	}
	public void setRowF(int rowF) {
		if (rowF >= 0 && rowF <= MAX_SEAT_INT_EACH_ROW) {
			this.rowF = rowF;
		} else {
			String msg = String.format("F行座位必須大於等於0小於%s:%s 不正確",MAX_SEAT_INT_EACH_ROW,rowF);
			throw new MLInvalidDataException(msg);
		}
	}
	public int getRowG() {
		return rowG;
	}
	public void setRowG(int rowG) {
		if (rowG >= 0 && rowG <= MAX_SEAT_INT_EACH_ROW) {
			this.rowG = rowG;
		} else {
			String msg = String.format("G行座位必須大於等於0小於%s:%s 不正確",MAX_SEAT_INT_EACH_ROW,rowG);
			throw new MLInvalidDataException(msg);
		}
	}
	public int getRowH() {
		return rowH;
	}
	public void setRowH(int rowH) {
		if (rowH >= 0 && rowH <= MAX_SEAT_INT_EACH_ROW) {
			this.rowH = rowH;
		} else {
			String msg = String.format("H行座位必須大於等於0小於%s:%s 不正確",MAX_SEAT_INT_EACH_ROW,rowH);
			throw new MLInvalidDataException(msg);
		}
	}
	public int getRowI() {
		return rowI;
	}
	public static final int AVAILABLE_SEAT_ROW_I = 0b10_0111_1011;//I排可用座位
	public void setRowI(int rowI) {
		if((AVAILABLE_SEAT_ROW_I & rowI) != rowI){
			String msg = String.format("I行座位可用座位為%s:%s 不正確",Integer.toBinaryString(MAX_SEAT_INT_EACH_ROW),Integer.toBinaryString(rowI));
			throw new MLInvalidDataException(msg);
		} else if (rowI >= 0 && rowI <= MAX_SEAT_INT_EACH_ROW) {
			this.rowI = rowI;
		} else {
			String msg = String.format("I行座位必須大於等於0小於%s:%s 不正確",MAX_SEAT_INT_EACH_ROW,rowI);
			throw new MLInvalidDataException(msg);
		}
	}
	public List<String> getSeatList (){
		String A =Integer.toBinaryString(rowA);
		String B =Integer.toBinaryString(rowB);
		String C =Integer.toBinaryString(rowC);
		String D =Integer.toBinaryString(rowD);
		String E =Integer.toBinaryString(rowE);
		String F =Integer.toBinaryString(rowF);
		String G =Integer.toBinaryString(rowG);
		String H =Integer.toBinaryString(rowH);
		String I =Integer.toBinaryString(rowI);
		List<String> seatList = new ArrayList<String>();
		String[] rowNameList = new String[]{"A","B","C","D","E","F","G","H","I"};
		String[] rowList = new String[]{A,B,C,D,E,F,G,H,I};
		String rowName;
		String rowString;
		int seatNumber;
		
		for(int i=0;i<rowList.length;i++) {
			rowName = rowNameList[i];
			rowString = rowList[i];
			for(int j = 0;j<rowString.length();j++) {
				if(rowString.indexOf("1",j)>-1) {
					seatNumber = (rowString.length() - rowString.indexOf("1",j));
					seatList.add(rowName +(seatNumber<10?"0":"")+ seatNumber);//String 與 int相反
					j=rowString.indexOf("1",j);
				}
			}
		}
		seatList.sort(Comparator.naturalOrder());
		return seatList;
	}
	public int getQuantity() {
		return getSeatList().size();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sessionDate == null) ? 0 : sessionDate.hashCode());
		result = prime * result + sessionThread;
		result = prime * result + ((sessionTime == null) ? 0 : sessionTime.hashCode());
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
		Seat other = (Seat) obj;
		if (sessionDate == null) {
			if (other.sessionDate != null)
				return false;
		} else if (!sessionDate.equals(other.sessionDate))
			return false;
		if (sessionThread != other.sessionThread)
			return false;
		if (sessionTime == null) {
			if (other.sessionTime != null)
				return false;
		} else if (!sessionTime.equals(other.sessionTime))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return this.getClass().getName()+
				"[sessionDate=" + sessionDate + 
				",\n sessionTime=" + sessionTime + 
				",\n sessionThread=" + sessionThread +
				", rowA=" + rowA + 
				", rowB=" + rowB + 
				", rowC=" + rowC + 
				", rowD=" + rowD + 
				", rowE=" + rowE +
				", rowF=" + rowF + 
				", rowG=" + rowG + 
				", rowH=" + rowH + 
				", rowI=" + rowI +
				"\n, getSeatList()=" + getSeatList() +
				"]";
	}	
}
