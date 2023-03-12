<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<html>
<head>
<link href="/resources/css/header.css?ver=1" rel="stylesheet"
	type="text/css">
<link href="/resources/css/nav.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Home</title>
<style type="text/css">
.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 10px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
}
</style>
</head>
<body>

	<div id="article">
		<h1>Video</h1>
		<div id="outter">
			<div style="float: right;">
				<button onclick='addboard()'>글작성</button>
			</div>




			<!--검색창  -->
			<div class="search_wrap">
				<div class="search_area">
					<input type="text" name="keyword" value="${pageMaker.cri.keyword }"
						placeholder="What you looking for?">
					<button>Search</button>
				</div>
			</div>
			<!--검색 끝 -->






			<!--테이블 시작  -->
			<table class="table table-hover table-bordered results">
				<thead>
					<tr>
						<div class="allCheck">
							<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
						</div>
						<th>고유번호</th>
						<th>제목</th>
						<th class="col-md-4 col-xs-4">서버주소</th>
						<th class="col-md-3 col-xs-3">출연진</th>
						<th class="col-md-3 col1-xs-3">줄거리</th>
						<th class="col-md-3 col-xs-3">영문자막</th>
						<th class="col-md-3 col-xs-3">한글자막</th>
						<th class="col-md-3 col-xs-3">한영자막</th>
						<th class="col-md-3 col-xs-3">작성일자</th>
					</tr>
				</thead>
				<hr>
				<tbody>
					<div>
						<c:forEach var="board" items="${list }" varStatus="status">
							<tr>
								<div class="checkBox">
									<td><input type="checkbox" name="chBox" class="chBox"
										data-uniqueNo="${board.uniqueNo }" /></td>
								</div>
								<td><c:out value="${board.uniqueNo}" /></td>
								<td><a class="move"
									href='/admin/video/read?uniqueNo=<c:out value="${board.uniqueNo}"/>'>
										<c:out value="${board.title}" />
								</a></td>
								<td><c:out value="${board.link}" /></td>
								<td><c:out value="${board.people}" /></td>
								<td><c:out value="${board.synop}" /></td>
								<td><c:out value="${board.subEng}" /></td>
								<td><c:out value="${board.subKor}" /></td>
								<td><c:out value="${board.subMix}" /></td>
								<td><c:out value="${board.uploadDate}" /></td>
							</tr>
						</c:forEach>
					</div>
				</tbody>
			</table>
			<!--테이블 끝  -->



			<!--선택 삭제-->
			<div class="delBtn">
				<button type="button" class="selectDelete_btn"
					data-uniqueNo="${result.uniqueNo }">선택 삭제</button>
			</div>




			<div class="pageInfo_wrap">
				<div class="pageInfo_area">
					<ul class="pageInfo" id="pageInfo">

						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                	    <li class="pageInfo_btn"><a href="${num}">${num}</a></li>
                		</c:forEach>
 
	


					</ul>
				</div>
			</div>
			<form id='moveForm'  method='get'>
				  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        		  <input type="hidden" name="amount" value="${pageMaker.cri.amount }">  
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
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
										.append("<input type = 'hidden' name = 'uniqueNo' value= '"
												+ $(this).attr("href") + "'>");
								moveForm.attr("action", "/admin/video/read");
								moveForm.submit();
							});

			  $(".pageInfo a").on("click", function(e){
				  
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
