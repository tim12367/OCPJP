<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="uuu.movieline.entity.Customer"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	<title>會員登入成功</title>
	<link rel="stylesheet" href="css/vgb.css">
	<meta http-equiv="refresh" content="5; url=./">
	<script src = "./jquery.js"></script>
	<script>
		$(document).ready(init);
		function init() {
			setInterval(countdownHandlr,1000);
		}
		var countNumber = 6;
		function countdownHandlr(){
			countNumber--;
			$("#count_down").html(countNumber);
			
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
		Customer member = (Customer)request.getAttribute("member");
	%>
	<article>		
		<h2><%= member==null?"尚未登入":member.getName() %> 登入成功</h2>
		<p><span id="count_down">5</span>秒後將自動跳轉<a href='index.html'>首頁</a></p>
	</article>
	<footer>
		<hr>
		<div class='copyRightDiv'>一線影院&copy;版權所有 2023-01~</div>
	</footer>
</body>
</html>