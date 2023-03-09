<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<%@page import="uuu.movieline.entity.VIP"%>
<%@page import="java.time.LocalDate"%>
<%@page import="uuu.movieline.entity.Customer"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>修改會員資料</title>
<!-- 帶回會員資料 -->
<%Customer member = (Customer)session.getAttribute("member"); %>

<link rel="icon" type="image/x-icon" href="../source/title_icon.png" />
<link href="../css/global.css" type="text/css" rel="stylesheet">
<link href="../css/register.css" type="text/css" rel="stylesheet">
<style type="text/css">
.nav_user {
    margin-left: 0;
}
.menu_logo_img{
	filter: invert(86%) sepia(62%) saturate(5722%) hue-rotate(180deg) brightness(106%) contrast(116%);
}
.hint{
	color: red;
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
		
		//表單帶回
		repopulateFormData();
		
		//init check rule
		$("#roc_id").attr("pattern","<%=Customer.ID_PATTERN%>");
		$("#roc_id").attr("maxlength","<%=Customer.MAX_ID_LENGTH%>");
		
		$("#password").attr("maxlength","<%=Customer.MAX_PASSWORD_LENGTH%>");
		$("#password").attr("minlength","<%=Customer.MIN_PASSWORD_LENGTH%>");
		
		$("#newpassword").attr("maxlength","<%=Customer.MAX_PASSWORD_LENGTH%>");
		$("#newpassword").attr("minlength","<%=Customer.MIN_PASSWORD_LENGTH%>");
		
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
			$(".form_input_box_show_password_button").addClass("form_input_box_show_password_button--darkmode");
			$("#dark_mode_button").attr("src",
					"../source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
		} else {
			$("body").removeClass("body--darkmode");
			$("#register_form :input:not([type=submit])").removeClass("form_input--darkmode");
			$("select").removeClass("form_select--darkmode");
			$(".form_input_box_show_password_button").removeClass("form_input_box_show_password_button--darkmode");
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
	
	<%if("POST".equalsIgnoreCase(request.getMethod())){%>
	//若打錯帶回資料
	function repopulateFormData() {
		$("#roc_id").val("<%=request.getParameter("id")%>");
		$("#email").val("<%=request.getParameter("email")%>");
		$("#password").val("<%=request.getParameter("password")%>");
		$("#name").val("<%=request.getParameter("name")%>");
		$("#birthday").val("<%=request.getParameter("birthday")%>");
		$("#gender").val("<%=request.getParameter("gender")%>");
		$("#address").val("<%=request.getParameter("address")%>");
		$("#phone").val("<%=request.getParameter("phone")%>");
		$("#subscribed").prop("checked",<%=request.getParameter("subscribed")!=null%>);
	}
		//alert("資料錯誤請修改錯誤欄位再修改");
	<%}else if(member==null){%>
		alert("請先登入後再修改");
		<%	
			//TODO:返回登入畫面
			//Thread.sleep(5000);
			//response.sendRedirect(request.getContextPath()+"/login.jsp");
		%>
	<%}else{%>
	//第一次請求帶入除了密碼的基本資料
	function repopulateFormData() {
		$("#roc_id").val("<%=member.getId()%>");
		$("#email").val("<%=member.getEmail()%>");
		
		$("#name").val("<%=member.getName()%>");
		$("#birthday").val("<%=member.getBirthday()%>");
		$("#gender").val("<%=member.getGender()%>");
		$("#address").val("<%=member.getAddress()%>");
		$("#phone").val("<%=member.getPhone()%>");
		
		$("#subscribed").prop("checked",<%=member.isSubscribed()%>);
	}
	<%}%>
	
</script>
</head>
<body>
	<jsp:include page="/subviews/header.jsp">
		<jsp:param value="/source/customer_setting.png" name="iconUrl"/>
	</jsp:include>
	<jsp:include page="/subviews/nav.jsp"/>
	<!-- id, email, password, name, birthday, gender, address, phone, subscribed -->
	<article>
		<form id="register_form" class="register_form" action="./update.do" method="POST" autocomplete="on">
			<h1>修改會員資料</h1>
			
			<%if(member instanceof VIP){ %>
			<p>VIP會員可享<%=((VIP)member).getDiscountString()%></p>
			
			<%}%>
			<!-- id 不可修改-->
			<div class="form_label_input_box">
				<label for="roc_id">身分證：<br><span class="required_mark"><b>(不可修改)</b></span></label>
				<input readonly="readonly" type="text" id="roc_id" class="form_input--lightmode"
					name="id" placeholder="身分證"
					value="F999999999">
			</div>
	
			<!-- email -->
			<div class="form_label_input_box">
				<label for="email">email：</label>
				<input type="email" id="email" class="form_input--lightmode"
					name="email" placeholder="請輸入電子郵件">
			</div>
	
			<!-- oldPassword -->
			<!-- 必要欄位! -->
			<div class="form_label_input_box password_div">
				<label for="password"><span class="required_mark"><b>*</b></span>輸入舊密碼：</label>
				<input type="password" id="password" class="form_input--lightmode"
					name="password" required="required" placeholder="必須輸入密碼才可修改會員資料">
				<img src="../source/visibility_off_FILL0_wght400_GRAD0_opsz48.svg" 
					id="show_password_button" class="form_input_box_show_password_button"
					draggable="false">
			</div>
			
			<!-- newPassword -->
			<div class="form_label_input_box password_div">
				<label for="password">輸入新密碼：</label>
				<input type="password" id="newpassword" class="form_input--lightmode"
					name="newpassword" placeholder="若要改密碼請輸入">
				<img src="../source/visibility_off_FILL0_wght400_GRAD0_opsz48.svg" 
					id="show_newpassword_button" class="form_input_box_show_password_button"
					draggable="false">
			</div>
			
			<!-- name -->
			<div class="form_label_input_box">
				<label for="name">姓名：</label>
				<input type="text" id="name" class="form_input--lightmode "
					name="name" placeholder="請輸入姓名2~20個字">
			</div>
	
			<!-- birthday 不可修改-->
			<div class="form_label_input_box">
				<label for="birthday">生日：<br><span class="required_mark"><b>(不可修改)</b></span></label>
				<input readonly="readonly" type="date" id="birthday" class="form_input--lightmode"
					name="birthday" value="9999-09-09">
			</div>
	
			<!-- gender -->
			<div class="form_label_input_box">
				<label for="gender">性別：</label>
				<select id="gender" class="form_select--lightmode"
					name="gender">
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
			<p class="hint"><%=errors==null?"":errors%></p>
			
			<!-- 送出按鈕 -->
			<input type="submit" class="submit_button" value="更新會員資料">
		</form>
	</article>
	<%@ include file="/subviews/footer.jsp" %>

</body>
</html>