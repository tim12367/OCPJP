<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/source/title_icon.png" />
<link href="<%=request.getContextPath()%>/css/global.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/check_out.css"
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
		<form action="check_out.do" method="POST">
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
								<img alt="電影名稱"
									src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20230116003.jpg">
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
									定價:340<br> 折扣:82折<br> 特價:278.8<br>
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
							<div class="shipping_price">
								<div>運費 $60</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<div class="pay_and_ship_box">
								<div class="paytype_box">
									<label for="paytype">選擇付款方式</label> <select id="paytype"
										class="selector">
										<option>信用卡</option>
									</select>
								</div>
								<div class="shipping_method_box">
									<label for="shipping_method">選擇配送方式</label> <select
										id="shipping_method" class="selector">
										<option>7-11取貨</option>
									</select>
								</div>
							</div>
						</td>
						<td colspan="1">
							<div class="cart_total_price_box">
								<div>總金額：1951.6 + 60</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<div class="customer_info_box">
								<div class="customer_info_title">訂購人資訊</div>
								<div class="customer_info_input_box">
									<div class="customer_name_box">
										<label for="name">姓名</label> <input id="name">
									</div>
									<div class="customer_email_box">
										<label for="email">Email</label> <input id="email">
									</div>
									<div class="customer_phone_box">
										<label for="phone">聯絡電話</label> <input id="phone">
									</div>
									<div class="customer_addr_box">
										<label for="address">收件地址</label> <input id="address">
									</div>
								</div>
							</div>
						</td>
						<td colspan="1">
							<div class="td_box">
								<button type="submit" class="checkOut_btn" name="submit"
									value="checkOut">送出訂單</button>
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