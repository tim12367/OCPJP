<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		table{
			font-family: 'Oswald', sans-serif;
			border-collapse:collapse;
		}
		th{
			background-color:#009879;
			color:#ffffff;
			width:25vw;
			height:75px;
		}
		td{
		    background-color:#ffffff;
		    width:25vw;
		    height:50px;
		    text-align:center;
		}
		tr{
		    border-bottom: 1px solid #dddddd;
		}
		tr:nth-child(2n+1) {
			background-color: #f3f3f3;
			
		}
	</style>
	</head>
	<body>
		<header>
			<h1>Hello<sub>JSP練習</sub></h1>
		</header>
		<article>
			<table>
				<tr>
					<th colspan="9">
						九九乘法表
					</th>
				</tr>
				<% 
				for(int x = 1;x<10;x++){%>
				<tr><% 
					for(int y = 1; y<10;y++){
					%>
					<td>
							<%=x%> * <%=y%> = <%=x*y%>
					</td><% 
					}%>
				</tr><% 
				}%>
			</table>
		
		</article>
	</body>
</html>