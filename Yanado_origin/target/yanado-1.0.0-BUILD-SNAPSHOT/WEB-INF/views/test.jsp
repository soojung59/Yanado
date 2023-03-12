<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- <link href="resources/css/videoboard.css" rel="stylesheet" type="text/css"> -->
<link href="/resources/css/header.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Home</title>
</head>

<body>

	<!--사이드 메뉴 시작  -->
	<header class="header" role="banner">
		<h1 class="logo">
			<a href="/">Yanado</a>
		</h1>
		<div class="nav-wrap">
			<nav class="main-nav" role="navigation">
				<ul class="unstyled list-hover-slide">
					<li><a href="/admin/video/stat">통계</a></li>
					<li><a href="/admin/video/list">영화관리</a></li>
					<li><a href="/admin/member">멤버관리</a></li>
					<li><a href="/admin/qna">Q&A</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<!--사이드 메뉴 끝  -->




	<div id="article">
	</div>


</body>
</html>
