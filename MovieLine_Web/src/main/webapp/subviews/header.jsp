<%@ page pageEncoding="UTF-8"%>
<!-- header.jsp start -->
	<header id="menu" class="menu">
		<img class="menu_logo_img" src="source/movie_FILL0_wght400_GRAD0_opsz48.svg" alt="Movie_Line_Logo" draggable="false">
		<form id="search_form" action="<%=request.getContextPath()%>/products_list.jsp" method="get" class='menu_search_form'>
			<input type='search' name="search" class="menu_search_input menu_search_form_items" placeholder='請輸入查詢關鍵字'>
			<input type='submit' class="menu_search_form_button menu_search_form_items" value='搜尋'>			
		</form>
		<img id=dark_mode_button class="menu_dark_mode_button"
			src="source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg"
			alt="dark_mode_button" draggable="false">
	</header>
<!-- header.jsp end -->