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
	}
}

function darkModeHandler() {
	if (darkModeFlag) {
		$("body").addClass("body--darkmode");
		$("#dark_mode_button").attr("src",
				"<%=request.getContextPath()%>/source/light_mode_FILL0_wght400_GRAD0_opsz48.svg");
	} else {
		$("body").removeClass("body--darkmode");
		$("#dark_mode_button").attr("src",
				"<%=request.getContextPath()%>/source/dark_mode_FILL0_wght400_GRAD0_opsz48.svg");
	}
	localStorage.setItem("darkModeFlag", darkModeFlag);
	darkModeFlag = !darkModeFlag;
}