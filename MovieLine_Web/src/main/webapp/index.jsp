<!--<%@ page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<%@page import="uuu.movieline.entity.Customer"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>一線影院 HOME</title>
<link rel="icon" type="image/x-icon" href="source/title_icon.png" />
<link href="css/global.css" type="text/css" rel="stylesheet">
<link href="css/home.css" type="text/css" rel="stylesheet">
<style>
    .slideshow_view{
        position: relative;
        margin: auto;
        height: 600px;
        width: 1300px;
        overflow: hidden;
    }
    
    .slideshow_box{
        position: absolute;
        display: flex;
        width: calc(1300 * 5px);/*1300*5*/
        left: -1300px;
    }
	.prev_btn,.next_btn{
		background-color: rgba(0, 0, 0, 0.5);
		/* opacity: 0.5; */
		color: white;
		position: absolute;
		font-size: 50px;
		font-weight: bolder;
		/* top:calc(50% - 50px); */
		width: 100px;
		height: 100%;
		line-height: 600px;
		text-align: center;
		cursor: pointer;
   		user-select: none;
	}
	.prev_btn:hover,.next_btn:hover{
		background-color: rgba(255,255,255,0.5)
	}
	.prev_btn{
		left: 0;
	}
	.next_btn{
		right: 0;
	}
    .slideshow_img{
        height: 600px;
        width: 1300px;
        display: block;
        object-fit:fill;
        user-select: none;
    }
</style>
<link href="css/global_dark.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<script>
	var darkModeFlag = true;
	$(document).ready(init);
	function init() {
		if (localStorage) {
			restoreData();
			$("#dark_mode_button").click(darkModeHandler);
		} else {
			alert("不支援的瀏覽器!");
			$("#hint").text("不支援的瀏覽器!");
		}
	}
	function restoreData() {
		var getDarkModeFlag = localStorage.getItem("darkModeFlag");
		//記住深色模式
		if (getDarkModeFlag == "true") {
			darkModeFlag = getDarkModeFlag;
			darkModeHandler();
		}else{
			localStorage.setItem("darkModeFlag", true);
			darkModeHandler();
		}
	}

	function darkModeHandler() {
		if (darkModeFlag) {
			$("body").addClass("body--darkmode");
			$("#dark_mode_button").attr("src",
					"source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
		} else {
			$("body").removeClass("body--darkmode");
			$("#dark_mode_button").attr("src",
					"source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
		}
		localStorage.setItem("darkModeFlag", darkModeFlag);
		darkModeFlag = !darkModeFlag;
	}
</script>
<!-- 跑馬燈控制 -->
<script>
	var coordinate = -1300;
    $(document).ready(init2);
	function init2(){
		$("#next_btn").click(nextPicHandlr);
		$("#prev_btn").click(prevPicHandlr);
		myInterval = setTimeout(intervalHandler, 4000);
	}
	function intervalHandler(){
		moveHandlr(1);
	}
	function nextPicHandlr(){
		moveHandlr(1);
	}
	function prevPicHandlr(){
		moveHandlr(-1);
	}
	function moveHandlr(moveDirection){
		clearInterval(myInterval);
		myInterval = setTimeout(intervalHandler, 5000);//set timeer
		console.log(coordinate);
		if(coordinate<=-6500){
			coordinate=(0)
			$("#slideshow_box").stop().animate({"left":(coordinate)+"px"},0);
		}else if(coordinate>=0){
			coordinate=(-6500)
			$("#slideshow_box").stop().animate({"left":(coordinate)+"px"},0);
		}
		coordinate = coordinate-moveDirection*1300
		$("#slideshow_box").stop().animate({"left":(coordinate)+"px"},1000);
		console.log($("#slideshow_box").css("left"));
	}
</script>
</head>

<body>
	<!-- 後端標籤 -->
	<jsp:include page="/subviews/header.jsp" />
	<jsp:include page="/subviews/nav.jsp" />
	<article>
		<div class="slideshow_view">
			<div id="slideshow_box" class="slideshow_box">
				<a href="product_detail.jsp?movieId=5" draggable="false">
					<img class="slideshow_img" alt="slideshow"
					src="./source/titanic_slide.jpg" draggable="false">
				</a>
				<a href="product_detail.jsp?movieId=1" draggable="false">
					<img class="slideshow_img" alt="slideshow"
					src="./source/AntMan_slide.jpg" draggable="false">
				</a>
				<a href="product_detail.jsp?movieId=2" draggable="false">
					<img class="slideshow_img" alt="slideshow"
					src="./source/slam_dunk_slide.jpg" draggable="false">
				</a>
				<a href="product_detail.jsp?movieId=3" draggable="false">
					<img class="slideshow_img" alt="slideshow"
					src="./source/Avatar_slide.jpg" draggable="false">
				</a>
				<a href="product_detail.jsp?movieId=4" draggable="false">
					<img class="slideshow_img" alt="slideshow"
					src="./source/otto_slide.jpg" draggable="false">
				</a>
				<a href="product_detail.jsp?movieId=5" draggable="false">
					<img class="slideshow_img" alt="slideshow"
					src="./source/titanic_slide.jpg" draggable="false"></a>
				<a href="product_detail.jsp?movieId=1" draggable="false">
					<img class="slideshow_img" alt="slideshow"
					src="./source/AntMan_slide.jpg" draggable="false">
				</a>
			</div>
			<div id="prev_btn" class="prev_btn">&lt;</div>
			<div id="next_btn" class="next_btn">&gt;</div>
		</div>
	</article>
	<%@ include file="/subviews/footer.jsp"%>
</body>

</html>