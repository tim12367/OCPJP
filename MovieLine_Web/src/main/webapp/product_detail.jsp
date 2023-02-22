<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>

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
	
	<!-- Insert icon here! -->
	<jsp:include page="/subviews/header.jsp">
		<jsp:param value="/source/movie_list_icon.png" name="iconUrl"/>
	</jsp:include>
	<jsp:include page="/subviews/nav.jsp"/>
	<article>
		<div class="article_content">
			<div class="detail_box">
				<img class="detail_box_preview_pic" src="https://www.miranewcinemas.com/MiramarApp/Resource/8db039cc9cfe630_S.jpg">
				<a class="detail_box_booking_btn" href="<%=request.getContextPath()%>/member/ticket_booking.jsp?productId=<%=request.getParameter("productId")%>">前往訂票</a>
				
				<div>
					<div class="detail_box_subtitle">上映 RELEASE DATE</div>
					<div class="detail_box_font">2023-02-10</div>
				</div>
				
				<div>
					<div class="detail_box_subtitle">類型 GENRE</div>
					<div class="detail_box_font">劇情片 DRAMA</div>
				</div>
				
				<div>
					<div class="detail_box_subtitle">導演 DIRECTOR</div>
					<div class="detail_box_font">詹姆斯卡麥隆 James Cameron</div>
				</div>
				
				<div>
					<div class="detail_box_subtitle">演員 CAST</div>
					<div class="detail_box_font">
						李奧納多狄卡皮歐 Leonardo DiCaprio<br>
						凱特溫絲蕾 Kate Winslet<br>
						凱西貝茲 Kathy Bates<br>
						法蘭西斯費雪 Frances Fisher<br>
						比爾派頓 Bill Paxton<br>
						維特賈勃 Victor Garber<br>
					</div>
				</div>
				
			</div>
			<div class="trailer_describe_box">
				<h1>鐵達尼號 25周年重映版</h1>
				<h2>TITANIC: 25TH ANNIVERSARY</h2>
				<hr>
				<div class="youtube_vediobox">
					<iframe class="youtube"
						src="https://www.youtube.com/embed/dvTDJBvvW1s" 
						frameborder="0" allowfullscreen="true">
					</iframe>
				</div>
				<hr>
				<h2 class="describe_title">劇情簡介</h2>
				<!--TODO:句號換行-->
				<p>
					1912年四月十五日凌晨，重達四十六萬噸的鐵達尼號，也是當時被稱為全世界最大最安全的豪華遊輪自英格蘭駛向紐約，在加拿大東岸紐芬蘭附近海面撞上巨大冰山，2223名乘客只有七百多名逃過這場史上最大船難，一千五百多人隨著巨船沉沒海底。
				</p>
				<p>
					八十五年後，尋寶探險家在三千英尺深處的鐵達尼號殘骸中找到一幅完美無損的少女裸身素描畫，而畫中人正是年逾百歲的倖存者羅絲。當她面對這張熟悉的畫像時，飽經滄桑的老人陷入往事的追憶，而故事也就此開始。
				</p>
				<p>
					回溯當年愛爾蘭海岸旁，“夢之船”鐵達尼號即將展開處女航，年輕貌美的貴族少女羅絲隨著母親和未婚夫卡爾乘上這艘豪華巨輪。但羅絲內心孤獨寂寞，單調乏味的貴族生活使她鬱鬱寡歡。與之相比，同船三等艙的年輕畫家傑克就顯得興高采烈。他生活窘迫，卻樂天知命。
				</p>
				<p>
					悶悶不樂的羅絲無法忍受生活的無奈，面對著滾滾的海浪欲結束自己的生命。但傑克的出現不僅挽救了她的生命，更挽救了她的靈魂。羅絲在傑克身上體驗到愛情的美妙和活力。她不顧母親的反對，毅然地與傑克沉浸在愛情的喜悅之中。然而，這段美麗的邂逅，卻將隨著突來的浩劫，沉入陰陰鬱鬱的大西洋底。
				</p>
			</div>
		</div>
		
	</article>
	
</body>

</html>