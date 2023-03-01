<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="uuu.movieline.entity.Movie"%>
<%@page import="uuu.movieline.service.ProductService"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>一線影院 電影介紹</title>
<link rel="icon" type="image/x-icon" href="source/title_icon.png" />
<link href="css/global.css" type="text/css" rel="stylesheet">
<link href="css/product_detail.css" type="text/css" rel="stylesheet">
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
	<!-- Insert icon here! -->
	<jsp:include page="/subviews/header.jsp">
		<jsp:param value="/source/movie_list_icon.png" name="iconUrl"/>
	</jsp:include>
	<jsp:include page="/subviews/nav.jsp"/>
	<%
	String productId = request.getParameter("movieId");
			ProductService service = new ProductService();
			Movie p =null;
			if(productId!=null && productId.length()>0){
		p = service.getProductById(productId);
			}
	%>
	<article>
	<%if(p==null){ %>
	<p>查無此產品</p>
	<%}else{ %>
	
		<div class="article_content">
			<div class="detail_box">
				<img class="detail_box_preview_pic" src="<%=p.getPhotoUrl()%>">
				<a class="detail_box_booking_btn" 
					href="<%=request.getContextPath()%>
					/member/select_date_session.jsp?movieId=
					<%=request.getParameter("movieId")%>">
					前往訂票
				</a>
				
				<div>
					<div class="detail_box_subtitle">上映 RELEASE DATE</div>
					<div class="detail_box_font"><%=p.getLaunchDate()%></div>
				</div>
				
				<div>
					<div class="detail_box_subtitle">類型 GENRE</div>
					<div class="detail_box_font"><%=p.getCategory() %></div>
				</div>
				
				<div>
					<div class="detail_box_subtitle">導演 DIRECTOR</div>
					<div class="detail_box_font"><%=p.getDirector()%></div>
				</div>
				
				<div>
					<div class="detail_box_subtitle">演員 CAST</div>
					<div class="detail_box_font">
						<%String[] castList = p.getCast().split("、"); %>
						<%for(String cast: castList){ %>
							<%=cast %><br>
						<%} %>
					</div>
				</div>
				
			</div>
			<div class="trailer_describe_box">
				<h1><%=p.getName()%></h1>
				<h2><%=p.getSubtitle()%></h2>
				<hr>
				<div class="youtube_vediobox">
					<iframe class="youtube"
						src="<%=p.getTrailerUrl()%>" 
						frameborder="0" allowfullscreen="true">
					</iframe>
				</div>
				<hr>
				<h2 class="describe_title">劇情簡介</h2>
				
				<%=p.getDescription() %>
			</div>
		</div>
		<%} %>
	</article>
	
</body>

</html>