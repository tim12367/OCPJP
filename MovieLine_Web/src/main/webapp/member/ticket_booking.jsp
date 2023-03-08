<!--<%@ page pageEncoding="UTF-8"%>-->
<%@page import="uuu.movieline.entity.Seat"%>
<%@page import="org.apache.catalina.Service"%>
<%@page import="uuu.movieline.entity.MovieSession"%>
<%@page import="uuu.movieline.service.ProductService"%>
<%@page import="uuu.movieline.entity.Movie"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>一線影院 訂票系統</title>
<%	//獲取上一個網頁傳的查詢條件
	String movieId = request.getParameter("movieId");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	MovieSession movieSession = null;
	Seat seat = null;

	ProductService service = new ProductService();
	if(movieId!=null && date!=null && time!=null){
		movieSession = service.getSessionsByMovieIdDatetime(movieId, date, time);
		seat = movieSession.getSeat();
	}
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

		SelectorInitHandlr();//初始化選單
		seatInitHandlr(); //初始化位子
		$("td>img").attr("draggable", "false");//disable draggable
		$("td").click(seatSelectHandlr); //點到的格子
		//重新選電影
		$("#movie").change(movieSelectorChangeHandlr);//movie選單改變時
		$("#date").change(dateSelectorChangeHandlr);//date選單改變時
		$("#time").change(timeSelectorChangeHandlr);//time選單改變時
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
		var seatRow = $(this).parent().attr("id");
		if ((!isNaN(seatNumber)) && (seatNumber !== undefined)
				&& (seatNumber !== null)) {
			//console.log(seatRow);//A排
			//console.log(seatNumber);//1位
			//console.log($(this).children("img").attr("src"));//圖片網址

			if (($(this).children("img").attr("src"))
					.indexOf("standard_available.png") >= 0) {
				//每按一個座位將數量加一
				$("#quantity").val(Number($("#quantity").val()) + 1);
				
				//每按一個座位多一行詳情
				$("#booking_detail_body").append("<div>"+seatRow+"排"+seatNumber+"號"+"</div>");
				
				//座位輸出加一
				seatInputAdd(seatRow,seatNumber);
				
				$(this).children("img").attr("src",
						"../source/standard_selected.png");
			} else if (($(this).children("img").attr("src"))
					.indexOf("standard_selected.png") >= 0) {
				//每按一個座位將數量減一
				$("#quantity").val(Number($("#quantity").val()) - 1);
				//取消選取↓
				var rmtag = seatRow+"排"+seatNumber+"號";
				console.log(rmtag);
				$("#booking_detail_body> :contains("+rmtag+")").remove();
				//取消選取↑
				
				//座位輸出減一
				seatInputRemove(seatRow,seatNumber);
				
				$(this).children("img").attr("src",
						"../source/standard_available.png");
			}

		}
	}
	function seatInitHandlr() {
// 		$("#rowA").val(0);
// 		$("#rowB").val(0);
// 		$("#rowC").val(0);
// 		$("#rowD").val(0);
// 		$("#rowE").val(0);
// 		$("#rowF").val(0);
// 		$("#rowG").val(0);
// 		$("#rowH").val(0);
// 		$("#rowI").val(0);
		//TODO:從資料庫帶資料
		<%
		if(movieSession!=null){
		seat = movieSession.getSeat();
		%>
		seatRestoreByRow("A",<%=seat.getRowA()%>);
		seatRestoreByRow("B",<%=seat.getRowB()%>);
		seatRestoreByRow("C",<%=seat.getRowC()%>);
		seatRestoreByRow("D",<%=seat.getRowD()%>);
		seatRestoreByRow("E",<%=seat.getRowE()%>);
		seatRestoreByRow("F",<%=seat.getRowF()%>);
		seatRestoreByRow("G",<%=seat.getRowG()%>);
		seatRestoreByRow("H",<%=seat.getRowH()%>);
		seatRestoreByRow("I",<%=seat.getRowI()%>);
		<%}%>
	}
	function seatInputAdd(seatRow,seatNumber) {
		console.log("seatInputAdd"+seatRow+seatNumber);
		var jqueryString = "#row" + seatRow;
		var oldSeatNumber = Number($(jqueryString).val());
		var newSeatNumber = oldSeatNumber | (1<<(Number(seatNumber)-1));
		$(jqueryString).val(newSeatNumber);
	}
	function seatInputRemove(seatRow,seatNumber) {
		console.log("seatInputRemove"+seatRow+seatNumber);
		var jqueryString = "#row" + seatRow;
		var oldSeatNumber = Number($(jqueryString).val());
		var newSeatNumber = oldSeatNumber & (~(1<<(Number(seatNumber)-1)));
		$(jqueryString).val(newSeatNumber);
	}

	function seatRestoreByRow(rowName,rowBinary){
		//輸入測試
		console.log("第"+rowName+"行:"+rowBinary);
		//數字to二進位字串轉換
		var binarySeatString = rowBinary.toString(2);
		console.log("二進位字串"+binarySeatString);
		//切分成字元陣列
		var binarySeatCharList = binarySeatString.split('');
		//將字元字串變成座位位置陣列
		var seatNumber = [];
		for (var i in binarySeatCharList){
			if(binarySeatCharList[i]=="1"){
				seatNumber.push(binarySeatCharList.length-i);
			}
		}
		console.log("座位號碼為:"+seatNumber);
		//將座位陣列帶上畫面 function seatSold()
		for(var i in seatNumber){
			seatSold(rowName,seatNumber[i]);
		}
	}	
	function seatSold(seatRow,seatNumber){
		seatNumber = String(seatNumber);//toString 輸入可能是數字
		//selector 選擇完全符合的文字in p 再選擇兄弟img
		$("#"+seatRow+" >td >p:contains('"+seatNumber+"')").filter(function() {
	        return $.trim($(this).text()) === seatNumber;
	      }).siblings("img").attr("src","../source/sold.png");
	}
	function SelectorInitHandlr() {
		<%if(movieId!=null && movieId.length()>0
				&& date!=null && date.length()>0
				&& time!=null && time.length()>0){%>
				getDateOption("<%=movieId%>");
				getTimeOption("<%=movieId%>","<%=date%>");
			$("#movie").val("<%=movieId%>");
		<%}else{%>
			$("#movie").val("");
		<%}%>
		
	}
	
	function movieSelectorChangeHandlr() {
		//location.href="?movieId=" + $("#movie").val();
		//更新日期
		getDateOption($("#movie").val());
		//更新時間
		$("#time").empty();
		$("#time").append('<option value="">↑請先選擇日期↑</option>');
	}
	function getDateOption(movieId) {
		//console.log("AJEX查日期 電影ID"+movieId);
		$.ajax({
			url:'../get_movie_date.jsp?movieId='+movieId,
			method:'GET'
		}).done(getDateOptionDoneHandlr);
	}
	var initDateOptionFlag = true;
	function getDateOptionDoneHandlr(result, textStatus, jqXHR ) {
		//console.log("result : "+result+"\ntextStatus : "+ textStatus+"\njqXHR : "+ jqXHR);
		$("#date").empty();
		$("#date").append(result);
		if(initDateOptionFlag==true){
			$("#date").val("<%=date%>");
			initDateOptionFlag = false;
		}
	}
	function dateSelectorChangeHandlr() {
		getTimeOption($("#movie").val(),$("#date").val());
	}
	function getTimeOption(movieId,date) {
		//console.log("AJEX查時間 電影:"+movieId+"日期："+date);
		$.ajax({
			url:'../get_movie_time.jsp?movieId='+movieId+'&date='+date,
			method:'GET'
		}).done(getTimeOptionDoneHandlr);
	}
	var initTimeOptionFlag = true;
	function getTimeOptionDoneHandlr(result, textStatus, jqXHR ) {
		//console.log("result : "+result+"\ntextStatus : "+ textStatus+"\njqXHR : "+ jqXHR);
		$("#time").empty();
		$("#time").append(result);
		if(initTimeOptionFlag==true){
			$("#time").val("<%=time%>");
			initTimeOptionFlag = false;
		}
	}
	function timeSelectorChangeHandlr() {
		location.href="?movieId=" + $("#movie").val()+"&date="+$("#date").val()+"&time="+$("#time").val();
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
				<h1 class="movie_name"><%=movieSession!=null?movieSession.getMovie().getName():"查無電影" %></h1>
				<img class="screan_img"
					src="<%=request.getContextPath()%>/source/SeatScreen.png" alt="">
				<%@ include file="/subviews/seating_area.jsp" %>
				<!-- form -->
				<form class="booking_form" action="<%=request.getContextPath()%>/add_cart.do" method="POST" >
					<div class = hidden_inputs>
						<label for="rowA">A</label><input id="rowA" name="rowA" type="number" readonly="readonly"><br>
						<label for="rowB">B</label><input id="rowB" name="rowB" type="number" readonly="readonly"><br>
						<label for="rowC">C</label><input id="rowC" name="rowC" type="number" readonly="readonly"><br>
						<label for="rowD">D</label><input id="rowD" name="rowD" type="number" readonly="readonly"><br>
						<label for="rowE">E</label><input id="rowE" name="rowE" type="number" readonly="readonly"><br>
						<label for="rowF">F</label><input id="rowF" name="rowF" type="number" readonly="readonly"><br>
						<label for="rowG">G</label><input id="rowG" name="rowG" type="number" readonly="readonly"><br>
						<label for="rowH">H</label><input id="rowH" name="rowH" type="number" readonly="readonly"><br>
						<label for="rowI">I</label><input id="rowI" name="rowI" type="number" readonly="readonly"><br>
					</div>
					<div class="input_box">
						<label for="movie">電影</label>
						<select required="required" id="movie" name="movieId">
							<%
							//1.取得所有電影
								List<Movie> list;
								list = service.getAllMovies();
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
					</div>
					<div class="input_box">
						<label for="date">日期</label>
						<select required="required" id="date" name="date">
							<option value="">請選擇日期</option>
						</select>
					</div>
					<div class="input_box">
						<label for="time">場次時間</label>
						<select required="required" id="time" name="time">
							<option value="">↑請先選擇日期↑</option>
						</select>
					</div>
					<div class="input_box">
						<label for="quantity"> 目前購票數量 </label>
						<input id="quantity" readonly="readonly"
							type="number" name="quantity" min="1" max="20" value="0">
					</div>
					<input class="booking_btn" type="submit" value="確認訂購">
				</form>
				<!-- form -->
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
						<hr>
					</div>
				</div>
<!-- 				<div class="panel"> -->
<!-- 					<div class="panel_title"> -->
<!-- 						<img class="panel_title_icon" alt="" src="../source/ticket_title.png"> -->
<!-- 						<div class="panel_title_text">購物清單</div> -->
<!-- 					</div> -->
<!-- 					<div class=panel_body> -->
<!-- 						<hr> -->
<!-- 						<div class="product_box"> -->
<!-- 						一筆購物 -->
<!-- 							<div class="product_name">MUCROWN單人套票2022</div> -->
<!-- 							<div class="product_quantity"> -->
<!-- 								<span>X</span> 2 <span>=</span> 2,200 -->
<!-- 							</div> -->
<!-- 							<hr> -->
<!-- 						一筆購物 -->
<!-- 						一筆購物 -->
<!-- 							<div class="product_name">MUCROWN單人套票2022</div> -->
<!-- 							<div class="product_quantity"> -->
<!-- 								<span>X</span> 2 <span>=</span> 2,200 -->
<!-- 							</div> -->
<!-- 							<hr> -->
<!-- 						一筆購物 -->
<!-- 						一筆購物 -->
<!-- 							<div class="product_name">MUCROWN單人套票2022</div> -->
<!-- 							<div class="product_quantity"> -->
<!-- 								<span>X</span> 2 <span>=</span> 2,200 -->
<!-- 							</div> -->
<!-- 							<hr> -->
<!-- 						一筆購物 -->
<!-- 							<div class="total_price"> -->
<!-- 								<span>合計</span> 2,200 -->
<!-- 							</div> -->
<!-- 						</div><hr> -->
						
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
	</article>
</body>
</html>
