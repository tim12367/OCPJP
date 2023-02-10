<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>JSP隱含變數</title>
	<link type="text/css" rel="stylesheet" href="../css/global.css">
	<style>
		div>h2>sup{color: red;}
		div>p>span {color: blue;font-weight: bold;}
	</style>
	</head>
	<body>
		<header>
			<h1>For Test<sub>JSP Implicit Variable示範</sub></h1>
			<hr>
		</header>
			<div>
				<h2>request<sup>***</sup></h2>
				<p>method type(<span>request.getMethod()</span>) : <%=request.getMethod() %></p>
				<p>URL(<span>request.getRequestURL()</span>) :<%=request.getRequestURL() %></p>
				<p>URL(<span>request.getRequestURI()</span>) :<%=request.getRequestURI() %></p>
				<p><span>通訊協定</span> :<%=request.getProtocol() %></p>
				<p><span>HostName(電腦名稱)</span> :<%=request.getLocalName() %></p>
				<p><span>PortName(埠號)</span> :<%=request.getLocalPort() %></p>
				<p><span>本機IP</span> :<%=request.getLocalAddr() %></p>
				<p><span>QueryString</span> :<%=request.getQueryString() %></p>
				
				<h2>request headers</h2>
				<p>Header(<span>request.getHeader("accept-language")</span>):<%=request.getHeader("accept-language")%></p>
				<p>Header(<span>request.getHeader("user-agent")</span>) :<%=request.getHeader("user-agent")%></p>
				
				<h2>form data</h2>
				<!-- 編碼? -->
<!-- 				http://10.0.1.15:8080/ML/mod12/implicit_variable.jsp?test1=%E6%B8%AC%E8%A9%A61&test2=%E6%B8%AC%E8%A9%A62 -->
<!-- 請求會用本機編碼 不加下面會亂碼 -->
				<%request.setCharacterEncoding("UTF-8"); %>
				<!-- 網址列QueryString一組資料form一組 -->
				<form method="POST">
					<input name="test1" placeholder="test1資料" value="<%=request.getParameter("test1") %>"><br>
					<input name="test2" placeholder="test2資料" value="<%=request.getParameter("test2") %>"><br>
					<input type="submit" value="OK"><br>
				</form>
			</div>
			<div>
				<hr>
				<h2>session<sup>**</sup></h2>
				<!-- 若開同一個瀏覽器則同一個連線 隱私視窗也是一個 -->
				<p>session id(<span>session.getId()</span>)<%=session.getId() %></p>
			</div>
		<article>
		</article>
	</body>
</html>