<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>一線影院 訂票系統</title>
<link rel="icon" type="image/x-icon" href="../source/title_icon.png" />
<link href="../css/global.css" type="text/css" rel="stylesheet" />
<link href="../css/ticket_booking.css" type="text/css" rel="stylesheet" />
<style></style>
<link href="../css/global_dark.css" type="text/css" rel="stylesheet" />
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
		// TODO:從資料庫放資料上去初始化位子
		seatInitHandlr(); //初始化位子
		$("td>img").attr("draggable", "false");//disable draggable
		$("td").click(seatSelectHandlr); //點到的格子
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
					"../source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
		} else {
			$("body").removeClass("body--darkmode");
			$("#dark_mode_button").attr("src",
					"../source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
		}
		localStorage.setItem("darkModeFlag", darkModeFlag);
		darkModeFlag = !darkModeFlag;
	}
	function seatSelectHandlr(e) {
		var seatNumber = $(this).children("p").html();
		if ((!isNaN(seatNumber)) && (seatNumber !== undefined)
				&& (seatNumber !== null)) {
			console.log($(this).parent().attr("id"));
			console.log(seatNumber);
			console.log(typeof seatNumber);
			console.log($(this).children("img").attr("src"));

			if (($(this).children("img").attr("src"))
					.indexOf("standard_available.png") >= 0) {
				//每按一個座位將數量加一
				$("#quantity").val(Number($("#quantity").val()) + 1);
				$(this).children("img").attr("src",
						"../source/standard_selected.png");
			} else if (($(this).children("img").attr("src"))
					.indexOf("standard_selected.png") >= 0) {
				//每按一個座位將數量減一
				$("#quantity").val(Number($("#quantity").val()) - 1);
				$(this).children("img").attr("src",
						"../source/standard_available.png");
			}

		}
	}
	function seatInitHandlr() {
		seatDisplayAllLine("#seating_area");
	}
	function seatDisplayAllLine(id) {
		var seatLineNumber;
		for (var i = 0; i < ($(id).children().children().length); i++) {
			seatLineNumber = $(id).children().children().eq(i).attr("id");
			console.log(seatLineNumber);
			seatDisplay("#" + seatLineNumber);
		}
	}
	function seatDisplay(id) {
		// var seatNumber = $(id).children()[0];
		// console.log(seatNumber);
		var seatNumber;
		for (var i = 0; i < ($(id).children().length); i++) {
			seatNumber = $(id).children().eq(i).children("p").html();
			if ((!isNaN(seatNumber)) && (seatNumber !== undefined)
					&& (seatNumber !== null)) {
				console.log(seatNumber);
			}
		}
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
		<div class="main_div">

			<div class="seating_box">
				<h1 class="movie_name">鐵達尼號 25周年重映版</h1>
				<img class="screan_img"
					src="<%=request.getContextPath()%>/source/SeatScreen.png" alt="">

				<table id="seating_area" class="seating_area">
					<tbody>
						<tr id="A">
							<td>
								<p>A</p>
							</td>
							<td></td>
							<td></td>
							<td>
								<p>1</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>2</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>3</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>4</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>5</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>6</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>7</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>8</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>9</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>10</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>A</p>
							</td>

						</tr>
						<tr id="B">
							<td>
								<p>B</p>
							</td>
							<td></td>
							<td></td>
							<td>
								<p>1</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>2</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>3</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>4</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>5</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>6</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>7</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>8</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>9</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>10</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>B</p>
							</td>

						</tr>
						<tr id="C">
							<td>
								<p>C</p>
							</td>
							<td></td>
							<td></td>
							<td>
								<p>1</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>2</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>3</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>4</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>5</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>6</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>7</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>8</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>9</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>10</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>C</p>
							</td>

						</tr>
						<tr id="D">
							<td>
								<p>D</p>
							</td>
							<td></td>
							<td></td>
							<td>
								<p>1</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>2</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>3</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>4</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>5</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>6</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>7</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>8</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>9</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>10</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>D</p>
							</td>

						</tr>
						<tr id="E">
							<td>
								<p>E</p>
							</td>
							<td></td>
							<td></td>
							<td>
								<p>1</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>2</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>3</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>4</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>5</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>6</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>7</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>8</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>9</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>10</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>E</p>
							</td>

						</tr>
						<tr id="F">
							<td>
								<p>F</p>
							</td>
							<td></td>
							<td></td>
							<td>
								<p>1</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>2</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>3</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>4</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>5</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>6</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>7</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>8</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>9</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>10</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>F</p>
							</td>

						</tr>
						<tr id="G">
							<td>
								<p>G</p>
							</td>
							<td></td>
							<td></td>
							<td>
								<p>1</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>2</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>3</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>4</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>5</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>6</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>7</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>8</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>9</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>10</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>G</p>
							</td>

						</tr>
						<tr id="H">
							<td>
								<p>H</p>
							</td>
							<td></td>
							<td></td>
							<td>
								<p>1</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>2</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>3</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>4</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>5</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>6</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>7</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>8</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>9</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td>
								<p>10</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>H</p>
							</td>

						</tr>
						<tr id="I">
							<td>
								<p>I</p>
							</td>
							<td></td>
							<td></td>
							<td>
								<p>1</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>2</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td></td>
							<td>
								<p>4</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>5</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>6</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>7</p> <img src="../source/standard_available.png">
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<p>10</p> <img src="../source/standard_available.png">
							</td>
							<td>
								<p>I</p>
							</td>

						</tr>
					</tbody>
				</table>
				<!-- TODO:假輸入 -->
				<!-- For test input -->
				<form action="">
					<label> 目前產品id <input type="text" name="productId"
						value="<%=request.getParameter("productId")%>">
					</label> <br> <label> 目前產品數量 <input id="quantity"
						type="number" name="quantity" min="1" max="20" value="0">
					</label> <input type="submit">
				</form>
				<!-- For test input -->
			</div>
			<div class="shopping_detail_box">

				<div class="panel">
					<div class="panel_title">
						<img class="panel_title_icon" alt="" src="">
						<div class="panel_title_text">訂票詳情</div>
					</div>
					<div class=panel_body></div>
				</div>
				<div class="panel">
					<div class="panel_title">
						<img class="panel_title_icon" alt="" src="">
						<div class="panel_title_text">購物清單</div>
					</div>
					<div class=panel_body>
						<hr>
						<div class="product_box">
							<div class="product_name">MUCROWN單人套票2022</div>
							<div class="product_quantity">
								<span>X</span> 2 <span>=</span> 2,200
							</div>
							<hr>
							<div class="total_price">
								<span>合計</span> 2,200
							</div>
						</div><hr>
						
					</div>
				</div>
			</div>
		</div>
	</article>
</body>
</html>
