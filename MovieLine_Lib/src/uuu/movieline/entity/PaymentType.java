package uuu.movieline.entity;

public enum PaymentType {
	SHOP(0, "現場付款"),
	CARD(0, "信用卡");
	
	private final double fee;
	private final String description;
	
	private PaymentType(double fee, String description) {
		this.fee = fee;
		this.description = description;
	}
	
	public double getFee() {
		return fee;
	}
	
	public String getDescription() {
		return description;
	}
	@Override
	public String toString() {
		return description + (fee>0?fee+"元":"");
	}
}
