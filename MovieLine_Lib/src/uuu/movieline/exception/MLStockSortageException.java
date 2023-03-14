package uuu.movieline.exception;

import uuu.movieline.entity.OrderItem;

public class MLStockSortageException extends MLException {
	private final OrderItem theOrderItem;
	
	public MLStockSortageException(OrderItem theOrderItem) {
		super("庫存不足");
		this.theOrderItem = theOrderItem;
	}

	public MLStockSortageException(OrderItem theOrderItem,String message, Throwable cause) {
		super(message, cause);
		this.theOrderItem = theOrderItem;
	}

	public MLStockSortageException(OrderItem theOrderItem,String message) {
		super(message);
		this.theOrderItem = theOrderItem;
	}

	@Override
	public String toString() {
		return String.format( "訂購項目庫存不足[電影%s 日期%s 時間%s 座位%s]", 
				theOrderItem.getMovieName(),
				theOrderItem.getSessionDate(),
				theOrderItem.getSessionTime(),
				theOrderItem.getSeatList()
				);
	}

}
