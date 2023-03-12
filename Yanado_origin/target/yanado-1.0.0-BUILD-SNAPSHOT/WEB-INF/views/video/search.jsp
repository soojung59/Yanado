<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/includes/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/search.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>




	<main class="page-content">
		<c:forEach var="board" items="${list }" varStatus="status">
			<div class="card">
				<div class="content">
					<h2 class="title">
						<c:out value="${board.title}" />
					</h2>
					<p class="copy">
						<c:out value="${board.synop}" />
					</p>
					<button class="btn">watch</button>
				</div>
			</div>

		</c:forEach>
	</main>







	<!--페이징 시작  -->


	<div class="pageInfo_wrap">
		<div class="pageInfo_area">
			<ul class="pageInfo" id="pageInfo">
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a
						href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>


				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum==num?"active":"" }"><a
						href="${num}">${num}</a></li>

					<c:if test="${pageMaker.next }">
						<li class="pageInfo_btn next"><a
							href="${pageMaker.endPage+1 }">Next</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	<form id='moveForm' action="/admin/video/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
		<input type='hidden' name='keyword' value='${pageMaker.cri.keyword }'>
	</form>
	</div>


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
			moveForm.attr("action", "/admin/video/list");
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