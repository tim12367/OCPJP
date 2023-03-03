package uuu.movieline.entity;

import java.time.LocalDate;
import java.util.Objects;

import uuu.movieline.exception.MLInvalidDataException;

public class Movie {
	private int id; // 必要,Pkey,Auto-Increment
	private String name; // 必要,1~?字元
	private double unitPrice; // 必要, >0,定價(售價)
	//private int stock;// 必要, >0
	private String category; // 必要
	private String description = "";//非必要
	private String photoUrl;//非必要
	private LocalDate launchDate;//非必要
	private int boxOffice; //非必要
	private String director;//非必要
	private String cast;//非必要
	private String subtitle;//非必要
	private String trailerUrl;//非必要
	//private Map<String,Seat> seatsMap = new HashMap<>();//預設沒有
	
	//集合型態的Attribute,getter不可直接回傳正本
//	public List<Seat> getSeatsList() {
//		//排序要實作 Comparable 介面跟 compareTo方法
//		List<Seat> list = new ArrayList<>(seatsMap.values());
//		Collections.sort(list);
//		return list;
//	}
	
//	public int seatCount() {
//		return seatsMap.size();
//	}
//	
//	
//	//集合型態的Attribute,setter必須改為addColor
//	public void addSeats(Seat seat){
//		if(seat==null) throw new IllegalArgumentException("加入座位集合的seat物件不得為null");
//		seatsMap.put(seat.getRow(), seat);
//	}
	
	public Movie() {
	} // 無參數建構式

	public Movie(int id, String name, double price) {
		this.setId(id);
		this.setName(name);
		this.setUnitPrice(price);
	}

	public Movie(int id, String name, double unitPrice, 
//			int stock,
			String category) {
		this(id, name, unitPrice);
//		this.setStock(stock);
		this.setCategory(category);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		if (id > 0) {
			this.id = id;
		} else {
//			System.err.println("產品編號要大於0" + id + "不正確");
			//  第13章後要改成throw RuntimeException
			String msg = String.format("產品編號必須大於0:%s 不正確",id);
			throw new MLInvalidDataException(msg);
		}

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		if (name != null && name.length() > 0) {
			this.name = name;
		} else {
//			System.err.println("產品名稱必須大於一個字元");
			// 第13章後要改成throw RuntimeException
			String msg = String.format("產品名稱必須大於一個字元:%s 不正確",name);
			throw new MLInvalidDataException(msg);
		}

	}

	/**
	 * 查詢定價(即售價)
	 * 
	 * @return double型態定價(即售價)
	 */
	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		if (unitPrice >= 0) {
			this.unitPrice = unitPrice;
		} else {
//			System.err.println("產品定價必須>=0 " + unitPrice + "不正確");
			//  第13章後要改成throw RuntimeException
			String msg = String.format("產品定價必須>=0 : %s 不正確",unitPrice);
			throw new MLInvalidDataException(msg);
		}

	}

//	public int getStock() {
//		return stock;
//	}

//	public void setStock(int stock) {
//		if (stock > 0) {
//			this.stock = stock;
//		} else {
//			System.err.println("庫存必須大於0");
//			//第13章後要改成throw RuntimeException
//			String msg = String.format("庫存必須大於0 : %s 不正確",stock);
//			throw new MLInvalidDataException(msg);
//		}
//
//	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public LocalDate getLaunchDate() {
		return launchDate;
	}

	public void setLaunchDate(LocalDate launchDate) {
		this.launchDate = launchDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getBoxOffice() {
		return boxOffice;
	}

	public void setBoxOffice(int boxOffice) {
		this.boxOffice = boxOffice;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getTrailerUrl() {
		return trailerUrl;
	}

	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}

	@Override
	public String toString() {
		return this.getClass().getName() + "\n [產品編號 = " + id + ", 產品名稱 = " + name +", 副標題 = " + subtitle + 
				"\n, 售價 = " + unitPrice + 
//				", 庫存 = "+ stock + 
				", 產品敘述 = " + description + ", 圖片網址 = " + photoUrl +
				"\n, 發售日期 = " + launchDate + ", 分類 = "
				+ category +", 票房 = "+ boxOffice +", 導演 = "+ director +", 演員 = "+ cast + ", 預告片 = "+ trailerUrl 
//				+"\n, SeatMap ="+this.getSeatsList()
				+"]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null) // 防止傳入null
			return false;
		// 若原始型別相等才能比較 例如加入購物車 同商品但折扣不同
		if (this.getClass() != obj.getClass()) 
			return false;
		Movie other = (Movie) obj; // 轉型
		return id == other.id; // 比較id
	}

}
