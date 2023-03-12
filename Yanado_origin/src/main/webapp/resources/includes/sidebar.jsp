<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/includes/nav.jsp"%>
<html>
<head>
<!-- <link href="resources/css/videoboard.css" rel="stylesheet" type="text/css"> -->
<link href="/resources/css/sidebar.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Home</title>
</head>
<body>

	<nav class="main-menu">
		<ul>
			<li><a href="/admin/video/stat"> <i class="fa fa-bar-chart-o fa-2x"></i> <span
					class="nav-text"> 통계 </span>
			</a></li>
			<li class="has-subnav" onclick="dis()"><a href="#"> <i
					class="fa fa-laptop fa-2x"></i> <span class="nav-text" > 영화관리
				</span>
			</a></li>
				<div id="submenu">
				<li class="has-subnav"><a href="/admin/video/list"> <i class="slidedown">
					</i> <span class="nav-text"> - 영화 게시판 </span>
				</a></li>
				<li class="has-subnav"><a href="/admin/video/write"> <i
						class="slidedown"> </i> <span class="nav-text"> - 영화등록 </span>
				</a></li>
				<li class="has-subnav"><a href="/admin/video/teaser"> <i
						class="slidedown"></i> <span class="nav-text"> - 예고편 </span>
				</a></li>
			</div>
				<li class="has-subnav"><a href="/admin/member"> <i
						class="fa fa-table fa-2x"></i> <span class="nav-text"> 멤버관리
					</span>
				</a></li>
				<li class="has-subnav"><a href="/admin/qna""> <i
						class="fa fa-font fa-2x"></i> <span class="nav-text"> Q&A </span>
				</a></li>
		</ul>

	</nav>


	<script type="text/javascript">

    function dis(){
        if($('#submenu').css('display') == 'none'){
        $('#submenu').show();
    }else{
        $('#submenu').hide();
    }
    }
</script>























	<!--사이드 메뉴 시작  -->
	<!-- <div id="wrap" class="wrap">
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
			사이드 메뉴 끝 
		</header>
	</div>
	 -->


</body>
</html>
