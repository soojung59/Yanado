<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<html>
<head>
<link href="/resources/css/videoBoard.css" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Home</title>
<style type="text/css">
#article{
width: 70%;
}
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
    color:white;
  }
  th, td {
    border-bottom: 1px solid white;
    padding: 10px;
    text-align: center;
  }
  .button {
    width: 100px;
    background-color: #72bb85cf;
    border: none;
    color: #f4f4f4;
    padding: 7px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
  .selectDelete , .searchBtn {
        width: 50px;
    background-color: #d9d9d9;
    border: none;
    color: #444444;
    padding: 7px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    position: absolute;
}
.searchvideo{
margin-left: 30%;
}
.pageInfo{
margin: 10px 0 0 400px;
}
</style>
</head>
<body>
	<div id="article">
		<h1>Video</h1>
		<div id="outter">
			<div style="float: right;">
				<button onclick='addboard()' class="button">글작성</button>
			</div>





			<table>
				<thead>
					<tr style="background-color: gray">
						<div class="allCheck">
							<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
						</div>
						<th></th>
						<th>고유번호</th>
						<th>제목</th>
						<th class="col-md-3 col-xs-3">작성일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${list }" varStatus="status">
							<tr>

								<div class="checkBox" name="checkBox">
									<td><input type="checkbox" name="checkVideo"
										class="checkVideo" value="${board.uniqueNo }" /></td>
								</div>

								<td>${status.count}</td>
								<td><c:out value="${board.uniqueNo}" /></td>
								<td><a class="move"
									href='/admin/video/read?uniqueNo=<c:out value="${board.uniqueNo}"/>'>
										<c:out value="${board.title}" />
								</a></td>
								<td><c:out value="${board.uploadDate}" /></td>
							</tr>
						</c:forEach>
				</tbody>
			</table>





		<!--선택 삭제-->
		<div class="delBtn">
			<input type="button" class="selectDelete" value="삭제">
		</div>



			<!--검색창  -->
			<div class="searchvideo" >
					<input type="text" name="keyword" value="${pageMaker.cri.keyword }" style=" height: 30px;
    margin-top: 4px;">
					<button class="searchBtn" style="width: 70px">Search</button>
			</div>
			<!--검색 끝 -->


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
		<form id='actionForm' action="/admin/video/list" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
			<input type='hidden' name='keyword' value='${pageMaker.cri.keyword }'>
			<input type="hidden" name='uniqueNo' id='uniqueNo'>
		</form>
	</div>

	<script type="text/javascript">
		let actionForm = $("#actionForm");

		/* checkbox select all */
		$('input[name=allCheck]').on('change', function() {
			$('input[name=checkVideo]').prop('checked', this.checked);
		});

		/* delete check video */
		$(document).ready(function() {
			var chkArray = new Array(); // 배열 선언
			var obj = $("[name=checkVideo]");
			$('input[type=checkbox][name=checkVideo]').change(function() {
				if ($(this).is(':checked')) {
					chkArray.push(this.value);
					$('#uniqueNo').val(chkArray);
				} else {
					chkArray.pop(this.value);
				}
			});
		});

		$(".selectDelete").on("click", function(e) {
			e.preventDefault();
			actionForm.attr("action", "/admin/video/delete.do");
			actionForm.submit();
		});

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefaul();
							actionForm
									.append("<input type = 'hidden' name = 'uniqueNo' value= '"
											$(this).attr("href")
											+ "'>");
							actionForm.attr("action", "/admin/video/read");
							actionForm.submit();
						});

		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.attr("action", "/admin/video/list");
			actionForm.submit();

		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let val = $("input[name='keyword']").val();
			actionForm.find("input[name='keyword']").val(val);
			actionForm.find("input[name='pageNum']").val(1);
			actionForm.submit();
		});
	</script>
</body>
</html>
