package uuu.movieline.entity;

import java.util.Objects;

import uuu.movieline.exception.MLInvalidDataException;

public class Seat {
	private int id ;//Pkey
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		if (id > 0) {
			this.id = id;
		} else {
			String msg = String.format("產品編號必須大於0:%s 不正確",id);
			throw new MLInvalidDataException(msg);
		}
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
	@Override
	public int hashCode() {
		return Objects.hash(id);
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
		return id == other.id;
	}
	@Override
	public String toString() {
		return this.getClass().getName()+ 
				"[session_id=" + id 
				+ ",\n rowA=" + rowA 
				+ ",\n rowB=" + rowB 
				+ ",\n rowC=" + rowC 
				+ ",\n rowD=" + rowD 
				+ ",\n rowE=" + rowE 
				+ ",\n rowF=" + rowF 
				+ ",\n rowG=" + rowG 
				+ ",\n rowH=" + rowH 
				+ ",\n rowI=" + rowI 
				+ "]";
	}
}
