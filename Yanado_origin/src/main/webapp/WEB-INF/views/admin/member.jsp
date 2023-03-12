<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>

<body>
	<div id="article">
		<h1>Member</h1>
		<table style="border: 1px">
			<hr>
			<thead>
				<tr style="background-color: gray">
					<th><input type="checkbox" /></th>
					<th class="col-md-4 col-xs-4">id</th>
					<th class="col-md-3 col1-xs-3">name</th>
					<th class="col-md-3 col-xs-3">tel</th>
					<th class="col-md-3 col-xs-3">email</th>
					<th class="col-md-3 col-xs-3">joindate</th>
					<th class="col-md-3 col-xs-3">isout</th>
					<th class="col-md-3 col-xs-3">outdate</th>
					<th class="col-md-3 col-xs-3">emailAuthNum</th>
					<th class="col-md-3 col-xs-3">lastLoginDate</th>
					<th class="col-md-3 col-xs-3">phAuthNum</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="result" items="${list }" varStatus="status">
					<tr>
						<td><input type="checkbox" /></td>
						<td><c:out value="${result.id}" /></td>
						<td><c:out value="${result.name}" /></td>
						<td><c:out value="${result.tel}" /></td>
						<td><c:out value="${result.email}" /></td>
						<td><c:out value="${result.joinDate}" /></td>
						<td><c:out value="${result.isOut}" /></td>
						<td><c:out value="${result.outDate}" /></td>
						<td><c:out value="${result.emailAuthNum}" /></td>
						<td><c:out value="${result.lastLoginDate}" /></td>
						<td><c:out value="${result.phAuthNum}" /></td>

					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div class="delBtn" style="position: absolute;">
			<button type="button" class="selectDelete_btn">선택 삭제</button>
		</div>
	</div>
</body>
</html>