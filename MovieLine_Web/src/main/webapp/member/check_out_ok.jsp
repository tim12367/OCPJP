<%@page import="java.text.DecimalFormat"%>
<%@page import="uuu.movieline.entity.OrderItem"%>
<%@page import="uuu.movieline.entity.ShippingType"%>
<%@page import="uuu.movieline.entity.PaymentType"%>
<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="uuu.movieline.entity.Order"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>訂單明細</title>
<%
	Order order = (Order)request.getAttribute("theOrder");
	DecimalFormat df = new DecimalFormat("0.00");
%>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/source/title_icon.png" />
<link href="<%=request.getContextPath()%>/css/global.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/check_out_ok.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/global_dark.css"
	type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<script>
		var darkModeFlag = true;
		$(document).ready(init);
		function init() {
			if (localStorage) {
				restoreData();
				$("#dark_mode_button").click(darkModeHandler);
			} else {
				alert("不支援的瀏覽器!");
				$("#hint").text("不支援的瀏覽器!");
			}
			//初始化訂單狀態
			var status = Number(${requestScope.order.getStatus()})+1;
			console.log("status : "+status-1);
			$(".delivery_status_bar :nth-child("+status+")").addClass("delivery_status--display");
		}
		function restoreData() {
			var getDarkModeFlag = localStorage.getItem("darkModeFlag");
			//記住深色模式
			if (getDarkModeFlag == "true") {
				darkModeFlag = getDarkModeFlag;
				darkModeHandler();
			}
		}
	
		function darkModeHandler() {
			if (darkModeFlag) {
				$("body").addClass("body--darkmode");
				$("#dark_mode_button").attr("src",
						"<%=request.getContextPath()%>/source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
			} else {
				$("body").removeClass("body--darkmode");
				$("#dark_mode_button").attr("src",
						"<%=request.getContextPath()%>/source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
			}
			localStorage.setItem("darkModeFlag", darkModeFlag);
			darkModeFlag = !darkModeFlag;
		}
	</script>
</head>
<body>
	<!-- Insert icon here! -->
	<jsp:include page="/subviews/header.jsp">
		<jsp:param value="/source/movie_list_icon.png" name="iconUrl" />
	</jsp:include>
	<jsp:include page="/subviews/nav.jsp" />
	<article>
<%if(order==null||order.isEmpty()){ %>
<h1>查無訂單</h1>
<%}else{%>
<%-- 		<div>${sessionScope.theOrder}</div> --%>
		<div class="order_box">
			<div class="delivery_status_bar">
				<div class="delivery_status_bar_item">新訂單</div>
				<div class="delivery_status_bar_item">已付款</div>
				<div class="delivery_status_bar_item">已開票</div>
				<div class="delivery_status_bar_item">已寄送</div>
				<div class="delivery_status_bar_item">已完成</div>
			</div>
			<div class="order_info_box">
				<div class="order_detail_box">
				<%	
					String dateString = order.getOrderDate().toString().replace("-", "");
					String orderNumberString = "ML"+dateString+String.format("%05d", order.getId()); 
				%>
					<div>訂單編號. <span class="order_data"><%=orderNumberString%></span>
<!-- 					&emsp;|&emsp;<span class="order_data">訂單已完成</span> -->
					</div>
					<div>訂購日期時間：<span class="order_data"><%=order.getOrderDate()%> <%=order.getOrderTime().format(DateTimeFormatter.ofPattern("HH:mm"))%></span></div>
					<div>付款方式：<span class="order_data"><%=PaymentType.valueOf(order.getPaymentType())%></span></div>
					<div>運費：<span class="order_data"><%=ShippingType.valueOf(order.getShippingType())%></span></div>
				</div>
				<div class="customer_pay_info_box">
					<div>收件人資訊</div>
					<div>姓名：<span class="customer_data"><%=order.getRecipientName()%></span></div>
					<div>電話：<span class="customer_data"><%=order.getRecipientPhone()%></span></div>
					<div>Email：<span class="customer_data"><%=order.getRecipientEmail()%></span></div>
					<div>收件地址：<span class="customer_data"><%=order.getShippingAddress()%></span></div>
				</div>
			</div>
		</div>

		<table class="booking_detail">
			<caption>訂票明細</caption>
			<thead>
				<tr>
					<th>電影名稱</th>
					<th>日期</th>
					<th>時間</th>
					<th>價格</th>
					<th>數量</th>
					<th>座位</th>
					<th>小計</th>
				</tr>
			</thead>

			<tbody>
			<%for(OrderItem oItem:order.getOrderItemSet()){ %>
				<tr>
					<td>
						<div class="td_box">
							<div class="movie_name"><%=oItem.getMovieName()%></div>
						</div> <!--TODO:<div>剩餘座位：100席</div>-->
					</td>
					<td>
						<div class="td_box">
							<div><%=oItem.getSessionDate()%></div>
						</div>
					</td>
					<td>
						<div class="td_box">
							<div><%=oItem.getSessionTime()%></div>
						</div>
					</td>
					<td>
						<div class="td_box">
							<div>
								<%=df.format(oItem.getPrice())%>
							</div>
						</div>
					</td>
					<td>
						<div class="td_box">
							<div><%=oItem.getQuantity()%></div>
						</div>
					</td>
					<td>
						<div class="td_box">
							<div><%=oItem.getSeatList()%></div>
						</div>
					</td>
					<td>
						<div class="td_box">
							<div><%=df.format(oItem.getAmount())%></div>
						</div>
					</td>
				</tr>
			<%}%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<div class="cart_counter_box">
							<div class="cart_counter">共<%=order.size()%>場 , <%=order.getTotalQuantity()%>張票</div>
						</div>
					</td>
					<td colspan="1">
						<div class="cart_total_price_box">
							<div>手續費/運費：<%=df.format(order.getPaymentFee())%>/<%=df.format(order.getShippingFee())%><br>
							總金額：<%=df.format(order.getTotalAmountWithFee())%></div>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
<%}%>
	</article>
	<%@ include file="/subviews/footer.jsp"%>
</body>
</html>