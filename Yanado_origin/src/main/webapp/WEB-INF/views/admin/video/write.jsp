<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
<link href="/resources/css/write.css" rel="stylesheet" type="text/css">
<style type="text/css">
.container {
	margin-top: 3em;
	position: static;
	font-size: 18px;
	size: 10px
}

.write {
	border-left: 2px solid #000;
	border-right: 2px solid #000;
	border-bottom: 2px solid #000;
	height: 33px;
	width: 200px;
}

#id, #email {
	background-color: #d6d4d4;
}

.PWCheck1 {
	color: green;
	display: none;
}

.PWCheck2 {
	color: red;
	display: none;
}

#email_btn {
	background-color: #17223b;
	color: white;
}

#email_after {
	background-color: gray;
}

#article {
	position: absolute !important;
}

th {
	text-align: left;
	height: 20px;
}

input, select {
	height: 2em;
}

.reset {
	width: 100px;
	background-color: #bfbfbf;
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

.save {
	width: 100px;
	background-color: #72bb85cf;
	border: none;
	color: #f4f4f4;
	padding: 7px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin-left: 80%;
	cursor: pointer;
}
</style>
</head>
<body>
	<form action="/admin/videoUpload" method="GET">
		<div id="article">
			<H1>video 등록</H1>
			<table>
				<tr>
					<th>제목</th>
					<th><select id="selectTitle">
							<option>제목</option>
							<option value="newTitle">[직접입력]</option>
							<c:forEach var="title" items="${title }">
								<option value="${title.titleSeq}">${title.title}</option>
							</c:forEach>
					</select> <input type="text" id="titleInput" name="titleInput" /> season <select
						name="season" id="season">
							<option>season</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
					</select> episode <select name="episode" id="episode">
							<option>episode</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
					</select></th>
				</tr>
				<tr>
					<th>video</th>
					<th><input type="file" id="link" name="link"></th>
					<th></th>
				</tr>
				<tr>
					<th>teaser</th>
					<th><input type="file" id="teaserLink" name="teaserLink"></th>
				</tr>
				<tr>
					<th>subeng</th>
					<th><input type="file" id="subEng" name="subEng"></th>
				</tr>
				<tr>
					<th>subkor</th>
					<th><input type="file" id="subKor" name="subKor"></th>
				</tr>
				<tr>
					<th>submix</th>
					<th><input type="file" id="subMix" name="subMix"></th>
				</tr>
				<tr>
					<th>태그</th>
					<th><input type="text" id="tagName" name="tagName" size=30
						style="width: 400px"> <select id="selectTag"
						name="selectTag">
							<option>태그</option>
							<c:forEach var="tag" items="${tag }">
								<option value="${tag.tagNameSeq}">${tag.tagName}</option>
							</c:forEach>
					</select>
				</tr>
				<tr>
					<th>synop</th>
					<th><textarea type="text" style="height: 140px; width: 100%"
							id="synop" name="synop"></textarea></th>
				</tr>
				<tr>
					<th>people</th>
					<th><input type="text" id="people" name="people"></th>
				</tr>
				<tr>
					<th>poster</th>
					<th><div class="poster">
							<img id="img" src="" /> <input type="file" id="poster"
								name="poster" />
						</div></th>
				</tr>
				<tr>
				<th><input type="reset" class="reset" value="취소"></th>
				<th><input type="submit" class="save" value="등록"></th>
				</tr>
			</table>
			<input type="hidden" name="titleSeq" id="titleSeq" /> <input
				type="hidden" name="title" id="title" /> <input type="hidden"
				name="tagNameSeq" id="tagNameSeq" />

		</div>
	</form>
	<script type="text/javascript">
		/* 태그 배열 만들기 */
		var tagText = new Array();
		var tagSeq = new Array();
		$("#selectTag").change(function() {
			tagText.push($("#selectTag option:checked").text());
			tagSeq.push($(this).val());
			$("#tagName").val(tagText);
			$("#tagNameSeq").val(tagSeq);
		});

		/* new title Name */
		$("#titleInput").on("change keyup paste", function() {
			var text = $("#titleInput").val();
			$("#title").val(text);
		});

		/* make title */
		$("#selectTitle").change(function() {
			if ($("#selectTitle").val() == "newTitle") {
				var newTitleNo = '<c:out value="${maxUnique}"/>';
				var title = Number(newTitleNo) + 1;

			} else {
				var title = $("#selectTitle").val();
				var text = $("#selectTitle option:checked").text();
			}
			$("#title").val(text);
			$("#titleSeq").val(title);
		})

		/*title 직접입력시 inputbox 보이기*/
		$(function() {
			$("#titleInput").hide();
			$("#selectTitle").change(function() {
				if ($("#selectTitle").val() == "newTitle") {
					$("#titleInput").show();

				} else {
					$("#titleInput").hide();
				}
			})
		});
		/* episode는 01화가 아닌 경우 등록불가 */
		$("#episode").change(function() {
			if ($("#episode").val() == "01") {
				$("#poster").attr("disabled", false);
				$("#teaser").attr("disabled", false);
			} else if ($("#episode").val() != "01") {
				$("#poster").attr("disabled", true);
				$("#teaser").attr("disabled", true);
			}
		});

		/* 포스터 미리보기 */
		$("#poster").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".poster img").attr("src", data.target.result)
									.width(200);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
	</script>
</body>
</html>
