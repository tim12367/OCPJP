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
		<% int a = 1;//_jspService方法中的 local variable 
			out.println(this.getClass().getName());
		%>
		<%! int b = 1;//member variable 類別中方法外不可宣告建構式 因為編譯前不知道類別名稱
			private String welcomeStr = "Hi";
			public void jspInit(){
				String welcomeString = this.getInitParameter("welcomeString");
				if(welcomeString!=null){
					this.welcomeStr = welcomeString;
				}
			}
		%>
		<header>
			<h1>Hello<sub>JSP練習,<%=welcomeStr%></sub></h1>
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