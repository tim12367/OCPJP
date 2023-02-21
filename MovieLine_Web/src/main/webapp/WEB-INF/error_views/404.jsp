<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>404</title>
	<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/source/title_icon.png" />
	<link href="<%=request.getContextPath()%>/css/global.css" type="text/css" rel="stylesheet">
	<!-- link style here-->
	<link href="<%=request.getContextPath()%>/css/global_dark.css" type="text/css" rel="stylesheet">
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
						"<%=request.getContextPath()%>/source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
			} else {
				$("body").removeClass("body--darkmode");
				$("#dark_mode_button").attr("src",
						"<%=request.getContextPath()%>/source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
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
		<article>
			<p style="text-align:center;font-size: 100px;margin-bottom: 10px;">404</p>
			<p style="text-align:center;font-size: 30px;"><%=request.getAttribute("javax.servlet.error.request_uri")%> 不存在</p>
			
			<div style="width: fit-content;margin:auto;">
				<img alt="" src="<%=request.getContextPath() %>/source/404.jpg" style=" height: 300px;">
			</div>
		</article>
		<%@ include file="/subviews/footer.jsp" %>
	</body>
</html>