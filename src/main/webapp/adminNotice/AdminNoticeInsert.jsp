<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
@charset "UTF-8";

table {
	width: 100%;
	border-collapse: collapse;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px;
	text-align: left;
	background-color: #f7f7f7;
	color: #333;
}

th {
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ffeb3b;
}

textarea {
	height: 200px;
}

input {
	border-radius: 5px;
}
</style>

</head>

<body>
<%@include file="/include/AdminHeader.jsp"%>

	<br>
	<br>
	<br>
	<h1>공지사항 글쓰기</h1>

	<form action="/notice/noticeInsert">

		<table>
			<tr>
				<th>제목</th>
				<th><input type="text" style="width: 300px; height: 30px;" name="notice_title"></th>
			</tr>

			<tr>
				<th>내용</th>
				<th><textarea class="form-control" aria-label="With textarea" style="height: 400px;" name="notice_content"></textarea></th>
			</tr>

		</table>
		<hr>
		<input type="submit" class="btn btn-outline-success" value="글등록" style="margin-left: 1600px;">
	</form>

</body>

</html>