package uuu.movieline.entity;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ShoppingCart {
	private Customer member;
	private Map<CartItem, Integer> cartMap = new HashMap<>();
	
	public Customer getMember() {
		return member;
	}
	public void setMember(Customer member) {
		this.member = member;
	}
	//用accessers方法取代集合型態屬性cartMap的getters:	
	//以下4個business方法是利用delegate method(代理人程式)來產生的
	public int size() {
		return cartMap.size(); //有幾項
	}
	public boolean isEmpty() {
		return cartMap.isEmpty();//是否為空
	}
	/**
	 * 取得指定CartItem的購買數量
	 * @param 指定的item
	 * @return 該item的購買數量(int)
	 */
	public int getQuantity(CartItem item) {
		if(item==null) throw new IllegalArgumentException("取得明細購買數量時，cartitem物件不得為null");
		Integer qty = cartMap.get(item);
		return qty!=null?qty:0;
	}
	public Integer get(Object key) {
		return cartMap.get(key);
	}
	public Double getListPrice(CartItem item) {
		if(item.getMovie() instanceof Outlet) {
			return item.getListPrice();
		}else {
			return item.getUnitPrice();
		}
	}
	public String getDiscountString(CartItem item) {
		if(!(item.getMovie() instanceof Outlet) && member instanceof VIP) {
			return "VIP "+((VIP)member).getDiscountString();
		}else {
			return item.getDiscountString();
		}
	}
	public Double getUnitPrice(CartItem item) {
		if(!(item.getMovie() instanceof Outlet) && member instanceof VIP) {
			return item.getUnitPrice() * (100-((VIP)member).getDiscount())/100;
		}else {
			return item.getUnitPrice();
		}
	}
	public Set<CartItem> getCartItemSet() {//取得CartItem清單
		//return (cartMap.keySet()); //不得回傳正本
		return new HashSet<>(cartMap.keySet()); //應回傳複本
	}
	//以下3個business method	
	/**
	 * 取得指定CartItem的售價*購買數量
	 * @param 指定的item
	 * @return 該item的小計金額
	 */
	public double getAmount(CartItem item) {
		if(item==null) throw new IllegalArgumentException("取得明細小計金額時，cartitem物件不得為null");
		double amount = this.getUnitPrice(item) * getQuantity(item);
		return amount;
	}
	public double getTotalAmount() { //計算總金額
		double sum = 0;
		if (cartMap!=null && size()>0) {
			for(CartItem item:cartMap.keySet()) {
				sum+=getAmount(item);
			}
		}
		return sum;
	}
	public int getTotalQuantity() { //計算總購買數量
		int sum = 0;
		if (cartMap!=null && size()>0) {
			for(Integer qty:cartMap.values()) {
				sum+=(qty!=null?qty:0);
			}
		}
		return sum;
	}
	public void addCartItem(MovieSession s,int quantity) {
		if(s==null) throw new IllegalArgumentException("加入購物車時，場次不得為null");
		if(s.getMovie()==null) throw new IllegalArgumentException("加入購物車時，電影不得為null");
		if(s.getSeat()==null) throw new IllegalArgumentException("加入購物車時，座位不得為null");
		if(quantity<=0) throw new IllegalArgumentException("加入購物車時數量必須>0");
		if(quantity != s.getSeatList().size())throw new IllegalArgumentException("加入購物車時，座位與數量不符");;
		CartItem item = new CartItem();
		item.setMovieSession(s);
		
		Integer prevQty = cartMap.get(item);
		if(prevQty!=null) {
			quantity += prevQty;
		}
		cartMap.put(item, quantity);
	}
	@Override
	public String toString() {
		return "購物車[訂購人:" + member + "\n, 內容:" + cartMap 
				+ "\n, 共" + size() 
				+ "項, " + getTotalQuantity() 
				+ "件, 總金額" + getTotalAmount()
				+ "元]";
	}
	//TODO:E07-updateCartItem, removeCartItem
}
