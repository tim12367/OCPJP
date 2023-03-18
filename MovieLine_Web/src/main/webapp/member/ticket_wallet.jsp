<%@page import="uuu.movieline.entity.OrderItem"%>
<%@page import="java.lang.reflect.Member"%>
<%@page import="uuu.movieline.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page import="uuu.movieline.service.OrderService"%>
<%@page import="uuu.movieline.entity.Order"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>我的票券</title>
<%	
	Customer c = (Customer)session.getAttribute("member");
	OrderService oService = new OrderService();
	List<Order> oList = null;
%>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/source/title_icon.png" />
<link href="<%=request.getContextPath()%>/css/global.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/ticket_wallet.css"
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
				$("#dark_mode_button").attr("src","<%=request.getContextPath()%>/source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
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
<% 	
if(c!=null){
	oList= oService.getOrdersByCustomer(c);
}
%>
<%if(c==null){%>
<h1>請重新登入</h1>
<%}else if(oList==null||oList.isEmpty()){%>
<h1>查無訂票</h1>
<%}else{%>
<%for(Order o:oList){%>

		<div class="ticket_list">
			<div class="checkout_date">訂票時間：<%=o.getOrderDate()%> <%=o.getOrderTime()%></div>
			<hr>
<%for(OrderItem oItem:o.getOrderItemSet()){ %>
<%for(String seatString:oItem.getSeatList()){%>
			<div class="ticket">
				<div class="session_detail_box">
					<div class="movie_title">
						<div class="movie_title_data"><%=oItem.getMovieName()%></div>
					</div>
					<div class="movie_subtitle">
						<div class="movie_subtitle_data"><%=oItem.getMovieSession().getMovie().getSubtitle()%></div>
					</div>
					<div class="price_time_date_box">
						<div class="price">
							<div class="price_data">PRICE:&emsp;$ <%=oItem.getPrice()%></div>
						</div>
						<div class="date">
							<div class="date_data">DATE:&emsp;<%=oItem.getSessionDate()%></div>
						</div>
						<div class="time">
							<div class="time_data">TIME:&emsp;<%=oItem.getSessionTime()%></div>
						</div>
					</div>
				</div>
				<div class="seat_detail_box">
					<div class="theater_box">
						<div class="theater_label">THEATER</div>
						<div class="theater">
							<div class="theater_data"><%=oItem.getSessionTheater()%></div>
						</div>
					</div>
					<div class="row_col_box">

						<div class="row">
							<div class="row_label">ROW</div>
							<div class="row_data"><%=seatString.charAt(0)%></div>
						</div>
						<div class="col">
							<div class="col_label">COL</div>
							<div class="col_data"><%=seatString.substring(1)%></div>
						</div>
					</div>
				</div>
				<img class="qrcode"
					src="http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSh-wrQu254qFaRcoYktJ5QmUhmuUedlbeMaQeaozAVD4lh4ICsGdBNubZ8UlMvWjKC"
					alt="QRcode">
			</div>
<%}%>
<%}%>
		</div>
<%}%>
<%}%>
	</article>
	<%@ include file="/subviews/footer.jsp"%>
</body>
</html>