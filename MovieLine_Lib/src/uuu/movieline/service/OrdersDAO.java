package uuu.movieline.service;

import uuu.movieline.entity.Movie;
import uuu.movieline.entity.MovieSession;
import uuu.movieline.entity.Order;
import uuu.movieline.entity.OrderItem;
import uuu.movieline.entity.Outlet;
import uuu.movieline.entity.Seat;
import uuu.movieline.exception.MLException;
import uuu.movieline.exception.MLStockSortageException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

class OrdersDAO {
	
	private static final String INSERT_orders = 
			"INSERT INTO orders "
			+ "	(id, customer_id, order_date, order_time, status, "
			+ "    payment_type, payment_fee, payment_note, "
			+ "    shipping_type, shipping_fee,shipping_address, "
			+ "    recipient_name, recipient_email, recipient_phone) "
			+ "    VALUES(?,?,?,?,0, ?,?,'', ?,?,?, ?,?,?) ";
	private static final String INSERT_order_items = 
			"INSERT INTO order_Items "
			+ "	(order_id, session_date, session_time, session_theater, price, quantity, "
			+ " A, B, C, D, E, F, G, H, I) "
			+ "    VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	private static final String UPDATE_seats_stock=
			"UPDATE seats SET  "
			+ "A = A|?, B = B|?, C = C|?, D = D|?,  "
			+ "E = E|?, F = F|?, G = G|?, H = H|?, I = I|? "
			+ "WHERE A<=1023 AND B<=1023 AND C<=1023 AND D<=1023 AND  "
			+ "E<=1023 AND F<=1023 AND G<=1023 AND H<=1023 AND I<=1023 AND "
			+ "((A&?)=0) AND ((B&?)=0) AND ((C&?)=0) AND ((D&?)=0) AND  "
			+ "((E&?)=0) AND ((F&?)=0) AND ((G&?)=0) AND ((H&?)=0) AND ((I&?)=0) AND  "
			+ "(session_date = ? AND session_time = ? AND session_theater = ?)";
	void insert(Order order) throws MLException{
		
		try(
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				PreparedStatement pstmt01 = connection.prepareStatement(UPDATE_seats_stock);//更新座位指令
				
				PreparedStatement pstmt1 = connection.prepareStatement(INSERT_orders, Statement.RETURN_GENERATED_KEYS);//3.準備指令1
				PreparedStatement pstmt2 = connection.prepareStatement(INSERT_order_items);//3.準備指令2
			) {
			connection.setAutoCommit(false);
			try {
				//庫存管理
				if(order.getOrderItemSet()!=null&&order.size()>0) {//檢查訂單內有無明細
					for(OrderItem orderItem:order.getOrderItemSet()) {
						PreparedStatement pstmt ;
						pstmt = pstmt01;
						
						//3.1 pstmt01的?值
						pstmt.setInt(1, orderItem.getSeat().getRowA());
						pstmt.setInt(2, orderItem.getSeat().getRowB());
						pstmt.setInt(3, orderItem.getSeat().getRowC());
						pstmt.setInt(4, orderItem.getSeat().getRowD());
						pstmt.setInt(5, orderItem.getSeat().getRowE());
						pstmt.setInt(6, orderItem.getSeat().getRowF());
						pstmt.setInt(7, orderItem.getSeat().getRowG());
						pstmt.setInt(8, orderItem.getSeat().getRowH());
						pstmt.setInt(9, orderItem.getSeat().getRowI());
						
						pstmt.setInt(10, orderItem.getSeat().getRowA());
						pstmt.setInt(11, orderItem.getSeat().getRowB());
						pstmt.setInt(12, orderItem.getSeat().getRowC());
						pstmt.setInt(13, orderItem.getSeat().getRowD());
						pstmt.setInt(14, orderItem.getSeat().getRowE());
						pstmt.setInt(15, orderItem.getSeat().getRowF());
						pstmt.setInt(16, orderItem.getSeat().getRowG());
						pstmt.setInt(17, orderItem.getSeat().getRowH());
						pstmt.setInt(18, orderItem.getSeat().getRowI());
						
						pstmt.setString(19, orderItem.getSessionDate().toString());
						pstmt.setString(20, orderItem.getSessionTime().toString());
						pstmt.setInt(21, orderItem.getSessionTheater());
						
						//4.執行修改庫存的指令
						int rows = pstmt.executeUpdate();
						if(rows==0) {
							throw new MLStockSortageException(orderItem);
						}
						System.out.println("修改成功: "+orderItem);
					}
				}else {
					throw new MLException("訂單必須有明細");
				}
				//3.1傳入pstmt1?的值
				pstmt1.setInt(1, order.getId());
				pstmt1.setString(2, order.getCustomer().getId());
				pstmt1.setString(3, order.getOrderDate().toString());
				pstmt1.setString(4, order.getOrderTime().toString());
				
				pstmt1.setString(5, order.getPaymentType());
				pstmt1.setDouble(6, order.getPaymentFee());
				
				pstmt1.setString(7, order.getShippingType());
				pstmt1.setDouble(8, order.getShippingFee());
				pstmt1.setString(9, order.getShippingAddress());
				
				pstmt1.setString(10, order.getRecipientName());
				pstmt1.setString(11, order.getRecipientEmail());
				pstmt1.setString(12, order.getRecipientPhone());
				
				//4.執行pstmt1
				pstmt1.executeUpdate();
				
				try(
					//取得自動給號的值
					ResultSet rs = pstmt1.getGeneratedKeys();
				){
					while (rs.next()) {
						order.setId(rs.getInt(1));//從pstmt1 RETURN_GENERATED_KEYS 回傳AI給號
					}
				}
				if(order.getOrderItemSet()!=null&&order.size()>0) {
					for(OrderItem orderItem:order.getOrderItemSet()) {
						//3.1 傳入pstmt2?的值
						pstmt2.setInt(1,order.getId());
						pstmt2.setString(2,orderItem.getMovieSession().getDate().toString());
						pstmt2.setString(3,orderItem.getMovieSession().getTime().toString());
						pstmt2.setInt(4, orderItem.getMovieSession().getTheater());
						pstmt2.setDouble(5, orderItem.getPrice());
						pstmt2.setInt(6, orderItem.getQuantity());
						pstmt2.setInt(7, orderItem.getSeat().getRowA());
						pstmt2.setInt(8, orderItem.getSeat().getRowB());
						pstmt2.setInt(9, orderItem.getSeat().getRowC());
						pstmt2.setInt(10, orderItem.getSeat().getRowD());
						pstmt2.setInt(11, orderItem.getSeat().getRowE());
						pstmt2.setInt(12, orderItem.getSeat().getRowF());
						pstmt2.setInt(13, orderItem.getSeat().getRowG());
						pstmt2.setInt(14, orderItem.getSeat().getRowH());
						pstmt2.setInt(15, orderItem.getSeat().getRowI());
						
						//4.執行pstmt2
						pstmt2.executeUpdate();
					}
				}
				connection.commit();
			}catch(Exception e) {
				connection.rollback();
				throw e;
			}finally {
				connection.setAutoCommit(true);
			}
		} catch (SQLException e) {
			throw new MLException("建立訂單失敗",e);
		}
		
	}
	private static final String SELECT_Order_ByOrderId_And_CustomerId = 
			"SELECT orders.id, customer_id, order_date, order_time,  "
			+ "status, payment_type, payment_fee, payment_note,  "
			+ "shipping_type, shipping_fee, shipping_note, shipping_address,  "
			+ "recipient_name, recipient_email, recipient_phone , "
			+ "session_date, session_time, session_theater, price, quantity, A, B, C, D, E, F, G, H, I, "
			+ "movie_id,stock,  "
			+ " name, subtitle, unit_price, description, photo_url, trailer_url, "
			+ " launch_date, category, discount, box_office, director, cast "
			+ "FROM orders  "
			+ "LEFT JOIN order_items ON orders.id = order_items.order_id "
			+ "LEFT JOIN sessions ON (session_date = date AND session_time = time AND session_theater=theater) "
			+ "LEFT JOIN movies ON movie_id = movies.id "
			+ "WHERE orders.id = ? AND customer_id = ? ";
	Order selectOrderByOrderIdAndCustomerId(String orderId, String customerId) throws MLException {
		Order o =null;
		try(
				Connection connection = MySQLConnection.getConnection();//1,2
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Order_ByOrderId_And_CustomerId);//3,
			) {
			//3.1傳入?值
			pstmt.setString(1, orderId);
			pstmt.setString(2, customerId);
			try(
				ResultSet rs = pstmt.executeQuery();
				){
				while (rs.next()) {
					if(o==null) {
						o = new Order();
						o.setId(rs.getInt("id"));
						o.setOrderDate(rs.getString("order_date"));
						o.setOrderTime(rs.getString("order_time"));
						o.setStatus(rs.getInt("status"));
						
						o.setPaymentType(rs.getString("payment_type"));
						o.setPaymentFee(rs.getDouble("payment_fee"));
						o.setPaymentNote(rs.getString("payment_note"));
						
						o.setShippingType(rs.getString("shipping_type"));
						o.setShippingFee(rs.getDouble("shipping_fee"));
						o.setShippingNote(rs.getString("shipping_note"));
						o.setShippingAddress(rs.getString("shipping_address"));
						
						o.setRecipientName(rs.getString("recipient_name"));
						o.setRecipientEmail(rs.getString("recipient_email"));
						o.setRecipientPhone(rs.getString("recipient_phone"));
					}
					OrderItem oItem = new OrderItem();
					MovieSession mSession = new MovieSession();
					int discount = rs.getInt("discount");
					
					Movie m = null;
					if(discount>0) {
						m = new Outlet();
						((Outlet)m).setDiscount(discount);						
					}else m = new Movie();
					
					Seat seat = new Seat();
					//場次資訊
					oItem.setPrice(rs.getDouble("price"));
					oItem.setQuantity(rs.getInt("quantity"));
					mSession.setDate(rs.getString("session_date"));
					mSession.setTime(rs.getString("session_time"));
					mSession.setTheater(rs.getInt("session_theater"));
					mSession.setStock(rs.getInt("stock"));
					
					//座位資訊
					seat.setRowA(rs.getInt("A"));
					seat.setRowB(rs.getInt("B"));
					seat.setRowC(rs.getInt("C"));
					seat.setRowD(rs.getInt("D"));
					seat.setRowE(rs.getInt("E"));
					seat.setRowF(rs.getInt("F"));
					seat.setRowG(rs.getInt("G"));
					seat.setRowH(rs.getInt("H"));
					seat.setRowI(rs.getInt("I"));
					
					m.setId(rs.getInt("movie_id"));
					m.setName(rs.getString("name"));
					m.setSubtitle(rs.getString("subtitle"));
					m.setUnitPrice(rs.getDouble("unit_price"));
					m.setDescription(rs.getString("description"));
					m.setPhotoUrl(rs.getString("photo_url"));
					m.setTrailerUrl(rs.getString("trailer_url"));
					m.setLaunchDate(rs.getString("launch_date"));
					m.setCategory(rs.getString("category"));
					m.setBoxOffice(rs.getInt("box_office"));
					m.setDirector(rs.getString("director"));
					m.setCast(rs.getString("cast"));
					//將電影加入Session
					mSession.setMovie(m);
					//將座位,場次加入明細
					oItem.setMovieSession(mSession);
					oItem.setSeat(seat);
					//將明細加入訂單
					o.addOrderItem(oItem);
				}
			}
		} catch (SQLException e) {
			throw new MLException("[用訂單編號與客戶ID查詢訂單]失敗");
		}
		return o;
	}
	private static final String SELECT_Order_ByCustomerId = 
			"SELECT id, customer_id, order_date, order_time, status, payment_type, payment_fee, payment_note,  "
			+ "shipping_type, shipping_fee, shipping_note, shipping_address,  "
			+ "recipient_name, recipient_email, recipient_phone, session_date, session_time, session_theater, price, quantity,  "
			+ "A, B, C, D, E, F, G, H, I, movie_id, stock, name, subtitle, unit_price,  "
			+ "description, photo_url, trailer_url, launch_date, category, discount, box_office, director, cast  "
			+ "FROM vgb.orders_orderitems_sessions_movies_view  "
			+ "WHERE customer_id = ? ORDER BY order_date DESC,order_time DESC";
	List<Order> selectOrdersByCustomerId(String customerId) throws MLException {
		List<Order> list = new ArrayList<>();
		Order o = null;
		try(
				Connection connection = MySQLConnection.getConnection();//1,2
				PreparedStatement pstmt = connection.prepareStatement(SELECT_Order_ByCustomerId);//3,
				) {
			//3.1傳入?值
			pstmt.setString(1, customerId);
			try(
					ResultSet rs = pstmt.executeQuery();
					){
				while (rs.next()) {
					if(o==null) {
						o = new Order();
						o.setId(rs.getInt("id"));
						o.setOrderDate(rs.getString("order_date"));
						o.setOrderTime(rs.getString("order_time"));
						o.setStatus(rs.getInt("status"));
						
						o.setPaymentType(rs.getString("payment_type"));
						o.setPaymentFee(rs.getDouble("payment_fee"));
						o.setPaymentNote(rs.getString("payment_note"));
						
						o.setShippingType(rs.getString("shipping_type"));
						o.setShippingFee(rs.getDouble("shipping_fee"));
						o.setShippingNote(rs.getString("shipping_note"));
						o.setShippingAddress(rs.getString("shipping_address"));
						
						o.setRecipientName(rs.getString("recipient_name"));
						o.setRecipientEmail(rs.getString("recipient_email"));
						o.setRecipientPhone(rs.getString("recipient_phone"));
					}else if(o.getId()!=rs.getInt("id")){
						//若是不同訂單
						list.add(o);
						o = new Order();
						o.setId(rs.getInt("id"));
						o.setOrderDate(rs.getString("order_date"));
						o.setOrderTime(rs.getString("order_time"));
						o.setStatus(rs.getInt("status"));
						
						o.setPaymentType(rs.getString("payment_type"));
						o.setPaymentFee(rs.getDouble("payment_fee"));
						o.setPaymentNote(rs.getString("payment_note"));
						
						o.setShippingType(rs.getString("shipping_type"));
						o.setShippingFee(rs.getDouble("shipping_fee"));
						o.setShippingNote(rs.getString("shipping_note"));
						o.setShippingAddress(rs.getString("shipping_address"));
						
						o.setRecipientName(rs.getString("recipient_name"));
						o.setRecipientEmail(rs.getString("recipient_email"));
						o.setRecipientPhone(rs.getString("recipient_phone"));
					}
					OrderItem oItem = new OrderItem();
					MovieSession mSession = new MovieSession();
					int discount = rs.getInt("discount");
					
					Movie m = null;
					if(discount>0) {
						m = new Outlet();
						((Outlet)m).setDiscount(discount);						
					}else m = new Movie();
					
					Seat seat = new Seat();
					//場次資訊
					oItem.setOrderId(rs.getInt("id"));
					oItem.setPrice(rs.getDouble("price"));
					oItem.setQuantity(rs.getInt("quantity"));
					mSession.setDate(rs.getString("session_date"));
					mSession.setTime(rs.getString("session_time"));
					mSession.setTheater(rs.getInt("session_theater"));
					mSession.setStock(rs.getInt("stock"));
					
					//座位資訊
					seat.setSessionDate(rs.getString("session_date"));
					seat.setSessionTime(rs.getString("session_time"));
					seat.setSessionTheater(rs.getInt("session_theater"));
					seat.setRowA(rs.getInt("A"));
					seat.setRowB(rs.getInt("B"));
					seat.setRowC(rs.getInt("C"));
					seat.setRowD(rs.getInt("D"));
					seat.setRowE(rs.getInt("E"));
					seat.setRowF(rs.getInt("F"));
					seat.setRowG(rs.getInt("G"));
					seat.setRowH(rs.getInt("H"));
					seat.setRowI(rs.getInt("I"));
					
					m.setId(rs.getInt("movie_id"));
					m.setName(rs.getString("name"));
					m.setSubtitle(rs.getString("subtitle"));
					m.setUnitPrice(rs.getDouble("unit_price"));
					m.setDescription(rs.getString("description"));
					m.setPhotoUrl(rs.getString("photo_url"));
					m.setTrailerUrl(rs.getString("trailer_url"));
					m.setLaunchDate(rs.getString("launch_date"));
					m.setCategory(rs.getString("category"));
					m.setBoxOffice(rs.getInt("box_office"));
					m.setDirector(rs.getString("director"));
					m.setCast(rs.getString("cast"));
					//將電影加入Session
					mSession.setMovie(m);
					//將座位,場次加入明細
					oItem.setMovieSession(mSession);
					oItem.setSeat(seat);
					//將明細加入訂單
					o.addOrderItem(oItem);
					if(rs.isLast()) {
						list.add(o);
					}
				}
			}
		} catch (SQLException e) {
			throw new MLException("[客戶ID查詢訂單]失敗");
		}
		return list;
	}

}
