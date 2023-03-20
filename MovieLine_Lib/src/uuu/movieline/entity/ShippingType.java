package uuu.movieline.entity;

public enum ShippingType {
	SHOP(0, "現場取票"),
	E_TICKET(0, "線上取票");
	
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
