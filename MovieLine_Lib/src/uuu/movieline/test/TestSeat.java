package uuu.movieline.test;

import uuu.movieline.entity.Seat;

public class TestSeat {

	public static void main(String[] args) {
		Seat s = new Seat();
		s.setRowA(0b0);
		s.setRowB(0b1111);
		s.setRowC(0b101010);
		s.setRowD(0b1111111111);
		s.setRowE(0b11111);
		s.setRowF(0b0101);
		s.setRowG(0b1111);
		s.setRowH(0b1111);
		s.setRowI(0b0);
		for(String seat :s.getSeatList()) {
			System.out.println(seat);
		}
	}

}
