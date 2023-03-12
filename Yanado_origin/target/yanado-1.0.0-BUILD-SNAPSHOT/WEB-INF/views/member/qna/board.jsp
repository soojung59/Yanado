<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/includes/nav.jsp"%>
<%@ include file="/resources/includes/sidebarMem.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/bookmark.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="article"></div>
</body>
<script>
	var acc = document.getElementsByClassName("accordion"); //아코디언클래스리스트를 가져온다. 
	var i;
	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() { //클릭이벤트를 추가한다. 
			this.classList.toggle("active"); //클래스를 추가하거나 삭제함. 
			var panel = this.nextElementSibling; //현재 아코디언의 다음노트를 가져온다. panel이 옴 
			if (panel.style.display === "block") { //출력모드가 블럭인지 none인지 체크한다. 
				panel.style.display = "none";
			} else {
				panel.style.display = "block";
			}
		});
	}
</script>


</body>
</html>
