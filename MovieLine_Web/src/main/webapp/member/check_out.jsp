<%@page import="uuu.movieline.entity.Customer"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="uuu.movieline.entity.ShoppingCart"%>
<%@page import="uuu.movieline.entity.CartItem"%>
<%@page import="uuu.movieline.entity.ShippingType"%>
<%@page import="uuu.movieline.entity.PaymentType"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>訂單</title>
<%	
	DecimalFormat df = new DecimalFormat("#.##");
	ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
	Customer member = (Customer)session.getAttribute("member");
%>
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
			shippingAndPaytypeSelectHandlr();
			$("#paytype").change(shippingAndPaytypeSelectHandlr);
			$("#shipping_method").change(shippingAndPaytypeSelectHandlr);
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
				$(".form_select--lightmode").addClass("form_input--darkmode");
				$(".form_input--lightmode").addClass("form_input--darkmode");
				$("#dark_mode_button").attr("src",
						"<%=request.getContextPath()%>/source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
			} else {
				$("body").removeClass("body--darkmode");
				$(".form_select--lightmode").removeClass("form_input--darkmode");
				$(".form_input--lightmode").removeClass("form_input--darkmode");
				$("#dark_mode_button").attr("src",
						"<%=request.getContextPath()%>/source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
			}
			localStorage.setItem("darkModeFlag", darkModeFlag);
			darkModeFlag = !darkModeFlag;
		}
		function shippingAndPaytypeSelectHandlr() {
			var totalPrice = Number(${sessionScope.cart.getTotalAmount()});
			var dataP = Number($('option:selected', $("#paytype")).attr('data-fee'));
			var dataS = Number($('option:selected', $("#shipping_method")).attr('data-fee'));
			console.log(dataP);
			console.log(dataS);
			console.log(dataP+dataS);
			console.log(dataP+dataS+totalPrice);
			if(!isNaN(dataP)&&!isNaN(dataS)&&!isNaN(totalPrice)){
				$(".shipping_price_data").html(dataP+dataS);
				$("#total_price_data").html(Math.round((dataP+dataS+totalPrice)*10)/10);
			}else{
				$(".shipping_price_data").html(0);
				$("#total_price_data").html(Math.round(totalPrice*10)/10);
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
<%if(cart==null || cart.isEmpty()){ %>
<h1>尚未訂票</h1>
<%}else if(member==null){ %>
<h1>請重新登入<h1>
<%}else{ %>
${requestScope.errorList}
<!-- 		<form action="check_out.do" method="POST"> -->
		<form action="<%=request.getContextPath()%>/member/check_out.do" method="POST">
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
				<%for(CartItem cartItem:cart.getCartItemSet()){ %>
					<tr>
						<td>
							<div class="td_box movie_name_box">
								<img alt="<%=cartItem.getMovieName()%>"
									src="<%= cartItem.getPhotoUrl()%>">
								<div class="movie_name"><%=cartItem.getMovieName()%></div>
							</div> <!--TODO:<div>剩餘座位：100席</div>-->
						</td>
						<td>
							<div class="td_box">
								<div><%=cartItem.getSessionDate()%></div>
							</div>
						</td>
						<td>
							<div class="td_box">
								<div><%=cartItem.getSessionTime()%></div>
							</div>
						</td>
						<td>
							<div class="td_box">
								<div>
									定價:<%=df.format(cart.getListPrice(cartItem))%><br>
									折扣:<%= cart.getDiscountString(cartItem)%><br>
									特價:<%=df.format(cart.getUnitPrice(cartItem))  %><br>
								</div>
							</div>
						</td>
						<td>
							<div class="td_box">
								<div><%=cart.getQuantity(cartItem)%></div>
							</div>
						</td>
						<td>
							<div class="td_box">
								<div><%=cart.getSeatListString(cartItem) %></div>
							</div>
						</td>
						<td>
							<div class="td_box">
								<div><%=df.format(cart.getAmount(cartItem)) %></div>
							</div>
						</td>
					</tr>
					<%}%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<div class="cart_counter_box">
								<div class="cart_counter">共<%=cart.size()%>場 , <%=cart.getTotalQuantity()%>張票</div>
							</div>
						</td>
						<td colspan="1">
							<div class="shipping_price">
								<div>手續費 $<span class="shipping_price_data">0</span></div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<div class="pay_and_ship_box">
								<div class="paytype_box">
									<label class="paytype_label" for="paytype">選擇付款方式</label> 
									<select id="paytype" name="paymentType" class="selector form_select--lightmode" required>
										<option value=''>請選擇...</option>
										<%for(PaymentType pType:PaymentType.values()){ %>
										<option value='<%=pType.name()%>' data-fee='<%=pType.getFee()%>'><%=pType%></option>
										<%}%>
									</select>
								</div>
								<div class="shipping_method_box">
									<label class="shippingtype_label" for="shipping_method">選擇配送方式</label> 
									<select id="shipping_method" class="selector form_select--lightmode"
									name="shippingType" required>
										<option value=''>請選擇...</option>
										<%for(ShippingType sType:ShippingType.values()){ %>
										<option value='<%=sType.name()%>' data-fee='<%=sType.getFee()%>'><%=sType%></option>
										<%} %>
									</select>
								</div>
							</div>
						</td>
						<td colspan="1">
							<div class="cart_total_price_box">
								<div class="total_price_box">總金額：<span id="total_price_data"><%=df.format(cart.getTotalAmount())%></span></div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<div class="customer_info_box">
								<div class="customer_info_title">訂購人資訊</div>
								<div class="customer_info_input_box">
									<div class="customer_name_box">
										<label class="input_label" for="name">姓名</label> <input id="name" name="name" class="form_input--lightmode" value="<%=member.getName()%>" required>
									</div>
									<div class="customer_email_box">
										<label class="input_label" for="email">Email</label> <input id="email" class="form_input--lightmode" name="email" value="<%=member.getEmail()%>" required>
									</div>
									<div class="customer_phone_box">
										<label class="input_label" for="phone">聯絡電話</label> <input id="phone" class="form_input--lightmode" name="phone" value="<%=member.getPhone()%>" required>
									</div>
									<div class="customer_addr_box">
										<label class="input_label" for="address">收件地址</label> <input id="address" class="form_input--lightmode" name="address" value="<%=member.getAddress()%>" required>
									</div>
								</div>
							</div>
						</td>
						<td colspan="1">
							<div class="td_box">
								<button type="submit" class="checkOut_btn" name="submit"
									value="checkOutOk">送出訂單</button>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
<%}%>
	</article>
	<%@ include file="/subviews/footer.jsp"%>
</body>
</html>