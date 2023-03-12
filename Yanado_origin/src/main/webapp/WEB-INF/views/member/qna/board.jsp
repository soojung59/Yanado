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
<link href="/resources/css/qna.css" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id=article>
		<h1>Q&A</h1>
		<!--검색창  -->
		<div class="qnaSearch_wrap">
			<div class="qnaSearch_area">
				<input type="text" name="keyword" value="${pageMaker.cri.keyword }"
					placeholder="What you looking for?">
				<button>Search</button>
			</div>
		</div>
		<!--검색 끝 -->
			<c:forEach var="qna" items="${qnaList }">
				<details>
					<summary>
						<c:out value="${qna.title }" />
						<c:if test="${qna.isReply == 'y'}"><input type="button" readonly value="답변완료"></c:if>
					</summary>
					<div>
						<c:out value="${qna.cont }" />
						<c:if test="${qna.isReply == 'y'}">>
						<hr>
						<c:out value="${qna.reply }" />
						</c:if>
					</div>
				</details>
			</c:forEach>


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
		<form id='qnaBoard' action="/member/qna/board" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
			<input type='hidden' name='keyword' value='${pageMaker.cri.keyword }'>
		</form>
	</div>

	<script type="text/javascript">
		let qnaBoard = $("#qnaBoard");

		$(".pageInfo a").on("click", function(e) {

			e.preventDefault();
			qnaBoard.find("input[name='pageNum']").val($(this).attr("href"));
			qnaBoard.attr("action", "/member/qna/board");
			qnaBoard.submit();

		});

		$(".qnaSearch_area button").on("click", function(e) {
			e.preventDefault();
			let val = $("input[name='keyword']").val();
			qnaBoard.find("input[name='keyword']").val(val);
			qnaBoard.find("input[name='pageNum']").val(1);
			qnaBoard.submit();
		});
	</script>
</body>
</html>
