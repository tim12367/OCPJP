<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<%@page import="uuu.movieline.entity.Customer"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>會員登入成功</title>
	<link rel="icon" type="image/x-icon" href="source/title_icon.png" />
	<meta http-equiv="refresh" content="5; url=./">
	<script src = "./jquery.js"></script>
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
	%>
	<article>		
		<h2><%= member==null?"尚未登入":member.getName() %><%=msg==null?"":msg %></h2>
		<p><span id="count_down">5</span>秒後將自動跳轉<a href='index.jsp'>首頁</a></p>
	</article>
	<footer>
		<hr>
		<div class='copyRightDiv'>一線影院&copy;版權所有 2023-01~</div>
	</footer>
</body>
</html>