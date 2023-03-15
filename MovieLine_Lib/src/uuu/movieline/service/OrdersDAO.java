package uuu.movieline.service;

import uuu.movieline.entity.Order;
import uuu.movieline.entity.OrderItem;
import uuu.movieline.exception.MLException;
import uuu.movieline.exception.MLStockSortageException;

import java.sql.*;

class OrdersDAO {
	
	private static final String INSERT_orders = 
			"INSERT INTO orders "
			+ "	(id, customer_id, order_date, order_time, status, "
			+ "    payment_type, payment_fee, payment_note, "
			+ "    shipping_type, shippinf_fee,shipping_address, "
			+ "    recipient_name, recipient_email, recipient_phone) "
			+ "    VALUES(?,?,?,?,0, ?,?,'', ?,?,?, ?,?,?) ";
	private static final String INSERT_order_items = 
			"INSERT INTO order_Items "
			+ "	(order_id, session_date, session_time, session_thread, price, quantity, "
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
			+ "(session_date = ? AND session_time = ? AND session_thread = ?)";
	public void insert(Order order) throws MLException{
		
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
						pstmt.setInt(21, orderItem.getSessionThread());
						
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
						pstmt2.setInt(4, orderItem.getMovieSession().getThread());
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

}
