<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
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
<script src="./jquery.js"></script>
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
	<header id="menu" class="menu">
		<img class="menu_logo_img" src="source/movie_FILL0_wght400_GRAD0_opsz48.svg" alt="Movie_Line_Logo" draggable="false">
		<form class='menu_search_form'>
			<input type='search' name="search" class="menu_search_input menu_search_form_items" placeholder='請輸入查詢關鍵字'>
			<input type='submit' class="menu_search_form_button menu_search_form_items" value='搜尋'>			
		</form>
		<img id=dark_mode_button class="menu_dark_mode_button"
			src="source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg"
			alt="dark_mode_button" draggable="false">
	</header>
	<%
		Customer member = (Customer)session.getAttribute("member");
	%>
	<nav class="nav">
		<ul class="nav_list">
			<li class="nav_list_item"><a href="./" class="nav_list_a">Home</a></li>
			<li class="nav_list_item nav_list_last_item"><a href=# class="nav_list_a">全部電影</a></li>
		</ul>
		<ul class = "nav_user">
			<%=member!=null?(member.getName()+" 你好"):"尚未登入" %>
			<%if(member==null){%>
			<!-- 尚未登入 -->
			<li class="nav_user_item nav_user_item_first"><a href="login.jsp" class="nav_user_a">登入</a></li>
			<li class="nav_user_item"><a href="register.jsp" class="nav_user_a">註冊</a></li>
			<%}else{%>
			<!-- 已經登入 -->
			<li class="nav_user_item nav_user_item_first"><a href=# class="nav_user_a">會員修改</a></li>
			<li class="nav_user_item"><a href=# class="nav_user_a">歷史訂單</a></li>
			<!-- http://localhost:8080/ML/ -->
			<li class="nav_user_item"><a href="logout.do" class="nav_user_a">登出</a></li>
			
			<%}%>
		</ul>
	</nav>
	<article>
		<ul class="products_list">
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20230116003.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">100萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">蟻人與黃蜂女：量子狂熱</div>
						<div class="release_date">2023-02-15</div>
					</div>
				</a>
			</li>
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20230110014.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">2000萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">灌籃高手 THE FIRST SLAM DUNK</div>
						<div class="release_date">2023-01-13</div>
					</div>
				</a>
			</li>
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20221121003.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">10000000000000000000000000000000000000000000000</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">阿凡達：水之道</div>
						<div class="release_date">2022-12-14</div>
					</div>
				</a>
			</li>
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20230109019.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">2000萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">迫降危機</div>
						<div class="release_date">2023-01-25</div>
					</div>
				</a>
			</li>
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20230131004.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">2000萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">火線交涉</div>
						<div class="release_date">2023-02-03</div>
					</div>
				</a>
			</li>
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20230106008.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">2000萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">玩命特攻：武演行動</div>
						<div class="release_date">2023-01-19</div>
					</div>
				</a>
			</li>
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20230113009.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">2000萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">寶塚歌劇 星組東京寶塚劇場公演『德米特里～在曙光下飄落的紫之花～』『JAGUAR BEAT』千秋樂 現場直播</div>
						<div class="release_date">2023-02-12</div>
					</div>
				</a>
			</li>
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20230113002.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">2000萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">Francis Tsai 法蘭 《Time's Up》戲院演唱會台北場</div>
						<div class="release_date">2023-02-08</div>
					</div>
				</a>
			</li>
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20220705016.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">2000萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">角落小夥伴電影版：藍色月夜的魔法之子</div>
						<div class="release_date">2022-08-05</div>
					</div>
				</a>
			</li>
			
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://www.vscinemas.com.tw/vsweb/upload/film/film_20230103022.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">2000萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">新世紀福音戰士新劇場版 : 終</div>
						<div class="release_date">2023-02-03</div>
					</div>
				</a>
			</li>
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://mrmad.com.tw/wp-content/uploads/2021/11/bigjpg.jpg" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">2000萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">新世紀福音戰士新劇場版 : 終</div>
						<div class="release_date">2023-02-03</div>
					</div>
				</a>
			</li>
			<li class="products_list_item">
				<a class="product_box">
					<div class="image_view_box">
						<img src="https://p2.bahamut.com.tw/B/ACG/c/74/0000106374.JPG" 
						class="image_view_preview_pic" alt="預覽圖">
						<div class = "image_view_viewers">
							<img src="./source/visibility_FILL1_wght400_GRAD0_opsz48.svg"
							class="viewers_icon">
							<div class="viewers_number">99.6萬</div>
						</div>
					</div>
					
					<div class="title_release_date_box">
						<div class="vedioname">進擊的巨人 The Final Season</div>
						<div class="release_date">2020-12-07</div>
					</div>
				</a>
			</li>
		</ul>
	</article>
	<%@ include file="/subviews/footer.jsp" %>
</body>
</html>