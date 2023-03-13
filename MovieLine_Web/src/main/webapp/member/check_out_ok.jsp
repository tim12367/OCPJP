<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>訂單明細</title>
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
		<div class="order_box">
			<div class="delivery_status_bar">
				<div class="delivery_status_bar_item">新訂單</div>
				<div class="delivery_status_bar_item">已付款</div>
				<div class="delivery_status_bar_item">已出貨</div>
				<div class="delivery_status_bar_item">已簽收</div>
				<div class="delivery_status_bar_item">已完成</div>
			</div>
			<div class="order_info_box">
				<div class="order_detail_box">
					<div>訂單編號. <span class="order_data">ML0210MBPGAH5A</span>&emsp;|&emsp;<span class="order_data">訂單已完成</span></div>
					<div>訂購日期時間：<span class="order_data">2023-03-10 12:35</span></div>
					<div>付款方式：<span class="order_data">貨到付款</span></div>
					<div>運費：<span class="order_data">$45</span></div>
				</div>
				<div class="customer_pay_info_box">
					<div>收件人資訊</div>
					<div>姓名：<span class="customer_data">郭良銘</span></div>
					<div>電話：<span class="customer_data">032868789</span></div>
					<div>Email：<span class="customer_data">test730@uuu.com</span></div>
					<div>收件地址：<span class="customer_data">篤勝門市 基隆市七堵區大德路103號</span></div>
				</div>
			</div>
		</div>
		<form action="update_cart.do" method="POST">
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
					<tr>
						<td>
							<div class="td_box">
								<div class="movie_name">蟻人與黃蜂女：量子狂熱</div>
							</div> <!--TODO:<div>剩餘座位：100席</div>-->
						</td>
						<td>
							<div class="td_box">
								<div>2023-03-02</div>
							</div>
						</td>
						<td>
							<div class="td_box">
								<div>13:20</div>
							</div>
						</td>
						<td>
							<div class="td_box">
								<div>
									278.8<br>
								</div>
							</div>
						</td>
						<td>
							<div class="td_box">
								<div>2</div>
							</div>
						</td>
						<td>
							<div class="td_box">
								<div>H08,I07</div>
							</div>
						</td>
						<td>
							<div class="td_box">
								<div>557.6</div>
							</div>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<div class="cart_counter_box">
								<div class="cart_counter">共2場 , 7張票</div>
							</div>
						</td>
						<td colspan="1">
							<div class="cart_total_price_box">
								<div>總金額：2011.6</div>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</article>
	<%@ include file="/subviews/footer.jsp"%>
</body>
</html>