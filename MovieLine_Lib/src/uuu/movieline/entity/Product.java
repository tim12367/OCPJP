package uuu.movieline.entity;

import java.time.LocalDate;
import java.util.Objects;

import uuu.movieline.exception.MLInvalidDataException;

public class Product {
	private int id; // 必要,Pkey,Auto-Increment
	private String name; // 必要,1~?字元
	private double unitPrice; // 必要, >0,定價(售價)
	private int stock;// 必要, >0
	private String description = "";
	private String photoUrl;
	private LocalDate launchDate;
	private String category; // 必要
	private int boxOffice; //非必要
	public Product() {
	} // 無參數建構式

	public Product(int id, String name, double price) {
		this.setId(id);
		this.setName(name);
		this.setUnitPrice(price);
	}

	public Product(int id, String name, double unitPrice, int stock, String category) {
		this(id, name, unitPrice);
		this.setStock(stock);
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

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		if (stock > 0) {
			this.stock = stock;
		} else {
			System.err.println("庫存必須大於0");
			//第13章後要改成throw RuntimeException
			String msg = String.format("庫存必須大於0 : %s 不正確",stock);
			throw new MLInvalidDataException(msg);
		}

	}

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

	@Override
	public String toString() {
		return this.getClass().getName() + "\n [產品編號 = " + id + ", 產品名稱 = " + name + ", 售價 = " + unitPrice + ", 庫存 = "
				+ stock + "\n, 產品敘述 = " + description + ", 圖片網址 = " + photoUrl + ", 發售日期 = " + launchDate + ", 分類 = "
				+ category +"\n, 票房 = "+ boxOffice +"]";
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
		Product other = (Product) obj; // 轉型
		return id == other.id; // 比較id
	}

}
