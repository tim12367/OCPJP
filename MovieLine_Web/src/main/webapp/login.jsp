<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<%@page import="uuu.movieline.entity.Customer"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登入畫面</title>
<link rel="icon" type="image/x-icon" href="source/title_icon.png" />
<link href="css/global.css" type="text/css" rel="stylesheet">
<link href="css/login.css" type="text/css" rel="stylesheet">
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
			//偵測localStorage變化 同步darkMode
			window.addEventListener('storage',darkModeHandler); 
			restoreData();
			$("#submitBtn").click(saveHandler);
			$("#dark_mode_button").click(darkModeHandler);
		} else {
			alert("不支援的瀏覽器!");
			$("#hint").text("不支援的瀏覽器!");
		}
		// 查看密碼按鈕
		$("#show_password_button").mousedown(showPasswordHandler);
		$("#show_password_button").mouseup(hidePasswordHandler);
		$("#show_password_button").mouseleave(hidePasswordHandler);
		$("#show_password_button").on("touchstart",showPasswordHandler);//手機版按下
		$("#show_password_button").on("touchend",hidePasswordHandler);//手機版放開
		//點選驗證圖片更新
		$("#captcha_image").click(refreshCaptcha);
		<%if("POST".equalsIgnoreCase(request.getMethod())){%>
		//表單帶回
		repopulateFormData();
		<%}%>
	}
	function saveHandler() {
		if ($("#remembermypassword")[0].checked) {
			var username = $("#username").val();
			localStorage.setItem("username", username);
		} else {
			localStorage.removeItem("username");
		}
	}
	function restoreData() {
		var username = localStorage.getItem("username");
		var getDarkModeFlag = localStorage.getItem("darkModeFlag");
		// 若之前有儲存帳號 則勾選記住
		if (username) {
			$("#username").val(username);
			$("#remembermypassword").attr("checked", "")
		} else {
			// 若是空字串或沒有就移除
			localStorage.removeItem("username");
		}
		//記住深色模式
		if (getDarkModeFlag == "true") {
			darkModeFlag = getDarkModeFlag;
			darkModeHandler();
		}
	}

	function darkModeHandler(e) {
		if (darkModeFlag) {
			$("body").addClass("body--darkmode");
			$("#login_form :input:not([type=submit])").addClass("form_input--darkmode");
			$("#dark_mode_button").attr("src",
					"source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
		} else {
			$("body").removeClass("body--darkmode");
			$("#login_form :input:not([type=submit])").removeClass("form_input--darkmode");
			$("#dark_mode_button").attr("src",
					"source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
		}
		localStorage.setItem("darkModeFlag", darkModeFlag);
		darkModeFlag = !darkModeFlag;
		//try {console.log(e.type);}//for test
		//catch(e){console.log("err");}
	}
	function showPasswordHandler(e){
		$("#show_password_button").attr("src","source/visibility_FILL0_wght400_GRAD0_opsz48.svg");
		$("#password").attr("type","text");
		//console.log(e.type);//for test
	}
	function hidePasswordHandler(e){
		$("#show_password_button").attr("src","./source/visibility_off_FILL0_wght400_GRAD0_opsz48.svg");
		$("#password").attr("type","password");
		//console.log(e.type);//for test
	}
	function refreshCaptcha() {
		$("#captcha_image").attr("src","images/captcha.jpg?refresh=" + new Date());
	}
	<%if("POST".equalsIgnoreCase(request.getMethod())){%>
	function repopulateFormData() {
		$("#username").val("<%=request.getParameter("username")%>");
		$("#password").val("<%=request.getParameter("password")%>");
	}
	<%}%>
</script>
</head>

<body>
	<!-- 後端標籤 -->
	<jsp:include page="/subviews/header.jsp"/>
	<%
		Customer member = (Customer)session.getAttribute("member");
	%>
	<nav class="nav">
		<ul class="nav_list">
			<li class="nav_list_item"><a href="./" class="nav_list_a">Home</a></li>
			<li class="nav_list_item nav_list_last_item"><a href="products_list.jsp" class="nav_list_a">全部電影</a></li>
		</ul>
		<ul class = "nav_user">
			<%=member!=null?(member.getName()+" 你好"):"尚未登入" %>
			<%if(member==null){%>
			<!-- 尚未登入 -->
			<li class="nav_user_item nav_user_item_first"><a href=# class="nav_user_a">登入</a></li>
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
	<!-- http://localhost:8080/ML/login.do -->
	<article>
	
		<form id="login_form" class="login_form" action="login.do" method="POST" autocomplete="on">
	
			<h1>登入</h1>
			<h3>歡迎光臨一線影院</h3>
	
			<div id="input_box" class="form_input_box">
			<!-- TODO:Fix pattern caught SyntaxError:  -->
				<input type="text" id="username" name="username"
					class="form_input--lightmode" required="required"
					placeholder="請輸入電子郵件或身分證"
					pattern="([a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$)|([a-zA-Z][1289][0-9]{8})">
				
				<div class="form_input_password_box">
					<input type="password" id="password" name="password"
					class="form_input--lightmode form_input--moblie" minlength="6" maxlength="20"
					placeholder="請輸入密碼" required="required">
					<img src="./source/visibility_off_FILL0_wght400_GRAD0_opsz48.svg" 
					id="show_password_button" class="form_input_box_show_password_button"
					draggable="false">
				</div>
				<input type="text" id="captcha" name="captcha"
					class="form_input--lightmode"
					placeholder="請輸入驗證碼(不分大小寫)" autocomplete="off" required="required">
				<img src="images/captcha.jpg" id=captcha_image class="form_input_box_capcha_image"
				draggable="false">
			</div>
	
	
			<div id="forget_and_remember" class="forget_and_remember_box">
				<input id="remembermypassword"
					class="forget_and_remember_box_elememt" type="checkbox" value="yes">
				<label for="remembermypassword"
					class="forget_and_remember_box_elememt">記住我</label>
				<%
					List<String> errors = (List<String>)request.getAttribute("errors");
				%>
				<div id="hint"
					class="forget_and_remember_box_elememt forget_and_remember_hint"><%=errors==null?"":errors%></div>
				<!-- 給button設置一個類型type="button" 才不會觸發表單-->
				<button
					type="button"
					class="forget_and_remember_button forget_and_remember_box_elememt">忘記密碼?</button>
				<br>
			</div>
	
			<input id="submitBtn" class="submit_button" type="submit" value="登入">
	
		</form>
	</article>
	<%@ include file="/subviews/footer.jsp" %>
	
</body>

</html>