<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<%@page import="java.time.LocalDate"%>
<%@page import="uuu.movieline.entity.Customer"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>修改會員資料</title>
<link rel="icon" type="image/x-icon" href="../sourcece/title_icon.png" />
<link href="../css/global.css" type="text/css" rel="stylesheet">
<link href="../css/register.css" type="text/css" rel="stylesheet">
<style type="text/css">
.nav_user {
    margin-left: 0;
}
</style>
<link href="../css/global_dark.css" type="text/css" rel="stylesheet">
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
		// TODO:兩次密碼打對才能送出

		//設定生日最大值
		$("#birthday").attr("max","<%=LocalDate.now().minusYears(Customer.MIN_AGE)%>");
		// 查看密碼按鈕
		$("#show_password_button,#show_newpassword_button").mousedown(showPasswordHandler);
		$("#show_password_button,#show_newpassword_button").mouseup(hidePasswordHandler);
		$("#show_password_button,#show_newpassword_button").mouseleave(hidePasswordHandler);
		$("#show_password_button,#show_newpassword_button").on("touchstart",showPasswordHandler);//手機版按下
		$("#show_password_button,#show_newpassword_button").on("touchend",hidePasswordHandler);//手機版放開
		
		
		<%if("POST".equals(request.getMethod())){%>
		//表單帶回
		repopulateFormData();
		<%}%>
		
		//init check rule
		$("#roc_id").attr("maxlength","<%=Customer.MAX_ID_LENGTH%>");
		
		$("#password").attr("maxlength","<%=Customer.MAX_PASSWORD_LENGTH%>");
		$("#password").attr("minlength","<%=Customer.MIN_PASSWORD_LENGTH%>");
		
		$("#name").attr("minlength","<%=Customer.MIN_NAME_LENGTH%>");
		$("#name").attr("maxlength","<%=Customer.MAX_NAME_LENGTH%>");
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
					"../source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
		} else {
			$("body").removeClass("body--darkmode");
			$("#register_form :input:not([type=submit])").removeClass("form_input--darkmode");
			$("select").removeClass("form_select--darkmode");
			$("#dark_mode_button").attr("src",
					"../source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
		}
		localStorage.setItem("darkModeFlag", darkModeFlag);
		darkModeFlag = !darkModeFlag;
	}
	function showPasswordHandler(){
		$(this).attr("src","../source/visibility_FILL0_wght400_GRAD0_opsz48.svg");
		$($(this).prev()).attr("type","text");
	}
	function hidePasswordHandler(){
		$(this).attr("src","../source/visibility_off_FILL0_wght400_GRAD0_opsz48.svg");
		$($(this).prev()).attr("type","password");
	}
	
	<%if("POST".equals(request.getMethod())){%>
	function repopulateFormData() {
		$("#roc_id").val("<%=request.getParameter("id")%>");
		$("#email").val("<%=request.getParameter("email")%>");
		$("#password").val("<%=request.getParameter("password")%>");
		$("#name").val("<%=request.getParameter("name")%>");
		$("#birthday").val("<%=request.getParameter("birthday")%>");
		$("#gender").val("<%=request.getParameter("gender")%>");
		$("#address").val("<%=request.getParameter("address")%>");
		$("#phone").val("<%=request.getParameter("phone")%>");
		<%String oldSubscribed = request.getParameter("subscribed");%>
		$("#subscribed").prop("checked",<%=(oldSubscribed!=null?oldSubscribed:"").equals("1")%>);
	}
	<%}%>
</script>
</head>
<body>
	<!-- 後端標籤 -->
	<!-- 後端標籤 -->
	<jsp:include page="/subviews/header.jsp"/>
	<jsp:include page="/subviews/nav.jsp"/>
	<!-- id, email, password, name, birthday, gender, address, phone, subscribed -->
	<article>
		<form id="register_form" class="register_form" action="register.do" method="POST" autocomplete="on">
			<h1>修改會員資料</h1>
	
			<!-- id 不可修改-->
			<div class="form_label_input_box">
				<label for="roc_id">身分證：</label>
				<input disabled="disabled" type="text" id="roc_id" class="form_input--lightmode"
					name="id" placeholder="身分證" required="required"
					pattern="<%=Customer.ID_PATTERN%>"
					value="F999999999">
			</div>
	
			<!-- email -->
			<div class="form_label_input_box">
				<label for="email"><span class="required_mark"><b>*</b></span>email：</label>
				<input type="email" id="email" class="form_input--lightmode"
					name="email" placeholder="請輸入電子郵件" required="required">
			</div>
	
			<!-- oldPassword -->
			<div class="form_label_input_box password_div">
				<label for="password"><span class="required_mark"><b>*</b></span>輸入舊密碼：</label>
				<input type="password" id="password" class="form_input--lightmode"
					name="password" placeholder="請輸入舊密碼6~20個字" required="required">
				<img src="../source/visibility_off_FILL0_wght400_GRAD0_opsz48.svg" 
					id="show_password_button" class="form_input_box_show_password_button"
					draggable="false">
			</div>
			
			<!-- newPassword -->
			<div class="form_label_input_box password_div">
				<label for="password"><span class="required_mark"><b>*</b></span>輸入新密碼：</label>
				<input type="password" id="newpassword" class="form_input--lightmode"
					name="password" placeholder="請輸入密碼6~20個字" required="required">
				<img src="../source/visibility_off_FILL0_wght400_GRAD0_opsz48.svg" 
					id="show_newpassword_button" class="form_input_box_show_password_button"
					draggable="false">
			</div>
			
			<!-- name -->
			<div class="form_label_input_box">
				<label for="name"><span class="required_mark"><b>*</b></span>姓名：</label>
				<input type="text" id="name" class="form_input--lightmode "
					name="name" placeholder="請輸入姓名2~20個字" required="required">
			</div>
	
			<!-- birthday 不可修改-->
			<div class="form_label_input_box">
				<label for="birthday">生日：</label>
				<input disabled="disabled" type="date" id="birthday" class="form_input--lightmode"
					name="birthday" required="required" pattern="\d{4}-\d{2}-\d{2}"
					value="9999-09-09">
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
			
			<%List<String> errors = (List<String>)request.getAttribute("errors");%>
			<p><%=errors==null?"":errors%></p>
			<!-- 送出按鈕 -->
			<input type="submit" class="submit_button" value="更新會員資料">
		</form>
	</article>
	<%@ include file="/subviews/footer.jsp" %>

</body>
</html>