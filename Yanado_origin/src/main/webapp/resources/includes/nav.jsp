<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<html>
<head>
<link href="/resources/css/header.css" rel="stylesheet" type="text/css">
<link href="/resources/css/nav.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Home</title>
<style type="text/css">

.tablist {
	font-weight: normal !important;
}

</style>
</head>
<body>
	<!--네비게이션바 시작 -->
	<ul class="tablist">
		<li><a href="/" class="tab selected">yanado</a></li>
		<li><a href="#" class="tab">
				<!-- <form  role="search" id="search">
					<label for="search">Search for stuff</label> <input id="search"
						type="search" placeholder="Search..." name="navKeyword" autofocus required />
					<button d="navSearch" onclick="navSearch">Go</button>
				</form> -->
				
				
			<form id="search">
					<div class="search">
						<div class="search_area">
							<input type="text" name="navKeyword"
								placeholder="What you looking for?">
							<button id="navSearch" onclick="navSearch">Search</button>
						</div>
				</form> 
				</div></li>
		<c:if test="${member == null }">
			<li><a href="/login" class="tab">login</a></li>
		</c:if>
		<c:if test="${member.isOut == 1 }">
			<li><a href="/login" class="tab">login</a></li>
		</c:if>
		<c:if test="${member.isOut == 0 }">
			<li><a href="/logout.do" class="tab">logout</a></li>
			<li><a type="button" href="/member/mypage" id="mypage"
				class="tab">mypage</a></li>
		</c:if>
		<c:if test="${member.isOut == 2 }">
			<li><a href="/logout.do" class="tab">logout</a></li>
			<li><a href="/admin/video/list" class="tab">admin</a></li>
		</c:if>

	</ul>
	<!-- 네비게이션바 끝 -->
	<script type="text/javascript">
		$("#navSearch").click(function() {
			$("#search").attr("action", "/video/search");
			$("#search").submit();

		});
	</script>
</body>
</html>
