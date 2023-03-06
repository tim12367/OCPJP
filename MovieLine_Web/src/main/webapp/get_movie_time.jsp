<%@ page pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Set"%>
<%@page import="uuu.movieline.entity.MovieSession"%>
<%@page import="uuu.movieline.service.ProductService"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.List"%>
<%
	ProductService service = new ProductService();
	String movieId = request.getParameter("movieId");
	String date = request.getParameter("date");
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
