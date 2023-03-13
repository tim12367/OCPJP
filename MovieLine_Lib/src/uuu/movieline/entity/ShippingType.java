package uuu.movieline.entity;

public enum ShippingType {
	SHOP(0, "門市付款"),
	HOME(100, "貨到付款"),
	STORE(65, "超商付款");
	
	private final double fee;
	private final String description;
	
	private ShippingType(double fee, String description) {
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
