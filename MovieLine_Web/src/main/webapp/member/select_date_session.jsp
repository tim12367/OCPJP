<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="uuu.movieline.entity.MovieSession"%>
<%@ page pageEncoding="UTF-8"%>
<%@page import="uuu.movieline.service.ProductService"%>
<%@page import="uuu.movieline.entity.Movie"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>電影場次選擇</title>
	<%
		ProductService service = new ProductService();
		String movieId = request.getParameter("movieId");
		String date = request.getParameter("date");
	%>
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
			//若網址有電影代號 帶入選項
			movieSelectorInitHandlr();
			//若網址有日期 帶入選項
			dateSelectorInitHandlr();
			
			//若選擇電影 則查詢場次
			$("#movie").change(movieSelectorChangeHandlr);
			//若選擇日期 則顯示時間
			$("#date").change(dateSelectorChangeHandlr);
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
		function movieSelectorInitHandlr() {
			$("#movie").val("<%=request.getParameter("movieId")==null?"":request.getParameter("movieId")%>");
		}
		function movieSelectorChangeHandlr() {
			console.log($("#movie").val());
			location.href="?movieId=" + $("#movie").val();
		}
		function dateSelectorInitHandlr() {
			//若movie selector有值
			if ($("#movie").val()!=""){
				$("#date").val("<%=request.getParameter("date")==null?"":request.getParameter("date")%>");
			}
			console.log("<%=request.getParameter("date")%>");
		}
		function dateSelectorChangeHandlr() {
			console.log($("#date").val());
			location.href="?movieId=" + $("#movie").val() + "&date=" + $("#date").val();
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
					//1.取得所有電影
						List<Movie> list;
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
				<%
				//獲取場次
				List<MovieSession> allSessions = null;
				if(movieId!=null&&movieId.length()>0){
					allSessions = service.getSessionsByMovieId(movieId);
				}
				//獲取日期
				Set<LocalDate> sessionDates = null;
				if(allSessions!=null&&!allSessions.isEmpty()){
					sessionDates = new LinkedHashSet<>();
					for(MovieSession s:allSessions){
						sessionDates.add(s.getDate());
					}
				}
				//獲取時間表
				List<MovieSession> SessionTimes =null;
				if(movieId!=null&&movieId.length()>0&&date!=null&&date.length()>0){
					SessionTimes = service.getSessionsByMovieIdDate(movieId, date);
				}
				%>
				
				<div class="select_session_form_input_box">
					<label for="date">
						<img class="select_session_form_input_icon" alt="calendar.png" src="../source/calendar.png">
					</label>
					<select id="date" class="select_session_form_input" name="date" required="required">
						<%if(sessionDates==null || sessionDates.isEmpty()){ %>
						<option value="">查無場次</option>
						<%}else{ %>
						<option value="">請選擇日期</option>
							<%for(LocalDate d:sessionDates){ %>
							<option value="<%=d%>"><%=d%></option>
							<%} %>
						<%} %>
					</select>			
				</div>
				
				<div class="select_session_form_input_box">
					<label for="session">
						<img class="select_session_form_input_icon" alt="time.png" src="../source/time.png">
					</label>
					<select id="session" class="select_session_form_input" name="session" required="required">
					<%if(sessionDates==null || sessionDates.isEmpty()){ %>
						<option value="">查無場次</option>
					<%}else if(SessionTimes==null || SessionTimes.isEmpty()){ %>
						<option value="">↑請先選擇日期↑</option>
					<%}else{ %>
						<option value="">請選擇時間</option>
						<%for(MovieSession s:SessionTimes){ %>
						<option value="<%=s.getTime()%>"><%=s.getTime()%></option>
						<%} %>
					<%} %>
					</select>
				</div>
				<input type="submit" class="submit_button" value="前往劃位">
			</form>
		</article>
		<%@ include file="/subviews/footer.jsp" %>
	</body>
</html>