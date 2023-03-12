package uuu.movieline.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ShoppingCart {
	private Customer member;
	private Map<CartItem, Seat> cartMap = new HashMap<>();
	
	public Customer getMember() {
		return member;
	}
	public void setMember(Customer member) {
		this.member = member;
	}
	//用accessers方法取代集合型態屬性cartMap的getters:	
	//以下4個business方法是利用delegate method(代理人程式)來產生的
	/**
	 * 取得map裡面有幾筆
	 * @return cartMap size
	 */
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
		Integer qty = cartMap.get(item).getQuantity();
		return qty!=null?qty:0;
	}
	public Seat get(Object key) {
			return cartMap.get(key);
		}
//	public Integer get(Object key) {
//		return cartMap.get(key).getQuantity();
//	}
	
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
	public String getSeatListString(CartItem item) {
		String seatListString = "";
		if(cartMap.get(item)!=null) {
			for(String seatString:cartMap.get(item).getSeatList()) {
				seatListString+=(seatString+",");
			}
		}
		if(cartMap.get(item).getSeatList().size()>1) {
			return seatListString.substring(0,seatListString.length()-1);			
		}
		return seatListString;
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
	/**
	 * 計算總購買數量
	 * @return 總購買數量
	 */
	public int getTotalQuantity() { //計算總購買數量
		int sum = 0;
		Integer qty;
		if (cartMap!=null && size()>0) {
			for(Seat seatTabel:cartMap.values()) {
				qty = seatTabel.getQuantity();
				sum+=(qty!=null?qty:0);
			}
		}
		return sum;
	}
	
	public void updateCartItem(CartItem currentItem, Seat newSeat) {
		Seat prevSeat = cartMap.get(currentItem);//找出之前加入的購買數量
		if(prevSeat!=null) {//有才修改
			cartMap.put(currentItem, prevSeat);
		}
	}
	public void removeCartItem(CartItem currentItem) {
		cartMap.remove(currentItem);//刪除不用判斷直接刪除 因為不必判斷
	}
	public void addCartItem(MovieSession s,Seat newSeat) {
		List<String> errList = new ArrayList<>();
		if(s==null) throw new IllegalArgumentException("加入購物車時，場次不得為null");
		if(s.getMovie()==null) throw new IllegalArgumentException("加入購物車時，電影不得為null");
		if(newSeat==null) throw new IllegalArgumentException("加入購物車時，座位不得為null");
		CartItem item = new CartItem();
		item.setMovieSession(s);
		
		Seat soldSeat = item.getSeat();
		if(soldSeat!=null) {
			if((soldSeat.getRowA()&newSeat.getRowA())>0) errList.add("A重複劃位!");
			if((soldSeat.getRowB()&newSeat.getRowB())>0) errList.add("B重複劃位!");
			if((soldSeat.getRowC()&newSeat.getRowC())>0) errList.add("C重複劃位!");
			if((soldSeat.getRowD()&newSeat.getRowD())>0) errList.add("D重複劃位!");
			if((soldSeat.getRowE()&newSeat.getRowE())>0) errList.add("E重複劃位!");
			if((soldSeat.getRowF()&newSeat.getRowF())>0) errList.add("F重複劃位!");
			if((soldSeat.getRowG()&newSeat.getRowG())>0) errList.add("G重複劃位!");
			if((soldSeat.getRowH()&newSeat.getRowH())>0) errList.add("H重複劃位!");
			if((soldSeat.getRowI()&newSeat.getRowI())>0) errList.add("I重複劃位!");
		}else {
			errList.add("無法獲取座位表!");
		}
		if(errList!=null&&errList.isEmpty()) {
			cartMap.put(item, newSeat);
		}else {
			System.out.println(errList);
		}
		
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
