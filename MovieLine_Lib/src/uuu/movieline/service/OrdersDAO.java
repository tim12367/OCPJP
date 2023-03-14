package uuu.movieline.service;

import uuu.movieline.entity.Order;
import uuu.movieline.entity.OrderItem;
import uuu.movieline.exception.MLException;
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
			"INSERT INTO orderItems "
			+ "	(order_id, session_id, price, quantity) "
			+ "    VALUES(?,?,?,?) ";
	
	public void insert(Order order) throws MLException{
		
		try(
				Connection connection = MySQLConnection.getConnection();//1,2取得連線
				//TODO:庫存管理
				PreparedStatement pstmt1 = connection.prepareStatement(INSERT_orders, Statement.RETURN_GENERATED_KEYS);//3.準備指令1
				PreparedStatement pstmt2 = connection.prepareStatement(INSERT_order_items);//3.準備指令2
			) {
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
					pstmt2.setInt(1,orderItem.getOrderId());
					pstmt2.setInt(2, orderItem.getMovieSession().getId());
					pstmt2.setDouble(3, orderItem.getPrice());
					pstmt2.setInt(4, orderItem.getQuantity());
					
					//4.執行pstmt2
					pstmt2.executeUpdate();
				}
			}
		} catch (SQLException e) {
			throw new MLException("建立訂單失敗",e);
		}
		
	}

}
