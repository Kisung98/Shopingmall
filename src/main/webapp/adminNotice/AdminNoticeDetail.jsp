<%@page import="com.example.demo.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/noticeMake.css">


<style>
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

<%
NoticeVo nVo = (NoticeVo) request.getAttribute("nVo");
%>

</head>

<body>
<%@include file="/include/AdminHeader.jsp"%>


	<br>
	<br>
	<br>
	<h1>공지사항 상세보기</h1>


	<form action="/notice/noticeUpdate">

		<input type="hidden" name="notice_num" value="<%=nVo.getNotice_num()%>">

		<table>

			<tr>
				<th>제목</th>
				<th><p><%=nVo.getNotice_title()%></p></th>
			</tr>

			<tr>
				<th>생성날짜</th>
				<th><p><%=nVo.getNotice_date()%></p></th>
			</tr>

			<tr>
				<th>조회수</th>
				<th><p><%=nVo.getNotice_count()%></p></th>
			</tr>


			<tr>
				<td>내용</td>
				<td>
					<textarea class="form-control" aria-label="With textarea" style="height: 400px;" name="notice_content"><%=nVo.getNotice_content()%></textarea>
				</td>
			</tr>

		</table>
		<hr>
		<div style="margin-left: 1450px;">
			<input type="button" class="btn btn-outline-success" value="글목록" onclick="location.href='/notice/noticeList'">
			<input type="submit" class="btn btn-outline-success" value="글수정">
			<input type="button" class="btn btn-outline-success" value="글삭제" onclick="location.href='/notice/noticeDelete?notice_num=<%=nVo.getNotice_num()%>'">
		</div>
	</form>
</body>

</html>