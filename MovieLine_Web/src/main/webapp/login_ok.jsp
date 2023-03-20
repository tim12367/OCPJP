<!--<%@ page pageEncoding="UTF-8"%>-->
<%@page import="java.util.List"%>
<%@page import="uuu.movieline.entity.Customer"%>
<!DOCTYPE html>
<html>
<%
	String loginRedirectUrl = (String)request.getAttribute("loginRedirectUrl");
%>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>會員登入成功</title>
	<link rel="icon" type="image/x-icon" href="source/title_icon.png" />
	<meta http-equiv="refresh" content="5; url=<%=loginRedirectUrl!=null?loginRedirectUrl:"./"%>">
	<style type="text/css">
		body {
			background-color: #282a36;
    		color: #e8eaed;
		}
		a{
			color: #e8eaed;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.0.0.js" 
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
	crossorigin="anonymous"></script>
	<script>
		$(document).ready(init);
		function init() {
			countdownHandlr();
		}
		var countNumber = 6;
		function countdownHandlr(){
			if (countNumber==0){
				return;
			}
			countNumber--;
			$("#count_down").html(countNumber);
			setTimeout(countdownHandlr,1000);
		}
	</script>
</head>
<body>
	<header>
			<h1>
				<a href='./'>一線影院</a> 
				<sub>登入成功</sub>
			</h1>
	</header>
	<nav>
		<hr>
	</nav>
	<% 
		Customer member = (Customer)session.getAttribute("member");
		String msg = (String)request.getAttribute("msg");
		List<String> errors = (List<String>)request.getAttribute("errors");
	%>
	<article>		
		<h2><%= member==null?"尚未登入":member.getName() %><%=msg==null?"":msg %><%=errors==null?"":errors %></h2>
		<p><span id="count_down">5</span>秒後將自動跳轉<a href='<%=loginRedirectUrl!=null?loginRedirectUrl:"index.jsp"%>'><%=loginRedirectUrl!=null?"上一頁":"首頁"%></a></p>
	</article>
	<footer>
		<hr>
		<div class='copyRightDiv'>一線影院&copy;版權所有 2023-01~</div>
	</footer>
</body>
</html>