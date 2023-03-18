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
		<div class="ticket_list">
			<div class="checkout_date">3/8</div>
			<hr>
			<div class="ticket">
				<div class="session_detail_box">
					<div class="movie_title">
						<div class="movie_title_data">鐵達尼號 25周年重映版</div>
					</div>
					<div class="movie_subtitle">
						<div class="movie_subtitle_data">TITANIC 25TH ANNIVERSARY</div>
					</div>
					<div class="price_time_date_box">
						<div class="price">
							<div class="price_data">PRICE:&emsp;$ 278.8</div>
						</div>
						<div class="date">
							<div class="date_data">DATE:&emsp;2023-02-28</div>
						</div>
						<div class="time">
							<div class="time_data">TIME:&emsp;12:50</div>
						</div>
					</div>
				</div>
				<div class="seat_detail_box">
					<div class="theater_box">
						<div class="theater_label">THEATER</div>
						<div class="theater">
							<div class="theater_data">3</div>
						</div>
					</div>
					<div class="row_col_box">

						<div class="row">
							<div class="row_label">ROW</div>
							<div class="row_data">I</div>
						</div>
						<div class="col">
							<div class="col_label">COL</div>
							<div class="col_data">1</div>
						</div>
					</div>
				</div>
				<img class="qrcode"
					src="http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSh-wrQu254qFaRcoYktJ5QmUhmuUedlbeMaQeaozAVD4lh4ICsGdBNubZ8UlMvWjKC"
					alt="QRcode">
			</div>
			<div class="ticket">
				<div class="session_detail_box">
					<div class="movie_title">
						<div class="movie_title_data">鐵達尼號 25周年重映版</div>
					</div>
					<div class="movie_subtitle">
						<div class="movie_subtitle_data">TITANIC 25TH ANNIVERSARY</div>
					</div>
					<div class="price_time_date_box">
						<div class="price">
							<div class="price_data">PRICE:&emsp;$ 278.8</div>
						</div>
						<div class="date">
							<div class="date_data">DATE:&emsp;2023-02-28</div>
						</div>
						<div class="time">
							<div class="time_data">TIME:&emsp;12:50</div>
						</div>
					</div>
				</div>
				<div class="seat_detail_box">
					<div class="theater_box">
						<div class="theater_label">THEATER</div>
						<div class="theater">
							<div class="theater_data">3</div>
						</div>
					</div>
					<div class="row_col_box">

						<div class="row">
							<div class="row_label">ROW</div>
							<div class="row_data">I</div>
						</div>
						<div class="col">
							<div class="col_label">COL</div>
							<div class="col_data">1</div>
						</div>
					</div>
				</div>
				<img class="qrcode"
					src="http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSh-wrQu254qFaRcoYktJ5QmUhmuUedlbeMaQeaozAVD4lh4ICsGdBNubZ8UlMvWjKC"
					alt="QRcode">
			</div>
		</div>

	</article>
	<%@ include file="/subviews/footer.jsp"%>
</body>
</html>