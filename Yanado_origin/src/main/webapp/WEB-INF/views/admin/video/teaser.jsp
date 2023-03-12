<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="article">
	<h1>Teaser</h1>
		<table style="border: 1px">
			<hr>
			<thead>
				<tr>
					<th><input type="checkbox" /></th>
					<th></th>
					<th class="col-md-3 col1-xs-3">titleSeq</th>
					<th class="col-md-3 col-xs-3">teaserLink</th>
					<th class="col-md-3 col-xs-3">uploadDate</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="teaser" items="${teaser }" varStatus="status">
					<tr>
						<td><input type="checkbox" /></td>
						<td>${status.count}</td>
						<td><c:out value="${teaser.titleSeq}" /></td>
						<td><c:out value="${teaser.teaserLink}" /></td>
						<td><c:out value="${teaser.uploadDate}" /></td>

					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</body>
</html>