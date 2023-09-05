<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/noticeMake.css">

<%
Map<String, Object> qMap = (Map<String, Object>) request.getAttribute("qMap");
%>

<style>
table {
	margin: 10px 50px;
	width: calc(100% - 500px);
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	border-radius: 15px;
	overflow: hidden;
	box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
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

p {
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

h3 {
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



</head>

<body>
	<%@include file="/include/header.jsp"%>

	<br>
	<br>
	<div class="content">
		<h1>QnA 상세</h1>
	</div>


	<table>
		<tr>
			<td class="label-cell">제목</td>
			<td class="value-cell">
				<p><%=qMap.get("QNA_TITLE")%></p>
			</td>
		</tr>
		<tr>
			<td class="label-cell">작성자</td>
			<td class="value-cell">
				<p><%=qMap.get("MEMBER_ID")%></p>
			</td>
		</tr>
		<tr>
			<td class="label-cell">게시 날짜</td>
			<td class="value-cell">
				<p><%=qMap.get("QNA_DATE")%></p>
			</td>
		</tr>
		<tr>
			<td class="label-cell">
				<h3>Q</h3>
			</td>
			<td class="value-cell">
				<textarea readonly="readonly" class="form-control" aria-label="With textarea" style="width: 500px; height: 300px;"><%=qMap.get("QNA_CONTENT")%></textarea>
			</td>
		</tr>
		<tr>
			<td class="label-cell">
				<h3>A</h3>
			</td>
			<td class="value-cell">
				<%
				if (qMap.get("REPLY_CONTENT") != null)
				{
				%>
				<textarea class="form-control" readonly="readonly" name="reply_content" aria-label="With textarea" style="width: 500px; height: 300px;"><%=qMap.get("REPLY_CONTENT")%></textarea>
				<%
				} else
				{
				%>
				<textarea class="form-control" readonly="readonly" name="reply_content" aria-label="With textarea" style="width: 500px; height: 300px;"></textarea>
				<%
				}
				%>

			</td>
		</tr>
	</table>
	<hr>
	<div style="margin-left: 1550px;">


		<%
		if (member.get("MEMBER_ID").equals(qMap.get("MEMBER_ID")))
		{
		%>
		<input type="button" class="btn btn-outline-success" value="글삭제" onclick="location.href='/qna/memberqnaDelete?qna_num=<%=qMap.get("QNA_NUM")%>'">
		<input type="button" class="btn btn-outline-success" value="글목록" onclick="location.href='/qna/memberqnaList'">
		<%
		} else
		{
		%>
		<input type="button" class="rounded-button" value="글목록" onclick="location.href='/qna/memberqnaList'">
		<%
		}
		%>
		<br> <br>
	</div>
</body>

</html>