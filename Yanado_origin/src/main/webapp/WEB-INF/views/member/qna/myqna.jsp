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
	<h1>My Q&A</h1>
			<c:forEach var="qna" items="${myQna }">
				<details>
					<summary>
						<c:out value="${qna.title }" />
					</summary>
					<div>
						<c:out value="${qna.cont }" />
					</div>
				</details>
			</c:forEach>
	</div>

</body>
<script>
</script>


</body>
</html>
