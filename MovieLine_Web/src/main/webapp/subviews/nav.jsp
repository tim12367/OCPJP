<%@page import="uuu.movieline.entity.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@page import="uuu.movieline.service.ProductService"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="uuu.movieline.entity.Customer"%>
<link rel='stylesheet' type='text/css' href='./fancybox3/jquery.fancybox.css'>
<script src='./fancybox3/jquery.fancybox.js'></script>
<script>
	$(document).ready(initL);
	function initL() {
		$("#login_btn").click(getLogin_fancybox);
	}
	function getLogin_fancybox(){
		//ajax送非同步GET請求
		$.ajax({
			url:"<%=request.getContextPath()%>/login_data.jsp",
			method: 'GET'					
		}).done(getLogin_fancyboxHandler);
	}
	
	function getLogin_fancyboxHandler(result, txtStatus, xhr){
		//用fancybox來顯示
		$("#fancyDialog").html(result);
		$.fancybox.open({
		    src  : '#fancyDialog',
			'width':720,
	        'height':560,
		    type : 'inline',
		    opts : {
		      afterShow : function( instance, current ) {
		        console.info('done!');
	          }
	        }
	    });
	}
</script>
<!-- nav.jsp start -->
	<%
			Customer member = (Customer)session.getAttribute("member");
			ProductService service = new ProductService();
			List<String[]> categoryList = service.getMovieCategoryList();
	%>
	<nav class="nav">
		<ul class="nav_list">
			<li class="nav_list_item"><a href="<%=request.getContextPath()%>" class="nav_list_a">Home</a></li>
			<li class="nav_list_item"><a href="<%=request.getContextPath()%>/products_list.jsp" class="nav_list_a">全部電影</a></li>
			<li class="nav_list_item nav_list_last_item">
				<ul class = "nav_list_category_list">
				分類清單
				<%if(categoryList == null || categoryList.size()==0){ %>
					<li class="nav_list_category_list_item nav_list_category_list_item_first">
						<a href=# class="nav_user_a">查詢分類失敗</a>
					</li>
				<%}else{%>
				<!-- TODO:從資料庫撈選項 -->
					<li class="nav_list_category_list_item nav_list_category_list_item_first">
						<a href="<%=request.getContextPath()%>/products_list.jsp?category=<%=categoryList.get(0)[0]%>" class="nav_user_a">
							<%= categoryList.get(0)[0] %>
						</a>
					</li>
					<%for(int i = 1; i<categoryList.size();i++){ %>
					<li class="nav_list_category_list_item">
						<a href="<%=request.getContextPath()%>/products_list.jsp?category=<%=categoryList.get(i)[0]%>" class="nav_user_a">
							<%= categoryList.get(i)[0] %>
						</a>
					</li>
					<%} %>
				<%} %>
				</ul>
			</li>
		</ul>
		<% ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");%>
		<a class=nav_cart_a href="<%=request.getContextPath()%>/member/cart.jsp">
			<img class="nav_cart_img" alt="cart" src="<%=request.getContextPath()%>\source\cart.png">
		<%if(cart!=null&&cart.getTotalQuantity()>0){ %>
			<div class="nav_cart_counter">
				${sessionScope.cart.getTotalQuantity()}
			</div>		
		<%} %>
		</a>
		<%if(member!=null){ %>
		<a class="nav_booking_a" href="<%=request.getContextPath()%>/member/select_date_session.jsp">
			<span class="nav_booking_text">快速訂票</span>
<%-- 			<img class="nav_booking_icon" alt="booking" src="<%=request.getContextPath()%>/source/ticket.png"> --%>
		</a>
		<% }%>
		<ul class = "nav_user">
			<%=member!=null?(member.getName()+" 你好"):"尚未登入" %>
			<%if(member==null){%>
			<!-- 尚未登入 -->
			<li class="nav_user_item nav_user_item_first">
				<a href="<%=request.getContextPath()%>/login.jsp" class="nav_user_a">登入</a>
<!-- 				<a id="login_btn" href=# class="nav_user_a">登入</a> -->
			</li>
			<li class="nav_user_item"><a href="<%=request.getContextPath()%>/register.jsp" class="nav_user_a">註冊</a></li>
			<%}else{%>
			<li class="nav_user_item nav_user_item_first"><a href="<%=request.getContextPath()%>/member/update_member.jsp" class="nav_user_a">會員修改</a></li>
			<!-- 已經登入 -->
			<li class="nav_user_item"><a href="" class="nav_user_a">歷史訂單</a></li>
			<!-- http://localhost:8080/ML/ -->
			<li class="nav_user_item"><a href="<%=request.getContextPath()%>/logout.do" class="nav_user_a">登出</a></li>
			
			<%}%>
		</ul>
	</nav>
	<div id='fancyDialog'></div>
<!-- nav.jsp end -->