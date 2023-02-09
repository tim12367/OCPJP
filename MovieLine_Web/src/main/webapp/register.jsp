<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊畫面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/global.css" type="text/css" rel="stylesheet">
<link href="css/register.css" type="text/css" rel="stylesheet">
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
		// TODO:兩次密碼打對才能送出

		//設定生日最大值
		maxBirthdaySetting();
		// 查看密碼按鈕
		$("#show_password_button").mousedown(showPasswordHandler);
		$("#show_password_button").mouseup(hidePasswordHandler);
		$("#show_password_button").mouseleave(hidePasswordHandler);
		$("#show_password_button").on("touchstart",showPasswordHandler);//手機版按下
		$("#show_password_button").on("touchend",hidePasswordHandler);//手機版放開
		//點選驗證圖片更新
		$("#captcha_image").click(refreshCaptcha);
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
			$("#register_form :input:not([type=submit])").addClass("form_input--darkmode");
			$("select").addClass("form_select--darkmode");
			$("#dark_mode_button").attr("src",
					"source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
		} else {
			$("body").removeClass("body--darkmode");
			$("#register_form :input:not([type=submit])").removeClass("form_input--darkmode");
			$("select").removeClass("form_select--darkmode");
			$("#dark_mode_button").attr("src",
					"source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
		}
		localStorage.setItem("darkModeFlag", darkModeFlag);
		darkModeFlag = !darkModeFlag;
	}
	function showPasswordHandler(){
		$("#show_password_button").attr("src","source/visibility_FILL0_wght400_GRAD0_opsz48.svg");
		$("#password").attr("type","text");
	}
	function hidePasswordHandler(){
		$("#show_password_button").attr("src","./source/visibility_off_FILL0_wght400_GRAD0_opsz48.svg");
		$("#password").attr("type","password");
	}
	function maxBirthdaySetting(){
		var today = new Date();
		var year_birthday = (today.getFullYear() - 12);
		// if 幾月日期 <10 加零在前面
		var month_birthday = (((today.getMonth() + 1) < 10) ? 
		("0" + (today.getMonth() + 1)) : (today.getMonth() + 1));
		var day_birthday = ((today.getDate()) < 10) ? 
		("0" + today.getDate()) : (today.getDay);

		console.log("12歲的生日：" + year_birthday + "-" + month_birthday + "-"
				+ day_birthday);
		$("#birthday").attr("max",
				(year_birthday + "-" + month_birthday + "-" + day_birthday));
	}
	function refreshCaptcha() {
		$("#captcha_image").attr("src","images/register_captcha.jpg?refresh=" + new Date());
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
	<nav class="nav">
		<ul class="nav_list">
			<li class="nav_list_item"><a href="./" class="nav_list_a">Home</a></li>
			<li class="nav_list_item"><a href="login.jsp" class="nav_list_a">登入</a></li>
			<li class="nav_list_item"><a href=# class="nav_list_a">註冊</a></li>
			<li class="nav_list_item nav_list_last_item"><a href="products_list.html" class="nav_list_a">全部電影</a></li>
		</ul>
	</nav>
	<!-- id, email, password, name, birthday, gender, address, phone, subscribed -->
	<article>
		<form id="register_form" class="register_form" action="register.do" method="POST" autocomplete="on">
			<h1>建立帳號</h1>
	
			<!-- id -->
			<div class="form_label_input_box">
				<label for="roc_id"><span class="required_mark"><b>*</b></span>身分證：</label>
				<input type="text" id="roc_id" class="form_input--lightmode"
					name="id" placeholder="請輸入中華民國身分證" required="required"
					pattern="[a-zA-Z][1289][0-9]{8}" maxlength="10">
			</div>
	
			<!-- email -->
			<div class="form_label_input_box">
				<label for="email"><span class="required_mark"><b>*</b></span>email：</label>
				<input type="email" id="email" class="form_input--lightmode"
					name="email" placeholder="請輸入電子郵件" required="required"
					pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$)">
			</div>
	
			<!-- password -->
			<div class="form_label_input_box password_div">
				<label for="password"><span class="required_mark"><b>*</b></span>密碼：</label>
				<input type="password" id="password" class="form_input--lightmode"
					name="password" placeholder="請輸入密碼6~20個字" minlength="6"
					maxlength="20" required="required">
				<img src="./source/visibility_off_FILL0_wght400_GRAD0_opsz48.svg" 
					id="show_password_button" class="form_input_box_show_password_button"
					draggable="false">
			</div>

			<!-- name -->
			<div class="form_label_input_box">
				<label for="name"><span class="required_mark"><b>*</b></span>姓名：</label>
				<input type="text" id="name" class="form_input--lightmode "
					name="name" placeholder="請輸入姓名2~20個字" minlength="2" maxlength="20"
					required="required">
			</div>
	
			<!-- birthday -->
			<div class="form_label_input_box">
				<label for="birthday"><span class="required_mark"><b>*</b></span>生日：</label>
				<input type="date" id="birthday" class="form_input--lightmode"
					name="birthday" required="required" pattern="\d{4}-\d{2}-\d{2}">
			</div>
	
			<!-- gender -->
			<div class="form_label_input_box">
				<label for="gender"><span class="required_mark"><b>*</b></span>性別：</label>
				<select type="text" id="gender" class="form_select--lightmode"
					name="gender" required="required">
					<option value="">請選擇性別</option>
					<option value="M">男</option>
					<option value="F">女</option>
					<option value="U">其他</option>
				</select>
			</div>
	
			<!-- address -->
			<div class="form_label_input_box">
				<label for="address">地址：</label> <input type="text" id="address"
					class="form_input--lightmode " name="address" placeholder="請輸入地址">
			</div>
	
			<!-- phone -->
			<div class="form_label_input_box">
				<label for="phone">電話：</label> <input type="tel" id="phone"
					class="form_input--lightmode " name="phone" placeholder="請輸入電話">
			</div>
	
			<!-- subscribed -->
			<div class="form_label_input_box">
				<label>是否訂閱電子報：</label> <input type="checkbox" id="subscribed"
					class="form_checkbox" name="subscribed" value="1">
			</div>
			<!-- 驗證碼 -->
			<div class="form_label_input_box  form_label_input_box_last">
				<input type="text" id="captcha" name="captcha"
					class="form_input--lightmode"
					placeholder="請輸入驗證碼(不分大小寫)"
					autocomplete="off" required="required">
				<img src="images/register_captcha.jpg" id=captcha_image class="form_input_box_capcha_image" draggable="false">
			</div>
			<!-- 送出按鈕 -->
			<input type="submit" class="submit_button" value="註冊">
		</form>
	</article>
	<footer>
		<hr>
		<div class='copyRightDiv'>一線影院&copy; 2023-01~</div>
	</footer>
</body>
</html>