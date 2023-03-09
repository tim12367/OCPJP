<%@page import="uuu.movieline.entity.CartItem"%>
<%@page import="uuu.movieline.entity.Customer"%>
<%@page import="uuu.movieline.entity.ShoppingCart"%>
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
	<% 
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
	    Customer member = (Customer)session.getAttribute("member");
	     
		if(cart!=null && member!=null){
			cart.setMember(member);
		}
	%>
	<%=cart %>
	<%if(cart==null || cart.isEmpty()){ %>
		<h2>尚未訂票!</h2>
	<%}else{ %>
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
						<th>刪除</th>
					</tr>
				</thead>
				
				<tbody>
				<% for(CartItem cartItem:cart.getCartItemSet()){ %>
					<tr>
						<td>
							<img alt="<%=cartItem.getMovieName()%>" src="<%=cartItem.getPhotoUrl()%>">
							<%=cartItem.getMovieName()%>

							<!--TODO:<div>剩餘座位：100席</div>-->
						</td>
						<td><%=cartItem.getSessionDate()%></td>
						<td><%=cartItem.getSessionTime()%></td>
						<td>
							定價:<%=cart.getListPrice(cartItem) %><br>
							折扣:<%= cart.getDiscountString(cartItem)%><br>
							特價:<%= cart.getUnitPrice(cartItem) %><br>
						</td>
						<td>
							<%= cart.getQuantity(cartItem) %>
						</td>
						<td>
							<%= cartItem.getSeatListString()%>		
						</td>
						<td><%= cart.getAmount(cartItem)%></td>
						<td><input type="checkbox" name = "delete<%=cartItem.hashCode()%>"></td>
					</tr>
					<%} %>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7"></td>
						<td colspan="1">
							<input type="submit" value="確認刪除">
							<button type="submit" name="submit" value="checkOut">我要結帳</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		<%}%>
		<form action="">
			<table id='cart'>
				<caption>餐點明細</caption>
				<thead>
					<tr>
						<th>名稱</th>
						<th>Size/選項</th>
						<th>價格</th>
						<th>數量</th>
						<th>小計</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img
							src='https://imgs.gvm.com.tw/upload/gallery/20191023/68938_01.jpg'>
							爆米花</td>
						<td>L/甜</td>
						<td>定價：650.0元<br> 優惠價：9折<br> 585.0元
						</td>
						<td><input type="number" name="quantity" required max="TODO" value="TODO:Quantity"></td>
						<td>1170.0</td>
					</tr>
					<tr>
						<td><img
							src='https://img.tukuppt.com/png_preview/00/00/06/oa3RLHO6PS.jpg!/fw/780'>
							飲料</td>
						<td>M/少冰</td>
						<td>定價：70.0元<br> 優惠價：9折<br> 63.0元
						</td>
						<td>1</td>
						<td>63</td>
					</tr>
					<tr>
						<td><img
							src='https://www.foodnext.net/dispPageBox/getFile/GetImg.aspx?FileLocation=%2FPJ-FOODNEXT%2FFiles%2F&FileName=photo-08366-i.jpg'>
							炸雞</td>
						<td>雞腿</td>
						<td>定價：70.0元<br> 優惠價：9折<br> 63.0元
						</td>
						<td>1</td>
						<td>63</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">共3項, 4件</td>
						<td colspan="2">總計: 1316元</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</article>
	<%@ include file="/subviews/footer.jsp"%>
</body>
</html>