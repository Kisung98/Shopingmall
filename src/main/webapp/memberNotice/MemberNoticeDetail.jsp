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
	margin: 10px 50px; 
	width: calc(100% - 500px); 
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	border-radius: 15px; 
	overflow: hidden;
	font-size: 18px; 
	font: bold;
}

th, td {
	padding: 12px;
	text-align: center;
	color: #333;
	border-bottom: 2px solid #ddd;
}


tr:hover {
	background-color: #ffeb3b;
}

p{
	text-align: left;
}

.content {
	margin-left: 250px;
	padding: 10px 10px;
	padding: auto;
	display: inline-block; 
	color: #000000;
	border-radius: 30px; 
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	margin-bottom: 20px;
	text-align: center;
}

textarea {
	height: 200px;
}

input {
	border-radius: 5px;
}

.rounded-button {
	background-color: #e3dac9;
	color: #000000;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	font-size: 18px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.rounded-button:hover {
	background-color: #edd09b;
}

h3{
	font-weight: bold;
}

.label-cell {
  border-right: 2px solid #ddd; 
  padding: 12px;
  text-align: center;
  font-weight: bold;
  background-color: #f7f7f7;
  color: #333;
}

.value-cell {
  padding: 12px;
  font-weight: bold;
  background-color: #f7f7f7;
  color: #333;
}

</style>

<%
NoticeVo nVo = (NoticeVo) request.getAttribute("nVo");
%>

</head>

<body>
	<nav style="margin-bottom: 50px;">
		<%@include file="/include/header.jsp"%>
	</nav>

	<div class="content">
		<h2>공지사항 상세</h2>
	</div>
	<br>

	<input type="hidden" name="notice_num" value="<%=nVo.getNotice_num()%>">

	<table>
		<tr>
			<th class="label-cell">제목</th>
			<th class="value-cell"><p><%=nVo.getNotice_title()%></p></th>
		</tr>

		<tr>
			<th class="label-cell">생성날짜</th>
			<th class="value-cell"><p><%=nVo.getNotice_date()%></p></th>
		</tr>

		<tr>
			<th class="label-cell">조회수</th>
			<th class="value-cell"><p><%=nVo.getNotice_count()%></p></th>
		</tr>

		<tr>
			<td class="label-cell">내용</td>
			<td class="value-cell">
				<textarea class="form-control" aria-label="With textarea" readonly="readonly" style="width: 600px; height: 400px;" name="notice_content"><%=nVo.getNotice_content()%></textarea>
			</td>
		</tr>
	</table>
	<hr>
	<div style="margin-left: 1550px;">
		<input type="button" class="rounded-button" value="글목록" onclick="location.href='/notice/membernoticeList'">
		<br>
		<br>
		<br>
	</div>
</body>
</html>