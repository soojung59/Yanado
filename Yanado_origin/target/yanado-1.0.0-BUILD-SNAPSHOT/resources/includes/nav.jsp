<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- <link href="resources/css/videoboard.css" rel="stylesheet" type="text/css"> -->
<link href="/resources/css/header.css?ver=1" rel="stylesheet"
	type="text/css">
<link href="/resources/css/nav.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Home</title>
</head>
<body>
	<!--네비게이션바 시작 -->
	<ul class="tablist">
		<li><a href="/" class="tab selected">yanado</a></li>
		<li><a href="#" class="tab">
				<div class="search_wrap">
					<div class="search_area">
						<input type="text" name="keyword"
							value="${pageMaker.cri.keyword }"
							placeholder="What you looking for?">
						<button>Search</button>
					</div>
				</div></li>
		<c:if test="${member == null }">
			<li><a href="/login" class="tab">login</a></li>
		</c:if>
		<c:if test="${member.isOut == 0 }">
			<li><a href="/logout.do" class="tab">logout</a></li>
			<li><a href="/member/mypage" class="tab">mypage</a></li>
		</c:if>
		<c:if test="${member.isOut == 2 }">
			<li><a href="/logout.do" class="tab">logout</a></li>
			<li><a href="/admin/video/list" class="tab">admin</a></li>
		</c:if>
	</ul>
	<!-- 네비게이션바 끝 -->

	<form id='moveForm' action="/video/search" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
		<input type='hidden' name='keyword' value='${pageMaker.cri.keyword }'>
	</form>


	<script type="text/javascript">
		let moveForm = $("#moveForm");

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefaul();

							moveForm
									.append("<input type = 'hidden' name = 'uniqueNo' value '"
											+ $(this).attr("href") + "'>'");
							moveForm.attr("action", "/admin/video/read");
							moveForm.submit();
						});

		$(".pageInfo a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/video/search");
			moveForm.submit();

		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let val = $("input[name='keyword']").val();
			moveForm.find("input[name='keyword']").val(val);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>
</body>
</html>
