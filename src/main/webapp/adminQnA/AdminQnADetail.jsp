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
	<h1>QnA 상세보기</h1>

	<form action="/qna/qnaReply">
		<input type="hidden" name="qna_num" value="<%=qMap.get("QNA_NUM")%>">
		<table>
			<tr>
				<th>제목</th>
				<th><p><%=qMap.get("QNA_TITLE")%></p></th>
			</tr>

			<tr>
				<th>작성자</th>
				<th><p><%=qMap.get("MEMBER_ID")%></p></th>
			</tr>

			<tr>
				<th>게시날짜</th>
				<th><p><%=qMap.get("QNA_DATE")%></p></th>
			</tr>

			<tr>
				<th><h2>Q</h2></th>
				<th><textarea readonly="readonly" class="form-control" aria-label="With textarea" style="height: 400px;"><%=qMap.get("QNA_CONTENT")%></textarea></th>
			</tr>



			<tr>
				<th><h2>A</h2></th>
				<%
				if (qMap.get("REPLY_CONTENT") != null)
				{
				%>
				<th><textarea class="form-control" readonly="readonly" name="reply_content" aria-label="With textarea" style="height: 400px;"><%=qMap.get("REPLY_CONTENT")%></textarea></th>
				<%
				} else
				{
				%>
				<th><textarea class="form-control" name="reply_content" aria-label="With textarea" style="height: 400px;"><%=qMap.get("REPLY_CONTENT")%></textarea></th>
				<%
				}
				%>

			</tr>
		</table>
		<%
		if (qMap.get("REPLY_CONTENT") == null)
		{
		%>
		<input type="submit" style="margin-left: 1500px;" class="btn btn-outline-success" value="답변달기">
		<%
		}
		%>

		<hr>
		<div style="margin-left: 1500px;">
			<input type="button" class="btn btn-outline-success" value="글목록" onclick="location.href='/qna/qnaList'">
		</div>
	</form>


</body>

</html>