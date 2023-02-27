<%@ page pageEncoding="UTF-8"%>
<%@page import="uuu.movieline.service.ProductService"%>
<%@page import="uuu.movieline.entity.Movie"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>電影場次選擇</title>
	<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/source/title_icon.png" />
	<link href="<%=request.getContextPath()%>/css/global.css" type="text/css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/select_date_session.css" type="text/css" rel="stylesheet">
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
			$("#movie").val(<%=request.getParameter("productId")==null?"":request.getParameter("productId")%>);
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
			<form id=select_session_form class="select_session_form" action="ticket_booking.jsp" method="POST">
				<div class="select_session_form_input_box">
					<label for="movie">
						<img class="select_session_form_input_icon" alt="vedio_cam.png" src="../source/vedio_cam.png">
					</label>
					<select id="movie" class="select_session_form_input" name="movie" required="required">
					<%
					//1.取得所有商品
										List<Movie> list;
										ProductService service = new ProductService();
										list = service.getAllProducts();
					%>
						<option value="">請選擇電影</option>
						<%
							if(list==null || list.size()==0){
						%>
						<option>查無電影</option>
						<%
							}else{
						%>
							<%
								for(int i=0; i<list.size();i++){
									Movie p = list.get(i);
							%>
						<option value="<%=p.getId()%>"><%=p.getName() %></option>
								<%}%>
						<%	}%>
					</select>
				</div>
				<div class="select_session_form_input_box">
					<label for="date">
						<img class="select_session_form_input_icon" alt="calendar.png" src="../source/calendar.png">
					</label>
					<select id="date" class="select_session_form_input" name="date" required="required">
						<option value="">請選擇場次</option>
						<option>2023-02-27</option>
					</select>			
				</div>
				
				<div class="select_session_form_input_box">
					<label for="session">
						<img class="select_session_form_input_icon" alt="time.png" src="../source/time.png">
					</label>
					<select id="session" class="select_session_form_input" name="session" required="required">
						<option value="">請選擇場次</option>
						<option>16:45</option>
					</select>
				</div>
				<input type="submit" class="submit_button" value="前往劃位">
			</form>
		</article>
		<%@ include file="/subviews/footer.jsp" %>
	</body>
</html>