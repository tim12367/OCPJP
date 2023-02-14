<%@page import="java.util.Random"%>
<%@ page pageEncoding="UTF-8" buffer="8kb" autoFlush="true" %>
<%@page import="java.util.Date"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
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
			<%Random r = new Random(); %>
			<%out.flush(); %>
				<h2>request<sup>***</sup></h2>
				<p>method type(<span>request.getMethod()</span>) : <%=request.getMethod() %></p>
				<p>URL(<span>request.getRequestURL()</span>) :<%=request.getRequestURL() %></p>
				<p>URL(<span>request.getRequestURI()</span>) :<%=request.getRequestURI() %></p>
				<p><span>通訊協定</span> :<%=request.getProtocol() %></p>
				<p><span>HostName(電腦名稱)</span> :<%=request.getLocalName() %></p>
				<p><span>PortName(埠號)</span> :<%=request.getLocalPort() %></p>
				<p><span>本機IP</span> :<%=request.getLocalAddr() %></p>
				<p><span>QueryString</span> :<%=request.getQueryString() %></p>
				<%out.flush(); 
// 				Thread.sleep(300 + r.nextInt(7500));
				%>
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
				<p>session 建立時間(<span>session.getCreationTime()</span>)<br><%=session.getCreationTime()%> -> 日期時間 <%=new Date(session.getCreationTime()) %><br></p>
				<p>session 建立時間(<span>session.getLastAccessedTime()</span>)<br><%=session.getLastAccessedTime()%> -> 日期時間 <%=new Date(session.getLastAccessedTime()) %><br></p>
				<p>session 是否為新連線(<span>session.isNew()</span>)<br><%=session.isNew()%><br></p>
				<p>session 連線逾時上限(<span>session.getMaxInactiveInterval()</span>)<br><%=session.getMaxInactiveInterval()%>秒<br></p>
				<%session.setMaxInactiveInterval(10); %>
				<p>session 連線逾時上限(<span>session.getMaxInactiveInterval()</span>)<br><%=session.getMaxInactiveInterval()%>秒<br></p>
			</div>
			<div>
				<hr>
				<h2>out<sup>*</sup>,response</h2>
				<!-- 存到多少才送出封包buffer="8kb"-->
				<!-- 滿了自動送出封包 autoFlush="true"-->
				<p>out的資料站存區(<span>out.getBufferSize()</span>)<%=out.getBufferSize()%><br></p>
				<p>response的第三部分的暫存區大小(<span>response.getBufferSize()</span>)<%=response.getBufferSize()%><br></p>
			</div>
			<div>
				<hr>
				<h2>application(this.getServletContext)<sup>*</sup></h2>
				<p>application的:(<span>application.getRealPath("/")</span>)<br><%=application.getRealPath("/")%><br></p>
			</div>
		<article>
		</article>
	</body>
</html>