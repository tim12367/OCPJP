<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<%@page import="uuu.movieline.service.ProductService"%>
<%@page import="uuu.movieline.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="uuu.movieline.entity.Customer"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>全部電影</title>
<link rel="icon" type="image/x-icon" href="source/title_icon.png" />
<link href="css/global.css" type="text/css" rel="stylesheet">
<link href="css/products_list.css" type="text/css" rel="stylesheet">
<style>
	
</style>
<link href="css/global_dark.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.0.0.js" 
integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
crossorigin="anonymous"></script>
<script>
	var darkModeFlag = true;
	$(document).ready(init);
	function init() {
		//從localStorage獲得資料
		if (localStorage) {
			//偵測localStorage變化 同步darkMode
			window.addEventListener('storage',darkModeHandler); 
			restoreData();
			$("#dark_mode_button").click(darkModeHandler);
		} else {
			alert("不支援的瀏覽器!");
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
					"source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
		} else {
			$("body").removeClass("body--darkmode");
			$("#dark_mode_button").attr("src",
					"source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
		}
		localStorage.setItem("darkModeFlag", darkModeFlag);
		darkModeFlag = !darkModeFlag;
	}
</script>
</head>
<body>
	<!-- 後端標籤 -->
	<jsp:include page="/subviews/header.jsp">
		<jsp:param value="/source/movie_list_icon.png" name="iconUrl"/>
	</jsp:include>
	<jsp:include page="/subviews/nav.jsp"/>
	<%
		String keyword = (String)request.getParameter("search");
		List<Product> list;
		
		ProductService service = new ProductService();
		//判斷是所有結果 or 查詢結果
		if(keyword!=null && keyword.length()>0){
			list = service.getProductsByKeyword(keyword);
		}else{
			list = service.getAllProducts();
		}
		
	%>
	<article>
		<% if(list==null || list.size()==0 ){%>
			<p>查無資料</p>
		<%}else{ %>
		
		<ul class="products_list">
			<%for(int i=0; i<list.size();i++ ){
				Product p = list.get(i);
			%>
			<li class="products_list_item">
				<a class="product_box" href="product_detail.jsp?productId=<%= p.getId()%>">
					<div class="image_view_box">
						<img src="<%=p.getPhotoUrl()%>" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number"><%=p.getBoxOffice()%>萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname"><%=p.getName() %></div>
						<div class="release_date"><%=p.getLaunchDate() %></div>
					</div>
				</a>
			</li>
			<%}%>
		</ul>
		<%}%>
	</article>
	<%@ include file="/subviews/footer.jsp" %>
</body>
</html>