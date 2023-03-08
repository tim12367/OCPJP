<%@ page pageEncoding="UTF-8" contentType="application/json"%>
<%@page import="uuu.movieline.service.ProductService"%>
<%@page import="uuu.movieline.entity.MovieSession"%>
<%@page import="uuu.movieline.entity.Seat"%>
<%
String movieId = request.getParameter("movieId");
String date = request.getParameter("date");
String time = request.getParameter("time");

MovieSession movieSession = null;
Seat seat = null;

ProductService service = new ProductService();
if(movieId!=null && date!=null && time!=null){
	movieSession = service.getSessionsByMovieIdDatetime(movieId, date, time);
	seat = movieSession.getSeat();
}
%>
[
	<% if(seat!=null){%>
	{"rowName":"A","seats":<%=seat.getRowA()%>},
	{"rowName":"B","seats":<%=seat.getRowB()%>},
	{"rowName":"C","seats":<%=seat.getRowC()%>},
	{"rowName":"D","seats":<%=seat.getRowD()%>},
	{"rowName":"E","seats":<%=seat.getRowE()%>},
	{"rowName":"F","seats":<%=seat.getRowF()%>},
	{"rowName":"G","seats":<%=seat.getRowG()%>},
	{"rowName":"H","seats":<%=seat.getRowH()%>},
	{"rowName":"I","seats":<%=seat.getRowI()%>}
	<%}%>
]