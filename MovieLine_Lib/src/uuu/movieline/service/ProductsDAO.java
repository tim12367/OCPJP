package uuu.movieline.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.util.DnsSrv.SrvRecord;

import uuu.movieline.entity.Outlet;
import uuu.movieline.entity.Movie;
import uuu.movieline.entity.Seat;
import uuu.movieline.exception.MLException;

class ProductsDAO {
	private static final String SELECT_ALL_PRODUCTS = 
			"SELECT id, name, unit_price, stock, description, "
			+ "photo_url, launch_date, category, discount, box_office "
			+ "FROM products";
	List<Movie> selectAllProducts() throws MLException{
		List<Movie> list = new ArrayList<>();
		//connection
		try(
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL_PRODUCTS);
			) {
			//3.1 傳入?(無)的值
			
			try(
					//4 執行指令
					ResultSet rs = pstmt.executeQuery();
				){
				
				//5.處理rs
				while (rs.next()) {
					Movie p;
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new Outlet();
						((Outlet)p).setDiscount(discount);
					}else{
						p = new Movie();
					}
					
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setDescription(rs.getString("description"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
					p.setCategory(rs.getString("category"));
					p.setBoxOffice(rs.getInt("box_office"));
					
					list.add(p);//!!要記得加入查詢清單
				}
			}
		} catch (SQLException e) {
			
			throw new MLException("[查詢全部產品]失敗",e);
		}
		
		
		return list;
	}
	private static final String SELECT_PRODUCTS_BY_KEYWORD = SELECT_ALL_PRODUCTS
			+" WHERE name LIKE ?";
	List<Movie> selectProductsByKeyword(String keyword) throws MLException{
		//查詢清單
		List<Movie> list = new ArrayList<>();
		//connection
		try(
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_KEYWORD);
			) {
			//3.1 傳入?的值
			pstmt.setString(1, "%"+keyword+"%");
			try(
					//4 執行指令
					ResultSet rs = pstmt.executeQuery();
				){
				//5.處理rs
				while (rs.next()) {
					Movie p;
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new Outlet();
						((Outlet)p).setDiscount(discount);
					}else{
						p = new Movie();
					}
					
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setDescription(rs.getString("description"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
					p.setCategory(rs.getString("category"));
					p.setBoxOffice(rs.getInt("box_office"));
					
					list.add(p);//!!要記得加入查詢清單
				}
			}
		} catch (SQLException e) {
			
			throw new MLException("[查詢全部產品]失敗",e);
		}
		
		
		return list;
	}
	private static final String SELECT_PRODUCTS_BY_CATEGORY = SELECT_ALL_PRODUCTS
			+" WHERE category = ?";
	List<Movie> selectProductsByCategory(String category) throws MLException {
		//查詢清單
				List<Movie> list = new ArrayList<>();
				//connection
				try(
						Connection connection = MySQLConnection.getConnection();
						PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCTS_BY_CATEGORY);
					) {
					//3.1 傳入?的值
					pstmt.setString(1, category);
					try(
							//4 執行指令
							ResultSet rs = pstmt.executeQuery();
						){
						//5.處理rs
						while (rs.next()) {
							Movie p;
							int discount = rs.getInt("discount");
							if(discount>0) {
								p = new Outlet();
								((Outlet)p).setDiscount(discount);
							}else{
								p = new Movie();
							}
							
							p.setId(rs.getInt("id"));
							p.setName(rs.getString("name"));
							p.setUnitPrice(rs.getDouble("unit_price"));
							p.setStock(rs.getInt("stock"));
							p.setDescription(rs.getString("description"));
							p.setPhotoUrl(rs.getString("photo_url"));
							p.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
							p.setCategory(rs.getString("category"));
							p.setBoxOffice(rs.getInt("box_office"));
							
							list.add(p);//!!要記得加入查詢清單
						}
					}
				} catch (SQLException e) {
					
					throw new MLException("[查詢全部產品]失敗",e);
				}
				
				
				return list;
	}
//	private static final String SELECT_PRODUCT_BY_ID = 
//			"SELECT id, name, subtitle, unit_price, stock, description, "
//			+ "photo_url, trailer_url, launch_date, category, discount, box_office, director, cast "
//			+ "FROM products WHERE id=?";
	private static final String SELECT_PRODUCT_BY_ID = 
			 "SELECT id, name, subtitle, unit_price, products.stock , description,"
			+ "	photo_url, trailer_url, launch_date, category, discount, box_office,director, cast, "
			+ " row_name, seats_booked, product_seats.stock AS row_stock ,showing ,date "
			+ " FROM products LEFT OUTER JOIN product_seats "
			+ "	on id = product_id "
			+ " where id = ? "
			+ " order by id,showing;";
	
	Movie selectProductById(String id) throws MLException{
		Movie p =null;
		try(	//connection
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
			) {
			//3.1 傳入?的值
			pstmt.setString(1, id);
			
			try(
					//4 執行指令
					ResultSet rs = pstmt.executeQuery();
				){
				//5.處理rs
				while (rs.next()) {
					//只建立一次p物件
					if(p==null) {
						int discount = rs.getInt("discount");
						if(discount>0) {
							p = new Outlet();
							((Outlet)p).setDiscount(discount);
						}else{
							p = new Movie();
						}
						
						p.setId(rs.getInt("id"));
						p.setName(rs.getString("name"));
						p.setUnitPrice(rs.getDouble("unit_price"));
						p.setStock(rs.getInt("stock"));
						p.setDescription(rs.getString("description"));
						p.setPhotoUrl(rs.getString("photo_url"));
						p.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
						p.setCategory(rs.getString("category"));
						p.setBoxOffice(rs.getInt("box_office"));
						p.setDirector(rs.getString("director"));
						p.setCast(rs.getString("cast"));
						p.setSubtitle(rs.getString("subtitle"));
						p.setTrailerUrl(rs.getString("trailer_url"));
					}
					//fortest
//					System.out.println(p);
//					System.out.printf("資訊%s %s %s %s",
//							rs.getString("row_name"),
//							rs.getInt("seats_booked"),
//							rs.getInt("row_stock"),
//							rs.getInt("showing")
//							);
					
					//檢查是否有位子
//					String rowName = rs.getString("row_name");
//					if (rowName!=null) {
//						Seat seat = new Seat();
//						seat.setDate(rs.getString("date"));
//						seat.setRow(rowName);
//						seat.setBooked(rs.getInt("seats_booked"));
//						seat.setStock(rs.getInt("row_stock"));
//						seat.setShowing(rs.getInt("showing"));
//						p.addSeats(seat);
//					}
				}
			}
		} catch (SQLException e) {
			throw new MLException("[用id查詢產品失敗]",e);
		}
		return p;
		
		
	}
}
