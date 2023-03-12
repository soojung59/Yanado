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
						<li><a href="/member/mypage">시청기록</a></li>
						<li><a href="/member/bookmark">북마크</a></li>
						<div class="btn2">
							<li><a href="/member/qna/board" id="btn2">qna</a></li>
							<div class="divBox">
								<a href="/member/qna/board" style="font-size: 15px">- 전체보기</a> <a
									href="/member/qna/write" style="font-size: 15px">- 질문등록</a> <a
									href="/member/qna/myqna" style="font-size: 15px">- 내 질문</a>
							</div>
						</div>
						<li><a href="/member/modify">개인정보</a></li>
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
