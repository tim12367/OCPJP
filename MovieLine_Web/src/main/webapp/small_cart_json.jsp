<%@ page pageEncoding="UTF-8"%>
{	
	<%if(session.getAttribute("cart")!=null){ %>
	"cartItems":[
		{"movieName":"蜘蛛人",
		"date":"1999-09-09",
		"time":"19:00",
		"seat":"G07,H07,I07",
		"qty":"3"}
				]
	,"totalQty":${sessionScope.cart.getTotalQuantity}
	<%}%>
}