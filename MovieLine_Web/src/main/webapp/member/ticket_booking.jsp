<!--<%@ page pageEncoding="UTF-8"%>-->
<%@page import="uuu.movieline.service.ProductService"%>
<%@page import="uuu.movieline.entity.Movie"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>一線影院 訂票系統</title>
<%
	String movieId = request.getParameter("movieId");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
%>
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
		<%  //若有產品 選取選項
			if(request.getParameter("movie")!=null){
		%>
		
			$("#productId").val("<%=request.getParameter("movie")%>");
		<%}%>
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
		var searRow = $(this).parent().attr("id");
		if ((!isNaN(seatNumber)) && (seatNumber !== undefined)
				&& (seatNumber !== null)) {
			//console.log(searRow);//A排
			//console.log(seatNumber);//1位
			//console.log($(this).children("img").attr("src"));//圖片網址

			if (($(this).children("img").attr("src"))
					.indexOf("standard_available.png") >= 0) {
				//每按一個座位將數量加一
				$("#quantity").val(Number($("#quantity").val()) + 1);
				
				//每按一個座位多一行詳情
				$("#booking_detail_body").append("<div>"+searRow+"排"+seatNumber+"位"+"</div>");
				
				//座位輸出加一
				seatInputAdd(searRow,seatNumber);
				
				$(this).children("img").attr("src",
						"../source/standard_selected.png");
			} else if (($(this).children("img").attr("src"))
					.indexOf("standard_selected.png") >= 0) {
				//每按一個座位將數量減一
				$("#quantity").val(Number($("#quantity").val()) - 1);
				//取消選取↓
				var rmtag = searRow+"排"+seatNumber+"位";
				console.log(rmtag);
				$("#booking_detail_body> :contains("+rmtag+")").remove();
				//取消選取↑
				
				//座位輸出減一
				seatInputRemove(searRow,seatNumber);
				
				$(this).children("img").attr("src",
						"../source/standard_available.png");
			}

		}
	}
	function seatInitHandlr() {
		$("#rowA").val(0);
		$("#rowB").val(0);
		$("#rowC").val(0);
		$("#rowD").val(0);
		$("#rowE").val(0);
		$("#rowF").val(0);
		$("#rowG").val(0);
		$("#rowH").val(0);
		$("#rowI").val(0);
	}
	function seatInputAdd(searRow,seatNumber) {
		console.log("seatInputAdd"+searRow+seatNumber);
		var jqueryString = "#row" + searRow;
		var oldSeatNumber = Number($(jqueryString).val());
		var newSeatNumber = oldSeatNumber | (1<<(Number(seatNumber)-1));
		$(jqueryString).val(newSeatNumber);
	}
	function seatInputRemove(searRow,seatNumber) {
		console.log("seatInputRemove"+searRow+seatNumber);
		var jqueryString = "#row" + searRow;
		var oldSeatNumber = Number($(jqueryString).val());
		var newSeatNumber = oldSeatNumber & (~(1<<(Number(seatNumber)-1)));
		$(jqueryString).val(newSeatNumber);
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
				<form action="" method="POST">
				
				<label for="rowA">A</label>
				<input id="rowA" name="rowA" type="number" readonly="readonly"><br>
				
				<label for="rowB">B</label>
				<input id="rowB" name="rowB" type="number" readonly="readonly"><br>
				
				<label for="rowC">C</label>
				<input id="rowC" name="rowC" type="number" readonly="readonly"><br>
				
				<label for="rowD">D</label>
				<input id="rowD" name="rowD" type="number" readonly="readonly"><br>
				
				<label for="rowE">E</label>
				<input id="rowE" name="rowE" type="number" readonly="readonly"><br>
				
				<label for="rowF">F</label>
				<input id="rowF" name="rowF" type="number" readonly="readonly"><br>
				
				<label for="rowG">G</label>
				<input id="rowG" name="rowG" type="number" readonly="readonly"><br>
				
				<label for="rowH">H</label>
				<input id="rowH" name="rowH" type="number" readonly="readonly"><br>
				
				<label for="rowI">I</label>
				<input id="rowI" name="rowI" type="number" readonly="readonly"><br>
				
					<label for="productId">目前產品id</label>
					<select required="required" id="productId" name="productId">
						<%
						//1.取得所有商品
											List<Movie> list;
											ProductService service = new ProductService();
											list = service.getAllProducts();
						%>
						<option value="">請選擇電影</option>
						<%
						if(list==null || list.size()==0){
						%>
						<option>查無電影</option>
						<%
						}else{
						%>
						<%
						for(int i=0; i<list.size();i++){
											Movie p = list.get(i);
						%>
						<option value="<%=p.getId()%>"><%=p.getName() %></option>
						<%}%>
						<%}%>
						
					</select>
					<br>
					<label for="quantity"> 目前購票數量 </label>
					<input id="quantity" readonly="readonly"
						type="number" name="quantity" min="1" max="20" value="0">
					 <input type="submit">
				</form>
				<!-- For test input -->
			</div>
			<div class="shopping_detail_box">

				<div class="panel">
					<div class="panel_title">
						<img class="panel_title_icon" alt="" src="../source/ticket_title.png">
						<div class="panel_title_text">訂票詳情</div>
					</div>
					<div id="booking_detail_body" class=panel_body>
						<div>
							電影編號:<%=movieId%><br>
							日期:<%=date%><br>
							時間:<%=time%><br>
						</div>
					</div>
				</div>
				<div class="panel">
					<div class="panel_title">
						<img class="panel_title_icon" alt="" src="../source/ticket_title.png">
						<div class="panel_title_text">購物清單</div>
					</div>
					<div class=panel_body>
						<hr>
						<div class="product_box">
						<!-- 一筆購物 -->
							<div class="product_name">MUCROWN單人套票2022</div>
							<div class="product_quantity">
								<span>X</span> 2 <span>=</span> 2,200
							</div>
							<hr>
						<!-- 一筆購物 -->
						<!-- 一筆購物 -->
							<div class="product_name">MUCROWN單人套票2022</div>
							<div class="product_quantity">
								<span>X</span> 2 <span>=</span> 2,200
							</div>
							<hr>
						<!-- 一筆購物 -->
						<!-- 一筆購物 -->
							<div class="product_name">MUCROWN單人套票2022</div>
							<div class="product_quantity">
								<span>X</span> 2 <span>=</span> 2,200
							</div>
							<hr>
						<!-- 一筆購物 -->
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
