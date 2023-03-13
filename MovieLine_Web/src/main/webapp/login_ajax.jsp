<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"%>
<%@page import="uuu.movieline.entity.Customer"%>
<%@page import="java.util.List"%>
<link href="css/login_ajax.css" type="text/css" rel="stylesheet">

	<%
		Customer member = (Customer)session.getAttribute("member");
	%>

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
					<img src="source/visibility_off_FILL0_wght400_GRAD0_opsz48.svg" 
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
			</div>
	
			<input id="submitBtn" class="submit_button" type="submit" value="登入">
	
		</form>

	
