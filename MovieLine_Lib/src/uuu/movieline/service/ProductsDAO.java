package uuu.movieline.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import uuu.movieline.entity.Outlet;
import uuu.movieline.entity.Product;
import uuu.movieline.exception.MLException;

class ProductsDAO {
	private static final String SELECT_ALL_PRODUCTS = 
			"SELECT id, name, unit_price, stock, description, "
			+ "photo_url, launch_date, category, discount, box_office "
			+ "FROM products";
	List<Product> selectAllProducts() throws MLException{
		List<Product> list = new ArrayList<>();
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
					Product p;
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new Outlet();
						((Outlet)p).setDiscount(discount);
					}else{
						p = new Product();
					}
					
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setDescription(rs.getString("description"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
					p.setCategory(rs.getString("category"));
					
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
	List<Product> selectProductsByKeyword(String keyword) throws MLException{
		List<Product> list = new ArrayList<>();
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
					Product p;
					int discount = rs.getInt("discount");
					if(discount>0) {
						p = new Outlet();
						((Outlet)p).setDiscount(discount);
					}else{
						p = new Product();
					}
					
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setDescription(rs.getString("description"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
					p.setCategory(rs.getString("category"));
					
					list.add(p);//!!要記得加入查詢清單
				}
			}
		} catch (SQLException e) {
			
			throw new MLException("[查詢全部產品]失敗",e);
		}
		
		
		return list;
	}
}
