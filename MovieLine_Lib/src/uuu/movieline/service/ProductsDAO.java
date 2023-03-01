package uuu.movieline.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import uuu.movieline.entity.Outlet;
import uuu.movieline.entity.Movie;
import uuu.movieline.entity.MovieSession;
import uuu.movieline.exception.MLException;

class ProductsDAO {
	private static final String SELECT_ALL_MOVIES = 
			"SELECT id, name, unit_price, stock, description, "
			+ "photo_url, launch_date, category, discount, box_office "
			+ "FROM movies";
	List<Movie> selectAllProducts() throws MLException{
		List<Movie> list = new ArrayList<>();
		//connection
		try(
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL_MOVIES);
			) {
			//3.1 傳入?(無)的值
			
			try(
					//4 執行指令
					ResultSet rs = pstmt.executeQuery();
				){
				
				//5.處理rs
				while (rs.next()) {
					Movie m;
					int discount = rs.getInt("discount");
					if(discount>0) {
						m = new Outlet();
						((Outlet)m).setDiscount(discount);
					}else{
						m = new Movie();
					}
					
					m.setId(rs.getInt("id"));
					m.setName(rs.getString("name"));
					m.setUnitPrice(rs.getDouble("unit_price"));
					m.setStock(rs.getInt("stock"));
					m.setDescription(rs.getString("description"));
					m.setPhotoUrl(rs.getString("photo_url"));
					m.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
					m.setCategory(rs.getString("category"));
					m.setBoxOffice(rs.getInt("box_office"));
					
					list.add(m);//!!要記得加入查詢清單
				}
			}
		} catch (SQLException e) {
			
			throw new MLException("[查詢全部產品]失敗",e);
		}
		
		
		return list;
	}
	private static final String SELECT_MOVIES_BY_KEYWORD = SELECT_ALL_MOVIES
			+" WHERE name LIKE ?";
	List<Movie> selectProductsByKeyword(String keyword) throws MLException{
		//查詢清單
		List<Movie> list = new ArrayList<>();
		//connection
		try(
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_MOVIES_BY_KEYWORD);
			) {
			//3.1 傳入?的值
			pstmt.setString(1, "%"+keyword+"%");
			try(
					//4 執行指令
					ResultSet rs = pstmt.executeQuery();
				){
				//5.處理rs
				while (rs.next()) {
					Movie m;
					int discount = rs.getInt("discount");
					if(discount>0) {
						m = new Outlet();
						((Outlet)m).setDiscount(discount);
					}else{
						m = new Movie();
					}
					
					m.setId(rs.getInt("id"));
					m.setName(rs.getString("name"));
					m.setUnitPrice(rs.getDouble("unit_price"));
					m.setStock(rs.getInt("stock"));
					m.setDescription(rs.getString("description"));
					m.setPhotoUrl(rs.getString("photo_url"));
					m.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
					m.setCategory(rs.getString("category"));
					m.setBoxOffice(rs.getInt("box_office"));
					
					list.add(m);//!!要記得加入查詢清單
				}
			}
		} catch (SQLException e) {
			
			throw new MLException("[查詢全部產品]失敗",e);
		}
		
		
		return list;
	}
	private static final String SELECT_MOVIE_CATEGORY_GROUP_BY_CATEGORY =
			"SELECT category,COUNT(category) AS category_counter"
			+ " FROM movies "
			+ " GROUP BY category ";
	List<String[]> selectMovieCategoryGroupByCategory() throws MLException{
		List<String[]> list = new ArrayList<>();
		//connection
		try(
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_MOVIE_CATEGORY_GROUP_BY_CATEGORY);
			) {
			//3.1 傳入?(無)的值
			
			try(
					//4 執行指令
					ResultSet rs = pstmt.executeQuery();
				){
				
				//5.處理rs
				while (rs.next()) {
					String[] tempArray = new String[2];
					tempArray[0] = rs.getString("category");
					tempArray[1] = rs.getString("category_counter");
					
					list.add(tempArray);//!!要記得加入查詢清單
				}
			}
		} catch (SQLException e) {
			
			throw new MLException("[獲得全部分類]失敗",e);
		}
		return list;
	}
	private static final String SELECT_MOVIES_BY_CATEGORY = SELECT_ALL_MOVIES
			+" WHERE category = ?";
	List<Movie> selectProductsByCategory(String category) throws MLException {
		//查詢清單
				List<Movie> list = new ArrayList<>();
				//connection
				try(
						Connection connection = MySQLConnection.getConnection();
						PreparedStatement pstmt = connection.prepareStatement(SELECT_MOVIES_BY_CATEGORY);
					) {
					//3.1 傳入?的值
					pstmt.setString(1, category);
					try(
							//4 執行指令
							ResultSet rs = pstmt.executeQuery();
						){
						//5.處理rs
						while (rs.next()) {
							Movie m;
							int discount = rs.getInt("discount");
							if(discount>0) {
								m = new Outlet();
								((Outlet)m).setDiscount(discount);
							}else{
								m = new Movie();
							}
							
							m.setId(rs.getInt("id"));
							m.setName(rs.getString("name"));
							m.setUnitPrice(rs.getDouble("unit_price"));
							m.setStock(rs.getInt("stock"));
							m.setDescription(rs.getString("description"));
							m.setPhotoUrl(rs.getString("photo_url"));
							m.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
							m.setCategory(rs.getString("category"));
							m.setBoxOffice(rs.getInt("box_office"));
							
							list.add(m);//!!要記得加入查詢清單
						}
					}
				} catch (SQLException e) {
					
					throw new MLException("[查詢全部產品]失敗",e);
				}
				
				
				return list;
	}

	private static final String SELECT_MOVIES_BY_ID = 
			 "SELECT id, name, subtitle, unit_price, movies.stock , description,"
			+ "	photo_url, trailer_url, launch_date, category, discount, box_office,director, cast, "
			+ " row_name, seats_booked, product_seats.stock AS row_stock ,showing ,date "
			+ " FROM movies LEFT OUTER JOIN product_seats "
			+ "	on id = product_id "
			+ " where id = ? "
			+ " order by id,showing;";
	
	Movie selectProductById(String id) throws MLException{
		Movie m =null;
		try(	//connection
				Connection connection = MySQLConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_MOVIES_BY_ID);
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
					if(m==null) {
						int discount = rs.getInt("discount");
						if(discount>0) {
							m = new Outlet();
							((Outlet)m).setDiscount(discount);
						}else{
							m = new Movie();
						}
						
						m.setId(rs.getInt("id"));
						m.setName(rs.getString("name"));
						m.setUnitPrice(rs.getDouble("unit_price"));
						m.setStock(rs.getInt("stock"));
						m.setCategory(rs.getString("category"));
						m.setDescription(rs.getString("description"));
						m.setPhotoUrl(rs.getString("photo_url"));
						m.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
						m.setBoxOffice(rs.getInt("box_office"));
						m.setDirector(rs.getString("director"));
						m.setCast(rs.getString("cast"));
						m.setSubtitle(rs.getString("subtitle"));
						m.setTrailerUrl(rs.getString("trailer_url"));
					}
				}
			}
		} catch (SQLException e) {
			throw new MLException("[用id查詢電影失敗]",e);
		}
		return m;
		
		
	}
	private static final String SELECT_SESSIONS_BY_MOVIE_ID =
			"SELECT date, time, thread, movie_id, sessions.stock ,"
			+ "id, name, subtitle, "
			+ "unit_price, movies.stock, description, "
			+ "photo_url, trailer_url, launch_date, "
			+ "category, discount, box_office, director, cast "
			+ " FROM sessions "
			+ " LEFT JOIN movies "
			+ " ON id=movie_id "
			+ " WHERE movie_id = ? "
			+ " ORDER BY date,time ";
	List<MovieSession> selectSessionsByMovieId(String id) throws MLException{
		List<MovieSession> list= new ArrayList<>();//查詢list
		try (
			Connection connection = MySQLConnection.getConnection();//1,2
			PreparedStatement pstmt = connection.prepareStatement(SELECT_SESSIONS_BY_MOVIE_ID);//3
			){
			//3.1 傳入?的值
			pstmt.setString(1, id);
			try(
				//4.執行指令
				ResultSet rs = pstmt.executeQuery();
				){
				//5.處理rs
				while (rs.next()) {
					MovieSession s = new MovieSession();
					s.setDate(rs.getString("date"));
					s.setTime(rs.getString("time"));
					s.setThread(rs.getInt("thread"));
					s.setStock(rs.getInt("stock"));
					//MOVIE
					Movie m = null;
					int discount = rs.getInt("discount");
					if(discount>0) {
						m = new Outlet();
						((Outlet)m).setDiscount(discount);
					}else{
						m = new Movie();
					}
					m.setId(rs.getInt("id"));
					m.setName(rs.getString("name"));
					m.setUnitPrice(rs.getDouble("unit_price"));
					m.setStock(rs.getInt("stock"));
					m.setCategory(rs.getString("category"));
					m.setDescription(rs.getString("description"));
					m.setPhotoUrl(rs.getString("photo_url"));
					m.setLaunchDate(LocalDate.parse(rs.getString("launch_date")));
					m.setBoxOffice(rs.getInt("box_office"));
					m.setDirector(rs.getString("director"));
					m.setCast(rs.getString("cast"));
					m.setSubtitle(rs.getString("subtitle"));
					m.setTrailerUrl(rs.getString("trailer_url"));
					//加入MovieSession
					s.setMovie(m);
					//加入查詢清單
					list.add(s);
				}
				return list;
			}
		} catch (SQLException e) {
			throw new MLException("[用電影編號查詢session]失敗",e);
		}
		
		
	}
}
