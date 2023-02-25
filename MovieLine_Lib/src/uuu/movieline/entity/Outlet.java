package uuu.movieline.entity;

public class Outlet extends Movie {
	private int discount; // 必要欄位

	public Outlet() {
	}

	public Outlet(int id, String name, double price) {
		super(id, name, price);
	}

	public Outlet(int id, String name, double unitprice, int discount) {
		super(id, name, unitprice);
		this.setDiscount(discount);
		;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		if (discount >= 1 && discount <= 90) {
			this.discount = discount;
		} else {
			System.err.println("Outlet折扣必須在1~90% off之間");
		}
	}

	public String getDiscountString() {
		int discount = 100 - this.discount;
		if (discount % 10 == 0) {
			discount /= 10;
		}
		return discount + "折";

	}

	/**
	 * 查詢折扣後的售價
	 * 
	 * @return double型態的售價
	 */
	@Override
	public double getUnitPrice() {
		double price = super.getUnitPrice() * (100 - discount) / 100;
		return price;
	}

	/**
	 * 查詢定價
	 * 
	 * @return double型態的定價(父類別Product的uniPrice屬性)
	 */
	public double getListPrice() {
		return super.getUnitPrice();
	}

	@Override
	public String toString() {
		return super.toString() + "\n[" + discount + "% off" + ", 定價 = " + getListPrice() + ", 售價 = " + getUnitPrice()
				+ ", 打幾折 : " + getDiscountString() + "]";
	}

}
