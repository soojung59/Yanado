<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- <link href="resources/css/videoboard.css" rel="stylesheet" type="text/css"> -->
<link href="/resources/css/sidebar.css?ver=1" rel="stylesheet"
	type="text/css">
<link href="/resources/css/nav.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Home</title>
</head>
<body>

	<!--사이드 메뉴 시작  -->
	<div id="wrap" class="wrap">
		<header class="header" role="banner">
			<div class="nav-wrap">
				<nav class="main-nav" role="navigation">
					<ul class="unstyled list-hover-slide">
						<li><a href="/admin/video/stat">통계</a></li>
						<div class="btn2">
							<li><a href="/admin/video/list" id="btn2">영화관리</a></li>
							<div class="divBox">
								<a href="/admin/video/list" style="font-size: 15px">- 영화관리</a> <a
									href="/admin/video/write" style="font-size: 15px">- 영화등록</a> <a
									href="/admin/video/teaser" style="font-size: 15px">- 예고편</a>
							</div>
						</div>
						<li><a href="/admin/member">멤버관리</a></li>
						<li><a href="/admin/qna">Q&A</a></li>
					</ul>
				</nav>
			</div>
			<!--사이드 메뉴 끝  -->
		</header>
	</div>
	

	<script type="text/javascript">
		$(".btn2").on("click", function(e) {
			$(".divBox").slideDown();
		});

	</script>
</body>
</html>
