<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="uuu.movieline.entity.Customer"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	<title>會員註冊結果</title>
	<link rel="icon" type="image/x-icon" href="source/title_icon.png" />
	<link rel="stylesheet" href="css/vgb.css">
	<meta http-equiv="refresh" content="10; url=./">	
</head>
<body>
	<header>
			<h1>
				<a href='./'>一線影院</a> 
				<sub>註冊結果</sub>
			</h1>
	</header>
	<nav>
		<hr>
	</nav>
	<article>
	<%
	Customer member = (Customer)request.getAttribute("member");
	String msg = (String)request.getAttribute("msg");
	List<String> errors = (List<String>)request.getAttribute("errors");
	%>	
		<h2><%=member == null?"註冊失敗":member.getName() %><%=msg==null?"":msg %><%=errors==null?"":errors %></h2>
		<p>10秒後將自動跳轉<a href='index.html'>首頁</a></p>
	</article>
	<footer>
		<hr>
		<div class='copyRightDiv'>一線影院&copy;版權所有 2023-01~</div>
	</footer>
</body>
</html>