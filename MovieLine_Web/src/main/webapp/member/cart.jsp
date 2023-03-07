<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>購物車</title>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/source/title_icon.png" />
<link href="<%=request.getContextPath()%>/css/global.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/cart.css" type="text/css"
	rel="stylesheet">
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
		<table class="booking_detail">
			<caption>訂票明細</caption>
			<thead>
				<tr>
					<th>電影名稱</th>
					<th>日期</th>
					<th>時間</th>
					<th>價格</th>
					<th>數量</th>
					<th>小計</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<img alt="蟻人與黃蜂女：量子狂熱" src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20230116003.jpg">
						蟻人與黃蜂女：量子狂熱
					</td>
					<td>2023-02-28</td>
					<td>10:10:00</td>
					<td>
						定價:340<br>
						優惠價:85折 300.0元<br>
					</td>
					<td>2</td>
					<td>600.0</td>
				</tr>
			</tbody>
		</table>
		<table id='cart'>
			<caption>購物明細</caption>
			<thead>
				<tr>
					<th>名稱</th>
					<th>顏色/Size</th>
					<th>價格</th>
					<th>數量</th>
					<th>小計</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img
						src='https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/001/055/52/0010555220.jpg&w=374&h=374&v=5020f27b'>
						Java 7 教學手冊 第五版(附光碟)</td>
					<td></td>
					<td>定價：650.0元<br> 優惠價：9折<br> 585.0元
					</td>
					<td>2</td>
					<td>1170.0</td>
				</tr>
				<tr>
					<td><img
						src='https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/N01/142/02/N011420245.jpg&w=374&h=374&v=5b9f4e22'>
						【德國LYRA】Groove三角洞洞色鉛筆</td>
					<td>紅</td>
					<td>定價：70.0元<br> 優惠價：9折<br> 63.0元
					</td>
					<td>1</td>
					<td>63</td>
				</tr>
				<tr>
					<td><img
						src='https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/N01/142/02/N011420252.jpg&w=187&h=187&v=5b9f4e22'>
						【德國LYRA】Groove三角洞洞色鉛筆</td>
					<td>藍</td>
					<td>定價：70.0元<br> 優惠價：9折<br> 63.0元
					</td>
					<td>1</td>
					<td>63</td>
				</tr>
				<tr>
					<td><img
						src='https://www.9x9.tw/public/files/product/thumb/N90888-41314S.jpg'>
						Pentel百點橡皮擦</td>
					<td>白/S</td>
					<td>定價：10元<br> 優惠價：8折<br> 8元
					</td>
					<td>1</td>
					<td>8</td>
				</tr>
				<tr>
					<td><img
						src='https://www.9x9.tw/public/files/product/thumb/N90888-41314S.jpg'>
						Pentel百點橡皮擦</td>
					<td>白/M</td>
					<td>定價：15元<br> 優惠價：8折<br> 12元
					</td>
					<td>2</td>
					<td>24</td>
				</tr>
				<tr>
					<td><img
						src='https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/N00/106/80/N001068013.jpg&w=374&h=374&v=5d005bf1'>
						【德國LYRA】GROOVE三角洞洞色鉛筆(細) 24色</td>
					<td>24支裝</td>
					<td>優惠價：380元</td>
					<td>2</td>
					<td>380</td>
				</tr>
				<tr>
					<td><img
						src='https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/N00/026/84/N000268419.jpg&w=374&h=374&v=4feaab20'>
						【德國LYRA】GROOVE三角洞洞色鉛筆(細) 24色</td>
					<td>48支裝</td>
					<td>優惠價：380元</td>
					<td>1</td>
					<td>620</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">共7項, 10件</td>
					<td colspan="2">總計: 1316元</td>
				</tr>
			</tfoot>
		</table>
	</article>
	<%@ include file="/subviews/footer.jsp"%>
</body>
</html>